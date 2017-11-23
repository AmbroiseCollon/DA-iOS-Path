# Développez une application iPhone avec le modèle MVC

## Préparez la structure de votre application

### Tirez le meilleur de ce cours

Bonjour à tous ! Et bienvenue dans ce cours sur la programmation iOS ! Ensemble, nous allons réaliser une application iPhone OpenQuizz ! Je vous promets que ça va être passionnant !

> **:information_source:** Mais avant de rentrer dans le détail, sachez que vous avez besoin de quelques notions avant de vous lancer. Ce cours fait partie de tout un [parcours](https://openclassrooms.com/paths/developpeur-se-dapplication-ios) sur le développement iOS donc je vous invite à suivez les cours dans l'ordre. Oui en général c'est mieux quand on commence par le début... ;)  
- Cours [1](https://openclassrooms.com/courses/introduction-a-ios-plongez-dans-le-developpement-mobile) : Introduction à iOS. *Dans ce cours, vous allez faire votre première application mobile à partir de zéro !*
- Cours [2](https://openclassrooms.com/courses/apprenez-les-fondamentaux-de-swift) et [3](https://openclassrooms.com/courses/approfondissez-swift-avec-la-programmation-orientee-objet) : Swift. *Avec ces deux cours, vous saurez tout du langage Swift !*

Vous êtes prêts ? Alors allons-y !

#### OpenQuizz

Dans ce cours, nous allons donc réaliser l'application OpenQuizz. Et sans plus de suspens, laissez moi vous la montrer :

![]() => (P1/P1C1_1.png)

Dans l'application OpenQuizz, le joueur va pouvoir faire des parties de 10 questions. Il peut répondre par vrai ou par faux à chaque question en faisant glisser la question vers la droite ou vers la gauche. Il marque un point à chaque bonne réponse. Au bout de 10 questions, la partie s'arrête et le joueur peut lancer une nouvelle partie.

Sous son apparence simple, cette application va nous poser quelques challenges et nous allons donc voir comment gérer des images, interpréter les gestes de l'utilisateur, créer des animations et beaucoup d'autres choses !


#### Notre objectif : le modèle MVC
Lorsqu'on se lance dans de grands et beaux projets, il faut savoir où l'on va ! Comme c'est notre cas, prenons une minute pour comprendre l'objectif de ce cours !

Nous allons voir bien des choses dans ce cours comme je viens de vous l'annoncer ! Mais **le plus important, c'est le modèle MVC** ! Le modèle MVC, c'est la façon dont nous allons organiser notre programme. Cela vous paraît peut-être annexe mais vous verrez que même pour une application apparemment simple, on peut vite se faire déborder par la quantité de fichiers et de lignes de code du projet.

Heureusement, il existe une solution simple pour que le développement reste un plaisir jusqu'au bout et que vous ne vous perdiez pas dans votre projet. Et la solution, c'est d'appliquer avec rigueur le modèle MVC. Et je vous explique ça dès la fin de cette partie.

Pour insister sur ce point, voici un petit schéma qui parle de lui-même :

![]() => (P1/P1C1_2.png)

#### Approche

Tout le cours s'appuie sur la création de l'application OpenQuizz donc si vous ne faites pas l'application en même temps que moi, vous allez perdre une grande partie de l'intérêt du cours et vous apprendrez beaucoup moins vite !

Je vous invite donc fortement à **faire les choses en même temps que moi sur votre ordinateur** ! C'est la raison pour laquelle vous avez une **activité à la fin du cours dans laquelle vous allez devoir envoyer le code de votre application**. Cette activité est obligatoire pour obtenir le certificat du cours.

#### Création du projet Xcode
Alors sans plus attendre, créons ensemble le projet Xcode de notre application !

> **:information_source:** La création d'un projet Xcode est déjà détaillée complètement dans [ce cours](https://openclassrooms.com/courses/introduction-a-ios-plongez-dans-le-developpement-mobile/creez-votre-projet). C'est la raison pour laquelle je ne fais ici qu'un bref rappel.

1/ Ouvrez Xcode et choisissez *Create a new Xcode Project*
![]() => (P1/P1C1_3.png)
2/ Remplissez les **options** de votre projet :

> **:information_source:** Pour le nom de l'organisation, vous pouvez choisir votre nom et pour l'*organization identifier*, vous pouvez adopter la convention suivante `fr.nomprenom`.  
Soyez certains de bien choisir le langage Swift et de choisir *Universal* car dans le prochain cours sur iOS, on va adapter notre application OpenQuizz à toutes les tailles d'écrans.

![]() => (P1/P1C1_4.png)

3/ Choisissez **Single View Application** pour créer une application d'une seule page.

![]() => (P1/P1C1_5.png)

4/ Choisissez l'emplacement où vous souhaitez sauvegarder votre projet.

Ensuite, vous arrivez sur l'interface d'Xcode, ça y est votre projet est créé !

Nous allons pouvoir maintenant travailler à partir de ce projet. Et ce, dès le prochain chapitre dans lequel nous allons apprendre à **gérer les images** dans un projet d'application iPhone !

### Gérez les images

Notre dévoué designer nous a préparé un joli petit design pour notre application. Dans les chapitres de cette partie, nous allons préparer notre application pour que nous puissions facilement intégrer le design prévu par la suite. Cette partie permet donc surtout de préparer le terrain en apprenant au passage quelques techniques incontournables d'iOS. Et la première d'entre elles, c'est la gestion des images dans une application. Voyons ça ensemble dans ce chapitre !

#### Le dossier d'images
Notre designer a préparé pour vous les images que l'on va afficher dans notre application. Je vous invite à les télécharger à [cette adresse](https://s3-eu-west-1.amazonaws.com/static.oc-static.com/prod/courses/files/Parcours+DA+iOS/Cours+4+-+MVC/Assets.zip). Ouvrez le dossier et voyons ensemble ce qu'il comporte :

![]() => (P1/P1C2_1.png)

Nous avons donc 3 images différentes, de trois formats différents. Et un dossier `Icons` qui contient l'icône de l'application en différentes tailles.

#### Découvrir les assets
Pour l'instant, si vous lancez votre application et qu'ensuite, vous simulez l'appui sur le bouton *Home* du simulateur, vous verrez que notre icône d'application ressemble à ceci :

![]() => (P1/P1C2_2.png)

C'est l'icône par défaut d'une application. Nous allons changer ça en chargeant dans notre projet l'icône que nous avons trouvée dans le dossier. Allons-y !

Les images dans un projet Xcode, on appelle ça des *assets*. Et pour ajouter de nouveaux *assets*, il faut aller dans le dossier dédié `Assets.xcassets` :

![]() => (P1/P1C2_3.png)

En ouvrant ce dossier, vous voyez en haut à gauche l'inscription `App Icon`. Cliquez dessus et vous voyez s'afficher ceci :

![]() => (P1/P1C2_4.png)

Dans ce dossier, vous avez toutes les tailles d'icônes que le logiciel réclame.

> **:question:** Pourquoi toutes ces tailles ?

D'une part, la taille dépend de l'appareil. L'icône de l'application ne s'affiche pas de la même manière sur un iPhone ou un iPad.

D'autre part, dans iOS, l'icône de l'application est utilisée à divers endroits et pour qu'elle s'affiche correctement à chacun de ses endroits, il faut donner lui donner la bonne taille. Précisément, il y a 4 tailles différentes :

Voyons un peu à quoi elles correspondent :

![]() => (P1/P1C2_5.png)

Dans le schéma ci-dessus, j'ai pris l'exemple de l'icône de l'application *Message* affichée tour dans : une notification, dans les réglages de l'iPhone, dans la recherche et sur l'icône de l'application elle-même.

#### L'écran de l'iPhone

> **:question:** Mais c'est quoi les `2x` et `3x` ?

Pour répondre à cette question, il faut comprendre rapidement comment fonctionne un écran. Un écran, c'est une grille de pixels, chaque pixel étant un petit carré de couleur uniforme.

Avec l'arrivée de l'iPhone 4, Apple a créé l'écran Retina. Cet écran a une résolution deux fois meilleure que l'écran des iPhones précédents. Cela veut dire que **sur un même espace, mettons 1 cm2, l'écran affiche 2 fois plus de pixels**. Depuis, ils ont encore amélioré l'écran et les écrans des iPhone 6s Plus et 7 Plus (les plus grands iPhone) ont une résolution 3 fois meilleure (on les appelle *Retina HD*).

> **:information_source:** Apple ne supporte plus les anciens modèles d'iPhone, iPod Touch et iPad avec iOS 11. Les modèles supportés ont désormais tous au moins l'écran Retina. Cela veut dire que si vous faîtes des applications pour iOS 11, seulement les tailles 2x et 3x seront nécessaires.

Ce changement a posé un problème. On ne peut plus parler de la taille d'une image en nombre de pixels, car cela dépend de l'écran. Du coup, Apple a créé une autre unité : le point *(pt)*. Et selon l'écran, un point est automatiquement transformé avec le bon nombre de pixels.

![Une image de 10 x 10 points selon les trois résolutions d'écrans](Images/P1/P1C2_6.png)

Du coup, il faut fournir toutes les images qui vont être affichées par l'application en trois tailles différentes. Et pour cela il existe une convention spécifique. Prenons un fichier `image.jpg`. Voilà comment nous allons le nommer pour les différentes tailles d'écran :

![]() => (P1/P1C2_7.png)

On ajoute **@2x** et **@3x** à la fin du nom du fichier pour spécifier le niveau de résolution de l'image. C'est ce qui a été fait dans le dossier d'images que vous avez téléchargé.

> **:information_source:** Sur Mac, il existe un logiciel très populaire auprès des designers web et mobile : [Sketch](https://www.sketchapp.com). Ce logiciel contient notamment une fonctionnalité très pratique pour exporter les images en trois formats différents en respectant cette convention.

#### Changer l'icône de l'application
On va pouvoir maintenant simplement glisser-déposer nos icônes depuis notre dossier vers les *assets*. Comme ceci :

![]() => (P1/P1C2_8.gif)

> **:warning:** Pendant cette étape, vérifiez bien que vous glisser la bonne image au bon endroit. Si vous vous trompez et que les tailles ne correspondent pas, Xcode vous le signalera par un warning :  
![]() => (P1/P1C2_9.png)  
Pas d'inquiétude, il vous suffit de réparer votre erreur en glissant la bonne icône là où vous vous êtes trompé.

Et voilà, nous avons maintenant une belle icône d'application :

![]() => (P1/P1C2_10.png)

> **:information_source:** Vous noterez que l'arrondi des angles se fait automatiquement.

#### Charger les images
En plus de l'icône, notre application va également afficher des images. Pour les rajouter, il suffit de les glisser par paquet de trois (pour les trois résolutions d'écrans) dans les *assets* comme ceci :

![]() => (P1/P1C2_11.gif)

**Grâce à la convention de nommage**, Xcode reconnaît que ces trois fichiers représentent tous la même image en trois résolutions différentes. Il les groupe tous automatiquement sous le même nom `Icon Correct` qui est le nom du fichier sans l'extension.

Vous pouvez répéter l'opération pour les deux autres images. Et voilà notre projet contient de belles images que l'on va pouvoir utiliser !

#### En résumé
- Pour gérer les images et les icônes d'une application, on utilise le dossier `Assets.xcassets` dans lequel on dépose les fichiers images que l'on souhaite.
- Il existe plusieurs formats d'icônes d'application. En effet la taille de l'icône dépend :
	- De l'appareil : iPhone ou iPad
	- Du contexte dans lequel l'icône est utilisée dans iOS : notifications, réglages, etc.
- Les iPhone et iPad ont des **écrans de trois résolutions différentes** : 1x, 2x et 3x. Pour cette raison, il faut fournir toutes les images, en 3 résolutions pour qu'elles s'affichent correctement sur tous les écrans.
- Je vous invite à **respecter la convention de nommage** pour faciliter l'importation des images.

### Gérez les polices
Maintenant que nous avons de belles images prêtes à l'emploi, nous allons pouvoir passer à la suite. Notre designer a choisi une police précise pour les textes de l'application et nous allons donc devoir l'installer pour pouvoir l'utiliser dans notre application. C'est parti !

#### Télécharger la police
Dans Xcode, il y a déjà un certain nombre de polices que vous pouvez utiliser sans avoir besoin de les installer. Mais la plupart des applications créent leur propre police ou utilisent des polices trouvées sur le web. Donc il va falloir que vous sachiez installer ces polices spéciales.

Celle que nous avons pour notre application s'appelle *Balham* et vous pouvez la télécharger à [cette adresse](https://s3-eu-west-1.amazonaws.com/static.oc-static.com/prod/courses/files/Parcours+DA+iOS/Cours+4+-+MVC/Balham.otf).

#### Ajouter la police
Une fois la police téléchargée, vous avez un fichier `Balham.otf`. Vous allez maintenant glisser ce fichier dans le navigateur d'Xcode (avec les autres fichiers) comme ceci :

![]() => (P1/P1C3_1.gif)

Ensuite, dans la fenêtre qui s'affiche, **cochez les options comme indiqué ci-dessous sinon votre police ne sera pas prise en compte**. Et cliquez sur *finish*.

![]() => (P1/P1C3_2.png)

> **:information_source:** Si vous n'avez pas cocher la case *Add to targets*, vous pouvez rattraper votre erreur après coût en cliquant sur le nom du fichier de police dans le navigateur de fichiers. Puis dans les utilitaires à droite, vous pouvez cocher la case OpenQuizz dans la section *Target Membership*.

Et voilà ! Votre police est ajoutée !

#### Le fichier plist
Dans le navigateur, vous avez le fichier `Info.plist` :

![]() => (P1/P1C3_3.png)

Ce fichier est un dictionnaire qui contient un certain nombre d'informations sur votre projet comme le nom de votre application, les orientations supportées par votre application, etc. Ce sont un peu **les paramètres de votre projet**.

Il vous arrivera assez régulièrement de devoir modifier ces paramètres ou d'en rajouter. Et c'est justement ce que nous avons besoin de faire pour que notre police soit prise en compte.

Pour cela, il vous faut placer votre souris au-dessus de la dernière ligne de ce fichier. Les boutons `+` et `-` apparaissent :

![]() => (P1/P1C3_4.png)

Cliquez sur `+`. Une nouvelle ligne apparait avec une liste déroulante. Choisissez dedans : *Fonts provided by application*.

![]() => (P1/P1C3_5.png)

Cliquez ensuite sur le petit triangle de droite pour dérouler la ligne et inscrivez en face de *Item 0* le **nom exact du fichier** comme ceci :

![]() => (P1/P1C3_6.png)

Xcode sait maintenant qu'il doit prendre en compte ce fichier comme un fichier de police. Nous avons une police toute belle et prête à l'emploi dans notre application ! Nous allons pouvoir l'utiliser dans les prochains chapitres de ce cours.

#### En résumé
- Pour installer une police dans un projet, il vous suffit de la glisser avec les autres fichiers dans le navigateur d'Xcode. N'oubliez pas de cocher la case *Add to targets* pour qu'Xcode la prenne en compte.
- Ensuite, dans le fichier `Info.plist`, vous devez ajouter la ligne : *Fonts provided by application*. Et inscrire dessous le nom exact de votre fichier de police.
- Le fichier `Info.plist` contient les paramètres de votre projet.

### Créez votre page de lancement
Nous avons maintenant notre icône, nos images et notre police. Dans ce chapitre, nous allons voir un nouvel élément essentiel d'une application : la page de lancement.

#### La page de lancement

> **:question:** C'est quoi la page de lancement ?

La page de lancement, c'est une **image fixe** que vous voyez **lorsque vous ouvrez une application** après l'avoir quittée. Cette page vous est présentée en attendant que l'iPhone ait fini de faire tous les calculs nécessaires à la présentation de l'application elle-même.

Voici les pages de lancement de quelques applications célèbres :

![]() => (P1/P1C4_1.png)

> **:warning:** Amusez-vous à regarder les pages de lancement de vos applications préférées. Mais soyons clair dès qu'il y a la moindre animation ou le moindre mouvement sur la page de lancement, ce n'est plus la page de lancement. Car la page de lancement, ça ne bouge pas !

#### L'interface builder
Dans votre projet, vous avez deux fichiers avec l'extension `.storyboard`. Ces deux fichiers sont ce qu'on appelle des fichiers d'interface builder. C'est-à-dire qu'ils vont nous permettre de dessiner nos interfaces.

Le premier s'appelle `Main.storyboard`, c'est dans ce fichier que nous allons dessiner la ou les interfaces de notre application. Mais celui qui nous intéresse ici, c'est le fichier `LaunchScreen.storyboard`. Car c'est dans ce fichier que nous allons dessiner notre page de lancement.

Ouvrez le fichier, vous arrivez sur ceci :

![]() => (P1/P1C4_2.png)

Dans cette image, je vous ai rappelé les principales sections de l'interface builder.

#### La palette de couleur
Nous allons maintenant modifier la couleur de fond de notre interface.

> **:warning:** Un [chapitre entier](https://openclassrooms.com/courses/introduction-a-ios-plongez-dans-le-developpement-mobile/preparez-l-interface) est dédié à la découverte de l'interface builder et traite en détail de la modification de la couleur de fond d'une interface. Donc ici je ne reviendrais pas là-dessus en détail.

Pour cela, nous allons d'abord cliquer sur la vue principale puis cliquer dans l'inspecteur d'attribut à droite sur le carré blanc. On voit apparaitre alors le sélecteur de couleur :

![]() => (P1/P1C4_3.png)

Nous devons respecter pour cette application la charte graphique qui nous a été fournie par notre designer ce qui inclut les images (OK), la police (OK) et les couleurs (pas encore OK...). Donc je vous propose de voir comment **créer une palette de couleur que nous allons pouvoir facilement réutiliser**.

Voici la palette de l'application OpenQuizz :

![]() => (P1/P1C4_4.png)

Pour recréer cette palette dans Xcode, il faut commencer par cliquer sur l'onglet palette (le 3e onglet) dans le sélecteur de couleur :

![]() => (P1/P1C4_5.png)

Ensuite, cliquez sur la roue dentée et choisissez *new* :

![]() => (P1/P1C4_6.png)

Vous pouvez à nouveau cliquer sur la roue dentée puis choisir *Rename...* pour renommer votre nouvelle palette et l'appeler OpenQuizz.

Ensuite, pour ajouter des couleurs dans votre palette, il suffit de sélectionner la couleur souhaitée avec la pipette et de cliquer sur le bouton `+` comme ceci :

![]() => (P1/P1C4_7.gif)

Ensuite il vous suffit de double cliquer sur le nom de votre couleur pour le changer. Vous pouvez répéter l'opération pour toutes les couleurs de la palette ci-dessus. À la fin votre palette doit ressembler à ceci :

![]() => (P1/P1C4_8.png)

#### Construction de l'interface
On va tout de suite utiliser notre nouvelle palette pour changer la couleur de fond. Je vous laisse le faire. Choisissez la couleur *Dark Blue*.

Et maintenant, nous allons rajouter une image (le gros point d'interrogation) au milieu de notre interface. Pour cela, je vous invite à aller en bas à droite de l'écran, dans la bibliothèque des objets. Et vous allez choisir le dernier onglet : la bibliothèque des médias.

![]() => (P1/P1C4_9.png)

Ici vous retrouvez les images que nous avons ajoutées dans les *assets* précédemment. Vous n'avez plus qu'à glisser le point d'interrogation vers le centre de l'interface :

![]() => (P1/P1C4_10.gif)

> **:information_source:** Vous pouvez utiliser les guides bleues pour placer correctement l'image.

Nous n'avons plus qu'à lancer l'application et admirer le résultat !

![]() => (P1/P1C4_11.gif)

À l'ouverture de l'application, on peut voir notre page de lancement. Et ensuite apparaît notre application (une page blanche pour le moment).

#### En résumé
- La page de lancement est une image fixe qui s'affiche au lancement de votre application pendant que l'application se charge.
- Vous créez votre page de lancement dans le fichier de création d'interfaces `LaunchScreen.storyboard`.
- Dans le sélecteur de couleur, dans l'onglet palette, vous pouvez créer votre propre palette de couleur.

### Découvrez le modèle MVC
Nous avons fait tous les préparatifs de notre application. Et maintenant que vous vous êtes un peu échauffés, nous allons pouvoir attaquer le chapitre **le plus important** de ce cours : la découverte du MVC ! Est-ce que vous êtes prêts ?

![]() => (P1/P1C5_1.jpg)

Vous n’avez pas l'air tout à fait prêt... Est-ce que vous êtes *vraiment* prêts ?

![]() => (P1/P1C5_2.jpg)

Je préfère ! Alors, allons-y !

#### Un patron de conception
Le MVC est ce que l'on appelle un patron de conception. Parfois il est inutile de réinventer la roue, alors je vous propose la définition Wikipédia du patron de conception, la meilleure que j'ai pu trouver.

> En informatique, et plus particulièrement en développement logiciel, un patron de conception (souvent appelé *design pattern*) est un arrangement caractéristique de modules, reconnu comme bonne pratique en réponse à un problème de conception d'un logiciel. Il décrit une solution standard, utilisable dans la conception de différents logiciels.

Un patron de conception, c'est donc une organisation des modules qui vont composer notre programme.

> **:question:** Ça sert à quoi ?

Et bien ça sert simplement à **s'organiser**. C'est aussi bête que ça. Vous vous rendrez vite compte que dès que votre projet dépasse quelques centaines de lignes de code, ce qui arrive très vite, vous serez vite perdus si vous ne vous organisez pas. Vous ne saurez plus où se trouve telle ou telle fonction, à quoi sert tel fichier, etc. Et c'est comme ça qu'arrivent les bugs car tout se mélange dans votre code !

**C'est donc très important d'organiser son code clairement !**  
**C'est donc très important d'organiser son code clairement !**  
**C'est donc très important d'organiser son code clairement !**

> **:warning:** Je vous ai dit que c'était important ? ;)

Quand on choisit un patron de conception pour une application, on s'engage à en respecter les règles.

#### MVC, le choix d'Apple
Apple a choisi par défaut le très populaire patron de conception MVC pour les applications iPhone. Cela veut dire que la façon dont ils ont conçu le développement d'application iPhone nous encourage à respecter le design MVC.

La bonne nouvelle, c'est que parmi les dizaines de *design pattern* existant, le MVC est assez simple et pour autant assez puissant.

> **:information_source:** Le MVC a ses limites. Si vous sentez que les bugs s'accumulent, c'est soit que vous n'êtes pas rigoureux dans l'application du MVC soit que votre application est devenue trop grosse et que vous avez besoin de passer à une architecture plus solide. Dans ce deuxième cas, gardez en tête les architectures suivantes qui sont plus élaborées :
- MVP
- MVVM
- VIPER
Mais dans vos premiers mois de développement iOS, le MVC devrait largement suffire. ;)

#### MVC, pour Modèle Vue Contrôleur
Bon alors qu'est-ce que le MVC ? Le MVC est d'abord un sigle qui signifie **Modèle Vue Contrôleur**. Avec le MVC, nous allons donc séparer notre programme en trois parties comme ceci :

![]() => (P1/P1C5_3.png)

Alors qui fait quoi ?
- Le **modèle** : c'est ce que fait l'application. C'est la logique, le cerveau de l'application.
- Le **contrôleur** : il récupère les informations du modèle et les affiche dans la vue.
- La **vue** : c'est ce que l'utilisateur voit, c'est l'interface de l'application.

> **:question:** OK et concrètement ?

Bon, prenons l'exemple de l'application calculatrice. Le programme de cette application est divisé en trois selon le modèle MVC. Voyons ce qu'il se passe lorsqu'un calcul a lieu.
1. La *vue* détecte que le bouton égal a été appuyé. Elle fait passer l'information au *contrôleur*.
2. Le *contrôleur* interroge le *modèle* en lui passant les informations nécessaires : les nombres de l'opération et le type d'opération demandée.
3. Le *modèle* reçoit les nombres et les opérations et fait les calculs correspondants. Il passe le résultat au *contrôleur*.
4. Le *contrôleur* reçoit le résultat et l'envoie à la *vue*.
5. La *vue* affiche le résultat à l'écran.

On peut résumer le modèle MVC avec la phrase suivante :

> Le **contrôleur** interprète et formate les informations du **modèle** pour les passer à la **vue**.

#### Les règles de communication du MVC
Le MVC, c'est avant tout une règle de communication. Cette règle définit la façon dont les différentes parties doivent communiquer. Tout le monde ne peut pas communiquer avec tout le monde sinon ça ne sert à rien de faire des parties différentes :D !

Et la règle d’or, la voici :

> **La vue et le modèle ne peuvent JAMAIS communiquer.**

Cela veut dire que d'une part le modèle n'a aucune idée de ce à quoi ressemble l'interface, qu’elles en sont ses composants, etc. **Le modèle est complètement indépendant de l'interface**. D'autre part, la vue n'a aucune idée de la logique de l'application. Autrement dit la vue est stupide, elle a seulement pour rôle d'afficher ou de faire ce que lui dit le contrôleur.

Donc tous les échanges se font via le contrôleur. Lui seul est autorisé à parler avec la vue et avec le modèle.

![]() => (P1/P1C5_4.png)

Comme le suggère le schéma ci-dessus, le contrôleur s'adresse directement au modèle et à la vue. Il peut leur demander ce qu'il veut. Comme sur la route, on peut aller des pointillés vers la ligne pleine mais pas dans l'autre sens.

Mais alors que fait-on si le modèle a de nouvelles données à faire afficher sur l'interface ? Et comment fait-on si la vue a besoin d'informer le contrôleur que l'utilisateur a touché l'écran ? Le modèle et la vue ont-ils le droit de s'addresser au contrôleur ?

![]() => (P1/P1C5_5.png)

La réponse est oui... mais pas n'importe comment ! Et nous allons voir tout au long de ce cours et des suivants quels sont les moyens qu'ont le modèle et la vue de s'addresser au contrôleur.

#### Mettre en place le MVC dans notre projet

C'était pas mal de théorie mais cela était nécessaire parce que le MVC est vraiment central en iOS. Mais maintenant place à la pratique ! Nous allons finir de préparer notre application en structurant nos fichiers.

Nous allons créer trois groupes : `Model`, `View` et `Controller`.

> **:information_source:** Rappel : pour créer un groupe, il vous de faire un clic droit dans le navigateur de fichiers et de choisir l'option *New Group* :  
![]() => (P1/P1C5_6.png)

Remplissons maintenant nos groupes :
- Le *Model* ne contient rien pour le moment. Nous le remplirons dès le prochain chapitre.
- Le *Controller* contient le fichier `ViewController.swift` que nous a déjà fourni Xcode.
- La *View*, c'est ce qu'on voit, donc on y place le fichier `Main.storyboard` dans lequel nous allons construire notre interface.

> **:information_source:** Pour faire propre, vous pouvez mettre tout le reste dans un dossier *Supporting Files* pour indiquer que ce ne sont que des fichiers de support qu'on ne veut pas garder au premier plan.

Une fois tout cela effectué, votre architecture de dossier doit ressembler à ceci :

![]() => (P1/P1C5_7.png)

#### Le plan de ce cours
Notre application est fin prête et nous allons pouvoir nous attaquer au coeur de celle-ci dans de bonnes conditions.

Un des avantages du modèle MVC, c'est que l'on peut travailler sur chaque partie indépendamment des autres. Et c'est ce que nous allons faire dans la suite de ce cours en suivant le plan :
- Partie 2 : Modèle  
- Partie 3 : Vue  
- Partie 4 : Contrôleur

#### En résumé
- Le patron de conception MVC signifie Modèle Vue Contrôleur. Il permet de diviser son programme en trois parties indépendantes :
	- Le **modèle** : la logique de l'application.
	- Le **contrôleur** : interprète et formate les informations du modèle pour les passer à vue.
	- La **vue** : l'interface de l'application.
- **Le modèle et la vue ne peuvent JAMAIS communiquer.**

## Développez  le modèle de l’application

### Structurez les questions
Dans cette partie, nous allons développer le modèle de notre application. Le modèle c'est la logique de l'application, son cerveau. C'est aussi ici que nous allons faire appel à des ressources en base de données ou sur internet.

Allons-y !

#### Diagramme de classe
Avant de nous lancer tête baissée dans le code, prenons une minute pour dessiner notre **diagramme de classes**.

Nous allons faire un jeu de quizz. Chaque partie contient 10 questions auxquels on peut répondre par vrai ou faux. Donc, sans plus de détour, on peut rationnellement imaginer 2 classes : une classe `Question` et une classe `Game` qui va gérer la partie.

Commençons avec la classe la plus simple : `Question`. Vous allez créer un nouveau fichier `Question.swift` que vous allez placer dans le modèle. Pour cela, vous pouvez aller dans *File > New > File...*

> **:information_source:** Vous pouvez aussi utiliser le raccourci clavier <kbd>cmd + N</kbd>.

Choisissez ensuite l'option *Swift File* et cliquez sur *Next* :

![]() => (P2/P2C1_1.png)

Puis donner le nom `Question.swift` à votre fichier et sauvegardez le dans le modèle.

![]() => (P2/P2C1_2.png)

Et vous voilà avec le fichier `Question.swift` !

À vous de jouer maintenant créer la classe `Question` avec pour propriété `title` de type `String` et `isCorrect` de type `Bool`.

```swift
// Faîtes le sans regarder la correction !
















class Question {
    var title = ""
    var isCorrect = false
}
```

Vous aviez trouvé ? Bravo !

Nous avons maintenant notre classe `Question`. Mais en fait, nous n'allons pas faire de classe `Question`, nous allons créer une structure `Question` ! :O

#### Vous avez dit structure ?
En Swift, il existe des modèles de données nommés. Ces modèles ont en commun de nous permettre d'organiser nos données en créant des types. Il y en a 3 :
- les classes
- les énumérations
- les structures

Vous connaissez les deux premiers (enseignés dans [ce cours](https://openclassrooms.com/courses/approfondissez-swift-avec-la-programmation-orientee-objet)) et dans ce chapitre, nous allons étudier le dernier !

Une structure ressemble à 90% à une classe. Les différences sont donc assez subtiles, mais suffisantes pour qu'on s'y intéresse.

Pour créer une structure, on utilise le mot-clé `struct`. Vous pouvez donc remplacer dans votre code le mot-clé `class` par le mot-clé `struct` et obtenir ceci :
```swift
struct Question {
    var title = ""
    var isCorrect = false
}
```
Et comme vous pouvez le constater, nous n'avons pas d'erreur ! Je vous l'avais dit, les structures sont très proches des classes.

Dans une structure, comme dans une classe, vous pouvez :
- **Déclarer des propriétés**, qu'elles soient calculées ou non, de classe ou d'instance. Tout ce que vous savez sur les propriétés dans les classes est vrai pour les structures.
- **Déclarer des méthodes** : Idem, tout ce que vous savez sur les méthodes dans les classes est vrai pour les structures.
- **Déclarer des initialiseurs** : La plupart de ce que vous savez déjà est vrai pour les structures, mais il y a des petites subtilités que nous verrons.

Alors quelles sont les différences ? Il y en a 2 majeures :
- **L'héritage n'existe pas avec les structures**. Une structure ne peut pas avoir de structure fille ou mère.
- **Les structures sont des types par valeur tandis que les classes sont des types par référence.**

#### Type par référence et type par valeur
> **:question:** Ouh là, tu viens de dire deux trucs compliqués en même temps ! Tu t'expliques ?

Bien sûr, ça vaut une petite (grosse... ;)) explication :

- **Type par référence** : lorsqu'on initialise une instance de classe, on déclare à la mémoire de notre ordinateur : "*Trouve-moi un endroit où je vais pouvoir stocker un objet*". L'ordinateur s'exécute et renvoie une adresse en mémoire où l'instance va pouvoir stocker des informations. Donc quand on écrit : `var instance = MaClasse()`, la variable `instance` ne contient pas un objet, mais seulement une adresse en mémoire (une *référence*) à laquelle se trouve l'objet.
- **Type par valeur** : lorsqu'on initialise une instance de structure, on déclare à la mémoire de notre ordinateur : "*Sauvegarde les valeurs X et Y*". Donc quand on écrit `var instance = MaStructure()`, l'instance contient directement toutes les *valeurs* stockées dans l'objet.

Pour bien comprendre tout cela, je vous propose de voir ensemble deux conséquences concrètes de cette différence. Ouvrez un nouveau Playground et copiez le code suivant :

```swift
class RectangleClass {
    var hauteur = 0
    var largeur = 0

    init(largeur: Int, hauteur: Int) {
        self.largeur = largeur
        self.hauteur = hauteur
    }
}

struct RectangleStruct {
    var hauteur = 0
    var largeur = 0

    init(largeur: Int, hauteur: Int) {
        self.largeur = largeur
        self.hauteur = hauteur
    }
}
```

Dans ce code, vous avez une classe `RectangleClass` et une structure `RectangleStruct` qui ont rigoureusement le même contenu.

##### Assigner une instance à une autre
Créons une instance de `RectangleStruct` :
```swift
var s1 = RectangleStruct(largeur: 10, hauteur: 5)
```
Maintenant, je crée une deuxième variable `s2`, je lui affecte la valeur `s1` et je modifie sa propriété hauteur :
```swift
var s2 = s1
s2.hauteur = 8
```

Si j'affiche les hauteurs de s1 et s2, j'obtiens bien ceci :
```swift
s1.hauteur // 5
s2.hauteur // 8
```

Tout paraît normal. Les choses deviennent intéressantes si je fais la même chose avec la classe :
```swift
var c1 = RectangleClass(largeur: 10, hauteur: 5)
var c2 = c1
c2.hauteur = 8
```

Et si je compare les hauteurs :
```swift
c1.hauteur // 8
c2.hauteur // 8
```

Les deux hauteurs ont la même valeur ! Donc quand j'ai modifié ma référence à la deuxième instance, la première a été modifiée également. C'est toute la différence entre le type par référence et le type par valeur.

Avec la structure, quand j'écris `var s2 = s1`, le programme **copie toutes les valeurs** de `s1` et les mets dans un nouvel objet qui est affecté à `s2`. Donc `s1` et `s2` représentent des objets différents. Donc quand `s2` modifie ses propriétés, `s1` n’est pas affecté.  

![]() => (P2/P2C1_3.png)

Avec la classe, quand j'écris `var c2 = c1`, le programme copie **l'adresse** de `c2`et la passe à `c1`. Donc `c1` et `c2` font *référence* au même objet. Donc quand c2 modifie ses propriétés, c1 subit les mêmes modifications.

![]() => (P2/P2C1_4.png)

##### La mutabilité
Faisons une deuxième expérience, déclarez une instance constante de notre classe et essayez de modifier ses propriétés.
```swift
let c = RectangleClass(largeur: 10, hauteur: 5)
c.hauteur = 12 // Pas de souci
```

Faisons la même chose avec la structure :
```swift
let s = RectangleStruct(largeur: 10, hauteur: 5)
s.hauteur = 12 // Erreur !
```

Cette fois, ça ne marche pas ! **Une instance d'une structure déclarée avec let a ses propriétés constantes**. Tout est constant et plus rien ne peut être modifié. Car les structures représentent directement leurs valeurs, donc si la structure est constante, toutes les valeurs contenues le sont aussi.

En revanche, une instance de classe est associée à une adresse donc si l'instance est constante, cela veut dire que **l'adresse seulement est constante**. On ne peut pas lui attribuer une nouvelle adresse, c'est-à-dire lui affecter un nouvel objet. Mais on peut modifier ses propriétés !

![]() => (P2/P2C1_5.png)

#### Différences pratiques
Les deux grandes différences entre les classes et les structures sont donc :
- les structures n'ont pas d'héritage
- les structures sont un type par valeur et les classes un type par référence

Hormis ces deux grandes différences, il existe quelques différences pratiques et je vais vous en citer deux principales :

##### 1. L'initialisation par défaut
Si on reprend notre structure `RectangleStruct`, on peut lui enlever ses valeurs par défaut et son initialisation et contrairement à la classe, cela ne déclenchera pas d'erreur :

```swift
struct RectangleStruct {
    var hauteur: Int
    var largeur: Int
}
```

La raison, c'est que les structures ont une petite fonctionnalité bien pratique. Elles sont équipées automatiquement d'un **initialiseur par défaut qui prend en paramètre ses propriétés stockées**. Autrement dit, sans avoir déclaré un initialiseur, je peux écrire :
```swift
var s = RectangleStruct(hauteur: 12, largeur: 3)
```
Pratique, non ?

##### 2. Les fonctions mutantes
Une structure a comme vous l'avez vous un rapport direct avec ses valeurs. Et elle ne laisse pas n'importe qui les modifier ! Notamment si vous déclarer une méthode qui modifie une ou plusieurs propriétés de la structure, **vous devez rajouter le mot-clé `mutating` pour signifier à la structure que cette fonction risque de modifier certaines propriétés**. Par exemple :

```swift
mutating func doublerLaTaille() {
		hauteur *= 2
		largeur *= 2
}
```

> **:information_source:** Ne vous faites pas de souci, si vous l'oubliez, une erreur vous le rappellera sans tarder !

#### Utilisation
C'est le moment de la grande question : quand dois-je utiliser une structure plutôt qu'une classe ? Je vous propose une réponse simple :

> Si votre modèle de donnée sert principalement à **stocker des données** et qu'il effectue **peu de logique**, choisissez une structure.

Donc si vous n'avez pas ou très peu de méthodes, une structure fera sans doute mieux l'affaire. C'est la raison pour laquelle j'ai choisi une structure pour notre type `Question`.

> **:warning:** Apple recommande de plus en plus, l'utilisation des structures au lieu des classes. Donc, n'oubliez pas de suivre les suggestions d'utilisation les concernant !

Tous les types simples que vous connaissez : Int, Double, Float, String, Bool, Dictionnaire, Tableau sont des structures en Swift.

#### Exercice
Créez une structure sur codevolve  

#### En résumé
- Vous connaissez maintenant tous les modèles de données nommés de Swift : les classes, les structures et les énumérations. Bravo !
- Une structure ressemble beaucoup à une classe avec 2 différences fondamentales :
	- les structures n'ont **pas d'héritage**.
	- les structures sont un **type par valeur** et les classes un **type par référence**.
- Utiliser une structure lorsque vous cherchez principalement à stocker des données.

### Téléchargez les questions
Nous avons maintenant une structure `Question` et nous allons donc pouvoir créer notre classe `Game`. Contrairement à la structure `Question`, cette classe va contenir beaucoup de logique. C'est la raison pour laquelle, nous allons choisir une classe plutôt qu'une structure.

#### Exercice : Création d’une classe Game  
Et on commence très fort ce chapitre avec déjà un exercice ! En effet, vous savez très bien créer des classes, donc je vous propose de la créer sans moi dans cet exercice. Faites-le vraiment sinon vous risquez d'être perdus lorsqu'on devra utiliser notre classe `Game`.

[Exercice Codevolve]

Une fois l'exercice terminé, vous pouvez télécharger le fichier [Game.swift](https://s3-eu-west-1.amazonaws.com/static.oc-static.com/prod/courses/files/Parcours+DA+iOS/Cours+4+-+MVC/Game.swift) et le glisser dans votre modèle (c'est la même opération que ce qu'on a fait avec la police Balham).

> **:warning:** Le fichier est un tout petit peu différent que celui que vous avez créé dans l'exercice. La raison est simple, une fonction ne doit faire qu'une seule chose ! C'est un bon principe pour maintenir un code propre. Donc j'ai extrait quelques fonction privé pour simplifier la lecture du code. Je vous invite à y jeter un oeil.

#### QuestionManager
Notre quizz va charger ses questions depuis internet. Plus précisément, nous allons charger nos questions depuis la base de données de questions gratuites : [Open Triva Database](https://opentdb.com). Les requêtes réseau ne sont pas au programme de ce chapitre donc je l'ai fait pour vous. Vous pouvez donc télécharger le fichier : [QuestionManager.swift](https://s3-eu-west-1.amazonaws.com/static.oc-static.com/prod/courses/files/Parcours+DA+iOS/Cours+4+-+MVC/QuestionManager.swift). Vous pouvez ensuite glisser ce fichier dans votre modèle.

Ce fichier est un peu compliqué et nous n'allons pas rentrer dans le détail de ce qu'il fait. Sachez seulement qu'il récupère 10 questions dans la base de données, les formatte et les renvoie. Il le fait via la seule méthode publique  de cette classe qui a pour signature `get(completionHandler: @escaping ([Question]) -> ())`. Et c'est cette méthode que nous allons utiliser pour finaliser la méthode `refresh` de notre classe `Game`.

> **:question:** Doucement mon garçon. Tu veux vraiment qu'on utilise cette méthode ?

Oui, pourquoi ?

> **:question:** Tu as vu la tête du machin ?!!

Bon OK, ça peut paraître un peu impressionnant, mais rassurez-vous. À la fin de chapitre, cela n'aura plus de secret pour vous.

D'ailleurs vous en comprenez déjà une bonne partie. Nous avons une fonction qui s'appelle `get` et qui admet un paramètre `completionHandler`. Il nous reste à voir ensemble ce que veut dire : `@escaping ([Question]) -> ()`. Mettons le `@escaping` de côté pour le moment et intéressons-nous à `([Question]) -> ()`.

#### Le type fonction
Ceci : `([Question]) -> ()` est un type un peu particulier : le type fonction. Oui, **les fonctions ont un type**. De toute façon, tout a un type en Swift !

Le type fonction a une syntaxe un peu particulière. On écrit d'abord entre parenthèses, les types des paramètres puis une flèche puis le type de retour. Prenons quelques exemples de fonctions et tâchons de trouver leur type.

```swift
func double(a: Int) -> Int { (...) } // (Int) -> Int
func multiplie(a: Int, b: Int) -> Int { (...) } // (Int, Int) -> Int
func envoyer(message: String) -> Bool { (...) } // (String) -> Bool
func annuler() { (...) } // () -> ()
func annuler() { (...) } // () -> Void
func saluer(personne: String) // (String) -> ()
```
Ce n'est donc pas plus compliqué que ça ! Donc si on fait le travail inverse : le type `([Question]) -> ()` décrit une fonction qui prend en paramètre un tableau de questions et qui ne renvoie pas de valeur.

> **:warning:** Vous noterez que les paramètres sont toujours entre parenthèses tandis que la valeur de retour n'en a pas. Si la fonction n'a pas de valeur de retour ou pas de paramètre, on laisse des parenthèses vides (ou le mot-clé `Void` pour la valeur de retour).

Le type question est donc un type et par conséquent il peut être utilisé n'importe où : comme type d'une variable, comme paramètre ou valeur de retour d'une fonction, comme type d'un tableau etc. Je vous propose de jouer un peu avec dans le Playground. Copiez les 4 fonctions suivantes :
```swift
func ajouteDeux(x: Int) -> Int {
    return x + 2
}

func multiplieParTrois(x: Int) -> Int {
    return x * 3
}

func soustraitQuatre(x: Int) -> Int {
    return x - 4
}

func multiplieParDeux(x: Int) -> Int {
    return x * 2
}
```

Ces quatre fonctions sont du même type : `(Int) -> Int`. Donc on peut créer un tableau qui les regroupe toutes :
```swift
var mesFonctions = [ajouteDeux, multiplieParTrois, soustraitQuatre, multiplieParDeux]
```

Ce tableau est donc du type `[(Int) -> Int]`. Maintenant je peux, par exemple, faire une boucle for pour parcourir mon tableau :
```swift
var a = 2
for maFonction in mesFonctions {
    a = maFonction(a)
}
```
À chaque tour du tableau, c'est une fonction différente qui est utilisée et `a` vaut 16 à la fin.

#### Une autre façon de renvoyer une valeur de retour
Il y a une question que vous ne m'avez pas encore posée !

> **:question:** Pourquoi la fonction `get` de `QuestionManager` a une fonction en paramètre ?

Exactement ! Vous êtes impressionnant ;) !

Le rôle de la fonction `get` est juste de renvoyer un tableau de questions téléchargées sur internet.

> **:question:** Pourquoi elle ne ressemble pas juste à : `func get() -> [Question]` ?

Excellente question ! En fait, cette fonction est un peu particulière, car on ne sait pas quand la valeur de retour va arriver. Cela va dépendre de la qualité du réseau et du temps de réponse du serveur etc. Autrement dit, dès qu'on va chercher des ressources sur internet, on est obligé d'**attendre la réponse**. Or une fonction avec valeur de retour s'exécute instantanément et donc les questions n'ont pas le temps d'être chargées.

Du coup à la place, on donne à l'utilisateur de la méthode `get` la possibilité d'**exécuter une fonction lorsque le chargement des questions est terminé**. On passe alors en paramètre de cette fonction à exécuter les questions que nous venons de charger.

Donc nous allons créer une méthode dans notre classe `Game` que l'on va appeler `receiveQuestion` dont le rôle va être de gérer les questions reçues. Cette fonction va être du type `([Question]) -> ()` :

```swift
private func receiveQuestions(_ questions: [Question]) {
	self.questions = questions
	state = .ongoing
}
```

Lorsqu'on reçoit les questions, on fait donc deux choses :
1. Affecter les questions à la propriété `questions` de `Game`.
2. Passer la propriété `state` de `Game` à la valeur `ongoing`. Les questions sont chargées, la partie peut reprendre.

Maintenant nous allons pouvoir passer cette nouvelle fonction en paramètre de la fonction `get`. Et nous allons faire cela dans notre méthode `refresh`.

> **:information_source:** Pour appeler la fonction `get`, il faut passer par la propriété de classe `shared` de `QuestionManager`, on appelle cela le *pattern singleton*. C'est une technique que nous verrons dans un prochain cours.

```swift
func refresh() {
	score = 0
	currentIndex = 0
	state = .over

	QuestionManager.shared.get(completionHandler: receiveQuestions)
}
```

Ici, on appelle donc la méthode `get` du `QuestionManager` et on lui passe en paramètre la méthode `receiveQuestions`. Cela signifie que lorsque les questions sont chargées, la méthode `receiveQuestions` est appelée.

> **:information_source:** Si vous voulez tester l'exécution de cette méthode, vous pouvez utiliser le fichier `AppDelegate.swift`. Ce fichier contient la méthode `application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool`. Cette fonction est appelée au lancement de l'application. Vous pouvez donc tester du code dans cette méthode en lançant l'application. Par exemple, vous pouvez écrire :  
```swift
let game = Game()
game.refresh()
```  
Ensuite, en ajoutant un `print(questions)` dans la méthode `receiveQuestions`, vous pouvez vérifier que tout fonctionne bien en lançant l'application.

Vous voyez ? Nous avons réussi à utiliser cette méthode `get`. Ce n'était pas si dur finalement ! Notre méthode `refresh` est maintenant complète et permet de remettre à zéro les paramètres de la partie, de charger les questions et de relancer la partie.

#### Exercice

##### 1/ Trouvez les types des fonctions suivantes

```swift
func ajouterDeux(a: Int) -> Int { (...) }
func additioner(a: Int, b: Int) -> Int { (...) }
func envoyerMail(message: String, destinataire: String) -> Bool { (...) }
func cocherLaCase(aCoché: Bool) { (...) }
func verrouiller() { (...) }
func composerNumero(_ numero: Int) { (...) }
```

Vous pouvez trouver la correction [ici](https://s3-eu-west-1.amazonaws.com/static.oc-static.com/prod/courses/files/Parcours+DA+iOS/Cours+4+-+MVC/TrouvezLesTypes.txt).

##### 2/ Utiliser les types fonctions
Dans cet exercice, on cherche à calculer la somme d'un tableau d'entier selon les règles suivantes :
- si le nombre est pair, on le divise par deux avant de l'aditionner aux autres
- si le nombre est impair, on ajoute un puis on le divise par deux avant de l'additioner aux autres

Le code suivant vous est déjà fourni :

```swift
func diviserNombrePairParDeux(x: Int) -> Int {
    return x / 2
}

func diviserNombreImpairParDeux(x: Int) -> Int {
    return (x + 1) / 2
}

func obtenirDivision(x: Int) -> (Int) -> (Int) {
	// complétez cette fonction
}

let tableau = [2, 12, 3, 14, 76, 19, 7, 22]
var somme = 0

for nombre in tableau {
	// complétez cette boucle
}
```

Vous devez compléter la fonction `obtenirDivision`. Cette fonction renvoie une des deux fonctions au dessus en fonction de la parité de son paramètre `x`. Vous noterez que le type de retour de cette fonction corresponds bien au type des deux fonctions du dessus. Ensuite, vous devez utiliser la fonction `obtenirDivision` pour compléter la boucle.

Une fois l'exercice terminé, vous pouvez aller lire la correction [ici](https://s3-eu-west-1.amazonaws.com/static.oc-static.com/prod/courses/files/Parcours+DA+iOS/Cours+4+-+MVC/DivisionPairImpair.swift).

#### En résumé
- Les fonctions sont des types, on appelle cela le **type fonction**.
- Le type fonction a pour syntaxe : `(TypeParam1, TypeParam1, TypeParam1) -> TypeRetour`.
- On peut utiliser les types fonction pour passer des fonctions en paramètre d'autres fonctions notamment.

### Améliorez le chargement avec les fermetures
Dans ce chapitre, nous allons améliorer notre méthode `refresh` du chapitre précédent. Et nous allons faire cela avec les fermetures !

**Une fermeture** (en anglais *closures*) en Swift **permet d'utiliser une fonction sans l'avoir déclaré avant**. Une fermeture, c'est du coup une fonction qui n'a pas de nom. Nous allons essayer de remplacer notre fonction `receiveQuestions` par une fermeture.

#### Syntaxe
Les fermetures ont une syntaxe un peu particulière. L'animation suivante vous montre la différence de syntaxe entre une fermeture et une fonction.

![]() => (P2/P2C3_1.gif)

Une fermeture **commence par une accolade**. Ensuite on lui passe les paramètres et les valeurs de retour comme une fonction normale. Ensuite on ajoute le mot clé `in`. Et ensuite vient le corps de la fermeture terminé par une accolade.

Essayons donc de remplacer notre fonction `receiveQuestions` par une fermeture :

```swift
QuestionManager.shared.get(completionHandler: { (questions: [Question]) -> () in

})
```

L'avantage des fermetures, c'est qu'il existe plusieurs façons d'en simplifier l'écriture. Tout d'abord comme pour une fonction, quand la fermeture n'a pas de valeur de retour, on peut l'omettre.

```swift
QuestionManager.shared.get(completionHandler: { (questions: [Question]) in

})
```

Ensuite, comme le paramètre `completionHandler` est de type `([Question]) -> ()`, Swift est capable de déduire que le type de notre paramètre `questions` est `[Question]` donc nous n'avons pas besoin de le préciser.

```swift
QuestionManager.shared.get(completionHandler: { (questions) in

})
```

Ensuite, les fonctions qui terminent par une fermeture admettent une syntaxe simplifiée. On peut omettre le paramètre `completionHandler` et écrire la fermeture en dehors des parenthèses :

```swift
QuestionManager.shared.get() { (questions) in

}
```

Enfin, comme cette fonction n'admet pas d'autre paramètre que la fermeture, on peut même supprimer les parenthèses.

```swift
QuestionManager.shared.get { (questions) in

}
```
Élégant, vous ne trouvez pas ? Swift, c'est beau...

Maintenant, nous pouvons rajouter le corps de la fonction :

```swift
QuestionManager.shared.get { (questions) in
	self.questions = questions
	self.state = .ongoing
}
```

> **:warning:** Vous noterez que j'utilise le mot-clé `self` systématiquement. Dans une fermeture, on perd le contexte dans lequel on était. On doit donc toujours le lui rappeler en passant le mot-clé `self` à chaque fois que l'on veut utiliser une méthode ou une propriété de la classe dans laquelle on se trouve.

#### Utilisation
Maintenant que vous savez utiliser les fermetures, voyons dans quel cas vous allez en avoir besoin :
- Lorsque vous allez chercher des ressources sur le réseau comme dans notre cas, les fermetures sont très pratiques pour attendre la fin du chargement des données.
- Plus généralement, lorsque nous avons besoin de laisser l'opportunité à quelqu'un d'effectuer une action à un moment précis, mais nous ignorons laquelle.

Dans ce cours, nous verrons un autre exemple de l'utilisation des fermetures lorsque nous créerons nos animations.

#### Exercice

Transformez les déclarations de fonctions suivantes en fermetures :

```swift
func ajouterDeux(a: Int) -> Int { (...) }
func additioner(a: Int, b: Int) -> Int { (...) }
func envoyerMail(message: String, destinataire: String) -> Bool { (...) }
func cocherLaCase(aCoché: Bool) { (...) }
func verrouiller() { (...) }
func composerNumero(_ numero: Int) { (...) }
```

Vous pouvez trouver la correction [ici](https://s3-eu-west-1.amazonaws.com/static.oc-static.com/prod/courses/files/Parcours+DA+iOS/Cours+4+-+MVC/ExerciceFermetures.txt).


#### En résumé
- Une fermeture permet de créer une fonction sans la déclarer.
- Une fermeture a la syntaxe suivante :
```swift
{ (param1: Type1, param2: Type2) -> TypeRetour in
	// Corps de la fermeture
}
```

### Envoyez les questions au contrôleur
Nous avons maintenant une belle classe `Game` qui va gérer toute la logique de notre jeu. Notre contrôleur va pouvoir utiliser les deux méthodes publiques que nous avons définies :
- `answerQuestion` : quand l'utilisateur répond à une question.
- `refresh` : quand l'utilisateur appuie sur le bouton *New Game*.

Dans le premier cas, notre modèle renvoie le score mis à jour à partir de la réponse à la question. Mais dans le deuxième cas, on doit attendre le chargement des questions. Alors comment le modèle va-t-il pouvoir prévenir le contrôleur que les questions sont chargées et que la partie peut débuter ? C'est ce que nous allons voir dans ce chapitre !

> **:warning:** Dans ce chapitre, nous allons voir que les **notifications** permettent au modèle de renvoyer une information au contrôleur mais ce n'est pas le seul moyen. On pourrait le faire aussi avec une **fermeture** par exemple.

#### Les notifications dans le MVC
Nous avons vu dans le chapitre sur le MVC que le **modèle ne pouvait pas s'adresser directement au contrôleur**. Il ne doit même pas savoir que le contrôleur existe.

![]() => (P2/P2C4_1.png)

Seulement, nous avons besoin ici de lui dire que les questions ont été chargées pour qu'il puisse lancer la nouvelle partie à l'écran. Et pour cela nous allons utiliser une technique de communication aveugle : les **notifications**.

> **:warning:** Le mot `notification` en iOS signifie deux choses différentes, ce qui n'est pas très pratique. Alors, mettons les choses au clair :  
- Il y a les notifications utilisateurs qui s'affichent sous la forme d'un message sur l'écran verrouillé de l'iPhone. Elles peuvent être accompagnées d'un son et d'une pastille rouge sur l'icône de l'application. Vous les voyez quand vous recevez un texto par exemple.
- Les notifications dans le modèle MVC et c'est cela dont nous allons parler ici.

Les notifications fonctionnent **comme une radio**. N'importe quel objet peut décider de devenir émetteur et n'importe qui peut décider de devenir récepteur. Comme à la radio, un animateur ne peut pas savoir qui sont les personnes qui suivent son émission. Et de la même façon, les recepteurs ne savent pas où se trouve l'émetteur et qui il est. C'est la raison pour laquelle on appelle cela une technique de **communication aveugle**. On ne sait pas qui parle et qui écoute.

Dans notre cas, c'est donc le modèle qui va émettre pour déclarer : "Les questions sont chargées" et le contrôleur qui va écouter. Comme la communication est aveugle, le modèle peut s'adresser au contrôleur sans même savoir que le contrôleur existe.

![]() => (P2/P2C4_2.png)

#### Implémenter les notifications

Nous allons donc envoyer notre notification dans la méthode `refresh` une fois que les questions sont chargées. Pour envoyer une notification en iOS, il faut utiliser trois types du framework *Foundation* : `Notification.Name`, `Notification` et `NotificationCenter`. Si `Notification` est une emission de radio, `Notification.Name` c'est son nom ou sa fréquence et `NotificationCenter` c'est le poste de radio. C'est le `NotificationCenter` qui a le rôle d'envoyer et de recevoir des notifications.

Commençons par créer le nom de notre notification. **Tous ceux qui veulent écouter ma radio devront utiliser le même nom** :
```swift
let name = Notification.Name(rawValue: "QuestionsLoaded")
```
`Notification.Name` est une structure. On utilise son initialisation avec le paramètre `rawValue`.

> **:information_source:** En Swift, les types peuvent être déclarés à l'intérieur d'un autre. C'est ce qu'on a fait dans notre classe `Game` avec l'énumération `State`. Dans le cas des notifications, cela ressemble à ceci :
```swift
class Notification {
	struct Name {
	}
}
```

Ensuite nous allons créer la notification en lui passant la variable `name` lors de son initialisation.
```swift
let notification = Notification(name: name)
```

Il ne nous reste plus qu'à envoyer la notification avec le `NotificationCenter` :
```swift
NotificationCenter.default.post(notification)
```

Le `NotificationCenter` c'est le poste de gestion des notifications. Le poste principale s'appelle `default`.

> **:information_source:** Vous pouvez créer votre propre `NotificationCenter`, mais en pratique vous utiliserez quasiment toujours `default`.

On utilise ensuite la méthode `post` qui prend en paramètre la notification que nous venons de créer. À la fin, notre méthode refresh ressemble à ceci :

```swift
func refresh() {
  score = 0
  currentIndex = 0
  state = .over

  QuestionManager.shared.get { (questions) in
    self.questions = questions
    self.state = .ongoing
    let name = Notification.Name(rawValue: "QuestionsLoaded")
    let notification = Notification(name: name)
    NotificationCenter.default.post(notification)
  }
}
```

Et voilà la notification est partie !

> **:information_source:** Il existe une autre version de la méthode `post` qui prend en paramètre le nom directement. Cela nous permet d'écrire tout cela en une (grande) ligne. C'est pratique, mais un peu moins lisible :
```swift
NotificationCenter.default.post(name: NSNotification.Name(rawValue: "QuestionsReceived"), object: nil)
```
Le paramètre `object` permet d'envoyer des données avec la notification.

Il nous reste à mettre en place le récepteur côté contrôleur. Et nous ferons cela dans la dernière partie de ce cours dédiée au contrôleur !

#### En résumé
- **Le modèle ne peut pas communiquer directement avec le contrôleur** puisqu'il ne doit même pas savoir qu'il existe. Lorsqu'on a vraiment besoin que le modèle envoie une information au contrôleur, on utilise une notification.
- Les notifications forment un mode de **communication aveugle**, car l'émetteur ne connaît pas le récepteur et inversement.
- Les notifications **doivent avoir un nom**. Ce nom permet de l'identifier et permet du coup aux récepteurs d'écouter la communication.
- On envoie une notification comme ceci :
```swift
let name = Notification.Name(rawValue: "LeNomDeMaNotification")
let notification = Notification(name: name)
NotificationCenter.default.post(notification)
```

## Concevez votre interface

### Découvrez UIView
Notre modèle est désormais tout beau tout propre ! Mais notre application semble toujours vierge lorsqu'on la lance ! Rassurez-vous, dans cette partie, nous allons nous occuper de la vue !

![]() => (P3/P3C1_1.png)

Pour la remplir, il nous faut savoir quoi mettre de dedans. Et dedans, nous allons mettre exclusivement des `UIView` ! Vous ne savez pas que c'est ? Vous ne pourrez plus le dire à la fin de chapitre !

#### Qu'est-ce que UIView ?
`UIView`, c'est la classe qui permet de définir une **vue**.

> **:question:** Et une vue, c'est quoi ?

Une vue, c'est une **zone rectangulaire** qui a deux missions :
- **Afficher des choses**
- **Répondre à des gestes**

Donc comme vous pouvez le constater, c'est très générique ! Ça n'a pas l'air bien puissant comme ça. Mais sachez que **tout ce que vous voyez** à l'écran dans n'importe quel page de n'importe qu'elle application iOS **est une instance d'`UIView`**.

> **:question:** Mais les boutons, les images ce sont des UIView `aussi` ?

Eh oui ! Et ce, grâce à l'héritage. Prenons l'exemple d'un bouton. Les boutons en iOS sont définis avec une classe qui s'appelle `UIButton`. Cette classe comme toute celle que je vais vous présenter dans le prochain chapitre **hérite** de `UIView`. Donc elles disposent toutes de la logique présentent dans `UIView`, notamment le placement, l'affichage et la réponse aux gestes. Donc un indirectement, un bouton c'est une `UIView`.

#### La hiérarchie des vues
Comme les dossiers sur votre ordinateur, les vues ont une **hiérarchie** (on parle en anglais de *view hierarchy*). Cela veut dire qu'une vue, c'est comme un dossier. Elle peut contenir d'autres vues et elle peut-elle même être contenue dans une vue parente.

##### Exemple
Le meilleur moyen de bien comprendre ça, c'est d'essayer ! Ouvrez votre fichier `Main.storyboard`. Nous allons jouer un peu avec *interface builder*. Dans la bibliothèque des composants, choisissez l'objet `UIView` et glissez en quelques-uns dans votre interface.

> **:information_source:** Vous pouvez filtrer en tapant `UIView` dans le champ de texte en bas de la bibliothèque des composants.

De mon côté, j'ai composé mon interface comme ceci :

![]() => (P3/P3C1_2.png)

J'ai plusieurs vues qui sont les unes à côté des autres ou **les unes dans les autres**. Sur la gauche, vous pouvez voir la hiérarchie des vues. Je vous la montre ici également :

![]() => (P3/P3C1_3.png)

On a donc une vue principale qui a 4 sous vues :
- La vue verte n'a pas de sous-vue
- La vue rouge a 2 sous-vues blanches
- La vue bleu clair a une sous-vue blanche
- La vue bleu foncé a une sous-vue grise qui a elle-même une sous-vue blanche

En glissant les vues les unes dans les autres, vous créez votre hiérarchie. Pour des interfaces complexes qui peuvent compter une vingtaine de vues différentes, il est important de bien organiser votre hiérarchie pour vous y retrouver !

##### La vue principale
Vous avez noté dans l'exemple précédent que notre interface contenait déjà une vue : le grand rectangle blanc vertical.

En iOS, une page d'une application correspond (presque) toujours à un `UIViewController`. Cette classe (que nous verrons en détail dans la prochaine partie) a une propriété `var view: UIView` qui constitue la vue principale de votre interface. Cela veut dire que **toutes les vues que vous allez rajouter sont des descendantes de la vue principale de votre contrôleur**. Elles sont toutes contenues dedans. C'est la racine de votre hiérarchie de vues.

##### Et le code ?
La plupart du temps, vous créerez vos vues directement avec *Interface Builder*. Mais il peut arriver que vous souhaitiez manipuler la hiérarchie de vos vues dans le code. Pour cela, la classe `UIView` a deux propriétés et deux méthodes à connaitre :

```swift
// Propriétés
var superview: UIView
var subviews: [UIView]

// Méthodes
func addSubview(_ view: UIView)
func removeFromSuperview()
```

La propriété `superview` permet d'accéder à la vue parente. Et la propriété `subviews` permet d'accéder au tableau des sous-vues.

> **:warning:** L'ordre dans le tableau `subviews` a une importance. Les vues à la fin de tableau seront visuellement au-dessus des vues du début du tableau. (C'est l'équivalent du `z-index` si vous connaissez le CSS.)

Prenons un exemple pour les méthodes, mettons que j'ai une vue `myView` et un bouton `myButton`. Si je veux que le bouton soit inclus dans la vue, je fais ceci :
```swift
myView.addSubview(myButton)
```

Ensuite, si je souhaite retirer le bouton de la hiérarchie, j'écris :
```swift
myButton.removeFromSuperview()
```

Et le bouton ne sera plus visible à l'écran.

Pour votre information, je vous mentionne ici quelques autres méthodes qui pourront vous être utiles pour gérer la hiérarchie de vos vues :

```swift
func insertSubview(_ view: UIView, belowSubview siblingSubview: UIView)
func insertSubview(_ view: UIView, aboveSubview siblingSubview: UIView)
func bringSubview(toFront view: UIView)
func sendSubview(toBack view: UIView)
```
> **:warning:** Dans toute cette section sur la hiérarchie, ne faites pas la confusion avec l'héritage ! Ici, il s'agit juste de savoir **quelle vue est incluse dans quelle vue** et non qui hérite de qui.

#### En résumé
- Une `UIView` est une **zone rectangulaire** qui permet d'afficher des choses et de répondre à des gestes.
- Tous les composants d'une interface héritent de la classe `UIView`.
- Les vues dans une interface sont organisées selon une hiérarchie comme des dossiers. En particulier une vue peut avoir une vue parente et des sous-vues. Dans le code, on manipule la hiérarchie avec les propriétés et méthodes de UIView suivantes :
```swift
var superview: UIView
var subviews: [UIView]
func addSubview(_ view: UIView)
func removeFromSuperview()
```

### Placez vos vues

Maintenant que nous avons vu comment organiser nos vues, nous allons voir comment les placer. Et pour placer des éléments à l'écran, un peu comme lorsqu'on joue aux échecs ou à la bataille navale, il faut un **système de coordonnées**.

#### Position et taille
Une vue, c'est une zone rectangulaire. Donc pour décrire l'espace qu'elle occupe, il va falloir lui indiquer 2 choses :
- sa position
- sa taille

> **:information_source:** J'ai créé pour vous une application qui va vous permettre de jouer un peu avec le système de coordonnées. Je vous invite à [télécharger le code](https://github.com/AmbroiseCollon/UIView-Coordinate-System) et à lancer l'application sur votre simulateur ou iPhone.

###### La position
Une position sur un écran, ça nécessite deux valeurs :
- x : représente la position **horizontale**
- y : représenta la position **verticale**

L'origine se situe en haut à gauche. Donc cela veut dire que :
- x augmente quand on va **vers la droite**
- y augmente quand **on descend**

![]() => (P3/P3C2_1.png)

Il faut savoir que quand on parle de la position d'une vue, on parle de **la position de son point supérieur gauche**.

![]() => (P3/P3C2_2.png)

> **:information_source:** Sur l'application que vous avez téléchargée, vous pouvez déplacer le rectangle bleu et voir évoluer les valeurs `x` et `y`.

###### La taille
Pour décrire la taille d'une vue, comme c'est une zone rectangulaire, on a à nouveau deux valeurs :
- la **largeur** (en anglais *width*)
- la **hauteur** (en anglais *height*)

![]() => (P3/P3C2_3.png)

#### Frame et bounds
En tout, il faut donc 4 valeurs pour décrire précisément l'espace qu'occupe une vue :
- x
- y
- largeur
- hauteur

Ces quatre informations sont disponibles dans une propriété de `UIView` qui s'appelle `frame`. Cette propriété décrit donc **l'espace occupé par une vue par rapport à la vue parente**.

Donc les valeurs `x` et `y` indiquent **la position par rapport au coin supérieur gauche de la vue parente** et donc pas forcément par rapport au coin supérieur gauche de l'écran. C'est le cas dans l'application que vous avez téléchargée.

`UIView` a une seconde propriété : `bounds`. Cette propriété contient 4 informations aussi : x, y, largeur et hauteur. Mais elle décrit **l'espace occupé par la vue par rapport à elle-même**. Cela signifie que `x` et `y` vaudront toujours `0` pour cette propriété.

On utilise `frame` lorsqu'on s'intéresse au placement de **soi-même dans la vue parente**.
On utilise `bounds` lorsqu'on s'intéresse au placement de **ses sous-vues**.

Aussi, les propriétés `frame` et `bounds` n'ont pas forcément la même taille. Vous pouvez essayer de faire tourner le rectangle dans l'app téléchargée et vous verrez que lors de la rotation la taille décrite par `bounds` ne change pas. Mais `frame` doit grandir pour trouver le plus petit rectangle qui contient la vue.

![]() => (P3/P3C2_4.png)

> **:information_source:** En pratique, vos vues seront rarement en rotation. Mais cela doit vous rappeler de ne pas confondre `bounds` et `frame`, le premier regarde à l'intérieur, l'autre à l'extérieur.

#### Les structures de données
Les coordonnées en iOS s'appuient sur 4 types différents : `CGFloat`, `CGPoint`, `CGSize`, `CGRect`.

> **:information_source:** Le préfixe CG veut dire *Core Graphics*.

`CGFloat` est un type qui a été introduit pour gérer aussi bien les appareils 32 bits et 64 bits. En pratique, tout ce que vous avez besoin de savoir c'est qu'il décrit un **nombre décimal** et que c'est ce type et non `Float` ou `Double` que vous devez utiliser lorsque vous travaillez sur le placement d'une vue.

Vous pouvez convertir un `Double` ou un `Float` en `CGFloat` comme ceci :
```swift
var unDouble = 100.0
var unCGFloat = CGFloat(unDouble)
```

CGPoint est une structure qui a deux propriétés `x` et `y`. Elle décrit donc un point.
```swift
var unPoint = CGPoint(x: 10.0, y: 123.0)
```

`CGSize` est une structure qui a également deux propriétés `width` et `height`. Elle décrit une taille :
```swift
var uneTaille = CGSize(width: 30.0, height: 120.0)
```

Enfin `CGRect` est aussi une structure qui a aussi deux propriétés `origin` et `size`. Elle décrit un rectangle :
```swift
var unRectangle : CGRect(origin: unPoint, size; uneTaille)
```

> **:information_source:** CGRect a un autre initialiseur assez pratique qui prend directement en paramètre les 4 informations nécessaires pour décrire un rectangle :
```swift
var unRectangle = CGRect(x: 12.0, y: 34.0, width: 120.0, height: 200.0)
```

Les propriétés `frame` et `bounds` sont du type `CGRect`.

#### En résumé
- Les vues se placent grâce au système de coordonnées et des 4 informations suivantes `x`, `y`, `width` et `height`. Les x augmentent vers la droite et les y augmentent vers le bas.
- Les vues ont une propriété `frame` qui permet de les placer par rapport à la vue parente. Elles ont aussi une propriété `bounds` qui permet de placer les sous-vues.
- Le système de coordonnées est utilisé avec les types `CGFloat`, `CGPoint`, `CGSize` et `CGRect`.

### Organisez les composants de l’interface  
Vous possédez maintenant toutes les connaissances pour que l'on remplisse notre belle application ! C'est ce que nous allons faire dans ce chapitre !

#### Les composants principaux d'iOS
Apple fournit avec le framework *UIKit*, plusieurs composants qui sont prêts à l'emploi. Il y en a qui sont assez simples comme les boutons ou les images et d'autres qui sont plus évolués comme les sélecteurs de date.

> **:information_source:** Comme je suis sympa, je vous ai fait une petite application qui vous présente les principaux composants à votre disposition en iOS. Je vous invite fortement à la [télécharger](https://github.com/AmbroiseCollon/Discovering-UIKit-Components) et à jouer avec, c'est le meilleur moyen de les découvrir !

Vous apprendrez à utiliser la plupart d'entre eux par vous-même au fur et à mesure de votre besoin. Une fois qu'on en a utilisé un ou deux, c'est assez facile. Ici, je vais seulement vous les présenter pour que vous les connaissiez et ayiez le réflexe d'aller les utiliser le jour où vous en aurez besoin.

En plus de l'application, je vous ai résumé la liste des composants dans ce tableau :

![]() => (P3/P3C3_1.png)

#### Ajoutez un bouton et un indicateur d'activité
Nous allons maintenant créer notre interface ! Nous allons découvrir et utiliser ensemble cinq des principaux composants d'iOS : `UIView`, `UILabel`, `UIButton`, `UIActivityIndicator` et `UIImageView`.

Je vous propose de démarrer par simplement changer la couleur de fond de votre interface avec le bleu foncé de notre palette. Je vous laisse faire ça sans moi.

##### Le bouton
Maintenant nous allons rajouter un bouton. Depuis la bibliothèque des composants, faites glisser un bouton au milieu en bas de l'interface.

![]() => (P3/P3C3_1bis.png)

En double-cliquant dessus vous pouvez changer le titre de ce bouton. Et vous allez écrire `New Game`. C'est avec ce bouton que nous allons lancer une nouvelle partie.

> **:information_source:** L'interface de l'application est anglais, car la base de données de questions est anglaise. Et ce serait bizarre d'avoir des questions en anglais au milieu d'une interface française. Je suis désolé mais je n'ai pas trouvé de base de données gratuite de questions en français...

Je vous l'invite à redimensionner le bouton pour qu'il ait une taille confortable.

> **:information_source:** Apple suggère une taille minimum de 44 * 44 points pour un bouton. Afin que l'on puisse le taper facilement.

Ensuite dans l'**inspecteur d'attributs** sur la droite, vous avez **toutes les propriétés de `UIButton`** que vous pouvez modifier avec *Interface Builder*. Si vous défilez vers le bas, vous avez également toutes les propriétés de `UIView`, car `UIButton` hérite, comme on l'a vu, de `UIView`. Dans ces propriétés, je vous propose de passer `Text Color` en blanc. Nous allons également modifier la police avec la propriété `font`. Pour cela, suivez les étapes effectuées dans l'image ci-dessous :

![]() => (P3/P3C3_2.gif)

> **:information_source:** A retenir que lorsque vous souhaitez utiliser une police de votre choix, il faut choisir *custom*.

Maintenant nous allons changer la couleur de fond du bouton. Et pour cela, nous allons faire comme pour la couleur de fond de la vue principale, les deux sont des `UIView` et donc les deux ont une propriété *background* que vous trouverez en descendant dans l'inspecteur d'attribut. Cette fois-ci, je vous suggère de choisir le bleu clair. Votre bouton doit maintenant ressembler à ceci :

![]() => (P3/P3C3_3.png)

##### L'indicateur d'activité
L'indicateur d'activité (`UIActivityIndicator`) se présente sous la forme d'une roue qui tourne à l'infini. Cette roue permet d'indiquer à l'utilisateur qu'une action est en train de se dérouler. Dans notre cas, ce sera le chargement des questions pour une nouvelle partie. Vous pouvez retrouver ce composant dans le tableau au début de chapitre. Faites glisser un indicateur d'activité depuis la bibliothèque des composants vers l'interface. Vous allez le placer au centre du bouton.

Dans l'inspecteur d'attributs, vous trouvez en haut la propriété *style*. Cette propriété permet de choisir un style parmi plusieurs styles par défaut. Je vous suggère *Large White*. Dessous, une autre propriété nous intéresse : *Animating*. Cochez la case pour que notre roue soit animée.

> **:warning:** La roue ne s'animera pas sur le storyboard. Elle s'animera uniquement lorsque vous lancerez l'application.

Vos attributs de l'indicateur d'activité devraient ressembler à ceci :

![]() => (P3/P3C3_3bis.png)

Vous avez noté que l'indicateur d'activité et le bouton se superposent. Ce n'est pas très esthétique. La raison c'est que nous allons afficher l'un ou l'autre mais pas les deux en même temps. Donc en attendant de faire cela dans le contrôleur, je vous propose de cacher l'indicateur d'activité.

Pour cela, il suffit d'aller dans l'inspecteur d'attribut et de cocher la case *Hidden*.

![]() => (P3/P3C3_3ter.png)

Ainsi notre indicateur d'activité sera caché au lancement de l'application.

#### Ajouter un label
Nous allons maintenant afficher le score de la partie en cours. Une partie c'est 10 questions, donc le score aura pour format : *X / 10*.

Pour afficher du texte, nous allons utiliser `UILabel`. Vous pouvez glisser un composant `UILabel` depuis la bibliothèque des composants vers le centre de l'interface. En double-cliquant dessus, vous pouvez modifier le texte et écrire pour le moment "*0 / 10*". Nous allons changer la couleur du texte en blanc grâce à la propriété `color`. Vous pouvez également centrer le contenu de votre texte avec la propriété `alignment`.

Comme pour le bouton, nous allons changer la police avec la propriété *font*. Cette fois-ci, je vous invite à choisir à nouveau *Balham* et 30 pour la taille.

Le label est alors trop petit pour contenir le texte. Nous allons changer sa taille. Pour cela nous allons utiliser l'**inspecteur de taille** sur la droite. Vous l'ouvrez en cliquant en haut à droite sur l'icône en forme de règle.

![]() => (P3/P3C3_4.png)

Dedans, vous retrouvez les quatre propriétés nécessaires au placement d'une vue que nous avons vues dans le chapitre précédent `x`, `y`, `width` et `height`. Vous pouvez choisir :
- x : 37,5
- y : 273
- width : 300
- height : 60

Notre interface commence à ressembler à quelque chose ! :D

![]() => (P3/P3C3_5.png)

#### Ajouter la question
La question va être une vue un peu compliquée, car comme vous pouvez le voir ci-dessous, elle doit contenir un label et une image (l'icône verte ou rouge en bas):

![]() => (P3/P3C3_6.png)

Notre stratégie va être donc de créer d'abord une `UIView` simple **à l'intérieur de laquelle** nous allons rajouter un label et une image.

Commençons par rajouter une `UIView` (vous pouvez en retrouver l'icône dans le tableau plus haut). Elle va être carrée de longueur `245` et avec pour couleur de fond gris. Vous allez le placer au milieu, au-dessus du score. Je vous laisse le faire.

![]() => (P3/P3C3_7.png)

Ensuite vous allez glisser à l'intérieur un label. En vous aidant des guides bleus, vous allez l'agrandir pour qu'il prenne toute la place dans la vue grise en laissant pour chaque bord 8 points de marge. Ensuite, vous allez à nouveau changer ses propriétés et cette fois-ci je vous laisse faire :
- *police* : Balham, taille 23
- *couleur* : blanc
- *alignement* : centré

Vous allez également modifier la propriété `lines`. Cette propriété indique **le nombre maximum de lignes** que peut avoir le label. Ce label va contenir les questions et comme cela va changer souvent, on ne connait pas à l'avance le nombre de lignes nécessaires. L'astuce est de choisir `0`. Avec cette valeur, le label décidera automatiquement du nombre de lignes en fonction de la taille du texte. Votre label doit maintenant ressembler à ceci :

![]() => (P3/P3C3_8.png)

Il ne nous reste plus qu'à rajouter l'icône. Pour cela, vous avez deux options :
- soit vous glissez un **composant `UIImageView`** depuis la bibliothèque des **composants** vers l'interface
- soit vous glissez une **image** depuis la bibliothèque des **médias** vers l'interface

Les deux donnent un résultat équivalent : cela rajoute une `UIImageView` sur l'interface. L'avantage de la 2e option, c'est que la `UIImageView` contient déjà l'image de son choix et à la bonne taille.

> **:information_source:** Pour que les images apparaissent dans la bibliothèque des médias, il faut que vous les ayez préalablement rajoutées dans les *assets* de l'application. C'est ce que nous avons fait dans la première partie de ce cours.

Nous allons donc choisir la deuxième option ! Allez dans la bibliothèque des médias en cliquant sur l'icône en forme de pellicule de film :

![]() => (P3/P3C3_9.png)

Et nous allons glisser l'icône verte dans notre vue grise en bas au centre.

Si vous allez maintenant dans l'inspecteur d'attribut, vous verrez que `UIImageView` a une propriété `image` qui prend comme valeur le nom de notre image, en l'occurrence *Icon Correct*. Vous pouvez changer le nom en *Icon Error*. Et vous verrez que la `UIImageView` affiche désormais l'icône rouge. Ce qu'il faut que vous compreniez ici, c'est que `UIImageView` ce **n'est pas une image** directement, c'est une **vue qui affiche une image** et cette image peut changer à tout moment ! C'est d'ailleurs ce que nous allons faire dans la dernière partie de ce chapitre : l'image va changer selon si l'utilisateur glisse la question à gauche ou à droite.

Nous avons maintenant tous les éléments nécessaires dans notre interface ! Elle est prête ! Bravo !

![]() => (P3/P3C3_10.png)

#### En résumé
- Il existe tout un tas de composants en iOS que vous pouvez glisser très facilement dans votre interface. Identifiez-les pour avoir le réflexe de les utiliser le jour où vous en aurez besoin.
- Pour modifier les paramètres d'une vue, vous pouvez utiliser l'**inspecteur d'attributs**. Les propriétés modifiables diffèrent selon le type de la vue sélectionnée.
- Pour modifier la position ou la taille d'une vue, vous pouvez :
	- La déplacer à la souris et utiliser les poignées aux angles de la vue
	- Aller dans l'**inspecteur de taille** pour modifier les paramètres `x`, `y`, `width` et `height` directement.
- Pour ajouter une image, le plus simple est d'aller la chercher directement dans la **bibliothèque des médias**.

### Sous-classez UIView
Nous avons maintenant une belle interface ! Et avant de passer à la suite, nous allons la rendre pratique à utiliser ! Dans ce chapitre, nous allons apprendre à créer notre propre vue customisée.

#### Pourquoi faire une vue customisée ?
Si on regarde notre vue question, elle est assez compliquée. Non seulement c'est une vue qui en contient deux autres : le label et l'icône. Mais en plus, si on se fie à l'image ci-dessous, cette vue va s'afficher de trois façons différentes :
- L'utilisateur répond **faux** à la question : le fond devient rouge et la croix rouge apparait
- L'utilisateur répond **vrai** à la question : le fond devient vert et le symbole validé apparaît
- L'utilisateur **n'a pas encore répondu** à la question : le fond est gris et le symbole est caché

![]() => (P3/P3C4_1.png)

Donc pour que cette vue soit plus simple à gérer pour notre contrôleur tout à l'heure, nous allons créer une vue customisée. Et pour créer une vue customisée avec iOS, on crée une sous-classe de `UIView`. Vous risquez d'avoir souvent besoin de faire cela donc c'est le bon moment pour le découvrir ! Vous êtes partant ?

![]() => (P3/P3C4_2.jpg)

Parfait ! Bravo pour votre enthousiasme !

#### Créons la sous-classe

Nous allons créer une classe `QuestionView` qui va hériter de `UIView`. Pour cela, il faut créer un nouveau fichier.

> **:information_source:** Vous connaissez maintenant l'opération : allez dans File > New > File... ou utilisez le raccourci <kbd>cmd + n</kbd>.

Mais cette fois-ci, vous allez choisir la première option *Cocoa Touch Class* :

![]() => (P3/P3C4_3.png)

Cliquez sur *Next*. Cette option nous permet de créer un fichier qui est directement une sous-classe de la classe que l'on souhaite. Cela permet de gagner un peu de temps. Dans le champ *Subclass of*, vous allez donc choisir `UIView`. Et au-dessus, vous allez nommer votre classe `QuestionView`.

![]() => (P3/P3C4_4.png)

Cliquez sur *Next* et sauvegardez votre fichier en choisissant le groupe `View` puisque nous travaillons toujours dans la partie vue du MVC. Vous avez maintenant un fichier `QuestionView.swift` qui contient le code suivant :

```swift
class QuestionView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
```

Il s'agit bien de la déclaration d'une classe `QuestionView` qui hérite de `UIView`.

> **:information_source:** Dans la classe, vous avez un commentaire qui vous suggère de faire l'override d'une méthode `draw`. Pour votre information, cette méthode permet de dessiner des vues de toutes formes mais nous n'en avons pas besoin pour le moment. Vous pouvez supprimer tout le contenu de la classe.

#### Connecter la classe

Maintenant que notre classe est créée, nous allons la connecter avec notre vue dans le storyboard. Nous allons faire ça en deux étapes :
1. Nous allons changer la classe de notre vue dans le storyboard
2. Nous allons connecter le label et l'icône à notre classe

##### Changer la classe de notre vue
Retournons dans le storyboard. Notre vue grise qui contient les questions est à l'origine une `UIView` que nous avons glissée depuis la bibliothèque des composants. Il est temps d'en faire une `QuestionView` !

Pour cela, il faut aller dans l'inspecteur d'identité. C'est un des onglets que nous n'avons pas encore vus dans le panneau des utilitaires à droite.

![]() => (P3/P3C4_5.png)

Dans cet onglet, on peut vérifier après avoir sélectionné la vue que la classe actuelle de notre vue est bien `UIView`. Pour modifier cela, il suffit d'écrire notre nouvelle classe dans le premier champ de texte comme ceci :

![]() => (P3/P3C4_6.png)

Et voilà notre vue a maintenant pour classe `QuestionView` ! Cela va nous permettre de connecter le label et l'icône à notre classe.

##### Connecter le label et l'icône
Notre classe contient deux vues : le label et l'icône. Nous allons en faire des propriétés de notre classe `QuestionView`. Vous savez déjà créer des propriétés :

```swift
var label: UILabel?
var icon: UIImageView?
```

On utilise ici les optionnels, car on ne sait pas la valeur de ces deux propriétés.

Notre objectif avec cette classe est de simplifier l'utilisation de la vue. Dans le cadre de cette simplification, les personnes qui utilisent cette classe n'ont pas besoin de savoir son contenu. Donc nous allons marquer ces propriétés privées.

```swift
private var label: UILabel?
private var icon: UIImageView?
```

Maintenant, faisons la connexion ! **Une connexion entre une propriété et une vue avec Xcode s'appelle un Outlet**.

> **:information_source:** Nous allons créer d'autres *outlets* dans la partie suivante et [ce cours](https://openclassrooms.com/courses/introduction-a-ios-plongez-dans-le-developpement-mobile/connectez-le-code-et-le-storyboard) détaille ce qu'est un *outlet* donc je ne vais pas aller plus loin.

Donc pour faire la connexion, nous allons rajouter ce qu'on appelle un décorateur :

```swift
@IBOutlet private var label: UILabel?
@IBOutlet private var icon: UIImageView?
```

Le mot-clé `@IBOutlet` notifie Xcode que ces propriétés sont susceptibles d'être connectées à une vue dans Interface Builder. En reconnaissant ce mot-clé, Xcode rajoute un petit rond à côté de nos propriétés :

![]() => (P3/P3C4_7.png)

C'est ce petit rond qui va nous permettre de faire la connexion.

Pour cela, nous allons retourner dans le storyboard. Et nous allons nous placer en mode assistant. En mode assistant, pour choisir le fichier à afficher sur la droite, vous pouvez naviguer comme ceci :

![]() => (P3/P3C4_8.gif)

Choisissez le fichier `QuestionView.swift`. Et nous allons maintenant faire la connexion entre la propriété et la vue correspondante. Pour cela, nous allons glisser depuis le petit rond vers la vue comme ceci :

![]() => (P3/P3C4_9.gif)

Et voilà ! Notre classe est maintenant complètement connectée au storyboard. Il ne nous reste qu'une toute petite amélioration.

##### Le type optionnel déballé

Comme nos propriétés sont connectées à des vues qui existent dans le storyboard, on est certain que ces propriétés n'auront pas pour valeur `nil`. Donc au lieu de leur donner un type optionnel, on va leur donner un type **optionnel déballé** :

```swift
@IBOutlet private var label: UILabel!
@IBOutlet private var icon: UIImageView!
```

En remplaçant, le point d'interrogation par un point d'exclamation, on indique qu'on ne connait pas la valeur de nos optionnels, mais qu'on est certain qu'elle ne vaut pas `nil`. À chaque fois que la propriété va être utilisée, l'optionnel va être implicitement déballé.

> **:warning:** Lorsque vous utilisez le type optionnel déballé, il faut être sûr que la propriété ait une valeur ! Sinon lorsque vous allez l'utiliser, le programme va planter.

Le type optionnel déballé nous permet donc de ne pas donner de valeur à notre propriété tout en n'ayant pas à la déballer à chaque fois que l'on souhaite l'utiliser.

#### En Résumé
- Pour faire une vue customisée, on crée une sous-classe de `UIView`.
- Pour créer une sous-classe de `UIView`, on choisit *Cocoa Touch Class* dans le menu *Nouveau fichier* d'Xcode.
- Une connexion entre une propriété et une vue dans le storyboard s'appelle un `Outlet`. Pour pouvoir créer un `Outlet` dans une vue customisée, il faut :
	- Avoir connecté la classe et la vue via l'inspecteur d'identité dans les utilitaires
	- Créer les propriétés correspondantes aux vues
	- Ajouter le décorateur `@IBOutlet`.
	- Glisser le petit rond vers la vue.
- Le type optionnel déballé permet de déclarer une propriété dont on ne connaît pas la valeur mais dont on est certain qu'elle existe. Cela évite de devoir déballer l'optionnel à chaque fois qu'on souhaite l'utiliser.

### Implémentez la classe QuestionView
Notre classe est désormais créée et connectée. Nous allons pouvoir l'implémenter. Cette classe va avoir seulement deux propriétés publiques. Tout le reste va être privé. Ces deux propriétés sont :
- `style` : qui va avoir trois valeurs possibles : réponse correcte, réponse fausse et pas de réponse.
- `title` : cette propriété représente le titre de la question affichée.

#### La propriété title
Créons la propriété `title` de type `String`.

```swift
var title = ""
```

Rien de bien sorcier pour le moment. Dès que cette propriété est modifiée, on va vouloir modifier le texte de notre label pour qu'il affiche la valeur de `title`. Comment fait-on lorsqu'on veut effectuer une action quand une propriété est modifiée ?

> **:question:** On utilise l'observation des propriétés ?

Bravo ! Je vois que vous avez suivi [le cours sur le sujet](https://openclassrooms.com/courses/approfondissez-swift-avec-la-programmation-orientee-objet/enrichissez-vos-proprietes) ! On va donc observer notre propriété `title` :

```swift
var title = "" {
	didSet {
		// On modifie le titre ici
	}
}
```

Cette syntaxe devrait vous être familière. Lorsque la propriété sera modifiée, le contenu de la méthode `didSet` sera exécuté. Nous souhaitons modifier le texte du label. Pour cela, nous allons tout simplement utiliser la propriété `text` de `UILabel`.

```swift
var title = "" {
	didSet {
		label.text = title
	}
}
```

De cette façon, dès que `title` est modifié le texte du label le sera aussi.

#### La propriété style
La propriété `style` va définir l'apparence générale de la vue. Il y a trois possibilités : réponse correcte, réponse incorrecte et pas de réponse. Qui dit plusieurs choix dit ?

> **:question:** Énumération ?

Bravo ! Vous êtes en forme aujourd'hui ;) ! Nous allons donc créer une énumération `Style` à l'intérieur de notre classe `QuestionView`.

```swift
class QuestionView: UIView {
	enum Style {
		case correct, incorrect, standard
	}
	// (...)
}
```

À chaque cas de l'énumération, nous allons faire correspondre les apparences suivantes :

![]() => (P3/P3C5_1.png)

Nous allons maintenant créer la propriété `style` de type `Style` :

```swift
var style: Style = .standard
```

Et de la même façon, nous allons utiliser l'observation des propriétés pour modifier l'apparence. Mais cette fois-ci, le code à exécuter est plus gros qu'une simple ligne donc nous allons l'extraire dans une fonction privée à part :

```swift
var style: Style = .standard {
	didSet {
		setStyle(style)
	}
}

private func setStyle(_ style: Style) {
}
```

À chaque fois que la propriété `style` est modifiée, la fonction `setStyle` est appelée avec en paramètre le style à afficher.

#### La fonction setStyle

Écrivons le code de cette fonction. Tout d'abord nous allons faire un switch sur les différents cas :

```swift
private func setStyle(_ style: Style) {
	switch style {
		case .correct:
		case .incorrect:
		case .standard:
	}
}
```

Dans chacun des cas, il y a trois paramètres susceptibles de changer :
- la couleur de fond de la vue (vert, rouge ou gris)
- l'image de l'icône (validé ou erreur)
- la visibilité ou non de l'icône (dans le style standard, l'icône n'est pas visible)

##### La couleur de fond
Pour changer la couleur de fond, on utilise la propriété `backgroundColor` de `UIView`. Comme `QuestionView` hérite de `UIView` nous avons accès directement à cette propriété.

`backgroundColor` est de type `UIColor`. `UIColor` est la classe qui permet de gérer les couleurs. Elle a plusieurs initialiseurs. Parmi les plus pratiques, vous avez :

```swift
UIColor(white: CGFloat, alpha: CGFloat)
UIColor(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat)
```
Le premier permet de créer une nuance de gris :
- Le paramètre `white` est une valeur comprise entre 0 et 1. Plus la valeur est grande, plus la couleur est claire.
- Le paramètre `alpha` permet de gérer la transparence de la couleur entre 0 et 1.
	- 0 : la couleur est complètement transparente
	- 1 : la couleur est complètement opaque

Le deuxième permet de créer toutes les couleurs à partir des couleurs primaires rouge, vert et bleu. Les trois paramètres `red`, `green` et `blue` doivent avoir des valeurs comprises entre 0 et 1. Le paramètre `alpha` a le même rôle que précédemment.

En informatique, la notation RVB des couleurs se fait sur **255 tons**. Par exemple, nos trois couleurs ont pour valeur RVB :

![]() => (P3/P3C5_2.png)

Donc pour obtenir des valeurs entre 1 et 0, on divise par 255 :

```swift
UIColor(red: 243.0/255.0, green: 135.0/255.0, blue: 148.0/255.0, alpha: 1) // Le rouge
```
Vous savez maintenant manier `UIColor` ! On va pouvoir modifier la couleur de fond de notre vue :

```swift
private func setStyle(_ style: Style) {
	switch style {
	case .correct:
		backgroundColor = UIColor(red: 200.0/255.0, green: 236.0/255.0, blue: 160.0/255.0, alpha: 1) // Vert
	case .incorrect:
		backgroundColor = UIColor(red: 243.0/255.0, green: 135.0/255.0, blue: 148.0/255.0, alpha: 1) // Rouge
	case .standard:
		backgroundColor = UIColor(red: 191.0/255.0, green: 196.0/255.0, blue: 201.0/255.0, alpha: 1) // Gris
	}
}
```

Pour créer une couleur, Xcode propose également une fonctionnalité bien pratique les *color literal*. Si vous commencez à taper *color* dans Xcode, vous pouvez sélectionner la première suggestion : *Color Literal*. Ensuite, vous n'avez plus qu'à choisir la couleur de votre choix et la couleur s'affiche sous la forme d'un petit carré de couleur directement dans le code.

![]() => (P3/P3C5_2bis.gif)

C'est pratique mais parfois vous aurez besoin de `UIColor` donc c'est utile de connaître les deux options !

##### L'image
Nous allons maintenant modifier notre image. La classe `UIImageView` a une propriété `image` de type `UIImage`. C'est cette propriété qui permet de modifier l'image qu'affiche une `UIImageView`.

La classe `UIImage` a un initialiseur qui prend en paramètre le nom de l'image :

```swift
UIImage(named: String)
```

Le nom à indiquer est le nom que l'on a choisi pour l'image dans l'*asset catalog* :

![]() => (P3/P3C5_3.png)

Donc pour que notre icône affiche le signe validé vert, nous allons écrire :

```swift
icon.image = UIImage(named: "Icon Correct")
```

On crée ainsi une instance de `UIImage` à partir du nom du fichier et on assigne cette valeur à la propriété `image` de notre `UIImageView`.

Comme pour les couleurs précédemment, Xcode propose une autre façon bien pratique de créer une instance de `UIImage`. Si on commence à taper le nom de l'image recherchée, Xcode nous la suggère directement :

![]() => (P3/P3C5_4.gif)

> **:warning:** Pour qu'Xcode suggère l'image, il faut bien sûr l'avoir rajouté au préalable dans l'*assets catalog*.

Cette façon de faire est bien pratique, car elle affiche une vignette de l'image en question ce qui est plus clair. Les deux lignes suivantes sont donc équivalentes :

![]() => (P3/P3C5_5.png)

Nous allons donc faire cela pour les deux cas `correct` et `incorrect`. Et notre code ressemble maintenant à ceci :

![]() => (P3/P3C5_6.png)

##### La visibilité de l'image
Il ne nous reste plus qu'à cacher l'image dans le cas `standard` (quand la vue est grise). Pour cela, nous allons utiliser la propriété `isHidden` de type `Bool` de `UIView`. Quand la propriété est à `true`, la vue est cachée et donc n'apparaît pas à l'écran et inversement. Comme `UIImageView` hérite de `UIView`, nous avons accès à cette propriété pour l'icône. Nous allons donc pouvoir l'utiliser et notre code ressemble finalement à ceci :

![]() => (P3/P3C5_7.png)

Dans les deux premiers cas, l'image est affichée. Dans le dernier, elle est cachée.

C'est tout pour notre classe ! D'une vue assez complexe, nous en avons fait une vue très simple à utiliser dans notre contrôleur tout à l'heure. Nous allons pouvoir choisir entre les trois styles que nous venons de définir sans avoir à rentrer dans le détail de la construction de cette vue.

À la fin de ce chapitre, votre classe doit ressembler à ceci :

![]() => (P3/P3C5_8.png)

#### En Résumé
- Pour changer le texte qu'affiche un `UILabel`, on utilise la propriété `text` de type `String`.
- Pour changer la couleur de fond d'une vue, on utilise la propriété `backgroundColor` de `UIView` de type `UIColor`. Pour initialiser `UIColor`, on utilise le plus souvent cette méthode :  
```swift
UIColor(red: 200.0/255.0, green: 236.0/255.0, blue: 160.0/255.0, alpha: 1)
```
- Pour changer l'image qu'affiche une `UIView`, on utilise la propriété `image` de type `UIImage`. Pour initialiser `UIImage`, on utilise le nom du fichier image :  
```swift
UIImage(named: "Icon Correct")
```
- Pour cacher une vue, on utilise la propriété `isHidden` de `UIView` de type `Bool`.


## Connectez la vue et le modèle avec le contrôleur

### Connectez le contrôleur et la vue
Et nous voilà dans la partie sur le contrôleur ! Cette partie est la plus excitante du cours car nous allons tout connecter pour faire enfin fonctionner notre application ! La logique est prête dans le modèle, la vue est toute belle. Il ne nous reste plus qu'à faire les branchements avec le contrôleur !

![]() => (P4/P4C1_1.jpg)

Pour rappel, le rôle du contrôleur est de faire **le lien entre le modèle et la vue**. Le contrôleur va récupérer les données du modèle et les afficher dans la vue.

![]() => (P4/P4C1_2.png)

Dans ce chapitre, nous allons commencer par connecter le contrôleur et la vue.

#### Le fichier ViewController.swift

Concrètement le contrôleur, c'est le fichier `ViewController.swift` qui a été créé automatiquement par Xcode au début du projet.

Dans ce fichier, nous avons une classe `ViewController` qui hérite de `UIViewController`. Cette classe contient déjà deux méthodes :

```swift
override func viewDidLoad() {
	super.viewDidLoad()
	// Do any additional setup after loading the view, typically from a nib.
}

override func didReceiveMemoryWarning() {
	super.didReceiveMemoryWarning()
	// Dispose of any resources that can be recreated.
}
```

La première méthode est appelée lorsque **le contrôleur a fini d'être chargé** donc dans notre cas au lancement de l'application. Nous allons en avoir besoin dans le prochain chapitre pour faire quelques initialisations.

La deuxième méthode est appelée lorsque le contrôleur doit retenir trop d'informations et qu'**il n'a plus de place en mémoire** pour les stocker. Dans ce cas, il faut libérer de la place. Nous ne rencontrerons pas ce problème donc vous pouvez supprimer la méthode.

#### Les outlets

Pour connecter le contrôleur et la vue, nous allons utiliser des... **connexions** ! Il existe deux types de connexion : les **outlets** et les **actions**. Nous allons commencer par les outlets.

> **:information_source:** Les outlets et les actions ont déjà été traités en détail dans [ce cours](https://openclassrooms.com/courses/introduction-a-ios-plongez-dans-le-developpement-mobile/connectez-le-code-et-le-storyboard). Donc je vais aller plus vite ici et me concentrer sur l'impact sur notre modèle MVC.

##### Les outlets et le MVC
Pour rappel, les outlets sont des **connexions entre une vue dans le storyboard et une propriété dans le contrôleur**. Nous allons donc créer des propriétés dans notre contrôleur qui représentent nos vues.

Cela veut dire que dans notre modèle MVC, le contrôleur s'adresse à la vue via les outlets.

![]() => (P4/P4C1_3.png)


##### Créer un outlet
> **:question:** Comment on crée les outlets ?

Vous avez deux options :
- soit vous faites comme pour `QuestionView` précédemment en écrivant la propriété et le décorateur `@IBOutlet`.
- soit vous laissez Xcode faire cela pour vous en utilisant le **control drag**. Et c'est ce que nous allons faire.

Placez-vous en mode assistant avec le storyboard à gauche et le contrôleur à droite. Laissez la touche <kbd>ctrl</kbd> enfoncée et glissez depuis le bouton vers le code comme ceci :

![]() => (P4/P4C1_4.gif)

Lorsque vous relâchez la souris, une popup vous demande plus d'information sur la connexion que vous souhaitez créer. Il y a plusieurs paramètres :
- *Connection* : le type de connexion que vous souhaitez créer. Ici, on veut bien un *Outlet*.
- *Object* : Vers où pointe la connexion, c'est bien le `ViewController`.
- *Name* : Le nom de la propriété que l'on veut créer. Ici nous allons écrire : `newGameButton`.
- *Type* : Le type de la propriété que l'on veut créer. C'est bien `UIButton`.
- *Storage* : C'est une notion assez avancée de programmation et vous n'aurez jamais besoin de changer ce paramètre donc ignorons-le pour le moment.

On peut ensuite cliquer sur `connect` et le code suivant est généré :

```swift
@IBOutlet weak var newGameButton: UIButton!
```

On a bien le décorateur `@IBOutlet` (puis le mot-clé `weak` que l'on ignore pour le moment), puis la déclaration d'une propriété `newGameButton` de type `UIButton`.

> **:information_source:** Notez ici l'utilisation d'un optionnel déballé. C'est toujours le cas pour les outlets.

Vous pouvez répéter cette opération pour :
- l'indicateur d'activité
- la vue question
- le label score

> **:warning:** Pour la vue question, Xcode va sans doute vous proposer par défaut le type `UIView`. N'oubliez pas de le changer pour le type `QuestionView` pour que l'on puisse bénéficier de cette classe dans le prochain chapitre.

Si vous choisissez les noms ci-dessous, vous devrez obtenir le code suivant :

```swift
@IBOutlet weak var newGameButton: UIButton!
@IBOutlet weak var activityIndicator: UIActivityIndicatorView!
@IBOutlet weak var scoreLabel: UILabel!
@IBOutlet weak var questionView: QuestionView!
```

Tous nos outlets sont créés ! Nous pouvons désormais manipuler nos vues dans le contrôleur.

##### Les outlets collections
Pour votre information, il existe un autre type d'outlet que nous n'utiliserons pas ensemble, mais qui est très simple : les **outlets collections**. Comme leur nom le suggère, ils fonctionnent comme les outlets, mais pour plusieurs vues à la fois.

Par exemple, si on crée une application calculatrice, on pourrait créer un outlet pour chaque bouton de 0 à 9 comme ceci :

```swift
@IBOutlet weak var zeroButton: UIButton!
@IBOutlet weak var oneButton: UIButton!
@IBOutlet weak var twoButton: UIButton!
@IBOutlet weak var threeButton: UIButton!
@IBOutlet weak var fourButton: UIButton!
@IBOutlet weak var fiveButton: UIButton!
@IBOutlet weak var sixButton: UIButton!
@IBOutlet weak var sevenButton: UIButton!
@IBOutlet weak var eightButton: UIButton!
@IBOutlet weak var nineButton: UIButton!
```

C'est un peu redondant et peu pratique à utiliser. On va donc utiliser une outlet collection :

```swift
@IBOutlet var numbersButton: [UIButton]!
```

La propriété créée est un tableau qui contient tous les boutons.

Pour créer une outlet collection, il suffit de choisir ce type de connexion dans la popup après le control drag. Puis pour remplir le tableau, il faut faire un control drag depuis chaque bouton vers la propriété `numbersButton`.

#### Les actions
Nous voulons non seulement contrôler les vues. Mais aussi recevoir des informations de leur part. Par exemple, comment faire pour exécuter du code lorsque le bouton est tapé ?

##### Les actions et le MVC
Nous devons donc aborder l'épineuse question de la communication de la vue vers le contrôleur. La vue a-t-elle le droit de communiquer avec le contrôleur ?

Et la réponse est oui... mais indirectement. Via les **actions**. Les actions sont **des connexions entre une vue et une méthode du contrôleur associées à un évènement**.

Schématiquement le contrôleur va placer une cible sur lui-même. Ainsi la vue va pouvoir lui envoyer un message à chaque fois que le bouton est tapé.

![]() => (P4/P4C1_5.png)

##### Créer une action
Pour créer une action, on va faire comme pour les outlets. On va effectuer un control drag depuis le bouton vers le code. Mais cette fois-ci, nous allons choisir *Action* pour le paramètre *Connection* :

![]() => (P4/P4C1_6.png)

Il y à nouveau plusieurs paramètres ici :
- *Connection* et *Object* : même chose que pour les outlets.
- *Name* : le **nom de la méthode** que nous allons créer. Ici je vous propose `didTapNewGameButton`.
- *Type* : Nous allons créer une méthode. Cette méthode peut avoir des paramètres comme l'évènement et la vue dont vient l'action, appelée le *sender*. Si on souhaite avoir le sender en paramètre de la méthode, on peut choisir ici le **type du sender**.
- *Event* : Une action est associée à un **évènement**. Cet évènement représente le geste que doit réaliser l'utilisateur pour que l'action ait lieu. Par défaut, pour un bouton, cet évènement est *Touch Up Inside*. Cela signifie un touché vers le haut à l'intérieur du bouton, c'est-à-dire le moment où le doigt quitte le bouton. Je vous invite à regarder la liste pour voir les autres types d'évènements possibles.
- *Arguments* : Comme expliqué précédemment, la méthode peut avoir des **paramètres**. Ici on décide si on en a besoin ou non. J'ai choisi *None* pour aucun paramètre. Pour information, les autres possibilités sont le sender seul ou le sender et l'évènement.

Vous pouvez cliquer sur *connect* et Xcode génère le code suivant :

```swift
@IBAction func didTapNewGameButton() {
}
```

Notre action est créée. La méthode `didTapNewGameButton` va être appelée à chaque fois que l'on clique sur le bouton.

Pour différencier l'action et la logique qu'elle implique, je vous recommande de créer deux méthodes séparées. Nous allons donc rajouter une méthode `startNewGame` privée à notre classe :

```swift
private func startNewGame() {
}
```

Cette méthode va pouvoir être appelée n'importe où dans le code et notamment dans la méthode `didTapNewGameButton` :

```swift
@IBAction func didTapNewGameButton() {
	startNewGame()
}
```

#### Implémenter startNewGame
Il ne nous reste plus qu'à implémenter notre méthode `startNewGame`. Réfléchissons un peu à ce qu'elle fait. Elle lance une nouvelle partie donc :
1. Elle va afficher une interface de chargement
2. Elle va lancer le chargement des questions
3. Lorsque les questions sont chargées, la partie peut débuter.

Nous allons nous concentrer sur les points 2 et 3 dans le prochain chapitre car nous avons besoin du modèle pour ça. Pour le moment, nous allons afficher notre interface de chargement. Voici à quoi elle va ressembler :

![]() => (P4/P4C1_7.png)

Nous allons donc :
- Cacher le bouton : cela permet d'empêcher l'utilisateur de lancer un nouveau chargement.
- Afficher l'indicateur d'activité : pour notifier l'utilisateur que le chargement est en cours.
- Remettre le score à zéro.
- Remettre la vue question dans le style `standard` : son style a pu avoir été modifié plus tôt si l'utilisateur était en train de jouer.
- Afficher "*Loading...*" dans la vue question.

##### Cacher le bouton et afficher l'indicateur d'activité
Comme toutes les vues, les classes `UIButton` et `UIActivityIndicatorView` héritent de `UIView`. Elles ont donc accès à la propriété `isHidden` que nous avons vue dans la partie précédente. Nous avons donc simplement à écrire :

```swift
private func startNewGame() {
	activityIndicator.isHidden = false
	newGameButton.isHidden = true
}
```

Ainsi, le bouton est caché et l'indicateur d'activité est visible.

##### La vue question
Nous avons déjà bien travaillé sur notre vue question. Nous avons laissé deux propriétés publiques `style` et `title`. Nous avons juste à les utiliser ici.

```swift
questionView.title = "Loading..."
questionView.style = .standard
```

Vous voyez en quoi avoir créé une vue customisée nous rend les choses faciles ici !

##### Le label score

Il ne nous reste plus qu'à remettre à jour le label score. Vous savez maintenant que pour changer le texte d'un `UILabel`, on utilise la propriété `text`. C'est donc précisément ce que nous allons faire :

```swift
scoreLabel.text = "0 / 10"
```

Et voilà ! Votre méthode `startNewGame` doit ressembler à ceci :

```swift
private func startNewGame() {
	activityIndicator.isHidden = false
	newGameButton.isHidden = true

	questionView.title = "Loading..."
	questionView.style = .standard

	scoreLabel.text = "0 / 10"
}
```

Nous avons maintenant une belle interface de chargement lorsqu'on clique sur le bouton. Vous pouvez tester cela en lançant le simulateur.

![]() => (P4/P4C1_8.gif)

> **:warning:** Choisissez bien le modèle iPhone 7 pour lancer le simulateur. Notre interface ne s'adapte pas aux différentes tailles d'iPhone. Donc il n'y a que sur iPhone 7 que notre interface s'affichera correctement. Dans le prochain cours sur iOS, nous reprenons le travail sur OpenQuizz pour l'adapter à toutes les tailles d'écran d'iPhone et iPad.

#### En Résumé
- Pour contrôler les vues, le contrôleur utilise les outlets qui sont des connexions entre une propriété du contrôleur et une vue.
- Pour envoyer un message au contrôleur, les vues peuvent utiliser les actions qui sont des connexions entre une méthode du contrôleur et une vue, associées à un évènement.
- Pour créer ces connexions, on utilise le control drag depuis la vue vers le code du contrôleur.

### Connectez le contrôleur et le modèle
Nous avons fait la moitié du travail. La vue et le contrôleur sont connectés, mais le modèle et le contrôleur ne communiquent pas encore. Ce ne sera plus vrai à la fin de ce chapitre !

![]() => (P4/P4C2_1.jpg)

#### La propriété game
Dans le chapitre précédent, on a vu que le contrôleur peut manipuler les vues grâce à des outlets. Cela prend la forme de propriétés. Ici, nous allons faire exactement la même chose. Nous allons créer une propriété `game` de type `Game` :

```swift
var game = Game()
```

Cette propriété va nous permettre de gérer la partie en nous appuyant sur le travail qui a été fait dans le modèle.

Donc si on reprend notre modèle MVC, on voit que pour accéder au modèle, le contrôleur utilise les propriétés :

![]() => (P4/P4C2_2.png)

Nous allons maintenant utiliser notre propriété `game` pour lancer une nouvelle partie en téléchargeant de nouvelles questions.

#### Charger les questions
Pour télécharger de nouvelles questions, nous allons utiliser la méthode `refresh` de la classe `Game` que nous avons créée ensemble. Et nous allons faire cela, lorsque l'utilisateur appuie sur le bouton pour lancer une nouvelle partie. Donc on va rajouter l'appel à la méthode `refresh` dans la méthode `startNewGame`.

```swift
private func startNewGame() {
	activityIndicator.isHidden = false
	newGameButton.isHidden = true

	questionView.title = "Loading..."
	questionView.style = .standard

	scoreLabel.text = "0 / 10"

	game.refresh()
}
```

Revenons un peu sur le fonctionnement de cette méthode :
1. Elle redémarre la partie en remettant le score à zéro notamment
2. Elle va chercher de nouvelles questions sur internet
3. Quand les questions sont chargées :
	- Elle stocke les questions dans la propriété `questions` de la classe `Game`
	- Elle envoie une notification pour prévenir que les questions sont chargées.

Les notifications sont un des moyens qu'a le modèle de s'adresser au contrôleur. Nous avons déjà géré l'envoi de la notification, mais pas la réception.

![]() => (P4/P4C2_3.png)

C'est ce que nous allons faire ici !

#### Recevoir une notification
Pour recevoir une notification, il faut se brancher à l'émission de radio que l'on souhaite. Et nous voulons faire cela dès que le contrôleur est chargé pour ne pas rater de message.

##### Le nom de la notification
Lorsque le contrôleur vient de finir de se charger, la méthode `viewDidLoad` est appelée. C'est dans cette méthode que nous allons nous brancher à la notification.

Pour rappel, les notifications ont des noms. Ces noms permettent d'identifier chaque notification de façon unique. Pour savoir quelle notification écouter, nous allons commencer par obtenir son nom :

```swift
override func viewDidLoad() {
	super.viewDidLoad()
	let name = Notification.Name(rawValue: "QuestionsLoaded")
}
```

Jusque là rien de nouveau, nous avons écrit cette même ligne dans le modèle.

##### Observer la notification

Maintenant nous allons effectivement nous brancher. Pour rappel, la classe en charge d'envoyer et de recevoir les notifications s'appelle le `NotificationCenter`. Et le centre par défaut s'appelle simplement `default`. La méthode qui permet d'écouter les notifications s'appelle `addObserver`. Donc nous allons écrire :

```swift
let name = Notification.Name(rawValue: "QuestionsLoaded")
NotificationCenter.default.addObserver(self, selector: <vide>, name: name, object: nil)
```

Alors, commentons un peu cette ligne. Tout d'abord on récupère l'instance `default` de  `NotificationCenter` sur laquelle on appelle la fonction `addObserver`. Cette fonction prend quatre paramètres :
- *observer* : ici celui qui doit observer la notification, c'est le contrôleur. Donc on écrit `self` pour faire référence à soi-même.
- *selector* : on va voir ça dans un instant.
- *name* : le nom de la notification à observer, on lui passe donc la variable `name` que nous venons de créer.
- *object* : cette propriété permet de préciser l'objet dont on accepte la notification. Cela fonctionne comme un filtre. Ici, on ne cherche pas à savoir d'où vient la notification, donc on écrit `nil`.

##### Le sélecteur
Revenons sur cet étrange paramètre *selector*. Il est du type `Selector`. Ce type permet de passer une fonction en paramètre. C'est cette fonction qui sera exécutée quand le contrôleur recevra la notification.

Commençons donc par créer une fonction :

```swift
func questionsLoaded() {
}
```

Pour passer cette fonction dans le sélecteur, il y a une syntaxe bien particulière. On écrit `#selector` et le nom de la fonction entre parenthèses. Finalement, on obtient :

```swift
override func viewDidLoad() {
	super.viewDidLoad()
	let name = Notification.Name(rawValue: "QuestionsLoaded")
	NotificationCenter.default.addObserver(self, selector: #selector(questionsLoaded), name: name, object: nil)
}

func questionsLoaded() {
}
```
Ça y est ! Notre contrôleur observe maintenant la notification et dès que les questions seront chargées, il sera prévenu et pourra exécuter la méthode `questionsLoaded`.

> **:information_source:** On utilise principalement les sélecteurs pour les notifications. C'est un héritage d'Objective-C. Dans les autres cas, on préfère utiliser les fermetures que nous avons vues précédemment.

#### Implémenter questionsLoaded

Il ne nous reste plus qu'à implémenter la méthode `questionsLoaded`. Lorsque les questions sont chargées, nous allons faire plusieurs choses :
1. Cacher l'indicateur d'activité : le chargement est terminé, il peut disparaître.
2. Montrer le bouton : la partie a commencé, l'utilisateur peut décider d'en charger tout de suite une nouvelle s'il n'aime pas la première question qu'on lui propose.
3. Afficher la première question de la partie.

##### Cacher l'indicateur d'activité et montrer le bouton
Vous commencez à être habitué maintenant à cacher et à montrer des choses grâce à la propriété `isHidden`. Donc je vous laisse essayer et je vous donne la correction :

```swift
// Essayez par vous même













func questionsLoaded() {
	activityIndicator.isHidden = true
	newGameButton.isHidden = false
}
```

##### Afficher la première question
Nous avons conçu notre classe `Game` pour qu'elle puisse facilement donner au contrôleur la question qu'il a besoin d'afficher. Nous avons fait cela en créant la propriété `currentQuestion` de type `Question`. Nous allons donc l'utiliser pour modifier le titre de notre vue question :

```swift
questionView.title = game.currentQuestion.title
```

Et voilà, nous n'avons plus qu'à tester dans le simulateur !

![]() => (P4/P4C2_4.gif)

Il ne nous reste qu'une petite chose à faire. Lorsque l'utilisateur lance l'application, il s'attend à pouvoir jouer tout de suite. Donc nous allons lancer une partie dès la méthode `viewDidLoad` :

```swift
override func viewDidLoad() {
	super.viewDidLoad()
	let name = Notification.Name(rawValue: "QuestionsLoaded")
	NotificationCenter.default.addObserver(self, selector: #selector(questionsLoaded), name: name, object: nil)
	startNewGame() // On lance une partie tout de suite
}
```

#### En résumé
- Le contrôleur peut faire appel au modèle via ses propriétés.
- Le modèle peut communiquer avec le contrôleur via des notifications. Pour observer une notification, on utilise la méthode `addObserver` de la classe `NotificationCenter`.
- Les sélecteurs permettent de passer en paramètre une fonction avec la syntaxe suivante : `#selector(nomDeLaFonction)`.

### Travaillez votre gestuelle
Notre application commence à prendre une bonne forme ! Nous pouvons maintenant lancer une nouvelle partie en chargeant de nouvelles questions. Mais nous ne pouvons pas y répondre. Donc le jeu est pour l'instant assez limité... Pour répondre aux questions, l'utilisateur va devoir glisser la question à gauche ou à droite :

![]() => (P4/P4C3_1.gif)

Si l'utilisateur pense que la question est vraie, il la glisse vers la droite et inversement. Dans ce chapitre, nous allons donc apprendre à interpréter les gestes de l'utilisateur.

#### A la découverte de UIGestureRecognizer
Il y a deux classes qui permettent de gérer les gestes de l'utilisateur sur l'écran tactile :
- `UIGestureRecognizer` : pour les gestes simples
- `UITouch` : pour des interprétations plus fines des gestes.

On fait déjà énormément de choses avec `UIGestureRecognizer` donc je n'aborderais pas `UITouch` dans ce cours.

##### Quand utiliser UIGestureRecognizer ?

> **:question:**, Mais je sais déjà interpréter les gestes ?

Ah bon... ?

> **:question:**, Mais oui ! On vient de voir avec les actions que je peux répondre à l'appui sur le bouton !

Bien vu ! Tous les composants par défaut que je vous ai présentés ont pour la plupart des gestes prédéfinis. Donc pour ceux-là, vous n'aurez pas besoin de `UIGestureRecognizer`.

Pour tous les autres cas, vous en aurez besoin. Simple, non ?

##### Les sous-classes de UIGestureRecognizer

En fait, on ne va pas utiliser `UIGestureRecognizer` directement, mais ses sous-classes. Ces sous-classes définissent chacune un geste simple. L'application compagnon de ce cours vous permet de jouer avec toutes ces sous-classes. Si ce n'est pas déjà fait, il n'est pas trop tard pour [la télécharger](Lien de téléchargement) !

Pour ceux qui ne peuvent pas, voici un tableau qui donne les sous-classes principales de `UIGestureRecognizer` :

![]() => (P4/P4C3_2.png)

> **:information_source:** Toutes les classes ci-dessus qui s'utilisent avec un doigt ont une propriété `numberOfTouches` qui permet de choisir le nombre de doigts nécessaire pour que le geste soit reconnu. La plupart du temps on laissera cette valeur à `1`, mais vous savez maintenant que vous pouvez modifier cela si besoin.

Dans ce cours, nous allons utiliser `UIPanGestureRecognizer` pour faire glisser notre vue à droite ou à gauche.

#### Utiliser un UIGestureRecognizer
Comme tout ce qui concerne l'interface, il y a deux moyens de créer un `UIGestureRecognizer` :
- Avec le code
- Avec le storyboard

Pour changer, je vais vous montrer ça dans le code. Et comme je suis sympa, j'ai fait pour vous [cette vidéo](INSERT LINK) pour vous montrer comment on fait ça dans le storyboard !

##### Créer un UIGestureRecognizer
On veut que le geste soit détectable le plus tôt possible, dès que l'interface est chargée. Donc nous allons créer notre geste dans `viewDidLoad`.

`UIGestureRecognizer` a besoin de trois informations pour fonctionner :
- Target : Qui est responsable de gérer le geste ? En général le contrôleur.
- Action : Quelle action doit-on effectuer quand le geste est reconnu ?
- View : Quelle vue doit détecter le geste ?

`UIGestureRecognizer` et ses sous-classes ont un initialiseur qui réclame les deux premiers paramètres :
```swift
let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(dragQuestionView(_:)))
```

Détaillons tout ça :
- Pour le paramètre `target`, je choisis donc `self` pour faire référence au contrôleur.
- Pour le paramètre `action`, comme dans le chapitre précédent, j'utilise un **sélecteur** dans lequel je passe la méthode `dragQuestionView` que je crée par ailleurs comme ceci :
```swift
func dragQuestionView(_ sender: UIPanGestureRecognizer) {
}
```
J'ai donné à cette méthode le paramètre `sender` qui est notre `UIPanGestureRecognizer`.

> **:information_source:** Comme la méthode contient un paramètre, je dois le préciser dans le sélecteur comme ceci : `dragQuestionView(_:)`.

Il nous faut maintenant préciser la vue qui doit détecter le geste. Pour cela, on utilise la méthode `addGestureRecognizer` de `UIView`.

```swift
let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(dragQuestionView(_:)))
questionView.addGestureRecognizer(panGestureRecognizer)
```

Et voilà notre geste est reconnu ! Il nous faut maintenant implémenter la méthode `dragQuestionView` !

##### Les états des gestes
`UIGestureRecognizer` a une propriété `state` qui décrit l'état du geste. Elle va nous être utile pour savoir où en est le geste. Cette propriété est de type `UIGestureRecognizerState` qui est une énumération qui a donc plusieurs cas :
- `possible` : C'est le cas par défaut. Le gesture recognizer attend de détecter un geste.
- `began` : Le gesture recognizer vient de détecter le geste.
- `changed` : La valeur vient de changer et le geste se poursuit.
- `ended` : Le geste est terminé, l'utilisateur a lâché l'écran.
- `cancelled` : Un autre geste vient interrompre le geste en cours.

> **:information_source:** Il existe d'autres états, mais dont nous n'avons pas besoin ici.

Voici ce que nous allons faire :
- Lorsque le geste est en cours (`began` et `changed`), nous allons modifier la position de notre vue question pour qu'elle suive le doigt.
- Lorsque le geste est terminé (`cancelled` et `ended`), nous allons enregistrer la réponse choisie par l'utilisateur et proposer la question suivante.

Et comme nous avons à faire à une énumération, nous allons utiliser un `switch` :

```swift
switch sender.state {
case .began, .changed:
	// La vue doit suivre le doigt
case .ended, .cancelled:
	// On enregistre la réponse choisie
default:
	break
}
```

Pour ne pas surcharger ce `switch`, nous allons créer deux méthodes que nous allons remplir dans le prochain chapitre :

```swift
func dragQuestionView(_ sender: UIPanGestureRecognizer) {
	switch sender.state {
	case .began, .changed:
		transformQuestionViewWith(gesture: sender)
	case .ended, .cancelled:
		answerQuestion()
	default:
		break
	}
}

private func transformQuestionViewWith(gesture: UIPanGestureRecognizer) {

}

private func answerQuestion() {

}
```

> **:information_source:** Je marque ces méthodes privées pour indiquer clairement qu'elles servent uniquement en support d'une autre méthode de la classe.

Il ne nous reste qu'une toute petite chose à faire ici. Nous voulons que l'utilisateur puisse déplacer la vue question uniquement lorsque le jeu est en cours ! Pour cela, nous allons vérifier que la propriété `state` de `game` est à la valeur `ongoing`.

```swift
func dragQuestionView(_ sender: UIPanGestureRecognizer) {
	if game.state == .ongoing {
		switch sender.state {
		case .began, .changed:
			transformQuestionViewWith(gesture: sender)
		case .ended, .cancelled:
			answerQuestion()
		default:
			break
		}
	}
}
```

Et voilà ! Notre geste est prêt à être interprété ! La suite, au prochain épisode !

#### En résumé
- Il existe deux classes pour gérer les gestes en iOS `UITouch` et `UIGestureRecognizer`.
- `UIGestureRecognizer` et ses sous-classes permettent facilement de rajouter des gestes classiques à une interface.
- Pour créer un `UIGestureRecognizer`, on doit lui donner une cible (le contrôleur le plus souvent), la vue qui reçoit le geste et l'action à effectuer quand le geste est reconnu.
- `UIGestureRecognizer` a une propriété `state` qui permet de savoir où en est le geste.

### Transformez votre vue
Nous avons ajouté un geste à notre vue question. Mais pour le moment, ce geste n'est pas interprété. Dans ce chapitre, nous allons interpréter le geste pour déplacer notre vue question et permettre à l'utilisateur d'y répondre. Et nous allons commencer par récupérer les informations de notre geste.

#### Récupérer les informations du geste
Notre geste a été passé en paramètre dans la méthode `transformQuestionViewWith`. Nous allons récupérer les informations qu'il contient pour déplacer notre vue en fonction du geste. La classe `UIPanGestureRecognizer` a une méthode `translation(in: UIView)`. Cette méthode prend en paramètre la vue dont on veut obtenir le déplacement. Et renvoie un `CGPoint` qui représente le déplacement.

Récupérons donc cette translation :

```swift
private func transformQuestionViewWith(gesture: UIPanGestureRecognizer) {
	let translation = gesture.translation(in: questionView)
}
```

#### La propriété transform
Nous allons maintenant utiliser cette information de translation pour déplacer la vue. Et pour déplacer la vue, nous allons utiliser la propriété `transform` de `UIView` de type `CGAffineTransform`. Cette propriété a un rôle très précis, elle permet de modifier l'apparence d'une vue de trois façons différentes :
- changer la position de la vue en lui appliquant une translation
- changer la taille de la vue en lui appliquant une échelle
- changer l'orientation de la vue en lui appliquant une rotation

##### La translation
Pour le moment, c'est la translation qui nous intéresse. Pour créer une translation, on utilise l'initialiseur dédié de `CGAffineTransform` :

```swift
CGAffineTransform(translationX: CGFloat, y: CGFloat)
```

Les valeurs `x` et `y` de la translation sont celles obtenues précisément à partir des informations du geste. Donc on peut écrire :

```swift
let translation = gesture.translation(in: questionView)
questionView.transform = CGAffineTransform(translationX: translation.x, y: translation.y)
```

Prenons une pause pour bien assimiler ce qu'il vient de se passer :
1. On récupère **la translation effectuée par le doigt sur l'écran** dans la première ligne. Cette translation a pour type `CGPoint` qui est une structure que nous avons vue et qui a deux propriétés `x` et `y`.
2. On crée une transformation de notre vue question. Cette transformation est de type translation. On lui donne les paramètres de la translation de notre doigt.

Ainsi **la translation du doigt sur l'écran et la translation de la vue correspondent**. Si on lance le simulateur, on peut voir que maintenant la vue suit notre doigt (la souris) :

![]() => (P4/P4C4_1.gif)

#### La rotation
Allons plus loin avec cette propriété `transform` et amusons-nous. Nous allons appliquer une rotation à la vue selon les règles suivantes :
- Plus on est loin du centre, plus la rotation est forte
- Vers la droite, la vue est tournée vers la droite et inversement

Pour que la rotation ait un effet satisfaisant, nous allons appliquer une rotation de -30° quand la vue est à l'extrémité gauche de l'écran et +30° à l'extrémité droite. Si vous avez des petits restes de trigonométrie, nous allons donc faire la translation entre -π/6 et +π/6.

![]() => (P4/P4C4_2.png)

> **:information_source:** Libre à vous de choisir d'autres valeurs, après plusieurs essais, j'ai trouvé l'animation réussie avec ces valeurs, mais chacun ses goûts !

Nous allons commencer par récupérer la largeur de l'écran. Pour cela, on utilise la classe `UIScreen` et sa propriété de classe `main`. De cette propriété, on peut récupérer la propriété bounds que vous connaissez :

```swift
var screenWidth = UIScreen.main.bounds.width
```

J'utilise la vue principale de notre contrôleur et j'accède à sa largeur via sa propriété `frame`.

Avec cette information, nous allons pouvoir calculer l'angle en fonction de la translation de la vue :

```swift
let translationPercent = translation.x/(UIScreen.main.bounds.width / 2)
let rotationAngle = (CGFloat.pi / 6) * translationPercent
```
Je calcule d'abord où je suis par rapport au bord de l'écran. La valeur `translationPercent` peut varier entre `-100%` et `+100%`. Et ensuite j'applique ce pourcentage à π/6.

Maintenant nous allons pouvoir créer notre transformation en utilisant cet angle de rotation. Nous allons utiliser un autre initialiseur de `CGAffineTransform` :

```swift
let rotationTransform = CGAffineTransform(rotationAngle: rotationAngle)
```

##### Combiner les transformations
Nous avons maintenant une transformation de rotation et une transformation de translation. Il faut combiner les deux pour obtenir la transformation complète que l'on veut affecter à notre vue. Et pour cela, nous allons utiliser la méthode `concatenating` de `CGAffineTransform` :

```swift
let transform = translationTransform.concatenating(rotationTransform)
questionView.transform = transform
```

Et voilà ! On n'a plus qu'à tester dans notre simulateur :

![]() => (P4/P4C4_3.gif)

Joli, non ? :D

#### Changer le style
Pour compléter cette animation, il nous reste une petite chose à faire. Il faut changer le style de notre vue en fonction de sa position :
- Si elle est à droite, il faut afficher le style réponse correcte (en vert)
- Si elle est à gauche, il faut afficher le style réponse incorrecte (en rouge)

Et on va faire ça facilement grâce à notre belle `QuestionView` ! Il nous suffit de savoir si la vue est à droite ou à gauche. Et pour cela nous allons regarder la valeur `x` de notre translation :
- Si elle est positive, la vue est à droite.
- Si elle est négative, la vue est à gauche.

On écrit donc :

```swift
if translation.x > 0 {
	questionView.style = .correct
} else {
	questionView.style = .incorrect
}
```

Et voilà, nous avons créé une nouveau geste beau et pratique !

![]() => (P4/P4C4_4.gif)

Pour que vous ayez la vue d'ensemble, voici le code final de notre fonction :

```swift
private func transformQuestionViewWith(gesture: UIPanGestureRecognizer) {
	let translation = gesture.translation(in: questionView)

	let translationTransform = CGAffineTransform(translationX: translation.x, y: translation.y)

	let translationPercent = translation.x/(UIScreen.main.bounds.width / 2)
	let rotationAngle = (CGFloat.pi / 3) * translationPercent
	let rotationTransform = CGAffineTransform(rotationAngle: rotationAngle)

	let transform = translationTransform.concatenating(rotationTransform)
	questionView.transform = transform

	if translation.x > 0 {
		questionView.style = .correct
	} else {
		questionView.style = .incorrect
	}
}
```

#### Répondre à la question
Notre geste est bien beau, mais lorsqu'on lâche la vue, il ne se passe rien. Et c'est parce que nous n'avons pas implémenté la deuxième méthode que nous avions préparée : `answerQuestion`. Alors, allons-y !

##### Envoyer la réponse au modèle
Tout d'abord nous allons envoyer la réponse au modèle qui va se charger de mettre à jour le score. Nous allons utiliser la méthode `answerCurrentQuestion` que nous avions préparée dans la classe `Game`.

Cette question prend en paramètre la réponse de l'utilisateur : vrai ou faux. Nous allons déduire cette réponse du style de la vue question :

```swift
private func answerQuestion() {
	switch questionView.style {
	case .correct:
		game.answerCurrentQuestion(with: true)
	case .incorrect:
		game.answerCurrentQuestion(with: false)
	case .standard:
		break
	}
}
```

Si la vue question est dans le style `correct`, l'utilisateur répond "vrai" à la question et inversement.

##### Mettre à jour le score
La méthode `answerCurrentQuestion` met à jour le score de la partie. Donc nous pouvons ensuite afficher le score mis à jour :

```swift
scoreLabel.text = "\(game.score) / 10"
```

##### Afficher la nouvelle question
Enfin, il faut afficher la question suivante. Pour cela, nous allons commencer par replacer la vue question à sa place d'origine. Pour cela, nous allons utiliser une instance spéciale de `CGAffineTransform` : `identity`. Cette transformation est la **transformation identité** et permet donc de ramener la vue à son état d'origine.

```swift
questionView.transform = .identity
```

La vue est revenue à sa place. Il faut également lui redonner son style standard pour qu'elle redevienne grise.

```swift
questionView.style = .standard
```

Enfin, il nous faut modifier son titre pour afficher la nouvelle question :

```swift
questionView.title = game.currentQuestion.title
```

Et voilà ! Nous affichons la nouvelle question après avoir enregistré la réponse de l'utilisateur.

![]() => (P4/P4C4_5.gif)

##### Game Over

Minute papillon !

> **:question:** Bah quoi ?

Nous avons oublié de traiter un cas. Que se passe-t-il si la partie est terminée ? Nous ne pouvons plus afficher la question suivante ! L'application va planter. Donc nous devons afficher à la place que la partie est terminée. Pour cela, nous allons contrôler la propriété `state` de `game`.

```swift
switch game.state {
case .ongoing:
	questionView.title = game.currentQuestion.title
case .over:
	questionView.title = "Game Over"
}
```

Et voilà ! Nous indiquons à l'utilisateur que la partie est terminée ! C'est quand même mieux que l'application qui plante !

![]() => (P4/P4C4_6.gif)

> **:information_source:** Vous noterez que lorsque la partie est terminée, on ne peut en effet plus déplacer la vue.

A la fin, le code de notre fonction ressemble donc à ceci :

```swift
private func answerQuestion() {
	switch questionView.style {
	case .correct:
		game.answerCurrentQuestion(with: true)
	case .incorrect:
		game.answerCurrentQuestion(with: false)
	 case .standard:
		break
	}

	scoreLabel.text = "\(game.score) / 10"

	questionView.transform = .identity
	questionView.style = .standard

	switch game.state {
	case .ongoing:
		questionView.title = game.currentQuestion.title
	case .over:
		questionView.title = "Game Over"
	}
}
```

#### En résumé
- Pour obtenir la translation du doigt sur l'écran, lors d'un `UIPanGestureRecognizer`, on utilise la méthode `translation(in: UIView)`.
- `UIView` a une propriété `transform` qui permet de changer la taille, la position et l'orientation de la vue.
- Pour créer une transformation, nous avons vu deux initialiseurs de `CGAffineTransform` :
```swift
CGAffineTransform(translationX: CGFloat, y: CGFloat)
CGAffineTransform(rotationAngle: CGFloat)
```
- Pour combiner deux transformations, nous avons vu la méthode `concatenating` de `CGAffineTransform` :
```swift
let combinedTransform = transform1.concatenating(transform2)
```

### Animez l’interface
C'est le moment de la touche finale de notre application ! Le coup de pinceau génial ! La cerise sur le gâteau ! Le clou du spectacle !

> **:question:** Tu t'emballes...

Oui. Pardon. Mais c'est parce que dans ce chapitre, nous allons parler des animations ! Et je trouve ça personnellement très amusant. Nous allons apprendre à animer nos vues pour donner à notre application une finition vraiment professionnelle.

Vous êtes prêt ?

![]() => (P4/P4C5_1.jpg)

#### Les animations en iOS

Il existe de nombreux moyens de faire des animations en iOS. Voici la plupart d'entre eux :
- `UIView Animation` pour animer les propriétés des vues
- `Core Animation`pour animer des vues, mais avec bien plus de possibilités
- `SceneKit` pour des animations en 3D
- `SpriteKit` pour des jeux en 2D
- `Dynamic Animation` pour des animations avec des règles physiques comme la gravité, les collisions, etc.

Nous n'aborderons pas toutes ces techniques ensemble car ce serait trop long. Et puis, si vous ne programmez pas des jeux, les deux premiers couvrent 99% de vos besoins. Et le premier en couvre à lui tout seul 80%.

Donc nous allons nous concentrer dans ce chapitre sur `UIView Animation`. `UIView Animation` comme son nom l'indique permet d'animer les propriétés des vues et en particulier :
- `frame` : nous avons vu cette propriété ensemble, elle permet de placer les vues
- `transform` : nous venons de la voir
- `alpha` : cette propriété permet de modifier l'opacité de la vue. En l'animant, on peut faire apparaître ou disparaître doucement notre vue.
- `backgroundColor` : on peut animer le changement de la couleur de fond

Dans ce chapitre, nous allons principalement animer la propriété `transform`. Mais vous pouvez vous amuser à animer les autres. Nous allons réaliser l'animation suivante :

![]() => (P4/P4C5_2.gif)

Cette animation a lieu en deux temps :
- Lorsqu'on lâche la vue, la vue glisse vers la droite où vers la gauche selon l'endroit où nous l'avons lâchée.
- Ensuite, elle réapparaît au milieu avec une animation comme si elle arrivait par le fond avec un effet "boing".

#### Créer une animation
Pour créer une animation, on utilise la méthode de classe `animate` de `UIView`. Cette méthode a plusieurs variantes, mais celle qui nous intéresse pour l'instant est la suivante :

```swift
UIView.animate(withDuration: TimeInterval, animations: () -> Void, completion: (Bool) -> Void)
```
Cette méthode prend en paramètre une durée de type `TimeInterval`. Rien de bien sorcier ici, il suffit de lui passer un nombre décimal. Cela correspond à la durée en secondes de l'animation.

Puis elle prend deux autres paramètres qui sont des f...

> **:question:** Des float ?

Mais non ! Regardez leur type, ce sont des fer..

> **:question:** Des fermetures !!

Bravo ! Les animations sont un très bon moyen de pratiquer les fermetures. *Il n’est pas bien fait ce cours... ?* :D

Dans la première fermeture, nous allons modifier les propriétés que l'on souhaite animer. Dans l'autre, on va pouvoir effectuer une action quand l'animation est terminée.

#### Faire disparaître la vue
Pour faire disparaître la vue, on va la faire glisser vers la droite si la réponse est vraie et inversement si la réponse est fausse. Pour être certains qu'elle quitte l'écran, nous allons la faire glisser d'une distance égale à la largeur de l'écran. On commence donc par obtenir la largeur de l'écran :

```swift
let screenWidth = UIScreen.main.bounds.width
```

Puis on va créer une translation vers la droite ou vers la gauche en fonction de la réponse choisie :
```swift
var translationTransform: CGAffineTransform
if questionView.style == .correct {
	translationTransform = CGAffineTransform(translationX: screenWidth, y: 0)
} else {
	translationTransform = CGAffineTransform(translationX: -screenWidth, y: 0)
}
```

Maintenant, nous allons créer l'animation :

```swift
UIView.animate(withDuration: 0.3, animations: {
	self.questionView.transform = translationTransform
}, completion: nil)
```

Je précise une durée de 0,3 seconde. Puis dans la fermeture `animations`, je modifie la propriété `transform`. Et `UIView` va s'occuper tout seul d'animer le changement de cette propriété.

> **:information_source:** Vous notez que j'utilise le mot-clé `self`. On est obligé de l'utiliser pour faire référence à une propriété ou une méthode dans une fermeture.

Pour l'instant, je n'ai pas rédigé de code dans la fermeture `completion` mais nous allons corriger ça tout de suite !

```swift
UIView.animate(withDuration: 0.3, animations: {
	self.questionView.transform = translationTransform
}, completion: { (success) in
	if success {
		self.showQuestionView()
	}
})
```

La fermeture question a un paramètre `success` de type `Bool` qui permet de vérifier que l'animation s'est bien déroulée. Si c'est le cas, j'appelle la fonction `showQuestionView` que je vais créer tout de suite et qui contient le code suivant :

```swift
private func showQuestionView() {
    questionView.transform = .identity
    questionView.style = .standard

    switch game.state {
    case .ongoing:
        questionView.title = game.currentQuestion.title
    case .over:
        questionView.title = "Game Over"
    }
}
```

Dans cette fonction, j'ai simplement copié le code que nous avons rédigé dans le chapitre précédent et dont le seul but est de repositionner et mettre à jour la question.

Si je lance maintenant le simulateur, je vois bien que la vue disparaît sur le côté et à la fin de l'animation, elle revient au centre avec une nouvelle question :

![]() => (P4/P4C5_3.gif)

#### Faire apparaître la question

Nous allons maintenant animer le retour de la question. Nous allons procéder ainsi :
- Nous allons placer la vue au centre de l'écran et réduire sa taille pour qu'on ne la voie plus.
- Nous allons animer son retour à sa taille normale avec un petit effet "boing".

Nous allons faire tout cela juste après l'animation précédente donc dans la méthode `showQuestionView`. Nous ramenons déjà la vue au centre de l'écran avec la ligne :

```swift
questionView.transform = .identity
```

Nous devons maintenant réduire sa taille. Et pour cela, nous allons utiliser un troisième initialiseur de `CGAffineTransform` :

```swift
CGAffineTransform(scaleX: CGFloat, y: CGFloat)
```

Cette transformation prend en paramètre deux échelles d'agrandissement en largeur sur les x et en hauteur sur les y. Si on veut doubler la largeur et tripler la hauteur, on écrit 2 et 3. Ici, on veut réduire la taille donc on va écrire :

```swift
questionView.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
```

La vue est maintenant de retour au centre et toute petite, tellement qu'on ne la voit plus. Nous allons animer son retour à sa taille normale. Pour obtenir l'effet "boing" souhaité, nous allons utiliser une autre version de la méthode `animate` :

```swift
UIView.animate(withDuration: TimeInterval, delay: TimeInterval, usingSpringWithDamping: CGFloat, initialSpringVelocity: CGFloat, options: [UIViewAnimationOption], animations: () -> Void, completion: (Bool) -> Void)
```

Cette méthode permet d'animer les propriétés de la vue en les faisant osciller autour de la valeur d'arrivée. Laissez-moi vous expliquer cela avec ces deux animations :

![]() => (P4/P4C5_4.gif)

Dans la première animation, la vue va du point de départ au point d'arrivée simplement. Dans la deuxième, elle va plus rapidement au point d'arrivée et ensuite elle oscille autour du point d'arrivée avant de trouver sa position finale. On appelle cela une animation *spring*.

Et c'est ce que nous allons faire ici. Parcourons un peu les paramètres de cette grosse méthode :
- *duration* : La durée de l'animation comme tout à l'heure.
- *delay* : Cela permet de décaler le démarrage de l'animation. Nous n'en avons pas besoin ici.
- *damping* : Ce paramètre peut être choisi entre 0 et 1. Plus on est proche de 0, plus il y aura d'oscillations autour de la valeur d'arrivée.
- *initialVelocity* : Cela permet de choisir la vitesse de départ de la vue lors de l'animation. Plus elle sera rapide, plus les oscillations seront grandes.
- *options* : Ici, on peut préciser des options pour notre animation. Ici, nous n'allons pas en avoir besoin, mais vous pouvez allez regarder les options disponibles [ici](https://developer.apple.com/documentation/uikit/uiviewanimationoptions).
- *animations* et *completion* : les mêmes fermetures que pour la méthode utilisée précédemment.

Avec toutes ces informations, nous allons pouvoir utiliser notre méthode :

```swift
UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: [], animations: {
	self.questionView.transform = .identity
}, completion:nil)
```

> **:information_source:** Après plusieurs essais, j'ai choisi les paramètres `duration`, `damping` et `velocity` ainsi. Mais je vous invite à les modifier pour voir comment l'animation réagit !

A l'intérieur du bloc `animation`, je ramène la vue à sa taille d'origine en lui appliquant la transformation identité. Notre animation est terminée et notre vue question réapparaît maintenant avec un joli petit effet !

![]() => (P4/P4C5_2.gif)

Et voilà ! Notre application est complètement finalisée ! Et c’est du travail de pro !

#### ViewController.swift

Pour que vous vous y retrouviez, voici l'intégralité de notre contrôleur !

```swift
import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var newGameButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionView: QuestionView!

    var game = Game()

    override func viewDidLoad() {
        super.viewDidLoad()
        let name = Notification.Name(rawValue: "QuestionsLoaded")
        NotificationCenter.default.addObserver(self, selector: #selector(questionsLoaded), name: name, object: nil)

        startNewGame()

        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(dragQuestionView(_:)))
        questionView.addGestureRecognizer(panGestureRecognizer)
    }

		@IBAction func didTapNewGameButton() {
			startNewGame()
		}

    private func startNewGame() {
        activityIndicator.isHidden = false
        newGameButton.isHidden = true

        questionView.title = "Loading..."
        questionView.style = .standard

        scoreLabel.text = "0 / 10"

        game.refresh()
    }

    func questionsLoaded() {
        activityIndicator.isHidden = true
        newGameButton.isHidden = false
        questionView.title = game.currentQuestion.title
    }

    func dragQuestionView(_ sender: UIPanGestureRecognizer) {
        if game.state == .ongoing {
            switch sender.state {
            case .began, .changed:
                transformQuestionViewWith(gesture: sender)
            case .ended, .cancelled:
                answerQuestion()
            default:
                break
            }
        }
    }

    private func transformQuestionViewWith(gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: questionView)

        let translationTransform = CGAffineTransform(translationX: translation.x, y: translation.y)

        let translationPercent = translation.x/(UIScreen.main.bounds.width / 2)
        let rotationAngle = (CGFloat.pi / 3) * translationPercent
        let rotationTransform = CGAffineTransform(rotationAngle: rotationAngle)

        let transform = translationTransform.concatenating(rotationTransform)
        questionView.transform = transform

        if translation.x > 0 {
            questionView.style = .correct
        } else {
            questionView.style = .incorrect
        }
    }

    private func answerQuestion() {
        switch questionView.style {
        case .correct:
            game.answerCurrentQuestion(with: true)
        case .incorrect:
            game.answerCurrentQuestion(with: false)
        case .standard:
            break
        }

        scoreLabel.text = "\(game.score) / 10"

        let screenWidth = UIScreen.main.bounds.width
        var translationTransform: CGAffineTransform
        if questionView.style == .correct {
            translationTransform = CGAffineTransform(translationX: screenWidth, y: 0)
        } else {
            translationTransform = CGAffineTransform(translationX: -screenWidth, y: 0)
        }

        UIView.animate(withDuration: 0.3, animations: {
            self.questionView.transform = translationTransform
        }, completion: { (success) in
            if success {
                self.showQuestionView()
            }
        })
    }

    private func showQuestionView() {
        questionView.transform = .identity
        questionView.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)

        questionView.style = .standard

        switch game.state {
        case .ongoing:
            questionView.title = game.currentQuestion.title
        case .over:
            questionView.title = "Game Over"
        }

        UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: [], animations: {
            self.questionView.transform = .identity
        }, completion:nil)
    }
}
```

#### En résumé
- Il existe de nombreux moyens de faire des animations en iOS. Mais ce que vous utiliserez dans la plupart des cas, ce sont les `UIView Animation`.
- Les `UIView Animation` permettent d'animer facilement certaines propriétés de UIView comme `frame`, `alpha`, `transform` et `backgroundColor`.
- Pour créer une `UIView Animation`, on utilise l'une des variantes de la méthode de classe `animate` de `UIView`.
- Les animations *spring* permettent de créer un effet d'oscillation autour de la valeur d'arrivée de l'animation.

### Conclusion
Félicitations ! Vous êtes arrivés à la fin de ce cours et vous avez conçu de A à Z une application relativement sophistiquée ! Ce cours était riche et tout n'était pas trivial donc bravo pour avoir assimilé toutes ces connaissances. Vous maîtrisez maintenant une grande partie des techniques fondamentales d'iOS.

#### Le MVC
Résumons un peu ce que nous avons vu ensemble. Et commençons par le plus important de loin : le **MVC**. Le MVC c'est donc un schéma de conception qui vous permet d'architecturer votre code. Car une application sans architecture, ça ne tient pas debout !

> **:information_source:** Le MVC est la plus simple architecture que vous puissiez utiliser en iOS et donc pas la plus robuste. Mais elle reste extrêmement répandue et vous suffira largement pendant tout votre apprentissage d'iOS. Et si vous vous y tenez avec beaucoup de rigueur, vous arriverez très facilement à intégrer des architectures plus complexes.

Au fur et à mesure de nos avancées dans ce cours, nous avons conçu ce schéma du MVC.

![]() => (P4/P4C5_1.png)

La règle principale à retenir, c'est que **le modèle et la vue ne peuvent pas communiquer directement**. Ils ne sont même pas au courant de l'existence l'un de l'autre. Ils communiquent **via le contrôleur**.

Le contrôleur a le droit lui de s'adresser directement au modèle et à la vue :
- **via les propriétés** pour le modèle
- **via les outlets** pour la vue

Mais l'inverse n'est pas vrai, la vue et le modèle ne peuvent pas s'adresser directement au contrôleur :
- Le modèle s'adresse au contrôleur **via les notifications**.
- La vue s'adresse au contrôleur **via les actions**.

Dans les prochains cours sur iOS, nous continuerons à utiliser et à explorer le modèle MVC et nous apprendrons ensemble à utiliser d'autres modes de communications entre ces différents blocs. On fera même interagir plusieurs MVC ensemble !

#### Les techniques
Dans ce cours, nous avons appris de nombreuses techniques de développement.

##### Swift
Vous avez approfondi vos connaissances de Swift en découvrant les notions suivantes :
- Les **structures**
- Les **fermetures** et le **type fonction**
- Le **type optionnel déballé**

##### iOS
Nous avons vu surtout de nombreuses techniques propres à iOS :
- `UIView` : nous avons vu en long en large et en travers cette classe, et…
	- Plusieurs de ses propriétés comme `isHidden`, `backgroundColor`, etc.
	- Le système de hiérarchie d'une vue
	- Le système de coordonnées avec `frame`, `bounds` et les classes `CGFloat`, `CGPoint`, `CGSize` et `CGRect`
	- La plupart de ses sous-classes. Ce sont les composants par défaut en iOS.
	- Créer une vue customisée en préparant notre propre sous-classe de UIView.
- Nous avons également vu **les notifications** comme mode de communication.
- Interpréter les **gestes** sur l'écran tactile avec `UIGestureRecognizer`
- Créer des **animations** avec `UIView Animation`.

##### Xcode
Enfin, nous avons vu plusieurs techniques d'Xcode :
- Comment gérer les **images** avec l'`asset catalog`
- Comment gérer les **polices**, ce qui nous a permis de découvrir le fichier `info.plist`
- Comment créer une **palette de couleur**
- Comment modifier l'**icône** d'une application
- La **page de lancement**
- Manipuler le **storyboard** pour créer une interface
- Le **control-drag** pour relier le contrôleur et les vues du storyboard

#### Aller plus loin
Bien sûr il reste énormément de choses que vous aurez le loisir de découvrir si vous le souhaitez ! Mais à partir de maintenant, vous avez un niveau suffisant pour commencer à explorer ce vaste domaine par vous même ! Et je vous encourage fortement à le faire ! D'ailleurs dans l'activité qui termine ce cours, vous devez d'une part montrer que vous avez suivi le cours en ayant développé l'application, mais aussi **l'améliorer avec la(les) modification(s) de votre choix**.

Si vous n'êtes pas inspiré, voici quelques idées :
- Créer une animation lorsque le score augmente
- Créer une animation spécifique pour la fin de partie
- Créer un geste pour lancer une nouvelle partie
- Modifier le design de l'application
- etc.

#### La suite ?
Pour poursuivre votre apprentissage avec iOS, nous allons continuer notre travail sur OpenQuizz. En effet, cette application fonctionne très bien, mais elle est souvent moche...

> **:question:** Pardon ?!

Eh oui, nous ne la faisons fonctionner uniquement sur un iPhone 7. Mais faîtes l'expérience de lancer l'application sur iPhone 7 plus, un iPhone 4S ou un iPad. Vous verrez que l'interface ne s'adapte pas du tout aux différentes tailles d'écran. Et si on veut utiliser cette application en mode paysage au lieu du mode portrait ? Qu'est-ce que ça donnerait ? Donc oui, sur la plupart des écrans, notre application n'est pas très belle...

Mais rassurez-vous, c'est un problème que nous allons résoudre dans **le prochain cours sur iOS qui traite justement des applications réactives** (*responsive* en anglais) ! Je vous y retrouve très vite !

Mais en attendant, il faut terminer ce cours. Et le mot de la fin, bien sûr c'est :

![]() => (P4/P4C5_2.jpg)
