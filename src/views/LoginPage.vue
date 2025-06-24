<template>
    <div class="login-container">
        <h1>🚴 Fahrrad App – Login</h1>
        <form @submit.prevent="login">
            <input v-model="email" type="email" placeholder="E-Mail" required />
            <input v-model="password" type="password" placeholder="Passwort" required />
            <button type="submit">Anmelden</button>
        </form>
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
</script>

