<script setup lang="ts">
import resumePdf from "@/assets/resume/resume.pdf";
import resumeHtml from "@/assets/resume/resume.html?url";

import router from "@/router";
import { onMounted } from "vue";

onMounted(() => {
    let iframe = document.getElementById("resume")! as HTMLIFrameElement;
    iframe.onload = () => {
        iframe.height = (iframe.contentDocument?.body.scrollHeight ?? 0).toString();
    };
});

function goToHome() {
    router.push({
        name: "home",
    });
}
</script>

<template>
    <div style="background-color: #ffffff">
        <div class="buttons">
            <v-btn color="#DEDEDE" variant="flat" style="margin-right: 20px" @click="goToHome()"> Back </v-btn>
            <v-btn color="primary" variant="flat" style="margin-right: 20px" download :href="resumePdf">
                Download (PDF)
            </v-btn>
        </div>

        <iframe id="resume" :src="resumeHtml" frameborder="0" width="100%"> </iframe>
    </div>
</template>

<style scoped>
.buttons {
    display: flex;
    flex-direction: row;
    padding: 15px;
}
</style>
