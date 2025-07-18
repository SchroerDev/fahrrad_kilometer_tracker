<template>
    <div>
    <v-card class="mx-auto">
      <v-layout class="pa-0">
        <NavBar />
        <router-view />  
      </v-layout>
    </v-card>
  </div>
</template>
  

<script setup>
import NavBar from './components/NavBar.vue'
</script>
  
