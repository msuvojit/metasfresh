package de.metas.banking.service;

import java.math.BigDecimal;

import org.compiere.model.I_C_BankStatement;
import org.compiere.model.I_C_BankStatementLine;

import de.metas.banking.model.BankStatementId;
import de.metas.banking.model.BankStatementLineId;
import de.metas.util.ISingletonService;
import lombok.NonNull;

public interface IBankStatementBL extends ISingletonService
{
	void handleAfterPrepare(I_C_BankStatement bankStatement);

	void handleAfterComplete(I_C_BankStatement bankStatement);

	void handleBeforeVoid(I_C_BankStatement bankStatement);

	/**
	 * Updates bank statement ending balance as "beginning balance" + "statement difference".
	 */
	void updateEndingBalance(I_C_BankStatement bankStatement);

	/**
	 * Un-post given bank statement.
	 */
	void unpost(I_C_BankStatement bankStatement);

	boolean isReconciled(I_C_BankStatementLine line);

	BigDecimal computeStmtAmtExcludingChargeAmt(I_C_BankStatementLine line);

	String getDocumentNo(BankStatementId bankStatementId);

	void unlinkPaymentsAndDeleteReferences(I_C_BankStatementLine bankStatementLine);

	void deleteReferencesAndUnReconcilePayments(@NonNull BankStatementLineId bankStatementLineId);

}
