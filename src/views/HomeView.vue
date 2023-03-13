<script setup lang="ts">
import Navbar from "../components/navigation/Navbar.vue";
import Profile from "../components/Profile.vue";
import Info from "../components/Info.vue";
import Skills from "../components/Skills.vue";
import Projects from "../components/Projects.vue";
import Contact from "../components/Contact.vue";
</script>

<template>
    <Navbar/>
    <div class="header"></div>
    <div class="contents">
        <div id="Home">
            <Profile style="margin-bottom: 50px;"/>
            <Info/>
        </div>
        <Skills id="Skills"/>
        <Projects id="Projects"/>
        <Contact id="Contact"/>
    </div>
</template>

<style scoped>
    .contents {
        display: flex;
        flex-direction: column;
        row-gap: 50px;
        align-items: center;
        width: 100%;
        padding-left: 10px;
        padding-right: 10px;
        /* For the profile picture, move up to overlap with header. */
        position: relative;
        top: -60px;
    }

    .header {
        height: 300px;
        width: 100%;
        background-image: url("../assets/img/clouds-red.jpg");
        background-position: center center;
        background-size: cover;
        background-attachment: fixed;
    }
</style>