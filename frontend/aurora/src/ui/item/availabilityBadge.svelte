<script lang="ts">
	import { AvailabilityStatus } from '$lib/item/AvailabilityStatus';

	export let status: AvailabilityStatus = AvailabilityStatus.Unavailable;
	export let outlined: boolean = false;

	let badgeText = {
		[AvailabilityStatus.Available]: 'available',
		[AvailabilityStatus.Requested]: 'requested',
		[AvailabilityStatus.Borrowed]: 'borrowed',
		[AvailabilityStatus.Unavailable]: 'unavailable'
	};
	let badgeColor = {
		[AvailabilityStatus.Available]: '#4DB35E',
		[AvailabilityStatus.Requested]: '#9F9F9F',
		[AvailabilityStatus.Borrowed]: '#CBC845',
		[AvailabilityStatus.Unavailable]: '#C1676D'
	};
</script>

<div
	class={['badge']}
	class:outlined
	style="background-color: {badgeColor[status]}; border-color: {badgeColor[status]};"
>
	<p>
		{badgeText[status]}
	</p>
</div>

<style>
	.badge {
		user-select: none;
		padding-top: 2px;
		padding-bottom: 2px;
		width: min-content;
		height: min-content;
		padding-left: 8px;
		padding-right: 8px;
		border-radius: 99999px;
		margin: 1px;
	}

	.outlined {
		background-color: transparent !important;
		border: 1px solid;
		margin: 0px;
		p {
			color: white;
		}
	}

	p {
		margin: 0px;
	}
</style>
