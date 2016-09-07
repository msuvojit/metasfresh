package de.metas.ui.web.window.descriptor;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Nullable;

import org.adempiere.util.Check;
import org.adempiere.util.GuavaCollectors;
import org.slf4j.Logger;

import com.google.common.base.MoreObjects;
import com.google.common.base.Preconditions;
import com.google.common.base.Stopwatch;
import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;

import de.metas.logging.LogManager;
import de.metas.ui.web.window.exceptions.DocumentLayoutDetailNotFoundException;

/*
 * #%L
 * metasfresh-webui-api
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
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public
 * License along with this program.  If not, see
 * <http://www.gnu.org/licenses/gpl-2.0.html>.
 * #L%
 */

@SuppressWarnings("serial")
public final class DocumentLayoutDescriptor implements Serializable
{
	public static final Builder builder()
	{
		return new Builder();
	}

	/** i.e. AD_Window_ID */
	private final int AD_Window_ID;

	/** Special element: DocumentNo */
	private final DocumentLayoutElementDescriptor documentNoElement;
	/** Special element: DocStatus/DocAction */
	private final DocumentLayoutElementDescriptor docActionElement;

	/** Single row layout: header sections */
	private final List<DocumentLayoutSectionDescriptor> sections;
	private final DocumentLayoutDetailDescriptor gridView;
	
	/** Single row layout: included tabs */
	private final Map<String, DocumentLayoutDetailDescriptor> details;

	/** Side list layout */
	private final DocumentLayoutSideListDescriptor sideList;

	/** Filters */
	private final List<DocumentQueryFilterDescriptor> filters;

	/** Misc debugging properties */
	private final Map<String, String> debugProperties;

	private DocumentLayoutDescriptor(final Builder builder)
	{
		super();
		AD_Window_ID = builder.AD_Window_ID;
		documentNoElement = builder.documentNoElement;
		docActionElement = builder.docActionElement;

		sections = ImmutableList.copyOf(builder.buildSections());
		gridView = builder.gridView.build();
		details = ImmutableMap.copyOf(builder.buildDetails());
		sideList = builder.getSideList();
		filters = builder.getFilters();

		debugProperties = ImmutableMap.copyOf(builder.debugProperties);
	}

	@Override
	public String toString()
	{
		return MoreObjects.toStringHelper(this)
				.omitNullValues()
				.add("AD_Window_ID", AD_Window_ID)
				.add("sections", sections.isEmpty() ? null : sections)
				.add("gridView", gridView)
				.add("details", details.isEmpty() ? null : details)
				.add("sideList", sideList)
				.toString();
	}

	public int getAD_Window_ID()
	{
		return AD_Window_ID;
	}

	public DocumentLayoutElementDescriptor getDocumentNoElement()
	{
		return documentNoElement;
	}

	public DocumentLayoutElementDescriptor getDocActionElement()
	{
		return docActionElement;
	}

	public List<DocumentLayoutSectionDescriptor> getSections()
	{
		return sections;
	}
	
	public DocumentLayoutDetailDescriptor getGridView()
	{
		return gridView;
	}

	public Collection<DocumentLayoutDetailDescriptor> getDetails()
	{
		return details.values();
	}

	/**
	 *
	 * @param detailId
	 * @return detail
	 * @throws DocumentLayoutDetailNotFoundException
	 */
	public DocumentLayoutDetailDescriptor getDetail(final String detailId)
	{
		final DocumentLayoutDetailDescriptor detail = details.get(detailId);
		if (detail == null)
		{
			throw new DocumentLayoutDetailNotFoundException("Tab '" + detailId + "' was not found. Available tabs are: " + details.keySet());
		}

		return detail;
	}

	public DocumentLayoutSideListDescriptor getSideList()
	{
		return sideList;
	}

	public List<DocumentQueryFilterDescriptor> getFilters()
	{
		return filters;
	}

	public Map<String, String> getDebugProperties()
	{
		return debugProperties;
	}

	public static final class Builder
	{

		private static final Logger logger = LogManager.getLogger(DocumentLayoutDescriptor.Builder.class);

		private int AD_Window_ID;
		private DocumentLayoutElementDescriptor documentNoElement;
		private DocumentLayoutElementDescriptor docActionElement;

		private final List<DocumentLayoutSectionDescriptor.Builder> sectionBuilders = new ArrayList<>();
		private DocumentLayoutDetailDescriptor.Builder gridView;

		private final List<DocumentLayoutDetailDescriptor.Builder> detailsBuilders = new ArrayList<>();
		private DocumentLayoutSideListDescriptor sideList;
		private final List<DocumentQueryFilterDescriptor> filters = new ArrayList<>();

		private final Map<String, String> debugProperties = new LinkedHashMap<>();
		private Stopwatch stopwatch;

		private Builder()
		{
			super();
		}

		@Override
		public String toString()
		{
			return MoreObjects.toStringHelper(this)
					.add("AD_Window_ID", AD_Window_ID)
					.toString();
		}

