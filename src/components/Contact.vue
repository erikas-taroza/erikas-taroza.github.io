<script setup lang="ts">
import { ref } from "vue";

const from = ref("");
const subject = ref("");
const message = ref("");
const error = ref("");

function validateInput(input: String) : string | boolean {
    if(input.trim().length <= 0) return "This field is required.";
    return true;
}

function validateEmail(input: String): string | boolean {
    if(input.trim().length <= 0) return "This field is required.";
    const regex = RegExp(String.raw`[a-z0-9]+@[a-z]+\.[a-z]{2,3}`);
    if(!regex.test(input.toString())) return "Please enter a valid email address.";
    return true;
}
function onSendMessage()
{
    const email = {
        from: from.value,
        subject: subject.value,
        message: message.value
    };

    from.value = "";
    subject.value = "";
    message.value = "";
    error.value = "";

    fetch("https://backend.erikastaroza.com:7777/send_mail", {
        method: "POST",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify(email)
    })
        .then(async (res) => {
            if(res.status != 200) {
                error.value = await res.text();
            }
        });
}
</script>

<template>
    <div class="container">
        <h1 class="section-title">Contact Me</h1>
        <v-card class="card" elevation="2">
            <h2>Write me a message</h2>
            <v-text-field
                v-model="from"
                density="comfortable"
                label="Your email address"
                :rules="[validateEmail]"
            />
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
                :disabled="
                    validateInput(subject) !== true ||
                    validateInput(message) !== true ||
                    validateEmail(from) !== true"
            >
                Send Message
            </v-btn>

            <p v-if="error.length > 0" class="error">{{ error }}</p>
        </v-card>
    </div>
</template>

<style scoped>
    h2 {
        font-weight: 300;
        font-size: 25px;
        margin-bottom: 20px;
    }
    .error {
        color: red;
        text-align: center;
        font-weight: bold;
    }
</style>