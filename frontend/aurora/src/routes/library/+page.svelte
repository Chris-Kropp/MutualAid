<script lang="ts">
	import { onMount } from 'svelte';
	import Header from '../../ui/header/header.svelte';
	import Card from '../../ui/item/card.svelte';
	import Sidebar from '../../ui/libraryPage/sidebar/sidebar.svelte';
	import { type Item, ItemListManager } from '$lib/item/ItemListManager';
	import { filter, filterItems } from '$lib/item/ItemFilter';
	import { checkMobile, isMobile } from '$lib/util/mobilechecker';

	let allItems: Item[] = [];
	let displayedItems: Item[] = [];

	const itemListManager = new ItemListManager();

	onMount(async () => {
		allItems = await itemListManager.getItems($filter);
		updateItems();
		checkMobile();
	});

	$: $filter && updateItems();

	const updateItems = async () => {
		displayedItems = filterItems(allItems, $filter);
	};
</script>

<div class="header">
	<Header></Header>
</div>
<div class="contentHolder">
	<div class="sidebar" class:mobileSidebar={$isMobile}>
		<Sidebar></Sidebar>
	</div>

	<div class="itemAlignment">
		<div class="items">
			{#each displayedItems as item}
				<Card {item}></Card>
			{/each}
		</div>
	</div>
</div>

<style>
	.header {
		height: 80px;
		background-color: darkslategrey;
		position: relative;
		/* top: -16px; */
	}

	.contentHolder {
		display: flex;
		flex-direction: row;
	}

	.sidebar {
		margin-top: 16px;
		margin-bottom: 16px;
		width: 300px;
		min-width: 300px;
		border-top-right-radius: 16px;
		border-bottom-right-radius: 16px;
		border: 1px grey solid;
		border-left: 0px;
		height: 100%;
		overflow: auto;
	}
	.mobileSidebar{
		position: absolute;
		width: calc(100% - 16px);
		height: 95%;
		background-color: #1a1d1f
	}

	.itemAlignment {
		padding-right: 32px;
		padding-left: 32px;
	}

	.items {
		height: calc(100vh - 80px);
		display: flex;
		flex-direction: row;
		flex-wrap: wrap;
		overflow: auto;
		align-content: flex-start;
	}

	:global(body) {
		margin: 0px;
		background-color: #1a1d1f;
		overflow: hidden;
		margin-top: -16px;
		margin-bottom: -16px;
	}

	:global(.text) {
		color: white;
	}

	:global(.minorText) {
		color: grey;
	}
</style>
