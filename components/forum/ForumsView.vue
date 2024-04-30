<script setup lang="ts">
  import {useForumStore} from '~/stores/forum.store';
  import formatDate from '../../common/functions/formatDate';

  const forumStore = useForumStore();
  const {forums, hasForums} = storeToRefs(forumStore);
  const {chargeForums, toggleCreationForm} = forumStore;

  onMounted(async () => {
    await chargeForums();
  });
</script>

<template>
  <section v-show="hasForums" class="w-full h-fit flex flex-col items-center justify-center space-y-8 text-gray-700">
    <div class="flex flex-row space-x-2 items-center">
      <h2 class="text-2xl text-gray-500">Vous ne trouvez pas un forum ?</h2>
      <button class="text-2xl text-indigo-500 font-bold hover:underline" @click="toggleCreationForm">Créez-le !</button>
    </div>
    <div class="w-full max-w-3xl">
      <template v-for="forum in forums">
        <NuxtLink
            :href="`/forum/${forum.id}`"
            class="block bg-white rounded-lg p-4 shadow-md hover:shadow-lg transition duration-300 ease-in-out"
        >
          <div class="flex items-center justify-between">
            <div>
              <h1 class="text-xl font-semibold">{{ forum.name }}</h1>
              <h2 class="text-sm text-gray-500">Créé le {{ formatDate(forum.created_at) }}</h2>
            </div>
            <h2 class="text-lg">{{ forum.subject_count === 0 ? 'Aucun' : forum.subject_count }} sujet{{ forum.subject_count !== 1 ? 's' : '' }}</h2>
          </div>
        </NuxtLink>
        <div class="h-4"></div>
      </template>
    </div>
  </section>
</template>