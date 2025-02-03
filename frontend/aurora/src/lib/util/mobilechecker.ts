import { writable } from "svelte/store";

export const isMobile = writable(false);

export function checkMobile() {
    const w = window.innerWidth;
    const h = window.innerHeight;
    if(h/w > 16/9) {
        isMobile.set(true);
    }
}