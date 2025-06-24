<template>
    <nav class="navbar">
        <div class="nav-left">
            <router-link to="/" class="logo">🚴 Fahrrad App</router-link>
        </div>
        <div class="nav-right">
            <router-link to="/teams">Teams</router-link>
            <router-link to="/profile">Profil</router-link>
            <button @click="logout">Logout</button>
        </div>
    </nav>
</template>

<script setup>
import { useRouter } from 'vue-router'
import { supabase } from '../supabaseClient'


const router = useRouter()

const logout = async () => {
    const { error } = await supabase.auth.signOut()
    if (!error) {
        router.push('/login')
    } else {
        alert('Fehler beim Logout')
    }
}
</script>

<style scoped>
.navbar {
    display: flex;
    justify-content: space-between;
    align-items: center;
    background-color: #42b883;
    padding: 1rem 2rem;
    color: white;
    box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
}

.nav-left .logo {
    font-weight: bold;
    font-size: 1.2rem;
    color: white;
    text-decoration: none;
}

.nav-right {
    display: flex;
    gap: 1rem;
    align-items: center;
}

.nav-right a {
    color: white;
    text-decoration: none;
    font-weight: 500;
}

.nav-right a:hover {
    text-decoration: underline;
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
</style>
  
