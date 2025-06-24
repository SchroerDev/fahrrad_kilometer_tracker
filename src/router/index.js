import { createRouter, createWebHashHistory } from 'vue-router'

import LoginPage from '../views/LoginPage.vue'
import TeamsPage from '../views/TeamsPage.vue'
import CreateTeamPage from '../views/CreateTeamPage.vue'
import HomePage from '../views/HomePage.vue'
import RegisterPage from '../views/RegisterPage.vue'
import ProfilePage from '../views/ProfilePage.vue'
import NewRidePage from '../views/NewRidePage.vue'
import MyTeamPage from '../views/MyTeamPage.vue'
import InviteMemberPage from '../views/InviteMemberPage.vue'

const routes = [
    { path: '/', component: HomePage },
    { path: '/login', component: LoginPage },
    { path: '/register', component: RegisterPage },
    { path: '/teams', component: TeamsPage },
    { path: '/create-team', component: CreateTeamPage },
    { path: '/profile', component: ProfilePage },
    { path: '/rides/new', component: NewRidePage },
    { path: '/my-team', component: MyTeamPage },
    { path: '/join-team/:teamId', component: () => import('../views/JoinTeamPage.vue') },
    { path: '/invite-member', component: () => import('../views/InviteMemberPage.vue') }
]

const router = createRouter({
    history: createWebHashHistory(),
    routes
})

export default router
