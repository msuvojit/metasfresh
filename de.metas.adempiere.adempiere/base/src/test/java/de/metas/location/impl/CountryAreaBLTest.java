package de.metas.location.impl;

import static org.assertj.core.api.Assertions.assertThat;

/*
 * #%L
 * de.metas.swat.base
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

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import org.adempiere.test.AdempiereTestHelper;
import org.compiere.model.I_C_CountryArea_Assign;
import org.compiere.util.TimeUtil;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.Mockito;

import de.metas.location.ICountryAreaBL;
import de.metas.util.Services;

public class CountryAreaBLTest
{
	I_C_CountryArea_Assign assignment1;
	I_C_CountryArea_Assign assignment2;

	CountryAreaBL countryAreaBL = new CountryAreaBL();

	@BeforeEach
	public void beforeEach()
	{
		assignment1 = Mockito.mock(I_C_CountryArea_Assign.class);
		assignment2 = Mockito.mock(I_C_CountryArea_Assign.class);
	}

	@Test
	public void testServiceLoadedOK()
	{
		AdempiereTestHelper.get().init();
		Services.get(ICountryAreaBL.class);
	}

	@Test
	public void isTimeConflictTest() throws Exception
	{
		setAssignment(assignment1, "2010-01-01", null);
		setAssignment(assignment2, "2010-05-01", null);
		assertThat(countryAreaBL.isTimeConflict(assignment1, assignment2)).isTrue();

		setAssignment(assignment1, "2010-01-01", "2010-04-01");
		setAssignment(assignment2, "2010-05-01", null);
		assertThat(countryAreaBL.isTimeConflict(assignment1, assignment2)).isFalse();

		setAssignment(assignment1, "2010-01-01", "2010-06-01");
		setAssignment(assignment2, "2010-05-01", null);
		assertThat(countryAreaBL.isTimeConflict(assignment1, assignment2)).isTrue();

		setAssignment(assignment2, "2010-01-01", "2010-04-01");
		setAssignment(assignment1, "2010-05-01", null);
		assertThat(countryAreaBL.isTimeConflict(assignment1, assignment2)).isFalse();

		setAssignment(assignment2, "2010-01-01", "2010-06-01");
		setAssignment(assignment1, "2010-05-01", null);
		assertThat(countryAreaBL.isTimeConflict(assignment1, assignment2)).isTrue();

		setAssignment(assignment1, "2010-01-01", "2010-04-01");
		setAssignment(assignment2, "2010-05-01", "2010-07-01");
		assertThat(countryAreaBL.isTimeConflict(assignment1, assignment2)).isFalse();

		setAssignment(assignment1, "2010-01-01", "2010-06-01");
		setAssignment(assignment2, "2010-05-01", "2010-08-01");
		assertThat(countryAreaBL.isTimeConflict(assignment1, assignment2)).isTrue();
	}

	private void setAssignment(final I_C_CountryArea_Assign assignment, String validFromStr, String validToStr) throws ParseException
	{
		final DateFormat df = new SimpleDateFormat("yyyy-MM-dd");

		final Timestamp validFrom = validFromStr == null ? null : TimeUtil.asTimestamp(df.parse(validFromStr));
		final Timestamp validTo = validToStr == null ? null : TimeUtil.asTimestamp(df.parse(validToStr));

		Mockito.when(assignment.getValidFrom()).thenReturn(validFrom);
		Mockito.when(assignment.getValidTo()).thenReturn(validTo);
	}
}