		public DocumentLayoutDescriptor build()
		{
			//
			// Debug informations:
			putDebugProperty("generator-thread", Thread.currentThread().getName());
			putDebugProperty("generator-timestamp", new java.util.Date().toString());
			if (stopwatch != null)
			{
				putDebugProperty("generator-duration", stopwatch.toString());
			}

			return new DocumentLayoutDescriptor(this);
		}

		private List<DocumentLayoutSectionDescriptor> buildSections()
		{
			return sectionBuilders
					.stream()
					.filter(sectionBuilder -> checkValid(sectionBuilder))
					.map(sectionBuilder -> sectionBuilder.build())
					.filter(section -> checkValid(section))
					.collect(GuavaCollectors.toImmutableList());
		}

		private boolean checkValid(final DocumentLayoutSectionDescriptor.Builder sectionBuilder)
		{
			if (sectionBuilder.isInvalid())
			{
				logger.trace("Skip adding {} to {} because it's not valid", sectionBuilder, this);
				return false;
			}

			return true;
		}

		private final boolean checkValid(final DocumentLayoutSectionDescriptor section)
		{
			if (!section.hasColumns())
			{
				logger.trace("Skip adding {} to {} because it does not have columns", section, this);
				return false;
			}

			return true;
		}

		private Map<String, DocumentLayoutDetailDescriptor> buildDetails()
		{
			return detailsBuilders
					.stream()
					.map(detailBuilder -> detailBuilder.build())
					.filter(detail -> detail.hasElements())
					.collect(GuavaCollectors.toImmutableMapByKey(detail -> detail.getDetailId()));
		}

		public Builder setAD_Window_ID(final int AD_Window_ID)
		{
			this.AD_Window_ID = AD_Window_ID;
			return this;
		}

		public Builder setDocumentNoElement(final DocumentLayoutElementDescriptor documentNoElement)
		{
			this.documentNoElement = documentNoElement;
			return this;
		}

		public Builder setDocActionElement(final DocumentLayoutElementDescriptor docActionElement)
		{
			this.docActionElement = docActionElement;
			return this;
		}

		public Builder addSection(final DocumentLayoutSectionDescriptor.Builder sectionBuilder)
		{
			Check.assumeNotNull(sectionBuilder, "Parameter sectionBuilder is not null");
			sectionBuilders.add(sectionBuilder);
			return this;
		}

		public Builder addSections(final Collection<DocumentLayoutSectionDescriptor.Builder> sectionsBuilders)
		{
			sectionBuilders.addAll(sectionsBuilders);
			return this;
		}

		private final DocumentLayoutElementDescriptor.Builder findSectionElementBuilderByFieldName(final String fieldName)
		{
			for (final DocumentLayoutSectionDescriptor.Builder sectionBuilder : sectionBuilders)
			{
				final DocumentLayoutElementDescriptor.Builder elementBuilder = sectionBuilder.findElementBuilderByFieldName(fieldName);
				if (elementBuilder == null)
				{
					continue;
				}

				return elementBuilder;
			}

			return null;
		}

		public boolean isAdvancedSectionField(final String fieldName)
		{
			final DocumentLayoutElementDescriptor.Builder elementBuilder = findSectionElementBuilderByFieldName(fieldName);
			return elementBuilder != null && elementBuilder.isAdvancedField();
		}

		public boolean hasSectionElement(final String fieldName)
		{
			return findSectionElementBuilderByFieldName(fieldName) != null;
		}

		public Builder setGridView(final DocumentLayoutDetailDescriptor.Builder gridView)
		{
			this.gridView = gridView;
			return this;
		}

		/**
		 * Adds detail/tab if it's valid.
		 *
		 * @param detailBuilder detail/tab builder
		 */
		public Builder addDetailIfValid(@Nullable final DocumentLayoutDetailDescriptor.Builder detailBuilder)
		{
			if (detailBuilder == null)
			{
				return this;
			}

			if (!detailBuilder.hasElements())
			{
				logger.trace("Skip adding detail tab to layout because it does not have elements: {}", detailBuilder);
				return this;
			}

			detailsBuilders.add(detailBuilder);
			return this;
		}

		public Builder setSideList(final DocumentLayoutSideListDescriptor sideList)
		{
			this.sideList = sideList;
			return this;
		}

		public DocumentLayoutSideListDescriptor getSideList()
		{
			Preconditions.checkNotNull(sideList, "sideList");
			return sideList;
		}

		public Builder putDebugProperty(final String name, final String value)
		{
			debugProperties.put(name, value);
			return this;
		}

		public Builder setStopwatch(final Stopwatch stopwatch)
		{
			this.stopwatch = stopwatch;
			return this;
		}

		private List<DocumentQueryFilterDescriptor> getFilters()
		{
			return ImmutableList.copyOf(filters);
		}

		public Builder addFilters(final List<DocumentQueryFilterDescriptor> filters)
		{
			this.filters.addAll(filters);
			return this;
		}
	}
}
