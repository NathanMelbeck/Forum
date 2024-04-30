<script setup lang="ts">
  const props = defineProps<{
    subjectId: string;
  }>();

  const messageStore = useMessageStore();
  const {displayAnswerForm} = storeToRefs(messageStore);
  const {toggleAnswerForm, createMessage} = messageStore;

  const userStore = useUserStore();
  const {isLogged, user} = storeToRefs(userStore);

  const {getSubject} = useSubjectStore();

  const content = ref<string>('');
  const error = ref<string>('');

  const handleSubmit = async (event: Event) => {
    event.preventDefault();
    error.value = '';
    await createMessage(content.value, Number(props.subjectId), user.value.id);
    await getSubject(Number(props.subjectId));
    content.value = '';
    toggleAnswerForm();
  };
</script>

<template>
  <v-form @submit.prevent="handleSubmit" v-show="displayAnswerForm" class="answer-form">
    <v-row align="center" justify="center">
      <v-col>
        <v-card>
          <v-toolbar flat color="primary">
            <v-btn icon @click="toggleAnswerForm">
              <v-icon>mdi-close</v-icon>
            </v-btn>
            <v-toolbar-title>Créer un message</v-toolbar-title>
          </v-toolbar>

          <v-card-text>
            <v-row>
              <v-col cols="12">
                <v-alert v-if="!isLogged" outlined color="error" dense>
                  Vous devez être connecté pour créer un sujet
                </v-alert>
              </v-col>
            </v-row>

            <v-row>
              <v-col cols="12">
                <v-textarea
                    v-model="content"
                    outlined
                    label="Message"
                    placeholder="Rédigez votre message ici..."
                    required
                ></v-textarea>
              </v-col>
            </v-row>
          </v-card-text>

          <v-card-actions>
            <v-btn color="primary" type="submit">Poster</v-btn>
          </v-card-actions>
        </v-card>
      </v-col>
    </v-row>
  </v-form>
</template>