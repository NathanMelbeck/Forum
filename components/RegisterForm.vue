<script setup lang="ts">
  const props = defineProps<{
    title: string;
    buttonTitle: string;
    error: string;
    handleSubmit: (event: Event, pseudo: string, password: string, repeatedPassword: string) => Promise<void>;
  }>();

  const pseudo = ref<string>('');
  const password = ref<string>('');
  const repeatedPassword = ref<string>('');
</script>
<template>
  <v-container class="fill-height" fluid>
    <v-row justify="center" align="center">
      <v-col cols="12" sm="8" md="6">
        <v-card class="elevation-12">
          <v-card-title class="primary lighten-1 white--text text-center">
            <h1 class="display-1">{{ title }}</h1>
          </v-card-title>
          <v-card-text>
            <form @submit="handleSubmit($event, pseudo, password, repeatedPassword)" class="flex flex-col space-y-6">
              <v-text-field
                  v-model="pseudo"
                  label="Pseudo"
                  outlined
                  required
              ></v-text-field>
              <v-text-field
                  v-model="password"
                  label="Mot de passe"
                  outlined
                  type="password"
                  required
              ></v-text-field>
              <v-text-field
                  v-model="repeatedPassword"
                  label="Répéter le mot de passe"
                  outlined
                  type="password"
                  required
              ></v-text-field>
              <v-btn
                  color="primary"
                  dark
                  block
                  class="mx-auto"
                  type="submit"
              >
                {{ buttonTitle }}
              </v-btn>
              <v-alert
                  v-if="error !== ''"
                  type="error"
                  dense
                  outlined
                  border="left"
              >
                {{ error }}
              </v-alert>
            </form>
          </v-card-text>
        </v-card>
      </v-col>
    </v-row>
  </v-container>
</template>
