<template>
  <!-- Breadcrumbs-Komponente vorübergehend entfernt -->
  <div></div>
</template>

<script setup>
import { computed } from 'vue'
import { useRoute } from 'vue-router'

const route = useRoute()

const routeMap = {
  '/': { text: 'Home', to: '/' },
  '/teams': { text: 'Teams', to: '/teams' },
  '/my-team': { text: 'Mein Team', to: '/my-team' },
  '/team-stats': { text: 'Statistiken', to: '/team-stats' },
  '/profile': { text: 'Profil', to: '/profile' },
  '/rides/new': { text: 'Neue Fahrt', to: '/rides/new' },
  '/create-team': { text: 'Team erstellen', to: '/create-team' },
  '/invite-member': { text: 'Mitglied einladen', to: '/invite-member' },
  '/register': { text: 'Registrieren', to: '/register' },
  '/login': { text: 'Login', to: '/login' },
}

// Variable wird nicht genutzt, daher mit _ benennen
const _breadcrumbItems = computed(() => {
  const path = route.path
  const segments = path.split('/').filter(Boolean)
  let current = ''
  const items = []

  items.push(routeMap['/'])

  for (const segment of segments) {
    current += '/' + segment
    if (routeMap[current]) {
      items.push(routeMap[current])
    } else if (current.startsWith('/join-team')) {
      items.push({ text: 'Team beitreten', to: current })
    }
  }
  return items
})
</script>
