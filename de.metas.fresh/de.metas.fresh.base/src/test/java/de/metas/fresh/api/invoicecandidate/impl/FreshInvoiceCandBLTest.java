package de.metas.fresh.api.invoicecandidate.impl;

import static org.mockito.Mockito.times;

import org.junit.jupiter.api.Test;
import org.mockito.ArgumentMatchers;
import org.mockito.Mockito;

import de.metas.invoicecandidate.model.I_C_Invoice_Candidate;

public class FreshInvoiceCandBLTest
{
	/**
	 * If isSOTrx=Y, then the method shall return and *not* call the candidte's setC_DocTypeInvoice() or setC_DocTypeInvoice_ID() method.
	 */
	@Test
	public void test_updateC_DocTypeInvoice_does_nothing_if_IsSOTrx_true()
	{
		final I_C_Invoice_Candidate candidate = Mockito.mock(I_C_Invoice_Candidate.class);
		Mockito.when(candidate.isSOTrx()).thenReturn(true);

		new FreshInvoiceCandBL().updateC_DocTypeInvoice(candidate);

		Mockito.verify(candidate, times(1))
				.isSOTrx();

		Mockito.verify(candidate, times(0))
				.setC_DocTypeInvoice_ID(ArgumentMatchers.anyInt());
	}

}
