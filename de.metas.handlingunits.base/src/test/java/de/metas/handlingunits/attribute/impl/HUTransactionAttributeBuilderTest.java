package de.metas.handlingunits.attribute.impl;

import static org.mockito.Mockito.times;

import org.compiere.model.I_M_Attribute;
import org.junit.Test;
import org.mockito.Mockito;

import com.google.common.collect.ImmutableList;

import de.metas.handlingunits.AbstractHUTest;
import de.metas.handlingunits.attribute.IHUTransactionAttributeBuilder;
import de.metas.handlingunits.attribute.storage.IAttributeStorage;
import de.metas.handlingunits.attribute.strategy.IHUAttributeTransferRequest;
import de.metas.handlingunits.attribute.strategy.IHUAttributeTransferStrategy;

public class HUTransactionAttributeBuilderTest extends AbstractHUTest
{
	IHUAttributeTransferRequest request;
	IAttributeStorage attributesFrom;
	IAttributeStorage attributesTo;
	IHUAttributeTransferStrategy transferStrategy;
	I_M_Attribute attribute;

	@Override
	protected void initialize()
	{
		request = Mockito.mock(IHUAttributeTransferRequest.class);
		attributesFrom = Mockito.mock(IAttributeStorage.class);
		attributesTo = Mockito.mock(IAttributeStorage.class);
		transferStrategy = Mockito.mock(IHUAttributeTransferStrategy.class);
		attribute = Mockito.mock(I_M_Attribute.class);
	}

	@Test
	public void testTransferCalled()
	{
		final IHUTransactionAttributeBuilder trxAttributeBuilder = new HUTransactionAttributeBuilder(helper.getHUContext());

		createExpectations(true, true); // targetHasAttribute, transferable

		trxAttributeBuilder.transferAttributes(request);

		createVerifications(1); // noOfTimesTransferCalled
	}

	@Test
	public void testTransferNotCalled()
	{
		final IHUTransactionAttributeBuilder trxAttributeBuilder = new HUTransactionAttributeBuilder(helper.getHUContext());

		createExpectations(true, false); // targetHasAttribute, transferable

		trxAttributeBuilder.transferAttributes(request);

		createVerifications(0); // noOfTimesTransferCalled
	}

	@Test
	public void testTargetDoesNotHaveAttribute()
	{
		final IHUTransactionAttributeBuilder trxAttributeBuilder = new HUTransactionAttributeBuilder(helper.getHUContext());

		createExpectations(false, true); // targetHasAttribute, transferable

		trxAttributeBuilder.transferAttributes(request);

		createVerifications(0); // noOfTimesTransferCalled
	}

	private void createExpectations(final boolean targetHasAttribute, final boolean transferable)
	{
		Mockito.when(request.getAttributesFrom()).thenReturn(attributesFrom);
		Mockito.when(request.getAttributesTo()).thenReturn(attributesTo);

		Mockito.when(attributesFrom.getAttributes()).thenReturn(ImmutableList.of(attribute));
		Mockito.when(attributesFrom.retrieveTransferStrategy(attribute)).thenReturn(transferStrategy);

		Mockito.when(attributesTo.hasAttribute(attribute)).thenReturn(targetHasAttribute);

		Mockito.when(transferStrategy.isTransferable(request, attribute)).thenReturn(transferable);
	}

	private void createVerifications(final int noOfTimesTransferCalled)
	{
		Mockito.verify(transferStrategy, times(noOfTimesTransferCalled))
				.transferAttribute(request, attribute);
	}
}
