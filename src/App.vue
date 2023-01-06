<script setup lang="ts">
import Profile from "./components/Profile.vue";
</script>

<template>
    <main>
        <div class="header"></div>
        <Profile/>
    </main>
</template>

<style scoped>
    main {
        display: flex;
        flex-direction: column;
        align-items: center;
    }

    .header {
        background-color: #F44336;
        height: 300px;
        width: 100%;
    }
</style>