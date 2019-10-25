package de.metas.adempiere.report.jasper.servlet;

import org.adempiere.exceptions.AdempiereException;
import org.slf4j.Logger;
import org.springframework.context.annotation.Profile;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import de.metas.Profiles;
import de.metas.adempiere.report.jasper.IJasperServer;
import de.metas.adempiere.report.jasper.JasperServerConstants;
import de.metas.adempiere.report.jasper.OutputType;
import de.metas.adempiere.report.jasper.server.LocalJasperServer;
import de.metas.logging.LogManager;

@RestController
@RequestMapping(value = ReportRestController.ENDPOINT)
@Profile(Profiles.PROFILE_JasperService)
public class ReportRestController
{
	public static final String ENDPOINT = JasperServerConstants.SERVLET_ROOT + "/ReportServlet";

	private static final Logger logger = LogManager.getLogger(ReportRestController.class);
	private LocalJasperServer server = new LocalJasperServer();

	@GetMapping
	public ResponseEntity<byte[]> report( //
			@RequestParam(name = "AD_Process_ID", required = false) final int processId,
			@RequestParam(name = "AD_PInstance_ID", required = false) final int pinstanceId,
			@RequestParam(name = "AD_Language", required = false) final String adLanguage,
			@RequestParam(name = "output", required = false) final String outputStr)
	{
		try
		{
			final OutputType outputType = outputStr == null ? IJasperServer.DEFAULT_OutputType : OutputType.valueOf(outputStr);
			final byte[] reportData = server.report(processId, pinstanceId, adLanguage, outputType);
			final String reportContentType = outputType.getContentType();
			final String reportFilename = "report." + outputType.getFileExtension();

			final HttpHeaders headers = new HttpHeaders();
			headers.setContentType(MediaType.parseMediaType(reportContentType));
			headers.set(HttpHeaders.CONTENT_DISPOSITION, "inline; filename=\"" + reportFilename + "\"");
			headers.setCacheControl("must-revalidate, post-check=0, pre-check=0");
			final ResponseEntity<byte[]> response = new ResponseEntity<>(reportData, headers, HttpStatus.OK);
			return response;
		}
		catch (final Exception ex)
		{
			logger.warn("Failed running report for AD_Process_ID={}, AD_PInstance_ID={}, AD_Language={}, output={}",
					processId, pinstanceId, adLanguage, outputStr,
					ex);

			throw AdempiereException.wrapIfNeeded(ex);
		}
	}
}
