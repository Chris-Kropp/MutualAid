<script lang="ts">
	import type { Item } from '$lib/item/ItemListManager';
	import AvailabilityBadge from '../item/availabilityBadge.svelte';

	export let item: Item | undefined;
</script>

{#if item}
	<div class="card">
		<div class="header">
			<h2 class="title text">{item.name}</h2>
			<AvailabilityBadge status={item.status}></AvailabilityBadge>
		</div>
		<p class="text body">
			{item.description}
		</p>
		<div class="cardFooter">
			<p class="minorText">{item.location}</p>
		</div>
	</div>
{/if}

<style>
	.card {
		min-width: 300px;
		max-width: 400px;
		max-height: 300px;
		border: solid 1px grey;
		border-radius: 16px;
		padding: 16px;
		background-color: #292d32;
		&:hover {
			background-color: #2d3034;
		}
		margin: 16px;
	}

	.header {
		display: flex;
		align-items: center;
		justify-content: space-between;
	}

	.title {
		margin: 0px;
		margin-right: 16px;
	}

	.body {
		display: flex;
		flex-direction: column;
		height: 100%;
		justify-content: space-between;
	}

	.cardFooter {
		position: relative;
		bottom: 86px;
	}
</style>
