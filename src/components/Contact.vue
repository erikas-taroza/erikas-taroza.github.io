<script setup lang="ts">
import { ref } from "vue";

const subject = ref("");
const message = ref("");

function validateInput(input: String) : string | boolean {
    if(input.trim().length <= 0) return "This field is required.";
    return true;
}

function onSendMessage() {
    //TODO: Use third party email API.
    window.open(`mailto:erikastaroza@gmail.com?subject=${subject.value}&body=${message.value}`);

    subject.value = "";
    message.value = "";
}

</script>

<template>
    <div class="container">
        <h1 class="section-title">Contact Me</h1>
        <v-card class="card" elevation="2">
            <h2>Write me a message</h2>
            <v-text-field
                v-model="subject"
                density="comfortable"
                label="Subject"
                :rules="[validateInput]"
            />
            <v-textarea
                v-model="message"
                density="comfortable"
                label="Message"
                :rules="[validateInput]"
            />
            <v-btn
                variant="flat"
                color="primary"
                @click="onSendMessage()"
                :disabled="validateInput(subject) !== true || validateInput(message) !== true"
            >
                Send Message
            </v-btn>
        </v-card>
    </div>
</template>

<style scoped>
    h2 {
        font-weight: 300;
        font-size: 25px;
        margin-bottom: 20px;
    }
</style>