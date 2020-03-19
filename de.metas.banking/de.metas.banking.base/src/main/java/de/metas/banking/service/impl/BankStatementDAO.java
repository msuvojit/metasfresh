package de.metas.banking.service.impl;

import static org.adempiere.model.InterfaceWrapperHelper.load;
import static org.adempiere.model.InterfaceWrapperHelper.loadByRepoIdAwares;

import java.math.BigDecimal;
import java.util.Date;

/*
 * #%L
 * de.metas.banking.base
 * %%
 * Copyright (C) 2015 metas GmbH
 * %%
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as
 * published by the Free Software Foundation, either version 2 of the
 * License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public
 * License along with this program. If not, see
 * <http://www.gnu.org/licenses/gpl-2.0.html>.
 * #L%
 */

import java.util.List;
import java.util.Objects;
import java.util.Properties;
import java.util.Set;

import org.adempiere.ad.dao.IQueryBL;
import org.adempiere.ad.dao.IQueryBuilder;
import org.adempiere.ad.dao.impl.CompareQueryFilter.Operator;
import org.adempiere.ad.trx.api.ITrx;
import org.adempiere.model.InterfaceWrapperHelper;
import org.compiere.model.I_C_BankStatement;
import org.compiere.model.I_C_BankStatementLine;
import org.compiere.model.I_C_Payment;
import org.compiere.model.I_Fact_Acct;

import com.google.common.collect.ImmutableSet;

import de.metas.banking.interfaces.I_C_BankStatementLine_Ref;
import de.metas.banking.model.BankStatementAndLineAndRefId;
import de.metas.banking.model.BankStatementId;
import de.metas.banking.model.BankStatementLineId;
import de.metas.banking.service.BankStatementLineRefCreateRequest;
import de.metas.banking.service.IBankStatementBL;
import de.metas.banking.service.IBankStatementDAO;
import de.metas.bpartner.BPartnerId;
import de.metas.document.engine.IDocument;
import de.metas.invoice.InvoiceId;
import de.metas.payment.PaymentId;
import de.metas.util.GuavaCollectors;
import de.metas.util.Services;
import lombok.NonNull;

public class BankStatementDAO implements IBankStatementDAO
{
	@Override
	@Deprecated
	public de.metas.banking.model.I_C_BankStatement getById(int id)
	{
		return load(id, de.metas.banking.model.I_C_BankStatement.class);
	}

	@Override
	public de.metas.banking.model.I_C_BankStatement getById(@NonNull final BankStatementId bankStatementId)
	{
		return load(bankStatementId, de.metas.banking.model.I_C_BankStatement.class);
	}

	@Override
	public de.metas.banking.model.I_C_BankStatementLine getLineById(@NonNull final BankStatementLineId lineId)
	{
		return load(lineId, de.metas.banking.model.I_C_BankStatementLine.class);
	}

	@Override
	public List<de.metas.banking.model.I_C_BankStatementLine> getLineByIds(@NonNull final Set<BankStatementLineId> lineIds)
	{
		return loadByRepoIdAwares(lineIds, de.metas.banking.model.I_C_BankStatementLine.class);
	}

	@NonNull
	@Override
	public ImmutableSet<PaymentId> getLinesPaymentIds(@NonNull final BankStatementId bankStatementId)
	{
		final de.metas.banking.model.I_C_BankStatement bankStatement = getById(bankStatementId);
		final List<de.metas.banking.model.I_C_BankStatementLine> lines = retrieveLines(bankStatement, de.metas.banking.model.I_C_BankStatementLine.class);
		return lines.stream()
				.map(l -> PaymentId.ofRepoIdOrNull(l.getC_Payment_ID()))
				.filter(Objects::nonNull)
				.collect(GuavaCollectors.toImmutableSet());
	}

	@Override
	public void save(final @NonNull I_C_BankStatement bankStatement)
	{
		InterfaceWrapperHelper.save(bankStatement);
	}

	@Override
	public void save(final @NonNull I_C_BankStatementLine bankStatementLine)
	{
		InterfaceWrapperHelper.save(bankStatementLine);
	}

