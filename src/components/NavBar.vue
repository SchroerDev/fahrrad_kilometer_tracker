<template>
        <v-app-bar app color="primary" dark>
            <v-toolbar-title class="cursor-pointer" @click="goHome">
                🚴 Fahrrad App
            </v-toolbar-title>

            <template v-if="isLoggedIn">
                <v-spacer />

                <!-- Dropdown-Menü für Navigation -->
                <v-menu offset-y>
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
                        <v-list-item @click="navigateTo('/profile')">
                            <v-list-item-title>Profil</v-list-item-title>
                        </v-list-item>
                    </v-list>
                </v-menu>

                <!-- Logout-Button -->
                <v-btn text @click="logout" class="ml-2" color="white">
                    Logout
                </v-btn>
            </template>
        </v-app-bar>
</template>

<script setup>
import { ref, onMounted } from 'vue'
import { useRouter } from 'vue-router'
import { supabase } from '../supabaseClient'

const router = useRouter()
const isLoggedIn = ref(false)

const checkSession = async () => {
    const { data: { session } } = await supabase.auth.getSession()
    isLoggedIn.value = !!session
}

onMounted(checkSession)
supabase.auth.onAuthStateChange(() => checkSession())

const goHome = async () => {
    const { data: { session } } = await supabase.auth.getSession()
    router.push(session ? '/profile' : '/login')
}

const logout = async () => {
    const { error } = await supabase.auth.signOut()
    if (!error) {
        router.push('/login')
    } else {
        alert('Fehler beim Logout')
    }
}

const navigateTo = (path) => {
    router.push(path)
}
</script>
  
