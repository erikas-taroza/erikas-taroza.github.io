import { createRouter, createWebHistory } from "vue-router";

import Home from "../pages/Home.vue";
import Resume from "../pages/Resume.vue";

const router = createRouter({
    history: createWebHistory(import.meta.env.BASE_URL),
    routes: [
        {
            path: "/",
            name: "home",
            component: Home,
        },
        {
            path: "/cv",
            name: "cv",
            component: Resume,
        },
    ],
});

export default router;
