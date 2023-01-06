<script setup lang="ts">
import { ref } from "vue";

const subject = ref("");
const message = ref("");

function onSendMessage() {
    //TODO: Use third party email API.
    window.open(`mailto:erikastaroza@gmail.com?subject=${subject.value}&body=${message.value}`);

    subject.value = "";
    message.value = "";
}

</script>

<template>
    <div class="container">
        <h1>Contact Me</h1>
        <v-card class="card" elevation="3">
            <h2>Write me a message:</h2>
            <v-text-field
                v-model="subject"
                density="comfortable"
                label="Subject"
            />
            <v-textarea
                v-model="message"
                density="comfortable"
                label="Message"
            />
            <v-btn variant="flat" color="primary" @click="onSendMessage()">Send Message</v-btn>
        </v-card>
    </div>
</template>

<style scoped>
    .card {
        max-width: 1100px;
        width: 100%;
    }

    h1 {
        font-weight: lighter;
        font-size: 35px;
        margin-top: 15px;
        margin-bottom: 15px;
    }

    h2 {
        font-weight: 300;
        font-size: 25px;
        margin-bottom: 20px;
    }
</style>