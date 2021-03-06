package org.adempiere.ad.trx.api.impl;

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
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public
 * License along with this program.  If not, see
 * <http://www.gnu.org/licenses/gpl-2.0.html>.
 * #L%
 */


import java.sql.Savepoint;

import org.adempiere.ad.trx.api.ITrx;
import org.adempiere.ad.trx.api.ITrxSavepoint;

import de.metas.util.Check;

/**
 * JDBC {@link ITrxSavepoint} implementation
 * 
 * @author tsa
 * 
 */
public class JdbcTrxSavepoint implements ITrxSavepoint
{
	private final ITrx trx;
	private final Savepoint jdbcSavepoint;

	public JdbcTrxSavepoint(final ITrx trx, final Savepoint jdbcSavepoint)
	{
		super();

		Check.assumeNotNull(trx, "trx not null");
		this.trx = trx;

		Check.assumeNotNull(jdbcSavepoint, "jdbcSavepoint not null");
		this.jdbcSavepoint = jdbcSavepoint;
	}

	@Override
	public Savepoint getNativeSavepoint()
	{
		return jdbcSavepoint;
	}

	@Override
	public ITrx getTrx()
	{
		return trx;
	}
}
