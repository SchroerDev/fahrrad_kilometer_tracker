<template>
    <nav class="navbar">
        <div class="nav-left">
            <a class="logo" href="#" @click.prevent="goHome">🚴 Fahrrad App</a>
            <template v-if="isLoggedIn">
                <button class="hamburger" @click="toggleMenu" aria-label="Menü öffnen">
                    <span></span>
                    <span></span>
                    <span></span>
                </button>
                <div v-if="showMenu" class="dropdown-menu">
                    <router-link to="/teams" @click="closeMenu">Teams</router-link>
                    <router-link to="/rides/new" @click="closeMenu">Fahrt eintragen</router-link>
                    <router-link to="/profile" @click="closeMenu">Profil</router-link>
                </div>
            </template>
        </div>
        <div class="nav-right">
            <button v-if="isLoggedIn" @click="logout">Logout</button>
        </div>
    </nav>
</template>

<script setup>
import { ref, onMounted } from 'vue'
import { useRouter } from 'vue-router'
import { supabase } from '../supabaseClient'

const router = useRouter()
const isLoggedIn = ref(false)
const showMenu = ref(false)

const checkSession = async () => {
    const { data: { session } } = await supabase.auth.getSession()
    isLoggedIn.value = !!session
    if (!session) showMenu.value = false
}

onMounted(checkSession)

supabase.auth.onAuthStateChange(() => {
    checkSession()
})

const goHome = async () => {
    const { data: { session } } = await supabase.auth.getSession()
    if (session) {
        router.push('/profile')
    } else {
        router.push('/login')
    }
}

const logout = async () => {
    const { error } = await supabase.auth.signOut()
    if (!error) {
        router.push('/login')
    } else {
        alert('Fehler beim Logout')
    }
}

function toggleMenu() {
    showMenu.value = !showMenu.value
}
function closeMenu() {
    showMenu.value = false
}
</script>

<style scoped>
.navbar {
    position: fixed;
    top: 0;
    left: 0;
    width: 100vw;
    z-index: 1000;
    display: flex;
    justify-content: space-between;
    align-items: center;
    background-color: #42b883;
    padding: 1rem 2rem;
    color: white;
    box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
}

.nav-left {
    display: flex;
    align-items: center;
    position: relative;
}

.nav-left .logo {
    font-weight: bold;
    font-size: 1.2rem;
    color: white;
    text-decoration: none;
    margin-right: 1rem;
}

.hamburger {
    display: flex;
    flex-direction: column;
    justify-content: center;
    width: 32px;
    height: 32px;
    background: none;
    border: none;
    cursor: pointer;
    padding: 0;
}
.hamburger span {
    display: block;
    height: 4px;
    width: 100%;
    background: white;
    margin: 4px 0;
    border-radius: 2px;
    transition: 0.2s;
}

.dropdown-menu {
    position: absolute;
    top: 48px;
    left: 0;
    background: white;
    color: #42b883;
    border-radius: 8px;
    box-shadow: 0 2px 8px rgba(0,0,0,0.15);
    display: flex;
    flex-direction: column;
    min-width: 160px;
    padding: 0.5rem 0;
    z-index: 2000;
}
.dropdown-menu a {
    color: #42b883;
    text-decoration: none;
    padding: 0.75rem 1.5rem;
    font-weight: 500;
    transition: background 0.2s;
}
.dropdown-menu a:hover {
    background: #e6f4f1;
}

.nav-right {
    display: flex;
    align-items: center;
    gap: 1rem;
    margin-right: 4rem;
}

button {
    background-color: white;
    color: #42b883;
    border: none;
    padding: 0.5rem 1rem;
    border-radius: 6px;
    cursor: pointer;
    font-weight: 500;
}

button:hover {
    background-color: #e6f4f1;
}

@media (max-width: 600px) {
    .navbar {
        padding: 1rem 0.5rem;
    }
    .dropdown-menu {
        left: 0;
        min-width: 120px;
    }
}
</style>

