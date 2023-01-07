<script setup lang="ts">
const projects = [
    {
        name: "BitBeat",
        description: "A music player that provides ad-free music for no cost.",
        image_urls: [
            "https://imgs.search.brave.com/bCGsnBpyx9O2a3FAiEn8itD2wN9YXDijDNugVpCUWGk/rs:fit:474:474:1/g:ce/aHR0cHM6Ly93d3cu/Zmx1d2VsLmNvbS9t/ZWRpYS9jYXRhbG9n/L3Byb2R1Y3QvY2Fj/aGUvNjU0ODUwM2Fh/ODMzZTY4ZmZkYzQ1/Yjc1YmU2ZGEyZTUv/Yy9vL2NvcHBlcl9p/bWFnZV9hLmpwZw",
            "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/1280px-Image_created_with_a_mobile_phone.png"
        ],
        project_url: ""
    },
    {
        name: "simple_audio",
        description: "A cross-platform solution for playing audio in Flutter.",
        image_urls: [],
        project_url: "https://github.com/erikas-taroza/simple_audio"
    },
    {
        name: "audiotags",
        description: "A Flutter plugin for reading and writing metadata tags on audio files.",
        image_urls: [],
        project_url: "https://github.com/erikas-taroza/audiotags"
    },
    {
        name: "flutter_rust_plugin",
        description: "A piece of documentation for making a Flutter plugin using Rust.",
        image_urls: [],
        project_url: "https://github.com/erikas-taroza/flutter_rust_plugin"
    },
    {
        name: "SpotifyAntiAd",
        description: "A Windows program that skips Spotify ads by closing and reopening the client.",
        image_urls: [],
        project_url: "https://github.com/erikas-taroza/SpotifyAntiAd"
    },
    {
        name: "EmailSpamCleaner",
        description: "An app that helps you clean your inbox and unsubscribe from emails.",
        image_urls: [],
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
                    elevation="2"
                    @click="project.project_url ? onProjectClicked(project.project_url) : null"
                >
                    <!-- Display an image if there are 1 or 0 images. -->
                    <v-img
                        v-if="project.image_urls!.length <= 1"
                        height="200px"
                        :cover="project.image_urls!.length == 1"
                        :src="project.image_urls!.length == 1 ? project.image_urls[0] : 'src/assets/img/github.png'"
                    />

                    <!-- Display a slideshow of images if there are more than one provided. -->
                    <v-carousel
                        v-else
                        height="200"
                        hide-delimiters
                        :show-arrows="false"
                        cycle
                        :interval="4000"
                    >
                        <v-carousel-item 
                            v-for="image in project.image_urls"
                            cover
                            :src="image"
                        />
                    </v-carousel>

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