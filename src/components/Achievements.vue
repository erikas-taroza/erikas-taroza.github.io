<script setup lang="ts">
function openGCPCert() {
    window.open("https://google.accredible.com/d1f16c18-c022-49d1-bbe2-b9cb34c828f0");
}
</script>

<template>
    <div class="container">
        <h1 class="section-title">Achievements</h1>
        <v-card class="card" elevation="2">
            <div style="display: flex; flex-direction: column">
                <v-card-title>Google Cloud Certified</v-card-title>
                <v-card-text>
                    After spending 1 month learning Google Cloud, I am now certified as an Associate Cloud Engineer.
                </v-card-text>
                <v-card-actions>
                    <v-btn color="primary" @click="openGCPCert">SEE CERTIFICATE</v-btn>
                </v-card-actions>
            </div>
            <img
                src="https://api.accredible.com/v1/frontend/credential_website_embed_image/certificate/79064750"
                width="268"
                height="208"
                style="cursor: pointer"
                @click="openGCPCert"
            />
        </v-card>
    </div>
</template>

<style scoped>
.card {
    max-width: 600px;
    display: flex;
    flex-direction: row;
    justify-content: space-between;
}

@media (max-width: 600px) {
    .card {
        flex-direction: column;
        align-items: center;
    }
}
</style>
