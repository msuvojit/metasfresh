package de.metas.document.impl;

import org.compiere.model.I_C_Recurring;
import org.compiere.model.MRecurring;
import org.compiere.model.PO;

public class RecurringBL implements
		de.metas.document.IRecurringBL {

	public void recurringRun(final I_C_Recurring recurring) {
		
		final MRecurring recurringPO = asPO(recurring, MRecurring.class);
		recurringPO.executeRun();
	}

	private static <T extends PO> T asPO(final Object po, Class<T> clazz)
	{

		if (po == null)
		{
			throw new IllegalArgumentException("Param 'po' may not be null");
		}

		if (!clazz.isAssignableFrom(po.getClass()))
		{

			throw new IllegalArgumentException("Param 'po' must be a "
					+ clazz.getName() + ". Is: " + po.getClass().getName());

		}
		return clazz.cast(po);
	}

}
