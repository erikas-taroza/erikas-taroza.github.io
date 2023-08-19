<script setup lang="ts">
import router from "@/router";
import resume from "@/assets/resume/resume.html?raw";

const aboutText = resume.split('<p style="margin-top: 30px" id="about">')[1].split("</p>")[0];

// Used for the "Contact Me" button.
function goTo(id: string) {
    let element = document.getElementById(id);
    if (!element) return;

    window.scrollTo(0, element.offsetTop);
}

function goToCV() {
    router.push({
        name: "cv",
    });
}
</script>

<template>
    <div class="container">
        <v-card class="card" elevation="2" style="max-width: 900px">
            <div class="bio">
                <p><strong>Hello! I'm Erikas Taroza</strong></p>
                <p>{{ aboutText }}</p>

                <div style="margin-top: 20px">
                    <v-btn color="primary" variant="flat" style="margin-right: 20px" @click="goToCV()">
                        Go to CV
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
