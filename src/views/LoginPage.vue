<template>
    <div class="login-container">
        <h1>🚴 Fahrrad App – Login</h1>
        <form @submit.prevent="login">
            <input v-model="email" type="email" placeholder="E-Mail" required />
            <input v-model="password" type="password" placeholder="Passwort" required />
            <button type="submit">Anmelden</button>
        </form>
        <button class="oauth-btn" @click="signInWithGithub" type="button">
            <span style="margin-right:0.5em;">🐙</span> Mit GitHub anmelden
        </button>
        <p v-if="errorMessage" class="error">{{ errorMessage }}</p>
        <div class="register-hint">
            Noch kein Konto?
            <router-link to="/register" class="register-link">Hier registrieren</router-link>
        </div>
    </div>
    <router-view />
</template>

<script setup>
import '../style.css'
import { ref } from 'vue'
import { useRouter } from 'vue-router'
import { supabase } from '../supabaseClient'

const router = useRouter()

const email = ref('')
const password = ref('')
const errorMessage = ref('')

async function login() {
    errorMessage.value = ''
    const { error } = await supabase.auth.signInWithPassword({
        email: email.value,
        password: password.value
    })
    if (error) {
        errorMessage.value = error.message
    } else {
        router.push('/teams')
    }
}

async function signInWithGithub() {
    const { error } = await supabase.auth.signInWithOAuth({
        provider: 'github', 
        redirectTo: "https://schroerdev.github.io/fahrrad_kilometer_tracker/#/login"
    })
    if (error) {
        errorMessage.value = error.message
    }
}
</script>

<style>
.oauth-btn {
    margin-top: 1.2rem;
    width: 100%;
    background: #24292f;
    color: #fff;
    border: none;
    border-radius: 8px;
    padding: 0.6em 1.2em;
    font-size: 1em;
    font-weight: 500;
    cursor: pointer;
    transition: background 0.2s;
    display: flex;
    align-items: center;
    justify-content: center;
}
.oauth-btn:hover {
    background: #444d56;
}
</style>

