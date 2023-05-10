<script setup lang="ts">
import router from "@/router";
import resume from "@/assets/resume/resume.html?raw";

const aboutText = resume
    .split('<p style="margin-top: 30px;" id="about">')[1]
    .split("</p>")[0];

const birthday = new Date("2005-02-14");

const info = [
    // https://stackoverflow.com/a/50827764
    { key: "Age", value: Math.floor((Date.now() - birthday.getTime()) / 3.15576e+10) },
    { key: "Country", value: "United States" },
    { key: "State", value: "Nevada" },
    { key: "Email", value: "erikastaroza@gmail.com" }
];

// Used for the "Contact Me" button.
function goTo(id: string) {
    let element = document.getElementById(id);
    if(!element) return;

    window.scrollTo(0, element.offsetTop);
}

function goToCV() {
    router.push({
        name: "cv"
    });
}

</script>

<template>
    <div class="container">
        <v-card class="card" elevation="2">
            <div class="info-container">
                <div
                    v-for="(item, i) in info"
                    class="info"
                    :style="{'border-top': i > 0 ? '1px solid #CDCDCD' : 'none'}"
                >
                    <p><strong>{{ item.key }}</strong></p>
                    <div style="width: 10px;"></div>
                    <p>{{ item.value }}</p>
                </div>
            </div>
            <div class="bio">
                <p><strong>Hello! I'm Erikas Taroza</strong></p>
                <p>{{ aboutText }}</p>
            
                <div style="margin-top: 20px;">
                    <v-btn
                        color="primary"
                        variant="flat"
                        style="margin-right: 20px;"
                        @click="goToCV()"
                    >
                        Go to CV
                    </v-btn>

                    <v-btn color="#EEEEEE" variant="flat" @click="goTo('Contact')">
                        Contact Me
                    </v-btn>
                </div>
            </div>
        </v-card>
    </div>
</template>

<style scoped>
    @media(min-width: 800px) {
        .card {
            display: grid;
            grid-template-columns: 1.1fr 2fr;
        }

        .bio {
            margin-left: 15px;
        }

        .info-container {
            margin-right: 15px;
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

    .info-container {
        margin-bottom: 15px;
    }

    .bio p {
        font-size: 16px;
        margin-bottom: 10px;
    }

</style>