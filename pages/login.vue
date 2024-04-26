<script setup lang="ts">

const pseudo = ref('');
const password = ref('');


// à gérer une fois api ok
function handleSubmit() {

  console.log('Formulaire soumis avec email:', pseudo.value, 'et mot de passe:', password.value);
}

</script>


<template>
  <v-container class="mt-20">
    <v-card>
      <v-card-title class="text-h2 font-weight-bold mt-4 mb-4">Connexion</v-card-title>

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
          <div class="d-flex justify-start">
            <router-link to="/register" class="text-sm">Créer un compte</router-link>
          </div>
          <div class="d-flex justify-end">
            <v-btn type="submit" color="primary">Se connecter</v-btn>
          </div>
        </v-form>


      </v-card-text>
    </v-card>
  </v-container>

</template>
