package de.metas.ordercandidate.rest;

import java.math.BigDecimal;
import java.time.LocalDate;

import javax.annotation.Nullable;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.JsonAutoDetect.Visibility;
import com.fasterxml.jackson.annotation.JsonFormat;

import de.metas.util.Check;
import io.swagger.annotations.ApiModelProperty;
import lombok.Builder;
import lombok.Data;
import lombok.NonNull;

/*
 * #%L
 * de.metas.ordercandidate.rest-api
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

/**
 * Specifies a single order line candidate for be created by the system
 *
 * @author metas-dev <dev@metasfresh.com>
 *
 */
@JsonAutoDetect(fieldVisibility = Visibility.ANY, getterVisibility = Visibility.NONE, isGetterVisibility = Visibility.NONE, setterVisibility = Visibility.NONE)
@Data
@Builder(toBuilder = true)
public final class JsonOLCandCreateRequest
{
	private JsonOrganization org;

	@ApiModelProperty( //
			allowEmptyValue = false, //
			value = "This translates to <code>C_OLCand.externalId</code>.\n"
					+ "<code>externalId</code> and <code>dataSourceInternalName</code> together need to be unique.")
	private String externalId;

	@NonNull
	@ApiModelProperty( //
			allowEmptyValue = false, //
			value = "Internal name of the <code>AD_InputDataSource</code> record that tells where this OLCand came from.")
	private String dataSourceInternalName;

	@Nullable
	@ApiModelProperty( //
			allowEmptyValue = false, //
			value = "Internal name of the <code>AD_InputDataSource</code> record that tells what shall be happen with this OLCand.")
	private String dataDestInternalName;

	@ApiModelProperty( //
			allowEmptyValue = false, //
			value = " This translates to <code>C_OLCand.C_BPartner_ID</code>.\n"
					+ "It's the business partner that places/placed the order this candidate is about.")
	private JsonBPartnerInfo bpartner;

	@ApiModelProperty( //
			allowEmptyValue = true, //
			value = " This translates to <code>C_OLCand.Bill_BPartner_ID</code>.\n"
					+ "It's the business partner that shall receive the invoice.\n"
					+ "Optional; if empty, then <code>bpartner</code> will receive the invoice.")
	private JsonBPartnerInfo billBPartner;

	@ApiModelProperty( //
			allowEmptyValue = true, //
			value = " This translates to <code>C_OLCand.Dropship_BPartner_ID</code>.\n"
					+ "It's the business partner that shall receive the shipment.\n"
					+ "Optional; if empty, then <code>bpartner</code> will receive the shipment.")
	private JsonBPartnerInfo dropShipBPartner;

	@ApiModelProperty( //
			allowEmptyValue = true, //
			value = " This translates to <code>C_OLCand.HandOver_BPartner_ID</code>.\n"
					+ "It's an intermediate partner that shall receive the shipment and forward it to the eventual recipient.\n"
					+ "Optional; if empty, then <code>dropShipBPartner</code> or <code>bpartner</code> will directly receive the shipment.")
	private JsonBPartnerInfo handOverBPartner;

	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
	@ApiModelProperty( //
			allowEmptyValue = true, //
			value = "This translates to <code>C_OLCand.datePromised</code>.\n"
					+ "It's the date that the external system's user would like the metasfresh user to promise for delivery.\n"
					+ "Note: may be empty, if is <code>dataDestInternalName='DEST.de.metas.invoicecandidate'</code>")
	private LocalDate dateRequired;

	private int flatrateConditionsId;

	@ApiModelProperty( //
			allowEmptyValue = false, //
			value = "This translates to <code>C_OLCand.M_Product_ID</code>.")
	private JsonProductInfo product;

	@Nullable
	private String productDescription;

	private BigDecimal qty;

	@Nullable
	@ApiModelProperty( //
			allowEmptyValue = true, //
			value = " This translates to <code>C_UOM.X12DE355</code>.\n"
					+ "The respective UOM needs to exist in metasfresh and its ID is set as <code>C_OLCand.C_UOM_ID</code>.\n"
					+ "If not set, then the respective product's UOM is used.\n"
					+ "Note that if this is set, then there also needs to exist a UOM-conversion rule between this UOM and the <code>product</code>'s UOM")
	private String uomCode;

	private int packingMaterialId;

	private String pricingSystemCode;

	@Nullable
	@ApiModelProperty( //
			allowEmptyValue = true, //
			value = "If set, then the order line candidate will be created with a manual (i.e. not coming from metasfresh) price.")
	private BigDecimal price;

