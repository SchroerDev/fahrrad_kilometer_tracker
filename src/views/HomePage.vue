<template>
    <div class="home">
        <h1>🚴 Fahrrad Kilometer App</h1>
        <p>
            Willkommen! Dies ist ein <strong>Testprojekt</strong>, um <strong>Supabase</strong> auszuprobieren.
            Die App wurde mit <strong>Vue.js</strong> entwickelt und dient zum Sammeln und Vergleichen von gefahrenen
            Fahrradkilometern.
        </p>
        <div class="buttons">
            <router-link to="/login"><button>Anmelden</button></router-link>
            <router-link to="/register"><button>Registrieren</button></router-link>
        </div>
    </div>
</template>

<script setup>
</script>

<style scoped>
.home {
    max-width: 600px;
    margin: 2rem auto;
    text-align: center;
}

.buttons {
    margin-top: 2rem;
}

button {
    margin: 0 1rem;
    padding: 0.75rem 1.5rem;
    background-color: #42b883;
    color: white;
    border: none;
    border-radius: 6px;
    font-size: 1rem;
}
</style>
  
