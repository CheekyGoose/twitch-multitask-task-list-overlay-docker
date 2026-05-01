import { defineConfig } from 'vite'
import { resolve } from 'path'

export default defineConfig({
	server: {
		host: '0.0.0.0',
		port: 5173,
		strictPort: true,
		watch: {
			usePolling: true,
		},
	},
	build: {
		lib: {
			entry: resolve(__dirname, 'main.js'),
			name: 'MyLib',
			fileName: 'my-lib',
		},
	},
})