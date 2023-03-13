<script setup lang="ts">
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
        name: "home"
    });
}
</script>

<template>
    <div style="background-color: #FFFFFF;">
        <div class="buttons">
            <v-btn
                color="#DEDEDE"
                variant="flat"
                style="margin-right: 20px;"
                @click="goToHome()"
            >
                Back
            </v-btn>
            <v-btn
                color="primary"
                variant="flat"
                style="margin-right: 20px;"
                download
                href="src/assets/resume/resume.pdf"
            >
                Download (PDF)
            </v-btn>
        </div>

        <iframe
            id="resume"
            src="src/assets/resume/resume.html"
            frameborder="0"
            width="100%"
        >
        </iframe>
    </div>
</template>

<style scoped>
    .buttons {
        display: flex;
        flex-direction: row;
        padding: 15px;
    }
</style>