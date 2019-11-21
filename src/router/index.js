import Vue from 'vue'
import VueRouter from 'vue-router'
import NetworkMap from '@/views/NetworkMap'
import SignRequests from '@/views/SignRequests'

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    redirect: '/network-map'
  },
  {
    path: '/network-map',
    name: 'network-map',
    component: NetworkMap
  },
  {
    path: '/sign-requests',
    name: 'signing requests',
    component: SignRequests
  },
  {
    path: '/about',
    name: 'about',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/About.vue')
  }
]

const router = new VueRouter({
  routes
})

export default router
