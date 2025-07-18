<template>
    <v-main>
        <v-container class="d-flex align-center justify-center" style="min-height: calc(80vh - 64px);" fluid>
            <v-row justify="center">
                <v-col cols="12" sm="8" md="4">
                    <v-card class="pa-4" elevation="6">
                        <v-card-title class="text-h5 text-center">🚴 Fahrrad App – Login</v-card-title>

                        <v-card-text>
                            <v-form @submit.prevent="login">
                                <v-text-field v-model="email" label="E-Mail" type="email" required
                                    prepend-inner-icon="mdi-email" />
                                <v-text-field v-model="password" label="Passwort" type="password" required
                                    prepend-inner-icon="mdi-lock" />
                                <v-btn type="submit" color="primary" block class="mt-3">Anmelden</v-btn>
                            </v-form>

                            <v-btn class="mt-4" color="black" block @click="signInWithGithub" prepend-icon="mdi-github">
                                Mit GitHub anmelden
                            </v-btn>

                            <v-alert v-if="errorMessage" type="error" class="mt-4" dense border="start">
                                {{ errorMessage }}
                            </v-alert>

                            <div class="mt-4 text-center">
                                Noch kein Konto?
                                <router-link to="/register">Hier registrieren</router-link>
                            </div>
                        </v-card-text>
                    </v-card>
                </v-col>
            </v-row>
        </v-container>
    </v-main>
</template>
  

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
        router.push('/teams')
    }
}

async function signInWithGithub() {
    const { error } = await supabase.auth.signInWithOAuth({
        provider: 'github',
        options: {
            redirectTo: 'https://schroerdev.github.io/fahrrad_kilometer_tracker/'
        }
    })
    if (error) {
        errorMessage.value = error.message
    }
}
</script>
  
