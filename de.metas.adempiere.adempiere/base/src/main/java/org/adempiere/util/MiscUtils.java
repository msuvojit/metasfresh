package org.adempiere.util;

import org.compiere.util.ValueNamePair;

import de.metas.logging.MetasfreshLastError;

/**
 * Misc utils
 * 
 * @author metas-dev <dev@metasfresh.com>
 * @deprecated This class is scheduled to be removed
 */
@Deprecated
public final class MiscUtils
{

	private MiscUtils()
	{
	}

	public static String loggerMsgs()
	{

		final ValueNamePair lastError = MetasfreshLastError.retrieveError();

		final StringBuffer msg = new StringBuffer(" Infos from CLogger: ");
		if (lastError != null)
		{
			msg.append("; Last error: [value='").append(lastError.getValue())
					.append("', name='").append(lastError.getName() + "']");
		}

		final ValueNamePair lastWarning = MetasfreshLastError.retrieveWarning();
		if (lastWarning != null)
		{
			msg.append(" Last warning: [value='")
					.append(lastWarning.getValue()).append("', name='").append(
							lastWarning.getName())
					.append("']");
		}
		return msg.toString();
	}
}
