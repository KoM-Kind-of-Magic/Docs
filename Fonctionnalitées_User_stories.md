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
    - **Back** : Après validation des modification, le client web fera une requette HTTP en méthode **POST** sur la route `api/deck/update-deck`. Seule les informations modifiées seront envoyées (Ex : si on ne modifie pas le nom du deck, l'attribut **DeckName** ne sera pas envoyé).
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

4. Modifier l'affichage d'une Decklist:
    - **Back** : Le type de vue sera sauvegardé, soit dans la base de données via requette HTTP en méthode **POST** sur la route `api/user/update-user-pref` soit dans le navigateur via des cookies.

      <br>
    - **Front** : Sur la page de visualisation d'un deck, il sera possible de modifier l'affichage de la Decklist via des radios buttons. Changer de type d'affichage via ces boutons ne rechargera pas la page.
    <br> Les trois types d'affichage disponnibles seront:
      - Vue en liste: Sur une seule colonne, à l'image de ce [site](https://www.lotusnoir.info/magic/decks/rokiric-v1/).
      - Vue par catégorie : Sur plusieurs colonnes, à l'image de ce [site](https://deckstats.net/decks/157815/1688099-rakdos-eldrazi).
      - Vue par image : Séparé par catégories, à l'image de ce [site](https://edhrec.com/deckpreview/8up7SBQPWiPPp7QfCNOxWA).

<br>

5. Redirection vers la page d'une carte: 
    - **Back** : La redirection se fera vers un lien tel que : `https://kindofmagic.fr/card/{card_uuid}`

      <br>
    - **Front** : Cliquer sur la une carte ouvrira un autre onglet qui redirige vers la page de présentation d'une carte.


Visualiser une carte en détail en cliquant dessus (ouvre une fenêtre pop-in)

6. Visualiser des statistiques sur ses decks (nombre de carte par coût, type de carte, couleur, ...) en cliquant sur l'onglet dédié sur la page du deck sélectionné
7. Définir dès la création de deck les couleurs qu'il voudra jouer grâce à des checkbox 
8. Choisir le format de son deck(commander, standard, libre, ...) lors de la création du deck ou pendant modification grâce à une liste déroulante
9. Générer une main aléatoire dans l'onglet statistique, l'utilisateur pourra relancer plusieurs fois cette main (checkbox pour mulligan ou non?)
10. Importer/exporter des decklists format '.txt, csv, ...) depuis l'interface de visualisation du deck sélectionné
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
      - **Format** : Choix du format des cartes affichées (standard, libre, commander, ...).

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
      - L'utilisateur pourra depuis la liste déroulante **Format** choisir le format de jeu (standard, libre, commander, ...) des cartes affichées et donc vérifier si sa carte est acceptée dans le format sélectionné.
      - Les cartes seront affichées sous forme de liste (coût de la carte -> nom de la carte -> au bout de la ligne : extension de la carte).
  
    <br>
2. Visualiser une carte en passant sa souris dessus:
    - **Front** : Quand l'utilisateur passera sa souris au dessus d'une des cartes, il y aura un **Zoom** sur cette carte, affichant ainsi l'image associée.

    <br>
3. Aller sur la page détaillée d'une carte en cliquant dessus:
    - **Back** : Lorsque l'utilisateur cliquera sur une carte, le client web fera une requette http en methode **GET** sur la route `api/card/{card_uuid}`.

      Les informations générées automatiquement seront:
      - **card_uuid** : id de la carte sélectionnée.

      <br>Ce qui va être retourné : 
      - L'image de la carte.
      - Des informations sur la carte : son nom, son type, son coût en mana, son extension (nom + symbole), ses effets, des informations sur son effet (définition piétinement, célérité, initiative, ...) et sa déscription.<br>

    - **Front**: Quand l'utilisateur cliquera sur une carte, une fenêtre **Pop-in** s'ouvrira contenant diverse informations sur la carte sélectionnée.
      - Le nom de la carte dans la langue de l'utilisateur.
      - Le coût en mana de la carte.
      - Le type de la carte (créature, éphémère, rituel, artefact, enchantement, ...).
      - Les effets de la carte.
      - Des détails concernant certains effets (piétinement, célérité, initiative, ...).
      - La description de la carte.

    <br>
4. Si connecté, ajouter cette carte à sa collection grâce à un bouton:
    - **Back** : Lorsque l'utilisateur cliquera sur le bouton "Ajouter à la collection", le client web fera une requette http en methode **PUT** sur la route `api/collection/add_card`.

      <br> Les informations qui devront être renseignées seront :
      - **Card_uuid** : L'id de la carte.
      - **User_id** : L'id de l'utilisateur.
      
      <br>
    - **Front** : Lorsque l'utilisateur cliquera sur le bouton "Ajouter à la collection", une **Pop-in** s'ouvrira lui demandant de valider son choix (Êtes-vous sur de vouloir ajouter cette carte à votre collection ? oui/non), si l'utilisateur appuie sur "oui", un message de confirmation sera affiché (La carte à bien été ajoutée à votre collection.

<br>

## III. L'utilisateur pourra depuis la page "Collection" 2,5 Mois
1. Visualiser sa collection de carte de puis l'interface principale:
    - **Back** : Lorsque l'utilisateur arrivera sur la page collection ou modifiera un ou plusieurs paramêtres de tri, le client web fera une requette http en methode **GET** sur la route `api/collection/get_cards`.

      <br>Les informations qui devront être renseignées sont :
      - **User_id** : L'id de l'utilisateur

      <br>Les informations qui pourront être renseignées sont :
      - **MinCoveredManaCost** : coût en mana minimum des cartes affichées.
      - **MaxCoveredManaCost** : coût en mana maximum des cartes affichées.
      - **Colors** : Choix de la ou les couleur(s) des cartes affichées parmis les 6 disponibles (
        <img src="img/MagicColorIcons/plain.png" alt="drawing" width="16"/>
        ,<img src="img/MagicColorIcons/island.png" alt="drawing" width="16"/>
        ,<img src="img/MagicColorIcons/swamp.png" alt="drawing" width="16"/>
        ,<img src="img/MagicColorIcons/montain.png" alt="drawing" width="16"/>
        ,<img src="img/MagicColorIcons/forest.png" alt="drawing" width="16"/>
        ,<img src="img/MagicColorIcons/colorless.png" alt="drawing" width="16"/>
      ). 
      - **Extension** : Choix de l'extension des cartes affichées (Kamigawa, Ravnica, Dominaria, eldraine, ...).
      - **Rarity** : Choix de la rareté des cartes affichées (commune, inhabituelle, rare, mythique, timeshifted).

      <br>Ce qui va être retourné :
      - L'intégralité des cartes faisant partie de la collection de l'utilisateur si aucun filtre.
      - Si un ou plusieurs filtres sont actifs, les cartes seront affichées en prenant en compte ces filtres. 

      <br>
    - **Front** : Lorsque l'utilisateur arrivera sur la page, toutes les cartes seront affichées sous forme de lignes contenant: 
      - Le coût de la carte
      - La couleur de la carte
      - Le nom de la carte
      - L'extension de la carte

      <br> Il sera possible de changer ce format pour afficher diréctement une miniature de chaques cartes.

      <br> L'utilisateur pourra depuis la carte "Filtre" :
      - Spécifié le coût minimum et le coût maximum des cartes à afficher grâce à des zones .
      - Spécifié, grâce à des checkbox, une ou plusieurs couleurs parmi les 6 disponibles (
        <img src="img/MagicColorIcons/plain.png" alt="drawing" width="16"/>
        ,<img src="img/MagicColorIcons/island.png" alt="drawing" width="16"/>
        ,<img src="img/MagicColorIcons/swamp.png" alt="drawing" width="16"/>
        ,<img src="img/MagicColorIcons/montain.png" alt="drawing" width="16"/>
        ,<img src="img/MagicColorIcons/forest.png" alt="drawing" width="16"/>
        ,<img src="img/MagicColorIcons/colorless.png" alt="drawing" width="16"/>
      ), les cartes affichées corresponderont toutes aux couleurs spécifiées.
      -  Spécifié, grâce à une liste déroulante, l'extension des cartes à affiché.
      -  Spécifié, grâce à une liste déroulante, la rareté des cartes à affiché.
    
<br>

2. Supprimer une ou plusieurs cartes qu'il ne souhaite plus voir dans la collection:
    - **Back** : Lorsque l'utilisateur aura lancé la supression d'une ou plusieurs cartes de sa collection, le client web fera une requette http en methode **DELETE** sur la route `api/collection/delete`.

      <br> Les informations qui devront être renseignés seront :
      - **CardArray** : Un tableau contenant un ou plusieurs **Id de carte**.
      - **User_id** : L'id de l'utilisateur.   

      <br>Les cartes sélectionnées seront ainsi supprimées de la collection.

    <br>

    - **Front** : L'utilisateur aura la possibilité de sélectionner une ou plusieurs cartes en cochant une ou plusieurs **checkbox**, en appuyant ensuite sur le bouton supprimer, une **pop-in** apparaitra, affichant un récapitulatif des cartes sélectionnées puis demandant à l'utilisateur si il veut vraiment supprimer ces cartes de sa collection (Êtes-vous sur de vouloir supprimer ces X cartes de votre collection? oui/non).
    
    <br>Si l'utilisateur appuie sur "oui" alors les cartes n'apparaitront plus dans sa collection.

    <br>

3. Visualiser le nombre de carte qu'il possède d'une ou plusieurs extensions (mise en place d'une progress bar):
    - **Back** : Lorsque l'utilisateur aura renseigner au moins une extension au sein de la carte "Progression" puis appuyer sur le bouton "valider", le client web fera une requette http en methode **GET** sur la route `api/collection/get_progress_bar`.

      <br> Les informations qui devront être renseignés sont :
      - **ExtensionArray** : Un tableau contenant une ou plusieurs extensions (Kamigawa, Ravnica, Dominaria, eldraine, ...).

      <br> Ce qui va être retourné :
      - Une **progress bar** représentant le nombre de cartes que l'utilisateur possède dans une ou plusieurs extensions.
  
    <br>

    - **Front** : L'utilisateur pourra depuis la carte "Progression": 
      - Renseigner, grâce à une liste déroulante une première extension.
      - Renseigner des extensions supplémentaires en appuyant sur le bouton +. 
      - Retirer une extension de la liste grâce à un bouton - en face de l'extension.
      - Valider la sélection

      <br> Une fois les choix validés, une bar de progression représentant le nombre de carte par extension renseignées, le nombre total de carte sera également affiché pour pouvoir comparer.

      <br>

## IV. L'utilisateur pourra depuis la page "Sign in" - 0,5 Mois
1. Se connecter à son compte avec son pseudo ou son adresse mail, et un mot de passe:
    - **Back** : Si **Username**/**Email** existe dans la base de donnée et **Password** correspond, l'utilisateur sera redirigé vers la page "search" : `https://kindofmagic.fr/search` 

      <br>Les informations qui devront être renseignées :
      - **Username** ou **Email** : un nom d'utilisateur existant/un email existant
      - **Password** : un mot de passe correspondant au nom d'utilisateur/email

    <br>

    - **Front** : L'utilisateur devra remplir 2 champs: 
      - Le 1er champ contiendra son email ou son nom d'utilisateur
      - Le 2ème champ contiendra son mot de passe

      <br>Une fois les 2 champs remplis, l'utilisateur pourra se connecter en appuyant sur le bouton "login", si ses identifiants sont invalides, un message d'erreur apparaitre ("Votre Username/Email n'existe pas" si l'utilisateur n'existe pas dans la base de donnée et "Votre mot de passe est erroné, veuillez réessayer", si l'utilisateur existe mais le mot de passe ne correspond pas).

    <br>

2. S'inscrire en renseignant une adresse e-mail, un nom d'utilisateur, un mot de passe et une confirmation de ce mot de passe (à voir si besoin de plus d'info):
    - **Back** : Si **Username** et **Email** n'existent pas dans la base de donnée et **Password** = **PasswordConfirm**, le compte sera créer dans la base de donnée et l'utilisateur redirigé vers la page login : `https://kindofmagic.fr/login`.

      <br>Les informations qui devront être renseignées :
      - **Username** : un nom d'utilisateur non existant
      - **Email** : un email  non existant
      - **Password** : un mot de passe
      - **PasswordConfirm** : **Password**

    <br>

    - **Front** : L'utilisateur devra obligatoirement remplir les 4 champs :
      - Le 1er champ contiendra le nom d'utilisateur qu'il souhaite avoir
      - Le 2ème champ contiendra son adresse email
      - Le 3ème champ contiendra son mot de passe
      - Le 4ème champ contiendra la confirmation de son mot de passe

      <br>Une fois les 4 champs remplis, l'utilisateur va pouvoir créer son compte en cliquant sur le bouton "Sign up", si le nom d'utilisateur ou l'email existent déjà, un message d'erreur sera être retourné ("Votre nom d'utilisateur est déjà pris" si le nom d'utilisateur existe déjà et "Cet email est déjà assigné à un compte", si l'email existe déjà). 

      <br>Si le mot de passe utilisateur est différent de celui renseigné dans le champ **"password confirmation"**, un message d'erreur sera retourné ("Echec à la validation du mot passe").

      <br>

3. Se connecter avec son compte google ou autre (OAuth) avec un bouton dédié
    - **Back** : Lorsque l'utilisateur se connecte avec un compte google, la connection se fera après validation de l'utilisateur, celui-ci sera redirigé vers la page "search" : `https://kindofmagic.fr/search`.

    <br>

    - **Front** : L'utilisateur pourra cliquer sur le bouton **"Connection avec votre compte google"** via la page "login", puis il devra selectionner le compte avec lequel il veut se connecter et valider la connection via son portable (authenticator par défaut lors de l'utilisation d'un compte google). 

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




 
