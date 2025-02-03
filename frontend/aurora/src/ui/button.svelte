<script lang="ts">
	import { isMobile } from "$lib/util/mobilechecker";

	export let action = () => {};
	export let text: string | undefined = undefined;
	export let ariaLabel: string | undefined = undefined;

	if (!text && !ariaLabel) {
		text = 'Button must include either text or aria label';
	}
</script>

<button type="button" aria-label={ariaLabel ?? text} class="button" class:mobile={$isMobile} on:click={() => action()}>
	{#if text}
		<h3 class="text">{text}</h3>
	{/if}
</button>

<style>
	.button {
		border: none;
		min-height: 24px;
		min-width: 24px;
		margin: 4px;
		background-color: #2a2e32;
		border-radius: 6px; /* proportional to sidebar radius*/
		cursor: pointer;
		&:hover {
			background-color: #4e545b;
		}
		&:active {
			background-color: #6b737d;
		}
	}

	.mobile {
		min-height: 40px;
		min-width: 40px;
		&:hover {
			background-color: #2a2e32;
		}
		&:active {
			background-color: #6b737d;
		}
	}

	.text {
		padding: 0;
		margin: 0;
	}
</style>
