# Projet Nuxt.JS : Forum interactif
### L’objectif de ce projet est de réaliser une application complète utilisant Nuxt.JS. 
Cette application se présente sous la forme d’un forum interactif, qui s’actualise en temps réel au
fil que des sujets et des réponses sont créées.


## Fonctionnalités principales
L’application s’articule sous la forme d’une simple hiérarchie Forums ⇒ Sujets ⇒ Messages.
On peut donc avoir plusieurs forums, qui eux-même contiennent plusieurs sujets, qui
eux-même contiennent plusieurs messages. Un sujet contient toujours un message initial,
qui est écrit par l’utilisateur qui ouvre le sujet.

Les utilisateurs doivent créer un compte et s’authentifier à l’application pour pouvoir créer
des sujets ou poster des messages. Toutefois, il n’est pas nécessaire d’être authentifié pour
consulter les forums, sujets et messages postés. Deux niveaux de droits existent, un
utilisateur simple, et un administrateur. Un compte par défaut “admin” (avec le mot de passe
“admin”) sera créé automatiquement par la plate-forme lorsqu’elle est lancée pour la
première fois.

Les utilisateurs doivent pouvoir se déconnecter via un bouton “Déconnexion”, et changer leur
mot de passe depuis un bouton prévu à cet effet.

Lorsque l’on arrive sur la page d’accueil, celle-ci doit lister l’ensemble des forums
disponibles, avec le nombre de sujets au sein de chaque forum.

Lorsque l’on sélectionne un forum, on doit arriver sur une page qui liste tous les sujets de ce
forum, triés par date de dernier message décroissant (le sujet ayant eu un message le plus
récemment s’affiche donc en premier). Pour chaque sujet, on indiquera son auteur, ainsi que
la date et l’auteur du dernier message posté.

Toujours sur la page du forum, un bouton “Nouveau sujet” permettra de créer un nouveau
sujet. L’utilisateur doit alors saisir un titre, et un premier message pour le sujet (champ texte
multi-lignes). Ce bouton n’est accessible que si l’utilisateur est connecté, sinon un message
l'invitera à se créer un compte ou à se connecter.

Les sujets doivent être paginés, à raison de 20 sujets par page.

Lorsque l’on sélectionne un sujet, on doit arriver sur une page qui liste tous les messages du
sujet, par ordre de date de message croissant. Le premier message (initial) est donc en haut
de la page 1, le dernier message posté en réponse sera en bas de la dernière page. Les
utilisateurs connectés peuvent cliquer sur un bouton Répondre pour pouvoir apporter une
réponse au sujet, sous la forme d’un champ texte, comme pour le message initial à la
création d’un sujet.

Les messages doivent indiquer pour chacun le nom de l’utilisateur qui l’a posté, la date à
laquelle le message a été posté, et évidemment le message en lui-même.

Les messages doivent être paginés, à raison de 20 messages par page.

Un utilisateur doit pouvoir modifier un de ses propres messages via un bouton “Modifier”
présent au niveau de chaque message qu’il aura posté. Un administrateur peut modifier les
messages de tous les utilisateurs, supprimer un message posté, ou supprimer
complètement un sujet et tous ses messages.

Un espace administrateur permettra de créer un nouveau compte administrateur, et de créer,
renommer ou supprimer un forum. Lorsqu’un forum est supprimé, tous ses sujets et
messages doivent l’être également.

L’application doit s’actualiser en temps réel : si un utilisateur poste un message dans un
sujet, ou un nouveau sujet, la liste des sujets au sein d’un forum doit s’actualiser
immédiatement. De la même manière, si je suis en train de consulter un sujet et qu’un autre
utilisateur poste un nouveau message, le nouveau message posté doit immédiatement
apparaître.


## Fonctionnalités bonus (non réalisées)
Ces fonctionnalités ne sont pas obligatoires mais si réalisées peuvent donner un
complément de points.

● Possibilité de citer un message : Un bouton “Citer” présent sur les messages permet
de citer un message existant et d’y répondre. Dans la réponse, le message cité
apparaît en premier, puis le message saisi par l’utilisateur.

● Avatar : Les utilisateurs peuvent uploader une image en guise d’avatar, affichée à
côté du nom sur chacun des messages postés par celui-ci.

● Verrouiller un sujet : Un bouton “Verrouiller”, disponible qu’aux administrateurs,
permet de verrouiller un sujet et empêcher tous les utilisateurs d’y apporter de
nouveaux messages.

● Etat lu/non-lu : Un indicateur doit montrer quels sont les sujets et messages que
l’utilisateur n’a pas encore lu depuis sa dernière visite.