<script setup lang="ts">
import { ref, onMounted, onBeforeUnmount } from "vue";
import Socials from "./Socials.vue";

onMounted(() => {
    window.addEventListener("scroll", onScroll);
});

onBeforeUnmount(() => {
    window.removeEventListener("scroll", onScroll);
});

function onScroll() {
    buttons.forEach((button) => {
        let element = document.getElementById(button);
        if(!element) return;

        if(
            element.getBoundingClientRect().bottom <= window.innerHeight
            || element.offsetTop <= window.scrollY
        )
        {
            activeButton.value = button;
        }
    });
}

const activeButton = ref("Home");

const buttons = [
    "Home",
    "Skills",
    "Projects",
    "Contact"
]

function goTo(id:string) {
    let element = document.getElementById(id);
    if(!element) return;

    window.scrollTo(0, element.offsetTop);
}

</script>

<template>
    <div class="navbar">
        <div>
            <v-btn
                v-for="button in buttons"
                variant="text"
                :color="activeButton == button ? 'primary' : undefined"
                :active="activeButton == button"
                @click="goTo(button)"
            >
                {{ button }}
            </v-btn>
        </div>

        <Socials flat/>
    </div>
</template>

<style scoped>
    .navbar {
        height: 60px;
        width: 100%;
        background-color: white;
        position: sticky;
        top: 0;
        z-index: 999;
        box-shadow: 0px 1px 5px 3px rgba(0, 0, 0, 0.2);
        display: flex;
        flex-direction: row;
        align-items: center;
        padding-left: 50px;
        padding-right: 50px;
        column-gap: 5px;
        justify-content: space-between;
    }
</style>