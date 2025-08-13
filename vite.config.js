import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'
import { VitePWA } from 'vite-plugin-pwa'
import { fileURLToPath } from 'url'
import { dirname } from 'path'
import { URL } from 'url'

const __filename = fileURLToPath(import.meta.url)
const __dirname = dirname(__filename)

export default defineConfig({
  base: '/fahrrad_kilometer_tracker/', // <- wichtig für GitHub Pages!
  build: {
    outDir: 'docs', // <-- Output-Ordner für GitHub Pages auf /docs setzen
  },
  plugins: [
    vue(),
    VitePWA({
      registerType: 'autoUpdate',
      includeAssets: ['favicon.svg', 'robots.txt'],
      manifest: {
        name: 'Fahrrad Kilometer App',
        short_name: 'FahrradApp',
        description: 'Sammle und vergleiche gefahrene Fahrradkilometer',
        start_url: '/fahrrad_kilometer_tracker/',
        scope: '/fahrrad_kilometer_tracker/',
        display: 'standalone',
        background_color: '#ffffff',
        theme_color: '#42b883',
        lang: 'de',
        icons: [
          {
            src: 'pwa-192x192.png',
            sizes: '192x192',
            type: 'image/png',
          },
          {
            src: 'pwa-512x512.png',
            sizes: '512x512',
            type: 'image/png',
          },
        ],
      },
    }),
  ],
  resolve: {
    alias: {
      '@': fileURLToPath(new URL('./src', import.meta.url)),
    },
  },
  test: {
    setupFiles: ['./tests/setup.js'],
    environment: 'jsdom',
    globals: true,
  },
})
