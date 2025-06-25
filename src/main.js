import { createApp } from 'vue'
import './style.css'
import App from './App.vue'
import router from './router'
import { supabase } from './supabaseClient'

async function init() {
  // Session prüfen
  const { data: { session } } = await supabase.auth.getSession()
  if (!session && router.currentRoute.value.path !== '/login') {
    router.replace('/login')
  }

  // Auth-Listener
  supabase.auth.onAuthStateChange((event, session) => {
    if (event === 'SIGNED_OUT') {
      router.replace('/login')
    }
    if (event === 'SIGNED_IN' || event === 'TOKEN_REFRESHED') {
      // Optional: z.B. zur Teamseite weiterleiten
      router.replace('/teams')
    }
  })

  createApp(App).use(router).mount('#app')
}

init()
