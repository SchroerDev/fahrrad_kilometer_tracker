<template>
  <v-app-bar app color="primary" dark>
    <v-toolbar-title class="cursor-pointer" @click="goHome"> 🚴 Fahrrad App </v-toolbar-title>

    <template v-if="isLoggedIn">
      <v-spacer />

      <!-- Dropdown-Menü für Navigation -->
      <v-menu location="bottom">
        <template #activator="{ props }">
          <v-btn icon v-bind="props">
            <v-icon>mdi-menu</v-icon>
          </v-btn>
        </template>
        <v-list>
          <v-list-item @click="navigateTo('/teams')">
            <v-list-item-title>Teams</v-list-item-title>
          </v-list-item>
          <v-list-item @click="navigateTo('/rides/new')">
            <v-list-item-title>Fahrt eintragen</v-list-item-title>
          </v-list-item>
          <v-list-item @click="navigateTo('/team-stats')">
            <v-list-item-title>Statistiken</v-list-item-title>
          </v-list-item>
          <v-list-item @click="navigateTo('/profile')">
            <v-list-item-title>Profil</v-list-item-title>
          </v-list-item>
        </v-list>
      </v-menu>

      <!-- Logout-Button -->
      <v-btn variant="text" class="ml-2" color="white" @click="logout"> Logout </v-btn>
    </template>
  </v-app-bar>

  <v-snackbar v-model="snackbar" :timeout="3000" color="error">
    {{ snackbarText }}
  </v-snackbar>
</template>

<script setup>
import { ref, onMounted, onUnmounted } from 'vue'
import { useRouter } from 'vue-router'
import { supabase } from '../supabaseClient'

const router = useRouter()
const isLoggedIn = ref(false)
const snackbar = ref(false)
const snackbarText = ref('')

let authListener = null

const checkSession = async () => {
  const {
    data: { session },
  } = await supabase.auth.getSession()
  isLoggedIn.value = !!session
}

onMounted(() => {
  checkSession()
  const { data } = supabase.auth.onAuthStateChange(() => {
    checkSession()
  })
  authListener = data.subscription
})

onUnmounted(() => {
  if (authListener) {
    authListener.unsubscribe()
  }
})

const goHome = () => {
  router.push(isLoggedIn.value ? '/profile' : '/login')
}

const logout = async () => {
  const { error } = await supabase.auth.signOut()
  if (!error) {
    router.push('/login')
  } else {
    snackbarText.value = 'Fehler beim Logout'
    snackbar.value = true
  }
}

const navigateTo = (path) => {
  router.push(path)
}
</script>
