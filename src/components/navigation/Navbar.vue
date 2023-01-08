<script setup lang="ts">
import { ref, onMounted, onBeforeUnmount } from "vue";
import Socials from "../Socials.vue";
import Sidebar from "./Sidebar.vue";

onMounted(() => {
    window.addEventListener("scroll", onScroll);
    window.addEventListener("resize", onResize);
});

onBeforeUnmount(() => {
    window.removeEventListener("scroll", onScroll);
    window.removeEventListener("resize", onResize);
});

var timeout:number | null = null;
function debounce(callback:() => void) {
    if(timeout) clearTimeout(timeout);

    timeout = setTimeout(() => {
        callback();
    }, 50);
}

function onScroll() {
    debounce(() => {
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
    });
}

const isSidebarOpen = ref(false);
const showSidebar = ref(window.innerWidth < 800);
function onResize() {
    showSidebar.value = window.innerWidth < 800;
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
    <div class="navbar" v-if="!showSidebar">
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

    <div class="navbar" v-else>
        <v-btn
            elevation="0"
            icon="mdi-menu"
            @click="isSidebarOpen = true"
        />
    </div>
    
    <Sidebar
        v-if="showSidebar"
        :buttons="buttons"
        :active-button="activeButton"
        :is-sidebar-open="isSidebarOpen"
        @button-pressed="(button) => goTo(button)"
        @close="isSidebarOpen = false"
    />
</template>

<style scoped>
    .navbar {
        height: 60px;
        width: 100%;
        background-color: white;
        position: sticky;
        top: 0;
        z-index: 10;
        box-shadow: 0px 1px 5px 3px rgba(0, 0, 0, 0.2);
        display: flex;
        flex-direction: row;
        align-items: center;
        padding-left: 50px;
        padding-right: 50px;
        justify-content: space-between;
    }
</style>