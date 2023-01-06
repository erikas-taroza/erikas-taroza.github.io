<script setup lang="ts">
import Profile from "./components/Profile.vue";
import InfoCard from "./components/InfoCard.vue";
</script>

<template>
    <main>
        <div class="header"></div>
        <div class="contents">
            <Profile/>
            <InfoCard/>
        </div>
    </main>
</template>

<style scoped>
    .contents {
        display: flex;
        flex-direction: column;
        align-items: center;
        width: 100%;
        padding-left: 10px;
        padding-right: 10px;
    }

    .header {
        background-color: #F44336;
        height: 300px;
        width: 100%;
    }
</style>