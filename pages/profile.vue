<script setup lang="ts">

const password = ref('');
const verifPassword = ref('');
const passwordMatch = ref(true);


// à gérer une fois api ok
function handleSubmit() {
  if (password.value !== verifPassword.value) {
    passwordMatch.value = false;
  }
}

</script>


<template>
  <v-container class="mt-20">
    <v-card>
      <v-card-title class="text-h2 font-weight-bold mt-4 mb-4">Profile</v-card-title>

      <v-card-text>
        <v-form @submit.prevent="handleSubmit">
          <v-text-field
              label="Mot de passe"
              type="password"
              id="password"
              v-model="password"
              required
          ></v-text-field>
          <v-text-field
              label="Confirmer Mot de passe"
              type="password"
              id="verifPassword"
              v-model="verifPassword"
              required
          ></v-text-field>
          <div v-if="!passwordMatch" ><p>Les mots de passe ne correspondent pas</p></div>
          <div class="d-flex justify-end">
            <v-btn type="submit" color="primary">Changer de mot de passe</v-btn>
          </div>
        </v-form>


      </v-card-text>
    </v-card>
  </v-container>

</template>
