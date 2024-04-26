<script setup lang="ts">

const pseudo = ref('');
const password = ref('');
const verifPassword = ref('');
const passwordMatch = ref(true);


// à gérer une fois api ok
function handleSubmit() {
  if (password.value !== verifPassword.value) {
    passwordMatch.value = false;
  }

  console.log('Formulaire soumis avec email:', pseudo.value, 'et mot de passe:', password.value);
}

</script>


<template>
  <v-container class="mt-20">
    <v-card>
      <v-card-title class="text-h2 font-weight-bold mt-4 mb-4">S'incrire</v-card-title>

      <v-card-text>
        <v-form @submit.prevent="handleSubmit">
          <v-text-field
              label="Pseudo"
              type="pseudo"
              id="pseudo"
              v-model="pseudo"
              required
          ></v-text-field>

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
              id="password"
              v-model="verifPassword"
              required
          ></v-text-field>

          <div v-if="!passwordMatch" ><p>Les mots de passe ne correspondent pas</p></div>
          <div class="d-flex justify-start">
            <router-link to="/login" class="text-sm">J'ai déjà un compte</router-link>
          </div>
          <div class="d-flex justify-end">
            <v-btn type="submit" color="primary">S'incrire</v-btn>
          </div>
        </v-form>


      </v-card-text>
    </v-card>
  </v-container>

</template>
