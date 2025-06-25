import { createApp } from 'vue'
import './style.css'
import App from './App.vue'
import router from './router'
import { supabase } from './supabaseClient'

// Hilfsfunktion: Hash-Parameter in Query-Parameter umwandeln
function convertHashToQuery() {
  if (window.location.hash.startsWith('#/access_token=')) {
    // Entferne das führende #/
    const hash = window.location.hash.replace('#/', '#')
    // Ersetze # durch ?
    const url = window.location.href.replace(hash, hash.replace('#', '?'))
    window.location.replace(url)
  }
}

convertHashToQuery()

async function init() {
  // Warte auf die Session-Initialisierung
  let sessionChecked = false
  supabase.auth.onAuthStateChange((event, session) => {
    if (event === 'SIGNED_IN' || event === 'TOKEN_REFRESHED') {
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

  createApp(App).use(router).mount('#app')
}

init()
