package de.metas.procurement.base.impl;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.Mockito.times;

import org.adempiere.model.InterfaceWrapperHelper;
import org.adempiere.test.AdempiereTestHelper;
import org.adempiere.test.AdempiereTestWatcher;
import org.compiere.model.I_C_BPartner;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.ArgumentCaptor;
import org.mockito.ArgumentMatchers;
import org.mockito.Mockito;

import de.metas.procurement.base.IAgentSyncBL;
import de.metas.procurement.base.model.I_AD_User;
import de.metas.procurement.sync.protocol.SyncBPartner;
import de.metas.procurement.sync.protocol.SyncBPartnersRequest;
import de.metas.procurement.sync.protocol.SyncUser;
import de.metas.util.Services;
/*
 * #%L
 * de.metas.procurement.base
 * %%
 * Copyright (C) 2016 metas GmbH
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

@ExtendWith(AdempiereTestWatcher.class)
public class WebuiPushTests
{
	private static final String BPARTNER_NAME = "myName";
	private static final String LANGUAGE = "mylanguage";

	IAgentSyncBL agentSync;

	@BeforeEach
	public void init()
	{
		AdempiereTestHelper.get().init();

		agentSync = Mockito.mock(IAgentSyncBL.class);
		Services.registerService(IAgentSyncBL.class, agentSync); // registering our mock
	}

	/**
	 * Sync a BPartner without any user.
	 */
	@Test
	public void testPushBPartnerWithoutContract_NoUsers()
	{
		final I_C_BPartner bpartner = createBPartner();

		performTestNoUsersDeletePartner(bpartner);
	}

	/**
	 * Sync a BPartner with a user, but that user has <code>MFProcurementUser='N'</code>.
	 */
	@Test
	public void testPushBPartnerWithoutContract_NoProcurementUsers1()
	{
		final I_C_BPartner bpartner = createBPartner();

		final I_AD_User user = InterfaceWrapperHelper.newInstance(I_AD_User.class);
		user.setC_BPartner(bpartner);
		user.setEMail("mail@email");
		user.setProcurementPassword("validPassword");
		user.setIsMFProcurementUser(false);
		InterfaceWrapperHelper.save(user);

		performTestNoUsersDeletePartner(bpartner);
	}

	/**
	 * Sync a BPartner with a user that has <code>MFProcurementUser='Y'</code>, but no email address.
	 */
	@Test
	public void testPushBPartnerWithoutContract_NoProcurementUsers2()
	{
		final I_C_BPartner bpartner = createBPartner();

		final I_AD_User user = InterfaceWrapperHelper.newInstance(I_AD_User.class);
		user.setC_BPartner(bpartner);
		user.setEMail(null);
		user.setProcurementPassword("validPassword");
		user.setIsMFProcurementUser(true);
		InterfaceWrapperHelper.save(user);

		performTestNoUsersDeletePartner(bpartner);
	}

	/**
	 * Sync a BPartner with a user that a valid procurement user, but is not a vendor.
	 */
	@Test
	public void testPushBPartnerWithoutContract_NotVendor()
	{
		final I_C_BPartner bpartner = createBPartner();
		bpartner.setIsVendor(false);
		InterfaceWrapperHelper.save(bpartner);

		final I_AD_User user = InterfaceWrapperHelper.newInstance(I_AD_User.class);
		user.setC_BPartner(bpartner);
		user.setEMail("mail@email");
		user.setProcurementPassword("validPassword");
		user.setIsMFProcurementUser(true);
		InterfaceWrapperHelper.save(user);

		performTestNoUsersDeletePartner(bpartner);
	}

	private I_C_BPartner createBPartner()
	{
		final I_C_BPartner bpartner = InterfaceWrapperHelper.newInstance(I_C_BPartner.class);
		bpartner.setAD_Language(LANGUAGE);
		bpartner.setName(BPARTNER_NAME);
		bpartner.setIsVendor(true);
		InterfaceWrapperHelper.save(bpartner);
		return bpartner;
	}

	/**
	 * Invokes {@link WebuiPush#pushBPartnerAndUsers(I_C_BPartner)} and verifies, that only a delete-bpartner-sync without users is submitted.
	 *
	 * @param bpartner
	 */
	private void performTestNoUsersDeletePartner(final I_C_BPartner bpartner)
	{
		new WebuiPush().pushBPartnerAndUsers(bpartner);
		expectOnlySyncBPartnersCalled();

		final ArgumentCaptor<SyncBPartnersRequest> syncBPartnersRequestCaptor = ArgumentCaptor.forClass(SyncBPartnersRequest.class);
		Mockito.verify(agentSync)
				.syncBPartners(syncBPartnersRequestCaptor.capture());

		final SyncBPartnersRequest syncBPartnersRequest = syncBPartnersRequestCaptor.getValue();
		assertThat(syncBPartnersRequest).isNotNull();
		assertThat(syncBPartnersRequest.getBpartners()).hasSize(1);

		final SyncBPartner syncBPartner = syncBPartnersRequest.getBpartners().get(0);
		assertThat(syncBPartner.getName()).isEqualTo(bpartner.getName());
		assertThat(syncBPartner.isSyncContracts()).isFalse();
		assertThat(syncBPartner.isDeleted()).isTrue();

		assertThat(syncBPartner.getUsers()).isEmpty();
		assertThat(syncBPartner.getContracts()).isEmpty();
	}

	private void expectOnlySyncBPartnersCalled()
	{
		Mockito.verify(agentSync, times(0)).syncInfoMessage(ArgumentMatchers.any());
		Mockito.verify(agentSync, times(0)).syncProducts(ArgumentMatchers.any());
		Mockito.verify(agentSync, times(1)).syncBPartners(ArgumentMatchers.any());
	}

	/**
	 * Sync a valid BPartner with a valid user.
	 */
	@Test
	public void testPushBPartnerWithoutContract_with_user()
	{
		final I_C_BPartner bpartner = createBPartner();

		final I_AD_User user = InterfaceWrapperHelper.newInstance(I_AD_User.class);
		user.setC_BPartner(bpartner);
		user.setEMail("mail@email");
		user.setProcurementPassword("validPassword");
		user.setIsMFProcurementUser(true);
		InterfaceWrapperHelper.save(user);

		new WebuiPush().pushBPartnerAndUsers(bpartner);
		expectOnlySyncBPartnersCalled();

		final ArgumentCaptor<SyncBPartnersRequest> syncBPartnersRequestCaptor = ArgumentCaptor.forClass(SyncBPartnersRequest.class);
		Mockito.verify(agentSync)
				.syncBPartners(syncBPartnersRequestCaptor.capture());

		final SyncBPartnersRequest syncBPartnersRequest = syncBPartnersRequestCaptor.getValue();
		assertThat(syncBPartnersRequest).isNotNull();
		assertThat(syncBPartnersRequest.getBpartners()).hasSize(1);

		final SyncBPartner syncBPartner = syncBPartnersRequest.getBpartners().get(0);
		assertThat(syncBPartner.getUsers()).hasSize(1);
		assertThat(syncBPartner.getContracts()).isEmpty();
		assertThat(syncBPartner.getName()).isEqualTo(bpartner.getName());
		assertThat(syncBPartner.isSyncContracts()).isFalse();
		assertThat(syncBPartner.isDeleted()).isFalse();

		final SyncUser syncUser = syncBPartner.getUsers().get(0);
		assertThat(syncUser.isDeleted()).isFalse();
		assertThat(syncUser.getEmail()).isEqualTo(user.getEMail());
		assertThat(syncUser.getPassword()).isEqualTo(user.getProcurementPassword());
		assertThat(syncUser.getLanguage()).isEqualTo(bpartner.getAD_Language());
	}

}
