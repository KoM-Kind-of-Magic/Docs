# Analyse des retours 
Fonctionnalitées par ordre d'importance

## I. L'utilisateur pourra depuis la page "User decklists" - 3 Mois
1. Créer un deck : 
    - **Back** : Après validation du formulaire, le client web fera une requette HTTP en méthode **POST** sur la route `api/deck/create-deck`. 
      <br> Les informations requises seront:
      - **DeckName** : Nom du deck (String)
      - **DeckFormat** : Format du deck (Choix parmi une Liste -> Commander, Standard, Modern, etc...) (Enum)

      <br> Les informations optionnelles seront :
      - **DeckDescription** : Une description du deck (String)
      - **DeckColor** : Choix parmis les 6 couleurs de magic
      (<img src="img/MagicColorIcons/plain.png" alt="drawing" width="16"/>
      ,<img src="img/MagicColorIcons/island.png" alt="drawing" width="16"/>
      ,<img src="img/MagicColorIcons/swamp.png" alt="drawing" width="16"/>
      ,<img src="img/MagicColorIcons/montain.png" alt="drawing" width="16"/>
      ,<img src="img/MagicColorIcons/forest.png" alt="drawing" width="16"/>
      ,<img src="img/MagicColorIcons/colorless.png" alt="drawing" width="16"/>) (Enum)
      - **DeckRepresentative** : Carte qui représentera le deck (le commandant si le format est commander, sinon un carte choisie) (uuid référençant à une carte)
      - **DeckType** : Type du deck parmis (Aggro, Contrôle, Combo, Ramp)

      <br> Les informations générées automatiquement seront :
      - **DeckColor** : Si l'utilisateur n'as pas envoyé les couleurs dans le formulaire de création, les couleurs du deck sont déterminées à partir des couleurs des cartes dans celui-ci. (Enum)
      - **CreationDate** : Date de création du deck (yyyy:mm:dd h:m:s) (Date)
      - **CreatedBy** : ID du créateur du deck (Utilisateur connecté / Anonymous) (Int)
      - **DeckId** : Identifiant en base de données du deck (Int)
      
      <br>
    - **Front** : L'utilisateur devra cliquer sur un bouton "Créer un Deck" sur la page de visualisation des decks. Lorsque l'utilisateur clique sur le bouton "Créer un Deck" un popin (modale) s'ouvrira. La popin pourra se fermer soit : 
      - En cliquant sur "Annuler" en bas de la modale
      - En appuyant sur la touche "Esc"
      - En cliquant sur une croix en haut a droite à l'exterieur de la popin

      <br>
      Une fois la popin ouverte, l'utilisateur pourra remplir les champs suivant :
      
        - Nom du deck (Input Text) [**Required**]
        - Format du deck (Select)  [**Required**] (Default : Aucun)
        - Desctiption (Text Area)
        - Couleurs du deck (Checkboxes avec les 6 couleurs : 
        <img src="img/MagicColorIcons/plain.png" alt="drawing" width="16"/>
        ,<img src="img/MagicColorIcons/island.png" alt="drawing" width="16"/>
        ,<img src="img/MagicColorIcons/swamp.png" alt="drawing" width="16"/>
        ,<img src="img/MagicColorIcons/montain.png" alt="drawing" width="16"/>
        ,<img src="img/MagicColorIcons/forest.png" alt="drawing" width="16"/>
        ,<img src="img/MagicColorIcons/colorless.png" alt="drawing" width="16"/>) 
        
        <br>
        Apres validation du formulaire, l'utilisateur sera redirigé vers la page du deck en mode edition du deck créé.

        <br>

        En cas d'erreur lors de la validation du formulaire, le bouton de validation devindra rouge avec un petit tremblement. De plus, un message d'erreur s'affichera au dessus des bouton de validation de la popin.
        <br>
        Exemple :
        - "Le nom du deck ne doit pas être vide"
        - "Une erreur est survenue"
        
    <br>
2. Visualiser la liste des decks:
    - **Back** : Au chargement de la page, le client web ferra une requette HTTP en méthode **GET** sur la route `api/deck/get-all-decks`.
    <br> Cette requette renverra les informations suivantes :
      - La liste des decks qui ont été créés par l'utilisateur connecté
      - Les informations de chaques decks nécéssaire à la présentation de celui-ci (**DeckName**, **CreatedBy**, **DeckRepresentative**)
      - Le nombre de decks possédés par l'utilisateur <br>
    
    - **Front** : Lors du chargement des decks, l'utilisateur verra un spinner qui disparaîtra lorsque les données sur les deck seront arrivées au navigateur. Si il y a beaucoup de deck, une pagination sera mise en place avec 20 decks par page. 
    <br> Les decks seront représenté par leur image **DeckRepresentative**, si ils n'en ont pas ce sera le dos d'une carte magic. Autour de la **DeckRepresentative**, il y aura une bordure au couleurs du deck, si le deck n'as pas de couleur, il n'y aura pas de bordure.
    <br>
    Losqu'on clique sur la **DeckRepresentative** d'un deck, on est redirigé vers la page du deck.

