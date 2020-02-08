package de.metas.bpartner.service.impl;

/*
 * #%L
 * de.metas.adempiere.adempiere.base
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

import static org.junit.Assert.assertSame;

import org.adempiere.service.ISysConfigBL;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.Mockito;

import de.metas.interfaces.I_C_BPartner;
import de.metas.lang.SOTrx;
import de.metas.user.UserRepository;
import de.metas.util.Services;

public class BPartnerBL_AllowConsolidateTests
{
	I_C_BPartner partner;
	ISysConfigBL sysConfigBL;

	/**
	 * Register our mocked service implementation
	 */
	@BeforeEach
	public void init()
	{
		partner = Mockito.mock(I_C_BPartner.class);
		sysConfigBL = Mockito.mock(ISysConfigBL.class);
		Services.registerService(ISysConfigBL.class, sysConfigBL);
	}

	@Test
	public void test_isAllowConsolidateInOutEffective()
	{
		boolean allowsConsolidate = true;
		boolean sysConfigValue = true;

		allowsConsolidate = false;
		{
			sysConfigValue = false;
			{
				verifyIsAllowConsolidateInOutEffective(allowsConsolidate, SOTrx.PURCHASE, sysConfigValue, false);
				verifyIsAllowConsolidateInOutEffective(allowsConsolidate, SOTrx.SALES, sysConfigValue, false);
			}

			sysConfigValue = true;
			{
				// soTrx=false (i.e. purchase-side) and the sysconfig-value is also set to true => override the allowsConsolidate = false
				verifyIsAllowConsolidateInOutEffective(allowsConsolidate, SOTrx.PURCHASE, sysConfigValue, false);
				verifyIsAllowConsolidateInOutEffective(allowsConsolidate, SOTrx.SALES, sysConfigValue, true);
			}
		}

		allowsConsolidate = true;
		final boolean expectedResultInthisWholeBlock = true;
		{
			sysConfigValue = false;
			{
				verifyIsAllowConsolidateInOutEffective(allowsConsolidate, SOTrx.PURCHASE, sysConfigValue, expectedResultInthisWholeBlock);
				verifyIsAllowConsolidateInOutEffective(allowsConsolidate, SOTrx.SALES, sysConfigValue, expectedResultInthisWholeBlock);
			}

			sysConfigValue = true;
			{
				// soTrx=false (i.e. purchase-side) and the sysconfig-value is also set to true => override the allowsConsolidate = false
				verifyIsAllowConsolidateInOutEffective(allowsConsolidate, SOTrx.PURCHASE, sysConfigValue, expectedResultInthisWholeBlock);
				verifyIsAllowConsolidateInOutEffective(allowsConsolidate, SOTrx.SALES, sysConfigValue, expectedResultInthisWholeBlock);
			}
		}
	}

	protected void verifyIsAllowConsolidateInOutEffective(
			final boolean partnerAllowsConsolidateInOut,
			final SOTrx soTrx,
			final boolean sysConfigValue,
			final boolean expectedResult)
	{
		partnerAllowsConsolidateInOut(partnerAllowsConsolidateInOut);
		sysConfig_AllowConsolidateInOut_ReturnsTrue(sysConfigValue);

		final BPartnerBL testee = new BPartnerBL(new UserRepository());
		assertSame(expectedResult, testee.isAllowConsolidateInOutEffective(partner, soTrx));
	}

	private void partnerAllowsConsolidateInOut(final boolean partnerAllowsConsolidateInOut)
	{
		Mockito.when(partner.isAllowConsolidateInOut())
				.thenReturn(partnerAllowsConsolidateInOut);
	}

	private void sysConfig_AllowConsolidateInOut_ReturnsTrue(final boolean sysConfigReturnsTrue)
	{
		Mockito.when(sysConfigBL.getBooleanValue(BPartnerBL.SYSCONFIG_C_BPartner_SOTrx_AllowConsolidateInOut_Override, false))
				.thenReturn(sysConfigReturnsTrue);
	}
}
