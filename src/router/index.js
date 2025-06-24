import { createRouter, createWebHistory } from 'vue-router'

import LoginPage from '../views/LoginPage.vue'
import TeamsPage from '../views/TeamsPage.vue'
import CreateTeamPage from '../views/CreateTeamPage.vue'
import HomePage from '../views/HomePage.vue'
import RegisterPage from '../views/RegisterPage.vue'
import ProfilePage from '../views/ProfilePage.vue'


const routes = [
    { path: '/', component: HomePage },
    { path: '/login', component: LoginPage },
    { path: '/register', component: RegisterPage },
    { path: '/teams', component: TeamsPage },
    { path: '/create-team', component: CreateTeamPage },
    { path: '/profile', component: ProfilePage }    
]

const router = createRouter({
    history: createWebHistory(),
    routes
})

export default router
