<script setup lang="ts">
const search = defineModel<string>();

function doSearch() {
  if (search.value?.length == 0 || !search.value) return;
  window.location.href = `https://duckduckgo.com/?q=${encodeURIComponent(search.value)}`;
}
</script>

<template>
  <v-app>
    <div class="container">
      <h1>Erikas Taroza</h1>
      <v-text-field
        label="Search DuckDuckGo"
        color="primary"
        density="compact"
        prependInnerIcon="mdi-magnify"
        autofocus
        v-model="search"
        @keyup.enter="doSearch"
      ></v-text-field>
    </div>
  </v-app>
</template>

<style scoped>
.container {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  margin-top: 10%;
}

h1 {
  text-align: center;
}

.v-text-field {
  width: 30%;
}
</style>
