<script setup lang="ts">
const projects = [
    {
        name: "BitBeat",
        description: "A music player that provides ad-free music for no cost.",
        image_url: "https://imgs.search.brave.com/bCGsnBpyx9O2a3FAiEn8itD2wN9YXDijDNugVpCUWGk/rs:fit:474:474:1/g:ce/aHR0cHM6Ly93d3cu/Zmx1d2VsLmNvbS9t/ZWRpYS9jYXRhbG9n/L3Byb2R1Y3QvY2Fj/aGUvNjU0ODUwM2Fh/ODMzZTY4ZmZkYzQ1/Yjc1YmU2ZGEyZTUv/Yy9vL2NvcHBlcl9p/bWFnZV9hLmpwZw",
        project_url: ""
    },
    {
        name: "simple_audio",
        description: "A cross-platform solution for playing audio in Flutter.",
        image_url: "",
        project_url: "https://github.com/erikas-taroza/simple_audio"
    },
    {
        name: "audiotags",
        description: "A Flutter plugin for reading and writing metadata tags on audio files.",
        image_url: "",
        project_url: "https://github.com/erikas-taroza/audiotags"
    },
    {
        name: "flutter_rust_plugin",
        description: "A piece of documentation for making a Flutter plugin using Rust.",
        image_url: "",
        project_url: "https://github.com/erikas-taroza/flutter_rust_plugin"
    },
    {
        name: "SpotifyAntiAd",
        description: "A Windows program that skips Spotify ads by closing and reopening the client.",
        image_url: "",
        project_url: "https://github.com/erikas-taroza/SpotifyAntiAd"
    },
    {
        name: "EmailSpamCleaner",
        description: "An app that helps you clean your inbox and unsubscribe from emails.",
        image_url: "",
        project_url: "https://github.com/erikas-taroza/EmailSpamCleaner"
    },
];

function onProjectClicked(project_url:string) {
    window.open(project_url);
}
</script>

<template>
    <div class="container">
        <h1 class="section-title">Projects</h1>
        <div class="projects">
            <div v-for="project in projects">
                <v-card
                    max-width="353"
                    min-width="200"
                    height="300"
                    @click="project.project_url ? onProjectClicked(project.project_url) : null"
                >
                    <v-img
                        height="200px"
                        :cover="project.image_url ? true : false"
                        :src="project.image_url ? project.image_url : 'src/assets/img/github.png'"
                    />
                    <v-card-title>{{ project.name }}</v-card-title>
                    <v-card-text>{{ project.description }}</v-card-text>
                </v-card>
            </div>
        </div>
    </div>
</template>

<style scoped>
    .projects {
        display: flex;
        width: 100%;
        align-items: center;
        justify-content: center;
        flex-direction: row;
        flex-wrap: wrap;
        column-gap: 20px;
        row-gap: 20px;
    }
</style>