<script setup lang="ts"></script>

<template>
    <div class="container">
        <h1 class="section-title">Skills</h1>
        <div class="grid">
            <v-card class="card" elevation="2">
                <h2>Cloud</h2>
                <div class="icons" style="">
                    <img src="@/assets/img/svg/gcp.svg" />
                    <img src="@/assets/img/svg/aws.svg" />
                    <img src="@/assets/img/svg/vultr.svg" />
                </div>
                <p>GCP (certified)</p>
                <p>AWS</p>
                <p>Vultr</p>
            </v-card>

            <v-card class="card" elevation="2">
                <h2>Frontend</h2>
                <div class="icons" style="">
                    <img src="@/assets/img/svg/flutter.svg" />
                    <img src="@/assets/img/svg/vue.svg" />
                </div>
                <p>Flutter</p>
                <p>Vue</p>
            </v-card>

            <v-card class="card" elevation="2">
                <h2>Backend</h2>
                <div class="icons" style="">
                    <img src="@/assets/img/svg/surreal.svg" />
                    <img src="@/assets/img/svg/mysql.svg" />
                </div>
                <p class="bold-red-text">Frameworks</p>
                <p>Express.js</p>
                <p>Axum</p>
                <p>Parse Server</p>
                <p class="bold-red-text">Databases</p>
                <p>MySQL</p>
                <p>SurrealDB</p>
            </v-card>

            <v-card class="card" elevation="2" style="grid-column-end: span 3">
                <h2>Languages</h2>
                <div class="icons">
                    <img src="@/assets/img/svg/dart.svg" />
                    <img src="@/assets/img/svg/js.svg" />
                    <img src="@/assets/img/svg/rust.svg" />
                    <img src="@/assets/img/svg/csharp.svg" />
                    <img src="@/assets/img/svg/java.svg" />
                    <img src="@/assets/img/svg/python.svg" />
                </div>
                <div class="grid">
                    <div>
                        <p class="bold-red-text">Frontend</p>
                        <p>Dart</p>
                        <p>JavaScript/TypeScript</p>
                    </div>
                    <div>
                        <p class="bold-red-text">Backend</p>
                        <p>Rust</p>
                        <p>JavaScript/TypeScript</p>
                    </div>
                    <div>
                        <p class="bold-red-text">Other</p>
                        <p>C#</p>
                        <p>Java</p>
                        <p>Python</p>
                    </div>
                </div>
            </v-card>
        </div>
    </div>
</template>

<style scoped>
.general {
    margin-top: 30px;
    display: grid;
    grid-template-columns: auto auto;
    row-gap: 10px;
}

@media (min-width: 800px) {
    .grid {
        display: grid;
        grid-template-columns: 1fr 1fr 1fr;
        width: 100%;
        column-gap: 20px;
        row-gap: 20px;
    }
}

@media (max-width: 800px) {
    .grid {
        display: flex;
        flex-direction: column;
        width: 100%;
        row-gap: 20px;
    }

    .general {
        display: flex;
        flex-direction: column;
        width: 100%;
        row-gap: 10px;
    }
}

.container {
    max-width: 900px;
}

.icons {
    display: flex;
    flex-direction: row;
    flex-wrap: wrap;
    column-gap: 15px;
    row-gap: 15px;
    margin-bottom: 15px;
}

img {
    width: 25px;
    height: 25px;
    /* fill: #4b4b4b; */
}

h2 {
    font-weight: 300;
    font-size: 20px;
    margin-bottom: 20px;
}

p {
    margin-bottom: 5px;
}

li {
    margin-left: 30px;
}
</style>
