<script lang="ts">
	import { AvailabilityStatus } from '$lib/item/AvailabilityStatus';
	import { filter } from '$lib/item/ItemFilter';
	import AvailabilityBadge from '../../../item/availabilityBadge.svelte';

	function toggleOption(availability: AvailabilityStatus) {
		const modifiedFilter = { ...$filter };
		if (modifiedFilter.status?.includes(availability)) {
			modifiedFilter.status = modifiedFilter.status.filter((filtered) => filtered != availability);
		} else {
			modifiedFilter.status?.push(availability);
		}
		filter.set(modifiedFilter);
	}
</script>

<h3 class="title text">Availability</h3>
<div class="availabilityOptions">
	<button type="button" class="option" on:click={() => toggleOption(AvailabilityStatus.Available)}>
		<AvailabilityBadge
			status={AvailabilityStatus.Available}
			outlined={!$filter.status?.includes(AvailabilityStatus.Available)}
		></AvailabilityBadge>
	</button>
	<button type="button" class="option" on:click={() => toggleOption(AvailabilityStatus.Borrowed)}>
		<AvailabilityBadge
			status={AvailabilityStatus.Borrowed}
			outlined={!$filter.status?.includes(AvailabilityStatus.Borrowed)}
		></AvailabilityBadge>
	</button>
	<button
		type="button"
		class="option"
		on:click={() => toggleOption(AvailabilityStatus.Unavailable)}
	>
		<AvailabilityBadge
			status={AvailabilityStatus.Unavailable}
			outlined={!$filter.status?.includes(AvailabilityStatus.Unavailable)}
		></AvailabilityBadge>
	</button>
</div>

<style>
	button {
		border: none;
		background-color: transparent;
		padding: 0px;
	}

	.availabilityOptions {
		display: flex;
		flex-direction: row;
		column-gap: 8px;
	}

	.option {
		height: min-content;
		width: min-content;
		cursor: pointer;
		border-radius: 999999px;
	}

	.title {
		margin-top: 0px;
	}
</style>