3. Modification d'un Deck:
    - **Back** :  Après validation des modification, le client web fera une requette HTTP en méthode **POST** sur la route `api/deck/update-deck`. Seule les informations modifiées seront envoyées (Ex : si on ne modifie pas le nom du deck, l'attribut **DeckName** ne sera pas envoyé).
    <br> Les informations requises seront:
      - **DeckId** : L'identifiant du deck (Int)
    
      <br> Les informations optionnelles (à envoyer seulement si elles sont modifiées) seront :
      - **DeckName** : Nom du deck (String)
      - **DeckFormat** : Format du deck (Choix parmi une Liste -> Commander, Standard, Modern, etc...) (Enum)
      - **DeckDescription** : Une description du deck (String)
      - **DeckColor** : Choix parmis les 6 couleurs de magic
      (<img src="img/MagicColorIcons/plain.png" alt="drawing" width="16"/>
      ,<img src="img/MagicColorIcons/island.png" alt="drawing" width="16"/>
      ,<img src="img/MagicColorIcons/swamp.png" alt="drawing" width="16"/>
      ,<img src="img/MagicColorIcons/montain.png" alt="drawing" width="16"/>
      ,<img src="img/MagicColorIcons/forest.png" alt="drawing" width="16"/>
      ,<img src="img/MagicColorIcons/colorless.png" alt="drawing" width="16"/>) (Enum)
      - **DeckRepresentative** : Carte qui représentera le deck (le commandant si le format est commander, sinon un carte choisie) (uuid référençant à une carte) (uuid)
      - **DeckType** : Type du deck parmis (Aggro, Contrôle, Combo, Ramp) (Enum)
      - **CardList** : Tableau JSON contenant l'uuid des cartes composant le deck à la validation des modification avec le nombre d'exemplaire. (Json)

      <br>
    - **Front** : Sur la page de visualisation d'un deck, il sera possible de passer en mode Edition afin de pouvoir modifier les cartes qui sont dans le deck.
    <br>
    En mode Edition, les actions affichées seront : 
      - **Champ de recherche**: Il permettra de chercher des cartes à ajouter dans le deck. Les résultats de la recherche seront affiché en dessous du champs de recherche apres chaque input. Quand on passe la souris au dessus du nom de la carte dans les résultats de recherche, on peux voir la carte (Dans la langue choisi dans le profil utilisateur)
      - **Ajuster le nombre de cartes dans le deck** : Sur chaque cartes il sera possible de modifier le nombre d'exemplaires dans le deck (si 0 retirer la carte au moment de la sauvegarde)
      - **Modifier les infos du deck** : Il sera possible de modifier le **nom**/la **description**/le **format du deck** en cliquant sur eux et il se changeront en champs de texte prérempli avec les attibuts actuels du deck.
      - **Changer la representative du deck** : On pourra changer la carte représentant le deck en cliquant sur un bouton qui ouvrira une popin dans laquelle on pourra selectionner la carte (présente dans le deck) qui sera la représentative.
      - **Supprimer le deck** Il sera possible de supprimer le deck en cliquand sur "Supprimer le deck". Il y aura une popin de validation.
      - **Vider le deck** Il sera possible de vider les cartes d'un deck.
      - **Sauvegarder les modification du deck**: Enregistrer les modifications faite sur le deck
      - **Importer une liste de cartes** : Via un bouton qui ouvre une popin avec une textarea pour faire un copié collé d'une liste de cartes (au format sur mkm Ex : 5x Forest / 1 Forest)
    
      Les autres action présentes lors du mode "Visionnage" seront cachées.

4. Modifier le type d'affichage de ses decks (condensé, étendu, ...) grace à des checkbox/liste déroulante
5. Visualiser une carte en détail en cliquant dessus (ouvre une fenêtre pop-in)
6. Visualiser des statistiques sur ses decks (nombre de carte par coût, type de carte, couleur, ...) en cliquant sur l'onglet dédié sur la page du deck sélectionné
7. Définir dès la création de deck les couleurs qu'il voudra jouer grâce à des checkbox 
8. Choisir le format de son deck(commander, standard, libre, ...) lors de la création du deck ou pendant modification grâce à une liste déroulante
9. Générer une main aléatoire dans l'onglet statistique, l'utilisateur pourra relancer plusieurs fois cette main (checkbox pour mulligan ou non?)
10. Importer\exporter des decklists format '.txt, csv, ...) depuis l'interface de visualisation du deck sélectionné
11. Dupliquer un deck (possédé ou celui d'un autre joueur) depuis l'interface de visualisation des decks de l'utilisateur en cliquant sur le bouton dédié
12. Afficher des cartes pertinantes en fonction des couleurs choisies (à l'aide d'un onglet? bouton qui ouvre une pop-in avec 3 cartes qui pourrait correspondre, un peu comme dans un jeu de carte proposé par Blizzard?)
13. Visualiser les cartes bannies dans le format choisi (pop-in à l'aide d'un bouton?)
14. Se faire recommandé des cartes pertinantes pour son deck grâce à un bouton dédié sur la page du deck sélectionné

## II. L'utilisateur pourra depuis la page "Search" - 1,5 Mois
1. Rechercher une carte en particulier en entrant le nom de la carte dans le champ "rechercher" (Réfléchir à comment afficher les résultats):
    - **Back** : Après lancement de la recherche, le client web fera une requette http en méthode **POST** sur la route `api/search`.
  
      Les informations à renseigner obligatoirement :
      - **UserSearch** : contenu du champ **Rechercher**.

      <br>Les informations qui pourront être renseignées seront:
      - **Colors** : Choix de la ou les couleur(s) des cartes affichées parmis les 6 disponibles (
        <img src="img/MagicColorIcons/plain.png" alt="drawing" width="16"/>
        ,<img src="img/MagicColorIcons/island.png" alt="drawing" width="16"/>
        ,<img src="img/MagicColorIcons/swamp.png" alt="drawing" width="16"/>
        ,<img src="img/MagicColorIcons/montain.png" alt="drawing" width="16"/>
        ,<img src="img/MagicColorIcons/forest.png" alt="drawing" width="16"/>
        ,<img src="img/MagicColorIcons/colorless.png" alt="drawing" width="16"/>
      ). 
      - **MinCoveredManaCost** : coût en mana minimum des cartes affichées.
      - **MaxCoveredManaCost** : coût en mana maximum des cartes affichées.
      - **Type** : Choix du ou des type(s) des cartes affichées (créature, éphémère, rituel, artefact, enchantement, terrain, ...).
      - **Rarity** : Choix de la rareté des cartes affichées (commune, inhabituelle, rare, mythique, timeshifted).
      - **Extension** : Choix de l'extension des cartes affichées (Kamigawa, Ravnica, Dominaria, eldraine, ...).

      <br>autres requêtes nécessaire :
      - **GET** `api/card/{user_search}` : avec **user_search** = tableau contenant les données de toutes les cartes correspondant à la recherche (dont le nom correspond à la recherche spécifiée).
      Les informations renseignées lors de la précédente requête le seront automatiquement lors de l'exécution de cette requête. 
      
      <br>Ce qui va être retourné :
      - Liste de cartes contenant dans leur nom **UserSearch** et répondant au critères évoqués précédemment (**Colors**, **Type**, **Rarity**, ...).
    <br>

    - **Front** : L'utilisateur devra cliquer, puis, entrer une partie du nom de la carte qu'il la cherche dans le champ **Rechercher**, puis il devra soit presser la touche **ENTRER**, soit appuyer sur le bouton **Valider**. 
      - L'utilisateur pourra cocher une ou plusieurs cases du champ **Couleurs** représentant les 6 couleurs disponibles (
        <img src="img/MagicColorIcons/plain.png" alt="drawing" width="16"/>
        ,<img src="img/MagicColorIcons/island.png" alt="drawing" width="16"/>
        ,<img src="img/MagicColorIcons/swamp.png" alt="drawing" width="16"/>
        ,<img src="img/MagicColorIcons/montain.png" alt="drawing" width="16"/>
        ,<img src="img/MagicColorIcons/forest.png" alt="drawing" width="16"/>
        ,<img src="img/MagicColorIcons/colorless.png" alt="drawing" width="16"/>
      ).
      - L'utilisateur pourra rentrer dans le champ **Coût minimum** un nombre représentant le coût minimum des cartes à afficher.
      - L'utilisateur pourra rentrer dans le champ **Coût maximum** un nombre représentant le coût maximum des cartes à afficher.
      - L'utilisateur pourra cocher une ou plusieurs cases du champ **Type de carte** représentant les types de la carte recherchée (créature, éphémère, rituel, artefact, enchantement, terrain, ...). 
      - L'utilisateur pourra cocher une ou plusieurs cases du champ **Rareté** représentant la rareté de la carte recherchée (commune, inhabituelle, rare, mythique, timeshifted).
      - L'utilisateur pourra depuis la liste déroulante **Extension** choisir l'extension de la carte recherchée.
      - Les cartes seront affichées sous forme de liste (coût de la carte -> nom de la carte -> au bout de la ligne : extension de la carte).
  
    <br>
2. Visualiser une carte en passant sa souris dessus:
    - **Front** : Quand l'utilisateur passera sa souris au dessus d'une des cartes, il y aura un **Zoom** sur cette carte, affichant ainsi l'image associée.

    <br>
3. Aller sur la page détaillée d'une carte en cliquant dessus:
    - **Back** : Lorsque l'utilisateur cliquera sur une carte, le client web fera une recherche http en methode **GET** sur la route `api/card/{card_id}`.

      Les informations générées automatiquement seront:
      - **card_id** : id de la carte sélectionnée.

      <br>Ce qui va être retourné : 
      - L'image de la carte.
      - Des informations sur la carte : son nom, son type, son coût en mana, son extension (nom + symbole), ses effets, des informations sur son effet (définition piétinement, célérité, initiative, ...) et sa déscription.<br>

    - **Front**: Quand l'utilisateur cliquera sur une carte, une fenêtre **Pop-in** s'ouvrira contenant diverse informations sur la carte sélectionnée.
      - Le nom de la carte dans la langue de l'utilisateur.
      - Le coût en mana de la carte.
      - Le type de la carte (créature, éphémère, rituel, artefact, enchantement, ...).
      - Les effets de la carte.
      - Des détails concernant certains effets (piétinement, célérité, initiative, ...).
      - La description de la carte

    <br>
4. Si connecté, ajouter cette carte à sa collection grâce à un bouton
5. Rechercher des cartes par format grâce à une liste déroulante (peut être utile pour commander ou pour le standards)

## III. L'utilisateur pourra depuis la page "Collection" 2,5 Mois
1. Visualiser sa collection de carte de puis l'interface principale
2. Ajouter une carte qu'il a visualisé depuis une autre page à sa collection grâce à un bouton dédié sur la visualisation de la carte 
3. Trier les cartes par couleur grâce à des checkbox
4. Trier les cartes par extension grâce à une liste des extensions 
5. Trier les cartes par rareté grâce à des checkbox
6. Visualiser le nombre de carte qu'il possède d'une ou plusieurs extensions (mise en place d'une progress bar)

## IV. L'utilisateur pourra depuis la page "Sign in" - 0,5 Mois
1. Se connecter à son compte avec son pseudo ou son adresse mail, et un mot de passe
2. S'inscrire en renseignant une adresse e-mail, un pseudo, un mot de passe et une confirmation de ce mot de passe (à voir si besoin de plus d'info)
3. Se connecter avec son compte google ou autre (OAuth) avec un bouton dédié

## V. L'utilisateur pourra depuis la page "User profile" - 0,5 Mois
1. Modifier son email en renseignant au préhalable son email actuel et son mot de passe
2. Modifier son mot de passe en renseignant son email et son mot de passe actuel, puis en rentrant et en confirmant le nouveau mot de passe dans les champs dédiés
3. Modifier son pseudo comme il le souhaite en modifiant le champ "pseudo" 
4. Modifier ses informations utilisateur en modifiant le contenu des champs dédiés 

## VI. L'utilisateur pourra depuis la page "Community decklists" (visualisation de decks/éxemples d'autres utilisateurs) - 1,5 Mois
1. Visualiser des decklists en cliquant dessus
2. Exporter une decklist au format .txt pour que l'utilisateur puisse l'importer dans sa decklist
3. Trier les decklists en fonction du format grâce à une liste déroulante

## VII. L'utilisateur pourra depuis la page "Definition" - 2 Mois
1. Consulter la définition de n'importe quel effet qu'il ne comprend pas (wiki)

## VIII. Le développeur pourra depuis la page "Administration" - Tâche de fond sur la durée du projet (0,5 Mois)
1. Consulter la documentation du projet
2. Consulter la documentation de l'API
3. Tester l'API




 