	@Nullable
	@ApiModelProperty( //
			allowEmptyValue = true, //
			value = "If a (manual) <code>price</code> is provided, then also a currencyCode needs be given.")
	private String currencyCode; // shall come from pricingSystem/priceList

	@Nullable
	@ApiModelProperty( //
			allowEmptyValue = true, //
			value = "If set, then the order line candidate will be created with a manual (i.e. not coming from metasfresh) discount.")
	private BigDecimal discount;

	@NonNull
	@ApiModelProperty( //
			allowEmptyValue = false, //
			value = "External reference (document number) on a remote system. Unique in conjunction with <code>dataSourceInternalName</code>.")
	private String poReference;

	@Nullable
	@ApiModelProperty( //
			allowEmptyValue = true, //
			value = "Can be set if the invoice's document date is already known from the external system and shall be forwarded to the invoice candidate.\n"
					+ "This works only if not an order line but an invoice candidate is directly created for the respective order line candidate.\n"
					+ "Therefore, please make sure to have <code>dataDestInternalName='DEST.de.metas.invoicecandidate'</code>.\n"
					+ "Otherwise, this property will be ignored.")
	private LocalDate dateInvoiced;

	@Nullable
	@ApiModelProperty( //
			allowEmptyValue = true, //
			value = "Can be set if the invoice's document type is already known from the external system and shall be forwarded to the invoice candidate.\\n\""
					+ "This works only if not an order line but an invoice candidate is directly created for the respective order line candidate.\n"
					+ "Therefore, please make sure to have <code>dataDestInternalName='DEST.de.metas.invoicecandidate'</code>.\n"
					+ "Otherwise, this property will be ignored\n"
					+ "\n"
					+ "Note for healthcare-ch users: set <code>docBaseType</code> to <code>ARI</code> (sale sinvoice) "
					+ "and <code>docSubType</code> to one of <code>EA</code> (\"Patient\"), <code>GM</code> (\"Gemeinde\" or <code>KV</code> (\"Krankenversicherung\"")
	private JsonDocTypeInfo invoiceDocType;

	/**
	 * Since we want to use {@code ..build().toBuilder()} to get copies if the builder,
	 * we have a number of mandatory fields which are not annotated with {@link NonNull}.
	 * Therefore we call this method to check each instance before it is actually used.
	 */
	public JsonOLCandCreateRequest validate()
	{
		Check.assumeNotNull(externalId, "externalId may not be null; this={}", this);
		Check.assumeNotNull(product, "product may not be null; this={}", this);
		Check.assumeNotNull(bpartner, "bpartner may not be null; this={}", this);

		if (!"DEST.de.metas.invoicecandidate".equals(dataDestInternalName)) // TODO extract constant
		{
			Check.assumeNotNull(dateRequired,
					"dateRequired may not be null, unless dataDestInternalName={}; this={}",
					"DEST.de.metas.invoicecandidate", this);
		}
		if (price != null)
		{
			Check.assumeNotNull(currencyCode,
					"currencyCode may not be null, if price is set; this={}",
					this);
		}
		return this;
	}

	/** Creates an instance with the given {@code syncAdvise} in all bPartners. */
	public JsonOLCandCreateRequest withBPartnersSyncAdvise(@Nullable final SyncAdvise syncAdvise)
	{
		if (syncAdvise == null)
		{
			return this;
		}

		final JsonOLCandCreateRequestBuilder builder = toBuilder();
		if (org != null && org.getBpartner() != null)
		{
			builder.org(org.toBuilder()
					.bpartner(org.getBpartner().toBuilder().syncAdvise(syncAdvise).build())
					.build());
		}
		if (billBPartner != null)
		{
			builder.billBPartner(billBPartner.toBuilder().syncAdvise(syncAdvise).build());
		}
		if (bpartner != null)
		{
			builder.bpartner(bpartner.toBuilder().syncAdvise(syncAdvise).build());
		}
		if (dropShipBPartner != null)
		{
			builder.dropShipBPartner(dropShipBPartner.toBuilder().syncAdvise(syncAdvise).build());
		}
		if (handOverBPartner != null)
		{
			builder.handOverBPartner(handOverBPartner.toBuilder().syncAdvise(syncAdvise).build());
		}
		return builder.build();
	}

	public JsonOLCandCreateRequest withProductsSyncAdvise(@Nullable final SyncAdvise syncAdvise)
	{
		if (syncAdvise == null)
		{
			return this;
		}

		return toBuilder()
				.product(getProduct().toBuilder().syncAdvise(syncAdvise).build())
				.build();
	}
}
