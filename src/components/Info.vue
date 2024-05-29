<script setup lang="ts">
import resumePdf from "@/assets/resume/resume.pdf";

// Used for the "Contact Me" button.
function goTo(id: string) {
    let element = document.getElementById(id);
    if (!element) return;

    window.scrollTo(0, element.offsetTop);
}
</script>

<template>
    <div class="container">
        <v-card class="card" elevation="2" style="max-width: 900px">
            <div class="bio">
                <p><strong>Hello! I'm Erikas Taroza</strong></p>
                <p>
                    I am an experienced software developer with a diverse set of skills including Flutter/Dart, web
                    development, Git, and Linux. My journey in software development is marked by my drive to constantly
                    grow my skills and my commitment to excellence. I am also an active contributor to the open-source
                    community. I maintain my own projects as well as help fix various bugs in other open-source
                    projects.
                </p>

                <div style="margin-top: 20px">
                    <v-btn color="primary" variant="flat" style="margin-right: 20px" download :href="resumePdf">
                        Download CV (PDF)
                    </v-btn>

                    <v-btn color="#EEEEEE" variant="flat" @click="goTo('Contact')"> Contact Me </v-btn>
                </div>
            </div>
        </v-card>
    </div>
</template>

<style scoped>
@media (min-width: 800px) {
    .bio {
        margin: 10px 15px;
    }
}

.info {
    display: flex;
    flex-direction: row;
    align-items: center;
    justify-content: space-between;
    padding-top: 10px;
    padding-bottom: 10px;
}

.bio p {
    font-size: 16px;
    margin-bottom: 10px;
}
</style>
