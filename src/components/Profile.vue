<script setup lang="ts">

function openLink(urlToOpen:string) {
    window.open(urlToOpen);
}
</script>

<template>
    <div class="avatar">
    </div>

    <h1>Erikas Taroza</h1>
    <p>Full Stack Developer</p>

    <div style="margin-top: 20px;">
        <v-btn
            class="btn"
            icon="mdi-github"
            color="primary"
            width="40px"
            height="40px"
            @click="openLink('https://github.com/erikas-taroza')"
        />
        
        <v-btn
            class="btn"
            icon="mdi-linkedin"
            color="primary"
            width="40px"
            height="40px"
        />
    </div>
</template>

<style scoped>
    .avatar {
        border-radius: 100%;
        background-color: black;
        width: 120px;
        height: 120px;
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

    .btn {
        margin-left: 7px;
        margin-right: 7px;
    }
</style>