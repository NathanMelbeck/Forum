<script setup lang="ts">
  import {HTTP_OK} from '~/common/constants/api';

  const pseudo = ref<string>('');
  const password = ref<string>('');
  const error = ref<string>('');

  const {login} = useUserStore();

  const handleSubmit = async (event: Event) => {
    event.preventDefault();
    const loginResponse = await login(pseudo.value, password.value);

    if (loginResponse.code !== HTTP_OK && 'error' in loginResponse) {
      error.value = loginResponse.error;
      return;
    }

    navigateTo('/');
  };
</script>

<template>
  <v-container class="fill-height" fluid>
    <v-row justify="center" align="center">
      <v-col cols="12" sm="8" md="6">
        <v-card class="elevation-12">
          <v-card-title class="primary lighten-1 white--text text-center">
            <h1 class="display-1">Connexion</h1>
          </v-card-title>
          <v-card-text>
            <v-form @submit.prevent="handleSubmit">
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
              <v-btn
                  color="primary"
                  dark
                  block
                  @click="handleSubmit"
              >
                Se connecter
              </v-btn>
            </v-form>
            <v-alert
                v-if="error !== ''"
                type="error"
                dense
                outlined
                border="left"
            >
              {{ error }}
            </v-alert>
          </v-card-text>
          <v-card-actions class="justify-center">
            <div>
              <span class="caption">Pas encore de compte ?</span>
              <router-link to="/register" class="caption">S'inscrire</router-link>
            </div>
          </v-card-actions>
        </v-card>
      </v-col>
    </v-row>
  </v-container>
</template>

