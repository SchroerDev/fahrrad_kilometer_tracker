<script setup>
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
        router.push('/teams') // Weiterleitung zur Team-Übersicht
    }
}
</script>

<template>
    <div class="login-container">
        <h1>🚴 Fahrrad App – Login</h1>
        <form @submit.prevent="login">
            <input v-model="email" type="email" placeholder="E-Mail" required />
            <input v-model="password" type="password" placeholder="Passwort" required />
            <button type="submit">Anmelden</button>
        </form>
        <p v-if="errorMessage" class="error">{{ errorMessage }}</p>
    </div>
    <router-view />
</template>

<style scoped>
.login-container {
    max-width: 400px;
    margin: 2rem auto;
    padding: 2rem;
    border: 1px solid #ccc;
    border-radius: 8px;
}

input {
    display: block;
    width: 100%;
    margin-bottom: 1rem;
    padding: 0.5rem;
}

button {
    width: 100%;
    padding: 0.5rem;
    background-color: #2c3e50;
    color: white;
    border: none;
    border-radius: 4px;
}

.error {
    color: red;
    margin-top: 1rem;
}
</style>
