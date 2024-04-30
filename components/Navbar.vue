<script setup lang="ts">
  import {useUserStore} from '~/stores/user.store';

  const userStore = useUserStore();
  const {isLogged, isAdmin, user} = storeToRefs(userStore);

  const handleLogout = () => {
    userStore.logout();
    navigateTo('/');
  };
</script>

<template>
  <nav class="z-50 flex flex-row justify-between items-center bg-white shadow-lg fixed top-0 w-full h-14">
    <NuxtLink href="/" class="text-xl font-bold cursor-pointer hover:opacity-80 transition duration-300">
      NuxtForum
    </NuxtLink>
    <div class="flex items-center space-x-4">
      <NuxtLink v-if="!isLogged" href="/login" class="text-gray-800 hover:text-gray-600 transition duration-300">
        Connexion
      </NuxtLink>
      <NuxtLink v-if="isLogged" href="/profile" class="text-gray-800 hover:text-gray-600 transition duration-300">
        Profile
      </NuxtLink>
      <NuxtLink v-if="isAdmin" href="/admin-register" class="text-gray-800 hover:text-gray-600 transition duration-300">
        Admin
      </NuxtLink>
      <h2 v-if="isLogged" class="text-gray-800">{{ user.pseudo }}</h2>
      <button v-if="isLogged" @click="handleLogout" class="focus:outline-none">
        <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 text-gray-800 hover:text-gray-600 transition duration-300" fill="none" viewBox="0 0 24 24" stroke="currentColor">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7"/>
        </svg>
      </button>
    </div>
  </nav>
</template>