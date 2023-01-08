<script setup lang="ts">
import { defineProps, defineEmits, ref } from "vue";
import Socials from '../Socials.vue';

const {
    buttons,
    activeButton,
    isSidebarOpen
} = defineProps({
    buttons: { type: Array<String>, required: true },
    activeButton: String,
    isSidebarOpen: Boolean
});

defineEmits<{
    (event: "buttonPressed", button:string):void
    (event: "close"):void
}>();

</script>

<template>
    <div>
        <Transition name="sidebar">
            <div class="sidebar"
                v-if="isSidebarOpen"
                @wheel.prevent=""
                @touchmove.prevent=""
            >
                <div class="navbar">
                    <v-btn
                        elevation="0"
                        icon="mdi-close"
                        @click="$emit('close')"
                    />
                </div>

                <v-btn
                    v-for="button in buttons"
                    variant="text"
                    :color="activeButton == button ? 'primary' : undefined"
                    :active="activeButton == button"
                    width="95%"
                    @click="$emit('buttonPressed', button)"
                >
                    {{ button }}
                </v-btn>

                <Socials flat style="bottom: 20px; position: absolute;"/>
            </div>
        </Transition>

        <Transition name="backdrop">
            <div
                class="sidebar-backdrop"
                v-if="isSidebarOpen"
                @click="$emit('close')"
                @wheel.prevent=""
                @touchmove.prevent=""
            >
            </div>
        </Transition>
    </div>
</template>

<style scoped>
    .sidebar {
        height: 100%;
        width: 300px;
        z-index: 11;
        position: fixed;
        top: 0;
        left: 0;
        transition: 0.3s ease;

        /* Children */
        background-color: white;
        display: flex;
        flex-direction: column;
        align-items: center;
        row-gap: 7px;
    }

    .sidebar-enter-active, .sidebar-leave-active {
        transform: translateX(-100%);
    }

    .sidebar-enter-to {
        transform: translateX(0%);
    }

    .sidebar-backdrop {
        height: 100%;
        width: 100%;
        z-index: 10;
        background-color: rgba(0, 0, 0, 0.5);
        position: fixed;
        top: 0;
        transition: 0.3s ease;
    }

    .backdrop-enter-active, .backdrop-leave-active {
        opacity: 0%;
    }

    .backdrop-enter-to {
        opacity: 100%;
    }

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

    .sidebar .navbar {
        justify-content: end;
        padding-right: 10px;
    }
</style>