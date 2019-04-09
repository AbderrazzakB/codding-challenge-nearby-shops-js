import Vue from 'vue'
import VueRouter from 'vue-router'
import Register from "../components/Auth/Register";
import Login from "../components/Auth/Login";

Vue.use(VueRouter)

const router = new VueRouter({
	mode: 'history',
	routes: [
		{ path: '/register', component: Register },
		{ path: '/login', component: Login },
	]
})

export default router