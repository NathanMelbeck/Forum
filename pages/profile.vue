<script setup lang="ts">
  const {changePassword, logout, isLogged} = useUserStore();
  const error = ref<string>('');
  const currentPassword = ref<string>('');
  const newPassword = ref<string>('');
  const repeatedPassword = ref<string>('');

  const handleSubmit = async (event: Event) => {
    event.preventDefault();
    const response = await changePassword(currentPassword.value, newPassword.value, repeatedPassword.value);

    if (response.code !== 200 && 'error' in response) {
      error.value = response.error;
      return;
    }

    logout();
    navigateTo('/login');
  };

  onMounted(() => {
    if (!isLogged) {
      navigateTo('/login');
    }
  });
</script>

<template>
  <v-container class="fill-height" fluid>
    <v-row justify="center" align="center">
      <v-col cols="12" sm="8" md="6">
        <v-card class="elevation-12">
          <v-card-title class="primary lighten-1 white--text text-center">
            <h2 class="text-3xl font-semibold">Changer de mot de passe</h2>
          </v-card-title>
          <v-card-text>
            <form @submit.prevent="handleSubmit" class="flex flex-col space-y-6">
              <v-text-field
                  v-model="currentPassword"
                  label="Mot de passe actuel"
                  outlined
                  type="password"
                  required
              ></v-text-field>
              <v-text-field
                  v-model="newPassword"
                  label="Nouveau mot de passe"
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
                Modifier le mot de passe
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

