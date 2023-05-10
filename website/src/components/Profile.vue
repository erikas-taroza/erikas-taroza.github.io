<script setup lang="ts">
import Socials from "./Socials.vue";
</script>

<template>
    <div class="container">
        <img class="avatar" src="@/assets/img/portrait.jpg"/>

        <h1>Erikas Taroza</h1>
        <p>Full Stack Developer</p>

        <Socials style="margin-top: 20px;"/>
    </div>
</template>

<style scoped>
    .avatar {
        border-radius: 100%;
        width: 120px;
        height: 120px;
        object-fit: cover;
    }

    h1 {
        font-weight: lighter;
        font-size: 40px;
        margin-top: 10px;
    }

    p {
        font-size: 16px;
        font-weight: normal;
        margin: 0px;
    }
</style>