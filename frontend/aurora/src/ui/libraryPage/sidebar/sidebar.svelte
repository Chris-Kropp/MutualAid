<script>
	import { isMobile } from '$lib/util/mobilechecker';
	import Button from '../../button.svelte';
	import AvailabilityFilter from './availability/availabilityFilter.svelte';
</script>

<div class="mainContents">
	{#if $isMobile}
	<div class="collapseButton"><Button text={'≡'} ariaLabel="expand/collapse sidebar"></Button></div>
	{/if}
	<div class="option">
		<AvailabilityFilter></AvailabilityFilter>
	</div>
</div>

<style>
	.collapseButton {
		float: right;
		margin-top: -12px;
		margin-right: -12px;
	}

	.mainContents {
		padding: 16px;
	}

	.option {
		padding-bottom: 16px;
	}
</style>
