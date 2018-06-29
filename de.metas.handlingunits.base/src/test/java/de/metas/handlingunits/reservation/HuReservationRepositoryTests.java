package de.metas.handlingunits.reservation;

import static java.math.BigDecimal.ONE;
import static java.math.BigDecimal.TEN;
import static org.adempiere.model.InterfaceWrapperHelper.newInstance;
import static org.adempiere.model.InterfaceWrapperHelper.saveRecord;
import static org.assertj.core.api.Assertions.assertThat;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.adempiere.ad.wrapper.POJOLookupMap;
import org.adempiere.test.AdempiereTestHelper;
import org.compiere.model.I_C_UOM;
import org.junit.Before;
import org.junit.Test;

import de.metas.handlingunits.HuId;
import de.metas.handlingunits.model.I_M_HU;
import de.metas.handlingunits.model.I_M_HU_Reservation;
import de.metas.order.OrderLineId;
import de.metas.quantity.Quantity;

/*
 * #%L
 * de.metas.handlingunits.base
 * %%
 * Copyright (C) 2018 metas GmbH
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

public class HuReservationRepositoryTests
{
	private static final BigDecimal ELEVEN = TEN.add(ONE);
	private static final BigDecimal THIRTEEN = new BigDecimal("13");

	private I_C_UOM uomRecord;
	private HuReservationRepository huReservationRepository;

	@Before
	public void init()
	{
		AdempiereTestHelper.get().init();

		uomRecord = newInstance(I_C_UOM.class);
		saveRecord(uomRecord);

		huReservationRepository = new HuReservationRepository();
	}

	@Test
	public void getBySalesOrderLineId()
	{
		final OrderLineId orderLineId = OrderLineId.ofRepoId(20);

		final I_M_HU vhu1 = createHuReservationRecord(orderLineId, TEN);
		final I_M_HU vhu2 = createHuReservationRecord(orderLineId, ONE);

		// invoke the method under test
		final HuReservation huReservation = huReservationRepository.getBySalesOrderLineId(orderLineId);

		assertThat(huReservation.getSalesOrderLineId()).isEqualTo(orderLineId);

		final Quantity reservedQtySum = huReservation.getReservedQtySum().get();
		assertThat(reservedQtySum.getAsBigDecimal()).isEqualByComparingTo(ELEVEN);
		assertThat(reservedQtySum.getUOMId()).isEqualTo(uomRecord.getC_UOM_ID());

		final Map<HuId, Quantity> vhuId2reservedQtys = huReservation.getVhuId2reservedQtys();

		final HuId expectedVhu1Id = HuId.ofRepoId(vhu1.getM_HU_ID());
		assertThat(vhuId2reservedQtys).containsKey(expectedVhu1Id);
		assertThat(vhuId2reservedQtys.get(expectedVhu1Id).getAsBigDecimal()).isEqualByComparingTo(TEN);

		final HuId expectedVhu2Id = HuId.ofRepoId(vhu2.getM_HU_ID());
		assertThat(vhuId2reservedQtys).containsKey(expectedVhu2Id);
		assertThat(vhuId2reservedQtys.get(expectedVhu2Id).getAsBigDecimal()).isEqualByComparingTo(ONE);
	}

	@Test
	public void getBySalesOrderLineId_no_records()
	{
		final OrderLineId orderLineId = OrderLineId.ofRepoId(20);

		// invoke the method under test
		final HuReservation huReservation = huReservationRepository.getBySalesOrderLineId(orderLineId);

		assertThat(huReservation.getSalesOrderLineId()).isEqualTo(orderLineId);

		assertThat(huReservation.getReservedQtySum()).isNotPresent();
		assertThat(huReservation.getVhuId2reservedQtys()).isEmpty();
	}

	private I_M_HU createHuReservationRecord(final OrderLineId orderLineId, BigDecimal qtyReserved)
	{
		final I_M_HU vhu1 = newInstance(I_M_HU.class);
		saveRecord(vhu1);

		final I_M_HU_Reservation huReservationRecord = newInstance(I_M_HU_Reservation.class);
		huReservationRecord.setC_OrderLineSO_ID(orderLineId.getRepoId());
		huReservationRecord.setC_UOM(uomRecord);
		huReservationRecord.setVHU(vhu1);
		huReservationRecord.setQtyReserved(qtyReserved);
		saveRecord(huReservationRecord);
		return vhu1;
	}

	@Test
	public void save()
	{
		final HuReservation huReservation = HuReservation.builder()
				.salesOrderLineId(OrderLineId.ofRepoId(20))
				.vhuId2reservedQty(HuId.ofRepoId(10), Quantity.of(TEN, uomRecord))
				.vhuId2reservedQty(HuId.ofRepoId(11), Quantity.of(ONE, uomRecord))
				.reservedQtySum(Optional.of(Quantity.of(ELEVEN, uomRecord)))
				.build();

		huReservationRepository.save(huReservation);
		List<I_M_HU_Reservation> reservationRecords = POJOLookupMap.get().getRecords(I_M_HU_Reservation.class);
		assertThat(reservationRecords).hasSize(2);
		assertThat(reservationRecords).allMatch(r -> r.getC_OrderLineSO_ID() == 20);

		final HuReservation huReservation2 = huReservation.toBuilder()
				.vhuId2reservedQty(HuId.ofRepoId(10), Quantity.of(TEN.add(ONE), uomRecord))
				.vhuId2reservedQty(HuId.ofRepoId(11), Quantity.of(ONE.add(ONE), uomRecord))
				.reservedQtySum(Optional.of(Quantity.of(THIRTEEN, uomRecord)))
				.build();

		huReservationRepository.save(huReservation2);
		reservationRecords = POJOLookupMap.get().getRecords(I_M_HU_Reservation.class);
		assertThat(reservationRecords).hasSize(2); // the existing records were update, none where added
		assertThat(reservationRecords).allMatch(r -> r.getC_OrderLineSO_ID() == 20);
	}
}