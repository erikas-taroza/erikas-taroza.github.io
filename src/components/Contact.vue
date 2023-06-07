<script setup lang="ts">
import { ref } from "vue";

enum SendState {
  None,
  Sending,
  Success,
  Error,
}

const sendState = ref(SendState.None);
const result = ref("");

const from = ref("");
const subject = ref("");
const message = ref("");

const formRef = ref();

function validateInput(input: String | null): string | boolean {
  if (input == null) return true;
  if (input.trim().length <= 0) return "This field is required.";
  return true;
}

function validateEmail(input: String | null): string | boolean {
  if (input == null) return true;
  if (input.trim().length <= 0) return "This field is required.";
  const regex = RegExp(String.raw`[a-z0-9]+@[a-z]+\.[a-z]{2,3}`);
  if (!regex.test(input.toString()))
    return "Please enter a valid email address.";
  return true;
}

function onSendMessage() {
  const email = {
    from: from.value,
    subject: subject.value,
    message: message.value,
  };

  sendState.value = SendState.Sending;
  result.value = "";
  formRef.value.reset();

  fetch("https://backend.erikastaroza.com:7777/send_mail", {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
    },
    body: JSON.stringify(email),
  })
    .then(async (res) => {
      if (res.status != 200) {
        sendState.value = SendState.Error;
        result.value = await res.text();
      } else {
        sendState.value = SendState.Success;
        result.value = "Successfully sent email.";

        // Remove message after some time.
        setTimeout(() => {
          sendState.value = SendState.None;
          result.value = "";
        }, 10000);
      }
    })
    .catch((e) => {
      sendState.value = SendState.Error;
      const err = e as Error;
      result.value = `${err.name}: ${err.message}`;
    });
}
</script>

<template>
  <div class="container">
    <h1 class="section-title">Contact Me</h1>
    <v-card class="card" elevation="2">
      <h2>Write me a message</h2>
      <v-form ref="formRef">
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
      </v-form>

      <v-btn
        variant="flat"
        color="primary"
        @click="onSendMessage()"
        :disabled="
          validateInput(subject) !== true ||
          validateInput(message) !== true ||
          validateEmail(from) !== true
        "
      >
        Send Message
      </v-btn>

      <div style="display: flex; justify-content: center">
        <v-progress-circular
          v-if="sendState == SendState.Sending"
          indeterminate
          color="primary"
          size="22"
          width="3"
        />
        <p
          v-else-if="
            (sendState == SendState.Success || sendState == SendState.Error) &&
            result.length > 0
          "
          :class="sendState == SendState.Success ? 'success' : 'error'"
          style="width: 100%; margin-top: 5px"
        >
          {{ result }}
        </p>
      </div>
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

.success {
  color: limegreen;
  text-align: start;
}
</style>
