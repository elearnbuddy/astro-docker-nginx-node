// @ts-check
import { defineConfig } from "astro/config";

import node from "@astrojs/node";
import { compression } from "vite-plugin-compression2";

// https://astro.build/config
export default defineConfig({
	scopedStyleStrategy: "class",
	adapter: node({
		mode: "standalone",
	}),
	server: {
		port: 3000,
	},
	vite: {
		plugins: [compression()],
	},
});
