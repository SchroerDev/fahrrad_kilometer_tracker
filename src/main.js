import { createApp } from 'vue'
// Vuetify
import 'vuetify/styles'
import { createVuetify } from 'vuetify'
import * as components from 'vuetify/components'
import * as directives from 'vuetify/directives'

import App from './App.vue'
import router from './router'
import { supabase } from './supabaseClient'
import '@mdi/font/css/materialdesignicons.css'


async function init() {
  // Warte auf die Session-Initialisierung
  let sessionChecked = false
  supabase.auth.onAuthStateChange((event, session) => {
    if ((event === 'SIGNED_IN' || event === 'TOKEN_REFRESHED') && router.currentRoute.value.path === '/login') {
      router.replace('/teams')
    }
    if (event === 'SIGNED_OUT') {
      router.replace('/login')
    }
    // Nach dem ersten Event ist die Session initialisiert
    if (!sessionChecked) {
      sessionChecked = true
    }
  })

  // Warte, bis Supabase die Session aus dem URL-Fragment verarbeitet hat
  const { data: { session } } = await supabase.auth.getSession()
  if (!session && router.currentRoute.value.path !== '/login') {
    router.replace('/login')
  }

  const vuetify = createVuetify({
    components,
    directives,
    theme: {
      defaultTheme: 'customTheme',
      themes: {
        customTheme: {
          dark: false,
          colors: {
            primary: '#42b883',
            secondary: '#2d323c',
            accent: '#FF7043',
            error: '#e74c3c',
            success: '#27ae60',
            background: '#23272f',
            surface: '#2d323c',
          },
        },
      },
    },
  })
  

  createApp(App)
    .use(router)
    .use(vuetify)
    .mount('#app')
}

init()
