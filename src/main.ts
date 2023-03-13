import { createApp } from 'vue'
import App from './App.vue'
import vuetify from './plugins/vuetify';
import router from "./router/index";

import './assets/main.css'

export const resume = await (await fetch("src/assets/resume/resume.html")).text();

const app = createApp(App);

app.use(vuetify);
app.use(router);

app.mount('#app');