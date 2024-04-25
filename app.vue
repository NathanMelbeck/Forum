<template>
  <NuxtLayout>
    <v-app>
      <v-app-bar :elevation="2">
        <template v-slot:prepend>
          <v-app-bar-nav-icon></v-app-bar-nav-icon>
        </template>

        <v-app-bar-title>Forum</v-app-bar-title>
      </v-app-bar>

      <v-main>
        <v-container fluid>
          <NuxtPage />
        </v-container>
      </v-main>
    </v-app>
  </NuxtLayout>
</template>
<script setup lang="ts">
useHead({
  title: 'Forum',
})
</script>