	@Override
	public void save(final @NonNull de.metas.banking.model.I_C_BankStatementLine_Ref lineOrRef)
	{
		InterfaceWrapperHelper.save(lineOrRef);
	}

	@Override
	public <T extends I_C_BankStatementLine> List<T> retrieveLines(final I_C_BankStatement bankStatement, final Class<T> clazz)
	{
		return retrieveLinesQuery(bankStatement)
				.create()
				.list(clazz);
	}

	private IQueryBuilder<I_C_BankStatementLine> retrieveLinesQuery(final I_C_BankStatement bankStatement)
	{
		return Services.get(IQueryBL.class)
				.createQueryBuilder(I_C_BankStatementLine.class, bankStatement)
				.addOnlyActiveRecordsFilter()
				.addEqualsFilter(I_C_BankStatementLine.COLUMNNAME_C_BankStatement_ID, bankStatement.getC_BankStatement_ID())
				//
				.orderBy()
				.addColumn(I_C_BankStatementLine.COLUMNNAME_Line)
				.addColumn(I_C_BankStatementLine.COLUMNNAME_C_BankStatementLine_ID)
				.endOrderBy();
	}

	@Override
	public List<I_C_BankStatementLine_Ref> retrieveLineReferences(final org.compiere.model.I_C_BankStatementLine bankStatementLine)
	{
		return retrieveLineReferencesQuery(bankStatementLine)
				.create()
				.list(I_C_BankStatementLine_Ref.class);
	}

	@Override
	public boolean hasLineReferences(@NonNull final BankStatementLineId bankStatementLineId)
	{
		return Services.get(IQueryBL.class)
				.createQueryBuilder(I_C_BankStatementLine_Ref.class)
				// .addOnlyActiveRecordsFilter() // ALL
				.addEqualsFilter(I_C_BankStatementLine_Ref.COLUMNNAME_C_BankStatementLine_ID, bankStatementLineId)
				.create()
				.anyMatch();
	}

	public IQueryBuilder<I_C_BankStatementLine_Ref> retrieveLineReferencesQuery(final org.compiere.model.I_C_BankStatementLine bankStatementLine)
	{
		return Services.get(IQueryBL.class)
				.createQueryBuilder(I_C_BankStatementLine_Ref.class, bankStatementLine)
				.addOnlyActiveRecordsFilter()
				.addEqualsFilter(I_C_BankStatementLine_Ref.COLUMNNAME_C_BankStatementLine_ID, bankStatementLine.getC_BankStatementLine_ID())
				.orderBy()
				.addColumn(I_C_BankStatementLine_Ref.COLUMNNAME_Line)
				.addColumn(I_C_BankStatementLine_Ref.COLUMNNAME_C_BankStatementLine_Ref_ID)
				.endOrderBy();
	}

	@Override
	public boolean isPaymentOnBankStatement(final I_C_Payment payment)
	{
		final int paymentId = payment.getC_Payment_ID();
		final IQueryBL queryBL = Services.get(IQueryBL.class);

		//
		// Check if payment is on any bank statement line reference, processed or not
		final boolean hasBankStatementLineRefs = queryBL.createQueryBuilder(I_C_BankStatementLine_Ref.class, payment)
				.addOnlyActiveRecordsFilter()
				.addEqualsFilter(I_C_BankStatementLine_Ref.COLUMNNAME_C_Payment_ID, paymentId)
				.create()
				.anyMatch();
		if (hasBankStatementLineRefs)
		{
			return true;
		}

		//
		// Check if payment is on any bank statement line, processed or not
		final boolean hasBankStatementLines = queryBL.createQueryBuilder(I_C_BankStatementLine.class, payment)
				.addOnlyActiveRecordsFilter()
				.addEqualsFilter(I_C_BankStatementLine.COLUMN_C_Payment_ID, paymentId)
				.create()
				.anyMatch();
		if (hasBankStatementLines)
		{
			return true;
		}

		return false;
	}

