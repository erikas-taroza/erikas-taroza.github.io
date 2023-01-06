<script setup lang="ts">

</script>

<template>
    <div class="container">
        <h1 class="section-title">Skills</h1>
        <div class="grid">
            <v-card class="card" elevation="3">
                <h2>What I have worked with:</h2>
            </v-card>

            <v-card class="card" elevation="3">
                <h2>Languages I know:</h2>
            </v-card>
        </div>
    </div>
</template>

<style scoped>
    .grid {
        display: grid;
        grid-template-columns: 1fr 1fr;
        width: 100%;
        column-gap: 20px;
    }

    h2 {
        font-weight: 300;
        font-size: 20px;
        margin-bottom: 20px;
    }
</style>