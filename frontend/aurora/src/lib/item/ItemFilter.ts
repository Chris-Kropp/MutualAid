import { writable, type Writable } from 'svelte/store';
import { AvailabilityStatus } from './AvailabilityStatus';
import type { Item } from './ItemListManager';

export type ItemFilter = {
	status?: AvailabilityStatus[];
};

export const defaultFilter: ItemFilter = {
	status: [AvailabilityStatus.Available, AvailabilityStatus.Borrowed]
};

export const filter: Writable<ItemFilter> = writable(defaultFilter);

export function filterItems(items: Item[], filter: ItemFilter) {
	return items.filter((item) => {
		let matches = true;
		for (const key in filter) {
			const filterKey = key as keyof ItemFilter;
			if (Array.isArray(filter[filterKey])) {
				matches = filter[filterKey].includes(item[filterKey]) && matches ? true : false;
			} else {
				matches = filter[filterKey] == item[filterKey] && matches ? true : false;
			}
		}
		return matches;
	});
}
