<script setup lang="ts">

const birthday = new Date("2005-02-14");

const info:Map<string, any> = new Map<string, any>([
    // https://stackoverflow.com/a/50827764
    ["Age", Math.floor((Date.now() - birthday.getTime()) / 3.15576e+10)],
    ["Country", "United States"],
    ["State", "Nevada"],
    ["Email", "erikastaroza@gmail.com"]
]);
</script>

<template>
    <v-card class="card">
        <div v-for="i in info" style="display: flex; flex-direction: row; align-items: center;">
            <h3>{{ i[0] }}</h3>
            <div style="width: 10px;"></div>
            <p>{{ i[1] }}</p>
        </div>
    </v-card>
</template>

<style scoped>

    .card {
        max-width: 1100px;
        width: 100%;
        padding-left: 20px;
        padding-right: 20px;
    }

</style>