	@Override
	public List<I_C_BankStatement> retrievePostedWithoutFactAcct(final Properties ctx, final Date startTime)
	{
		final IQueryBL queryBL = Services.get(IQueryBL.class);

		final String trxName = ITrx.TRXNAME_ThreadInherited;

		// Exclude the entries that have trxAmt = 0. These entries will produce 0 in posting
		final IQueryBuilder<I_C_BankStatementLine> queryBuilder = queryBL.createQueryBuilder(I_C_BankStatementLine.class, ctx, trxName)
				.addOnlyActiveRecordsFilter()
				.addNotEqualsFilter(I_C_BankStatementLine.COLUMNNAME_TrxAmt, BigDecimal.ZERO);

		// Check if there are fact accounts created for each document
		final IQueryBuilder<I_Fact_Acct> factAcctQuery = queryBL.createQueryBuilder(I_Fact_Acct.class, ctx, trxName)
				.addEqualsFilter(I_Fact_Acct.COLUMN_AD_Table_ID, InterfaceWrapperHelper.getTableId(I_C_BankStatement.class));

		// query Builder for the bank statement

		final IQueryBuilder<I_C_BankStatement> bankStatementQuery = queryBuilder
				.andCollect(I_C_BankStatement.COLUMN_C_BankStatement_ID, I_C_BankStatement.class);

		// Only the documents created after the given start time
		if (startTime != null)
		{
			bankStatementQuery.addCompareFilter(I_C_BankStatement.COLUMNNAME_Created, Operator.GREATER_OR_EQUAL, startTime);
		}

		return bankStatementQuery.addEqualsFilter(I_C_BankStatement.COLUMNNAME_Posted, true) // Posted
				.addEqualsFilter(I_C_BankStatement.COLUMNNAME_Processed, true) // Processed
				.addInArrayOrAllFilter(I_C_BankStatement.COLUMNNAME_DocStatus, IDocument.STATUS_Closed, IDocument.STATUS_Completed) // DocStatus in ('CO', 'CL')
				.addNotInSubQueryFilter(I_C_BankStatement.COLUMNNAME_C_BankStatement_ID, I_Fact_Acct.COLUMNNAME_Record_ID, factAcctQuery.create()) // has no accounting
				.create()
				.list(I_C_BankStatement.class);
	}

	@Override
	public BankStatementAndLineAndRefId createBankStatementLineRef(@NonNull final BankStatementLineRefCreateRequest request)
	{
		final I_C_BankStatementLine_Ref record = InterfaceWrapperHelper.newInstance(I_C_BankStatementLine_Ref.class);
		IBankStatementBL.DYNATTR_DisableBankStatementLineRecalculateFromReferences.setValue(record, true); // disable recalculation. we will do it at the end

		record.setAD_Org_ID(request.getOrgId().getRepoId());
		record.setC_BankStatement_ID(request.getBankStatementId().getRepoId());
		record.setC_BankStatementLine_ID(request.getBankStatementLineId().getRepoId());
		record.setLine(request.getLineNo());

		record.setC_BPartner_ID(BPartnerId.toRepoId(request.getBpartnerId()));
		record.setC_Payment_ID(PaymentId.toRepoId(request.getPaymentId()));
		record.setC_Invoice_ID(InvoiceId.toRepoId(request.getInvoiceId()));

		// we store the psl's discount amount, because if we create a payment from this line, then we don't want the psl's Discount to end up as a mere underpayment.
		record.setC_Currency_ID(request.getTrxAmt().getCurrencyId().getRepoId());
		record.setTrxAmt(request.getTrxAmt().toBigDecimal());
		record.setDiscountAmt(BigDecimal.ZERO);
		record.setWriteOffAmt(BigDecimal.ZERO);
		record.setIsOverUnderPayment(false);
		record.setOverUnderAmt(BigDecimal.ZERO);

		save(record);

		return extractBankStatementAndLineAndRefId(record);
	}

	private static BankStatementAndLineAndRefId extractBankStatementAndLineAndRefId(@NonNull final I_C_BankStatementLine_Ref record)
	{
		return BankStatementAndLineAndRefId.ofRepoIds(
				record.getC_BankStatement_ID(),
				record.getC_BankStatementLine_ID(),
				record.getC_BankStatementLine_Ref_ID());
	}
}
