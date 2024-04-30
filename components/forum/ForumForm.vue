<script setup lang="ts">
  import {useForumStore} from '~/stores/forum.store';
  import type {ApiError} from '~/common/types/api';
  import {HTTP_OK} from '~/common/constants/api';

  const forumStore = useForumStore();
  const {displayCreationForm} = storeToRefs(forumStore);
  const {createForum, chargeForums, toggleCreationForm} = forumStore;

  const userStore = useUserStore();
  const {isLogged} = storeToRefs(userStore);

  const name = ref<string>('');
  const error = ref<string>('');

  const handleSubmit = async (event: Event) => {
    event.preventDefault();
    error.value = '';
    const creationResult = (await createForum(name.value)) as ApiError;

    if (creationResult && 'code' in creationResult && creationResult.code !== HTTP_OK) {
      error.value = creationResult.error;
      return;
    }

    toggleCreationForm();
    await chargeForums();
  };
</script>

<template>
  <v-card v-show="displayCreationForm" class="mx-auto mt-8" max-width="600">
    <v-toolbar color="grey darken-3" dark>
      <v-btn icon @click="toggleCreationForm">
        <v-icon>mdi-close</v-icon>
      </v-btn>
      <v-toolbar-title class="ml-4 mr-4">Créer un nouveau forum</v-toolbar-title>
    </v-toolbar>
    <v-card-text>
      <v-row>
        <v-col cols="12">
          <v-alert v-show="!isLogged" type="error" dense outlined border="left">
            Vous devez être connecté pour créer un forum
          </v-alert>
        </v-col>
      </v-row>
      <v-row v-show="isLogged">
        <v-col cols="12">
          <v-text-field
              v-model="name"
              label="Nom"
              outlined
              required
          ></v-text-field>
        </v-col>
      </v-row>
    </v-card-text>
    <v-card-actions>
      <v-btn v-show="isLogged" color="indigo" dark @click="handleSubmit">
        Créer
      </v-btn>
      <span class="ml-auto">{{ error }}</span>
    </v-card-actions>
  </v-card>
</template>