import { AvailabilityStatus } from './AvailabilityStatus';
import { defaultFilter, filterItems, type ItemFilter } from './ItemFilter';

export type Item = {
	name: string;
	description: string;
	category: string[];
	timeLimit: number;
	status: AvailabilityStatus;
	dueDate: Date | undefined;
	location: string | undefined;
};

export class ItemListManager {
	private _hasAllItems: boolean = false;
	public get hasAllItems() {
		return this._hasAllItems;
	}

	//TODO: add caching if needed
	public async getItems(filter?: ItemFilter): Promise<Item[]> {
		const items = await this.fetchItems(filter ?? defaultFilter);
		// return filter ? filterItems(items, filter) : items;
		return items;
	}

	//TODO: only fetch items as filtered if there's too many
	private async fetchItems(filter: ItemFilter): Promise<Item[]> {
		try {
			const response = await fetch('http://127.0.0.1:8080/items');

			if (!response.ok) {
				throw new Error('Failed to fetch items');
			}

			const itemsData: Item[] = await response.json();

			let items = itemsData.map((item) => ({
				...item,
				dueDate: item.dueDate ? new Date(item.dueDate) : undefined,
				status: this.mapAvailability(item.status),
				description:
					item.description.length < 100
						? item.description
						: item.description.slice(0, 97).concat('...')
			}));

			return items;
		} catch (error) {
			console.error('Error fetching items:', error);
			return [];
		}
	}

	private mapAvailability(availability: string): AvailabilityStatus {
		switch (availability) {
			case 'available':
				return AvailabilityStatus.Available;
			case 'requested':
				return AvailabilityStatus.Requested;
			case 'borrowed':
				return AvailabilityStatus.Borrowed;
			case 'unavailable':
				return AvailabilityStatus.Unavailable;
		}
		return AvailabilityStatus.Unavailable;
	}
}
