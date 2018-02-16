# Gérez la navigation et les formulaires en iOS

## Naviguez dans votre application

### Tirez le meilleur de ce cours

Bonjour et bienvenue dans ce cours sur la navigation et les formulaires en iOS ! Ensemble, nous allons découvrir comment créer plusieurs pages dans une application, comment organiser la navigation et la communication entre elles. Vous apprendrez aussi à créer des formulaires en vous appuyant sur des composants comme les champs de texte, les boutons switch, les sélecteurs et d'autres. Nous verrons même comment gérer le clavier et présenter des alertes aux utilisateurs.

Et bien sûr, j'ai prévu quelques surprises et autres bonus en chemin !

|IMAGE Images/P1/P1C1_1.jpg| [Ne vous inquiétez pas ! Tout va bien se passer !]

#### Prérequis

Ce cours fait partie de tout [un parcours sur le développement d'application iOS](https://openclassrooms.com/paths/developpeur-se-dapplication-ios). Je vous suggère fortement d'y jeter un oeil si vous souhaitez vous former et trouver un emploi en tant que développeur iOS.

> **:warning:** Pour profiter au mieux de ce cours, assurez-vous que vous maîtrisez a minima les compétences présentées dans les cours suivants :
- [Introduction à iOS : plongez dans le développement mobile !](https://openclassrooms.com/courses/introduction-a-ios-plongez-dans-le-developpement-mobile)
- [Apprenez les fondamentaux de Swift](https://openclassrooms.com/courses/apprenez-les-fondamentaux-de-swift)
- [Approfondissez Swift avec la Programmation Orientée Objet](https://openclassrooms.com/courses/approfondissez-swift-avec-la-programmation-orientee-objet)
- [Développez une application iPhone avec le modèle MVC](https://openclassrooms.com/courses/concevez-une-application-iphone-avec-le-modele-mvc)

#### Miawouf
Dans ce cours, nous allons développer une application de rencontre... pour chien et chat ! Cette application est baptisée Miawouf. Et nous allons nous concentrer sur la phase d'inscription. Car elle nous suffit pour découvrir tout ce qui est prévu dans ce cours !

> **:information_source:** Cette étape est présente dans 99% des applications donc autant que vous vous frottiez à l'exercice au plus vite !

Miawouf est divisée en deux, une inscription pour les chiens et une pour les chats. Et l'inscription se fait en trois pages :
- une page d'accueil
- un formulaire d'inscription
- une page de confirmation

|IMAGE Images/P1/P1C1_2.png| []

Pour construire cette application avec moi, je vous ai préparé un petit dossier contenant les images dont vous allez avoir besoin pour le cours. Vous pouvez le télécharger [ici](https://s3-eu-west-1.amazonaws.com/static.oc-static.com/prod/courses/files/Parcours+DA+iOS/Cours+7+-+Plusieurs+pages/App+Assets.zip).

> **:information_source:** Vous y trouverez aussi un fichier `Races.swift`, il contient deux listes non exhaustives de races de chiens et de chat sous forme de tableau Swift. On en aura besoin pour le cours.

Dans ce cours, il n'y a pas de projet Xcode à télécharger donc je vous invite à créer un projet vide, en choisissant le template le plus simple : *Single Page Application*. Vous pouvez déjà glisser les images et icônes dans les assets du projet et le fichier Races.swift dans votre navigateur de fichier.

> **:warning:** Si vous ne vous rappelez plus comment on gère les images dans un projet Xcode, vous pouvez revenir jeter un oeil [ici](https://openclassrooms.com/courses/concevez-une-application-iphone-avec-le-modele-mvc/gerez-les-images).

Et voilà vous êtes fin prêt à suivre ce cours.

#### Rappel sur le MVC

Avant de se lancer tête baissée dans nos différents sujets, je voudrais prendre un petit moment pour parler évidemment de MVC :D !

> **:warning:** Si le concept MVC ne vous dit rien, rendez-vous [ici](https://openclassrooms.com/courses/concevez-une-application-iphone-avec-le-modele-mvc).

Pour rappel, en MVC, le modèle et la vue n'ont pas connaissance de l'existence l'une de l'autre et le contrôleur et le seul à pouvoir s'adresser directement à l'un et l'autre.

|IMAGE Images/P1/P1C1_3.png| [Ce schéma vous dit quelque chose ?]

Le modèle utilise généralement des notifications pour s'adresser au contrôleur et la vue utilise des actions. Ces deux modes de communications sont aveugles pour que la vue et le modèle puissent rester complètement indépendants du contrôleur.

#### Plusieurs MVCs
En iOS, un MVC correspond généralement à une page de l'application, ou en tout cas à un espace défini de l'écran. Donc pour chaque nouvelle page, on va avoir un nouveau MVC.

> **:question:** Mais du coup, comment communique-t-on entre MVC ?

Quelle question parfaite ! Vous commencez à saisir l'importance de l'architecture, c'est beau...

Je vais résumer cela en trois règles simples :

**1/ Une vue communique toujours avec un seul contrôleur.**

|IMAGE Images/P1/P1C1_4.png| []

La gestion d'une vue n'est jamais répartie entre deux contrôleurs différents.

**2/ Un modèle peut-être utilisé par plusieurs contrôleurs**

|IMAGE Images/P1/P1C1_5.png| []

À l'inverse de la vue, deux contrôleurs peuvent faire appel aux mêmes données. Par exemple, une classe du modèle peut gérer les utilisateurs et les informations concernant l'utilisateur ont des chances d'être utiles dans plusieurs pages. Donc, ce modèle peut être partagé par plusieurs contrôleurs.

**3/ Les MVCs communiquent entre eux via le contrôleur**

Deux vues ne peuvent pas communiquer entre elles. De toute façon, il faut bien comprendre qu'une vue, c'est l'esclave d'un contrôleur donc elle n'irait jamais prendre l'initiative de parler avec qui que ce soit :).

Ce sont donc les contrôleurs qui permettent de faire des liens entre MVC. **Mais lorsqu'un contrôleur s'adresse à un autre contrôleur, il le fait d'une façon aveugle et structurée comme s'il s'agissait d'une vue.**

|IMAGE Images/P1/P1C1_6.png| []

Pour vous souvenir de ces trois règles simples, il suffit de se souvenir de la logique du MVC :
- Le modèle détient la logique, mais aussi les données de l'application. Donc ces informations doivent pouvoir être accessibles depuis plusieurs contrôleurs.
- Le contrôleur a pour rôle principal la communication entre le modèle et la vue, il est donc logique qu'il soit aussi le centre de communication vers les autres MVCs.
- La vue a pour seul rôle d'afficher ce qu'on lui demande, elle ne réfléchit pas et du coup n'est capable que de prendre les commandes d'un seul contrôleur. Il ne faut pas lui en demander plus !

Je pense que ça fait suffisamment de théorie pour le moment. Et si tout ça n'est pas parfaitement acquis, c'est normal. Tout va s'éclaircir lorsque vous verrez ce que ça donne concrètement dans le code ! Et ce dès le prochain chapitre, où nous allons ajouter une barre de navigation dans notre application !

### Ajoutez une barre de navigation

C'est parti ! On va tout de suite ajouter une barre de navigation qui va nous permettre, comme son nom l'indique, de naviguer entre plusieurs pages !

> **:question:** Oui, mais c'est quoi une barre de navigation ?

Ah oui, bien vu ! Alors une barre de navigation, c'est ça :

|IMAGE Images/P1/P1C2_1.png| []

C'est la barre que vous avez très souvent en haut de votre application et qui vous permet de revenir à la page précédente. Souvent, elle contient un titre comme "*Light*" ici et parfois un ou plusieurs boutons comme le bouton `edit`.

C'est plus clair ? Alors, allons-y !

#### Faire place nette

Et pour démarrer vraiment de zéro, nous allons supprimer le `ViewController` qu'Xcode a déjà créé pour vous.

> **:information_source:** L'idée, c'est qu'à chaque page corresponds un contrôleur. Donc on va devoir créer plusieurs contrôleurs et donc on va leur donner des noms un peu moins génériques que `ViewController` pour pouvoir les identifier facilement.

Commencez par supprimer le fichier `ViewController.swift` en faisant clic droit puis *Delete*. Choisissez ensuite l'option `Move to trash` dans la popup.

Ensuite, rendez vous dans le storyboard et supprimez le ViewController qui s'y trouve. Votre storyboard ne contient plus rien ! On va pouvoir travailler sereinement !

#### Présentation de la classe UINavigationController
Pour ajouter une barre de navigation, il faut ajouter ce qu'on appelle un `UINavigationController`. Cette classe est un contrôleur. Et comme tout contrôleur qui se respecte, son rôle est de gérer une vue. Et pour un navigation controller, cette vue est un peu particulière. Elle est composée de deux sous-vues comme le présente le schéma ci-dessous :

|IMAGE Images/P1/P1C2_2.png| []

La vue du `UINavigationController` contient une barre de navigation dont nous avons déjà parlé, et **une vue conteneur qui a pour but unique d'afficher une page de votre application.**

> **:warning:** On ne peut pas modifier cette vue conteneur, on peut simplement la remplir avec le contenu d'un autre `ViewController`.

**On peut se représenter le `UINavigationController` comme un cadre photo numérique qui contient en haut une petite barre de navigation et à l'intérieur des photos qui défilent, les unes après les autres.** Ces photos sont en fait des `ViewController` qui correspondent chacun à une page de notre application.

#### La pile de navigation

Dans notre navigationcontroller, les `ViewController` vont donc défiler en suivant une logique précise, celle d'une **pile**.

Lorsque vous passez de la page A à la page B, la page B vient se rajouter par-dessus la page A. Même chose, si vous passez à la page C, elle vient se mettre par dessus la page B. Et comme vous pouvez le voir dans le schéma ci dessous, cela forme donc une pile.

|IMAGE Images/P1/P1C2_3.png| []

> **:warning:** Cela veut dire que lorsque l'utilisateur visualise la page C, les pages A et B sont toujours présentes dans la mémoire du téléphone. Elles sont seulement visuellement cachées. On en reparlera dans le chapitre sur le cycle de vie du contrôleur.

**Un navigation controller a donc pour rôle de gérer cette pile qui peut contenir en même temps plusieurs ViewController, mais n'en afficher qu'un seul à l'écran.**

Cela se traduit dans le code par la propriété `viewControllers` de la classe `UINavigationController` qui est un tableau de type `ViewController` et qui contient tous les contrôleurs présents dans la pile de navigation rangés par ordre de présentation.

#### Ajout du navigation Controller

Assez de théorie ! Ajoutons maintenant notre `UINavigationController`. Pour cela, il vous suffit de vous rendre dans la bibliothèque des objets en bas à droite et de sélectionner un UINavigationController.

|IMAGE Images/P1/P1C2_4.png| []

Vous n'avez plus qu'à le faire glisser dans le storyboard et vous devriez obtenir ceci :

|IMAGE Images/P1/P1C2_5.png| []

Sur la gauche, vous avez le navigation controller qui est déjà lié à un premier ViewController de type Table View Controller visible sur la droite. Ce deuxième contrôleur permet d'ajouter des listes et nous verrons cela dans un prochain cours donc vous pouvez le supprimer pour le moment.

#### En résumé
- Pour ajouter une barre de navigation, on utilise un navigation controller.
- Un navigation controller gère une vue qui contient une barre de navigation et une vue conteneur dans laquelle défile les pages de l'application.
- Un navigation controller a pour rôle de gérer une pile qui peut contenir plusieurs ViewController, mais n'en afficher qu'un seul à l'écran.
- On peut ajouter un navigation controller en le glissant depuis la bibliothèque des objets dans le storyboard.

Dans le prochain chapitre, nous allons créer la première page que présentera notre navigation controller !

### Créez votre première page

Dans le chapitre précédent, nous avons installé notre Navigation Controller dans le storyboard et nous avons supprimé le Table View Controller qui était proposé avec par défaut.

À la place, nous allons ajouter un `ViewController` tout simple dont vous avez l'habitude.

#### Ajout du rootviewcontroller

Vous pouvez trouver le `ViewController` dans la bibliothèque des composants :

|IMAGE Images/P1/P1C3_1.png| []

Glissez le dans le storyboard à côté de votre navigation controller. Maintenant votre storyboard doit ressembler à ceci :

|IMAGE Images/P1/P1C3_2.png| []

Il nous faut maintenant relier le navigation controller et notre view controller. L'idée, c'est de faire comprendre au navigation controller que le premier contrôleur à afficher, c'est notre contrôleur, ici à droite.

Pour faire cela, nous ressortons notre fameux *control drag* ! **Laissez la touche control enfoncée et faites un glisser-déposer depuis le contrôleur de navigation vers notre contrôleur**. La popup suivante apparaît :

|IMAGE Images/P1/P1C3_3.png| []

Cette popup nous demande le type de relation que l'on souhaite créer entre les deux contrôleurs. Choisissez `rootviewcontroller` pour signifier que le contrôleur racine, le premier dans la pile de navigation, c'est le contrôleur que nous venions d'ajouter dans le storyboard.

Lorsque la connection est faite, elle est matérialisée par la flèche entre les deux contrôleurs et notre contrôleur est maintenant doté d'une jolie petite barre de navigation.

|IMAGE Images/P1/P1C3_4.png| []

#### Personnalisez la barre de navigation

Il est temps maintenant de créer notre première interface dans le contrôleur que nous venons de rajouter. Le résultat final doit ressembler à ceci :

|IMAGE Images/P1/P1C3_5.png| []

Vous avez toutes les images et connaissances nécessaires pour y arriver seul donc je vous laisse faire !

> **:information_source:** Tant qu'à faire, rendez l'interface responsive, c'est un bon réflexe à prendre ! ;)

> **:warning:** L'image de patte avec l'inscription "*Go !*" est un bouton ! Pour utiliser une image au lieu d'un texte pour un bouton, il faut supprimer le texte et ajouter l'image dans la propriété `Image` :  
|IMAGE Images/P1/P1C3_6.png| []

Bien sûr, je ne vais pas vous laisser tout seul pour la customisation de la barre de navigation. Laissez-moi vous montrer !

Pour ajouter un titre dans la barre, sélectionnez dans le ViewController `Navigation Item` :

|IMAGE Images/P1/P1C3_7.png| []

Puis dans l'inspecteur d'attribut, modifier la propriété `Title`.

|IMAGE Images/P1/P1C3_8.png| []

Ensuite pour modifier l'aspect de la barre de navigation, cela se passe du côté du `UINavigationController` puisque, comme on l'a vu, c'est lui qui gère cette vue. Sélectionnez `Navigation Bar` dans le Navigation Controller.

|IMAGE Images/P1/P1C3_9.png| []

Et ensuite, vous pouvez modifier tout ce que vous voulez du côté de l'inspecteur d'attribut, notamment la couleur de la barre avec la propriété `Bar Tint` et la couleur du titre avec la propriété `Title Color`.

Et voilà vous avez une belle barre de navigation ! :D

#### Créez une sous-classe de ViewController

> **:question:** OK c'est beau. Mais comment on va faire fonctionner ce contrôleur ? On a supprimé le fichier `ViewController.swift` !

Ah la boulette ! Ne vous inquiétez pas, tout était calculé ;) !

Je vous propose de créer un nouveau contrôleur. Pour cela, allez dans File > New > File... ou <kbd>cmd + n</kbd>. Choisissez ensuite `Cocoa Touch Class` puis cliquez sur *next*.

|IMAGE Images/P1/P1C3_10.png| []

Ensuite, nommez votre classe `WelcomeViewController` et faites-en une sous-classe de `UIViewController`. Vous pouvez cliquer sur *next* puis *create* pour créer le fichier `WelcomeViewController.swift`.

|IMAGE Images/P1/P1C3_11.png| []

Et voilà ! Votre fichier est créé et nous avons une nouvelle classe `WelcomeViewController` !

Il suffit maintenant de faire le lien avec notre contrôleur dans le storyboard. Pour cela, sélectionnez le contrôleur dans le storyboard. Puis, dans les utilitaires, ouvrez l'inspecteur d'identité (troisième onglet) :

|IMAGE Images/P1/P1C3_12.png| []

Dans le champ `Class`, écrivez le nom de notre classe nouvellement créée : `WelcomeViewController`. Maintenant, notre contrôleur est de type `WelcomeViewController` et le lien entre le contrôleur dans le storyboard et celui dans le code est fait !

|IMAGE Images/P1/P1C3_13.png| []

#### Le contrôleur initial

Nous avons bien travaillé ! Et je vous connais, c'est le moment où vous adorez lancer votre application dans le simulateur pour voir que tout marche bien. Alors, allez-y ! Vous n’allez pas être déçu... :)

> **:question:** Mais... Mais mon écran est tout blanc ! L'appli ne se lance pas.

Haha ! Quel coquin je fais à vous tendre des pièges comme ça ! Sacré moi ! :D

Il se trouve que lorsque votre application iPhone se lance, il lui faut savoir quelle page afficher en premier.

D'abord, elle recherche le bon storyboard. Dans notre cas, c'est facile, il y en a qu'un. Ensuite dans le storyboard, **elle recherche le contrôleur marqué comme étant le contrôleur *initial***. Par défaut, c'est celui qu'on a supprimé au début de chapitre précédent. Du coup, l'application ne trouve pas la page initiale et donc elle affiche un écran blanc.

> **:question:** Oups...

Mais pas de panique, on va régler ça. Ici, notre contrôleur initial, c'est le navigation controller. Sélectionnez-le dans le storyboard. Puis rendez-vous dans l'inspecteur d'attributs et cocher la propriété `Is Initial View Controller`.

|IMAGE Images/P1/P1C3_14.png| []

Et voilà ! Vous pouvez vérifier que cela a fonctionné en lançant votre simulateur ou simplement en vérifiant qu'une flèche est apparue sur la gauche de votre navigation controller.

|IMAGE Images/P1/P1C3_15.png| []

#### En résumé
- Avec un control drag, vous pouvez sélectionner le contrôleur racine de votre pile de navigation.
- Pour personnaliser la barre de navigation, il vous faut sélectionner la Navigation Bar de votre Navigation Controller. Et ensuite, ça se passe comme d'habitude dans l'inspecteur d'attributs.
- Quand vous créez un nouveau contrôleur, il faut le créer dans le storyboard et dans le code en créant une sous-classe de `UIViewController`. Ensuite, pour les relier, il faut utiliser le champ `Class` dans l'inspecteur d'identité.
- Votre storyboard doit contenir au moins un contrôleur *initial* qui sera la première page ouverte par votre application.

Dans le prochain chapitre, nous allons créer notre deuxième page et vous allez créer votre toute première expérience de navigation entre deux pages.

### Créez votre premier segue
Même si nous avons deux contrôleurs dans le storyboard : `NavigationController` et `WelcomeViewController`, cela ne fait jamais qu'une interface pour l'utilisateur ! Il est temps d'en rajouter d'autres et de parler de navigation !

#### Ajout de la deuxième page

Nous allons ajouter la deuxième page de l'application qui va contenir le formulaire d'inscription. Nous allons appeler le contrôleur correspondant `FormViewController`. Je vous laisse créer la classe correspondante puis faîtes glisser un contrôleur dans le storyboard et donner lui la classe `FormViewController` nouvellement créée. C'est exactement la même manipulation que pour le `WelcomeViewController` du chapitre précédent.

> **:warning:** On travaille en MVC, donc je vous suggère de créer des groupes de fichier dans votre navigateur pour refléter cette architecture. Votre structure de fichier doit ressembler à ceci :
|IMAGE Images/P1/P1C4_1.png| []

Maintenant, nous allons construire la base de l'interface. Nous allons juste rajouter le bouton *Valider* en bas. Le résultat doit ressembler à ceci :

|IMAGE Images/P1/P1C4_2.png| []

#### Vous avez dit segue ?

Nous allons maintenant créer une première navigation. Lorsque l'utilisateur appuie sur le bouton *Go !*, on doit passer à la page du formulaire d'inscription.

Pour cela, nous allons créer ce qu'on appelle un **segue**.

> **:information_source:** C'est un mot anglais à prononcer [segwe] ;). On pourrait le traduire par *transition* en français, mais transition a une autre signification en iOS. Donc pour éviter la confusion, on va gentiment garder *segue* !

**Un segue, c'est un objet dans le storyboard, qui permet de créer une transition entre deux pages.** Et c'est exactement ce dont on a besoin. Et pour le créer, nous allons faire.... un control drag !

|IMAGE Images/P1/P1C4_3.jpg| [1 point pour ceux qui sauront apprécier la référence...]

Le control drag doit se faire **entre le bouton qui initie la transition**, ici notre bouton *Go !* **et le contrôleur qui doit être présenté**, ici notre `FormViewController`.

Allez-y !

|IMAGE Images/P1/P1C4_4.gif| []

Lorsque vous relâchez, une popup apparaît et vous propose plusieurs types de segues différents. Détaillons-les !

#### Présentation des différentes catégories de segue

Il y a 5 types de segues différents comme vous pouvez le voir sur la popup.

|IMAGE Images/P1/P1C4_5.png| []

> **:information_source:** Les 2 derniers sont marqués *deprecated* donc cela signifie qu'ils ne sont plus utilisés que pour des versions anciennes d'iOS. Les 5 au-dessus les remplacent.

Et pour vous expliquer qui est qui, je vous ai fait des super gifs !

> **:question:** En tout cas, c'est pas la modestie qui va t'étouffer...

Ma pause déjeuner y est passée donc un peu de respect ;) ! Bref, les voici :

##### Show

|IMAGE Images/P1/P1C4_6.gif| []

Le segue Show est le plus simple, **il ajoute tout simplement une page par dessus la précédente en la rajoutant sur la pile de navigation**. Il vient avec des petits trucs cool :
- L'animation que vous pouvez admirer ci-dessus
- Un bouton de retour dans la seconde page
- Un geste : si vous glissez votre doigt depuis le bord droit vous revenez à la page précédente.

> **:information_source:** Tout cela est contenu avec le segue, c'est compris dans le prix ;) ! Et vous n'avez pas à rajouter une ligne de code pour que ça fonctionne !

##### Show Detail

|IMAGE Images/P1/P1C4_7.gif| []

Sur iPhone, c'est exactement le même que *Show*. **Mais sur iPad, la deuxième page est présentée sans remplacer la précédente en se positionnant à sa droite**.

> **:information_source:** On appelle ce genre de présentation *master-detail*. Le master, c'est la liste à gauche qui décide ce qu'on affiche, le détail c'est le contenu qui se trouve à droite.

Ce segue est donc très pratique pour faire des applications qui s'adaptent sur un iPad !

##### Present Modally

|IMAGE Images/P1/P1C4_8.gif| []

Avec ce segue, que l'on appelle *Modal*, vous pouvez choisir plusieurs animations de transitions comme celle que vous avez ci-dessus ou une apparition en transparence ou d'autres. Sur un iPad, en général, la nouvelle page ne prend pas tout l'écran et elle obscurcit la page derrière.

Contrairement au Show, **ce segue ne comprend pas un moyen de revenir en arrière**. Il faut créer son propre au bouton. Par ailleurs, il n'y a plus de barre de navigation. Donc même si techniquement, ce segue rajoute une vue à la pile de navigation comme les autres, d'un point de vue utilisateur, il interrompt le flux de navigation.

##### Present As Popover

|IMAGE Images/P1/P1C4_9.gif| []

Sur iPhone, vous obtiendrez par défaut un segue *Present Modally*. Mais sur iPad (ou sur iPhone si vous changez le réglage), vous obtiendrez **une popup accrochée visuellement à l'élément d'interface qui l'a appelé**.

##### Custom

Comme son nom l'indique, vous pouvez créer vos propres segues pour imaginer des transitions spectaculaires !

> **:information_source:** Si vous vous sentez de créer un custom segue, je vous recommande cette excellente [vidéo](https://www.youtube.com/watch?v=jn-93qElOT4) (en anglais...). Et si vous voulez aller plus loin et apprendre à faire des transitions complexes entre deux vues, je vous recommande [ce tutoriel](https://www.raywenderlich.com/170144/custom-uiviewcontroller-transitions-getting-started) (anglais aussi).

##### Attention !

> **:warning:** Si vous essayez de lancer un segue de type Show, mais que vous n'avez pas mis de Navigation Controller préalablement, vous obtiendrez un segue de type Present Modally, car sans Navigation Controller, vous n'aurez pas de pile ni de barre de navigation. N'oubliez donc pas le Navigation Controller !

#### Ajout des segues

##### Segue show
Il ne nous reste plus, après cette parenthèse théorique, qu'à ajouter notre segue. Faîtes votre control drag depuis le bouton *Go !* vers le `FormViewController` et dans la popup, choisissez le segue `Show`.

Vous constatez qu'une barre de navigation est apparue sur le contrôleur et le segue est matérialisé par une flèche entre les deux.

|IMAGE Images/P1/P1C4_10.png| []

Vous pouvez tester l'interaction dans votre simulateur et ça marche ! Pas plus compliqué
qu'un control drag !

##### Segue modal

Pour le plaisir, je vous propose qu'on se rajoute une troisième page. Cette page sera affichée lorsqu'on appuie sur le bouton *Valider* du `FormViewController` et elle informera l'utilisateur que son inscription a été prise en compte avec succès.

Comme d'habitude, vous allez créer une classe que l'on va appeler cette fois `SuccessViewController`, glisser un troisième ViewController dans le storyboard et lui donner la classe `SuccessViewController`.

Ensuite, nous allons juste ajouter un label pour informer l'utilisateur. Je vous laisse faire et ça donne ça :

|IMAGE Images/P1/P1C4_11.png| []

Maintenant que notre troisième interface est prête, nous allons créer le segue entre le bouton Valider du `FormViewController` et le `SuccessViewController`. Toujours pareil : avec le control-drag. Mais cette fois-ci, je vous suggère de choisir *Present Modally*. Et voici notre storyboard finalisé :

|IMAGE Images/P1/P1C4_12.png| []

> **:information_source:** Je positionne le dernier contrôleur au-dessus pour signifier qu'il interrompt l'expérience de navigation de gauche à droite à cause du segue modal.

Vous remarquez en lançant l'application que votre troisième page arrive avec une transition depuis le bas de l'écran. Mais elle ne contient ni barre de navigation ni bouton retour. Donc on est coincé sur cette interface ! Nous allons voir dans le prochain chapitre comment revenir en arrière.

#### En résumé
- Un segue, c'est un objet dans le storyboard, qui permet de créer une transition entre deux pages.
- Il existe 5 types de segues : Show, Show Detail, Present Modally, Present As Popover, Custom. Choisissez-les avec précaution !
- Pour créer un segue, on fait un control-drag depuis un bouton vers la page à afficher.

### Revenez en arrière !
Malgré le titre de ce chapitre, soyez bien certains que vous allez de l'avant dans vos connaissances en navigation iOS. Nous allons apprendre à revenir en arrière dans la pile de navigation d'abord d'un cran puis de plusieurs d'un coup !

#### Quittez le succès !

Notre `SuccessViewController` est bien beau, mais quand on atterrit dessus, on ne peut plus en partir ! Il n'y a pas de bouton retour ! Cela est dû au segue *Present Modally* que l'on a choisi pour afficher cette page.

Qu'à cela ne tienne, nous allons le créer ! Rajoutez un bouton en haut à gauche sur l'interface. Je vous suggère d'y mettre juste une croix. C'est suffisant pour qu'on en comprenne le sens.

|IMAGE Images/P1/P1C5_1.png| []

Nous allons maintenant créer une action. Je vous suggère de la nommer `dismiss`. Car son rôle va être de faire disparaître la page.

> **:information_source:** Rappel : pour créer une action, il vous suffit de faire un control-drag depuis le bouton vers le code. Rafraîchissez-vous la mémoire  [ici](https://openclassrooms.com/courses/introduction-a-ios-plongez-dans-le-developpement-mobile/creez-votre-premiere-action).

Notre action étant créée, nous allons pouvoir l'implémenter. Et ça va être très simple, nous allons juste utiliser une méthode de `ViewController` qui s'appelle... `dismiss` ! Vous pouvez écrire ceci dans votre action :

```swift
@IBAction func dismiss() {
	dismiss(animated: true, completion: nil)
}
```

La méthode `dismiss` prend deux paramètres :
- `animated` : si le paramètre est à `true`, la transition sera animée. C'est en général l'animation inverse de l'animation d'apparition de la page.
- `completion` : c'est un block qui vous permet d'exécuter du code lorsque la page a disparu au cas où vous ayez besoin de faire quelque chose de spécifique à ce moment-là.

Et c'est tout ! Vous pouvez tester dans le simulateur et ça marche, la vue disparaît lorsqu'on appuie sur la croix !

#### Deux techniques de disparition

Vous savez maintenant utiliser `dismiss` pour faire disparaître programmatiquement un contrôleur. Mais sachez qu'il y a deux techniques différentes et cela dépend du segue que vous avez utilisé.

On a vu qu'il y a plusieurs types de segues et on peut les regrouper en deux groupes :

| Push        | Modal              |
|-------------|--------------------|
| Show        | Present Modally    |
| Show Detail | Present As Popover |

**Les transitions de type Modal sont régies par les ViewController eux-mêmes**. Dans ce cas-là, on peut directement utiliser la méthode `dismiss` comme on vient de le faire.

**Les transitions de type Push ne sont possibles qu'en présence d'un Navigation Controller** car c'est lui qui sait gérer ce genre de transition. C'est la raison pour laquelle il y a une barre de navigation quand on utilise ce genre de segue. Du coup, programmatiquement, c'est le Navigation Controller qui va avoir la responsabilité de faire disparaître le contrôleur et on va écrire la commande suivante.

```swift
navigationController?.popViewController(animated: true)
```

`navigationController` est une propriété de `ViewController`. C'est un optionnel d'où le point d'interrogation. Et le paramètre `animated` a le même rôle que dans dismiss.

J'en profite aussi pour vous parler de la navigation dans le code (si on n'utilise pas les segues du storyboard). Et je vous résume tout ça dans ce schéma :

|IMAGE Images/P1/P1C5_2.png| []

> **:warning:** Inutile de vous accrocher à le retenir, mais souvenez-vous que **tout ce qu'on peut faire dans le storyboard a un équivalent dans le code** ! Par ailleurs, ceci est un résumé, mais il y a des méthodes plus précises, mais vous ne devriez pas en avoir besoin dans 99% des cas.

#### Revenir au début
Pour l'instant, nous n'avons parlé que de navigation d'une page à l'autre. Mais ce serait pratique d'avoir un bouton dans notre dernière page qui nous ramène tout au début pour lancer l'inscription pour un deuxième chien par exemple !

Commençons par créer ce bouton "Inscrire un autre chien". Je vous laisse faire, voici l'objectif :

|IMAGE Images/P1/P1C5_3.png| []

C'est bon ? Alors, continuons !

La première idée qui vient c'est de créer un segue depuis notre bouton vers la première page. Mais ça ne va pas marcher. Souvenez-vous les pages sont empilées les unes sur les autres comme ceci :

|Pile   |
|-------|
|Success|
|Form   |
|Welcome|

Si on crée un segue qui revient à la première page, on rajouterait en fait la première page à nouveau dans la pile :

|Pile   |
|-------|
|Welcome|
|Success|
|Form   |
|Welcome|

Et la navigation forme un cycle infini et n'est plus compréhensible ! À la place, il faut ôter les pages les unes après les autres. Mais ici, nous voulons enlever deux pages d'un coup pour obtenir ceci :

|Pile   |
|-------|
|Welcome|

Le problème, c'est que les segues ne peuvent que retirer une page à la fois. Nous allons devoir utiliser un type spécial de segue : les **unwind segues**.

##### Créer un unwind segue

La particularité de ses segues, c'est qu'ils peuvent vous mener n'importe où dans votre application en respectant la pile de navigation !

Ils fonctionnent comme le tir à l'arc. Il faut d'abord créer une cible sur la page à laquelle on veut revenir, ici `WelcomeViewController`. Puis on lance une flèche vers cette cible.

|IMAGE Images/P1/P1C5_3bis.png| []

Alors, créons d'abord la cible. Pour cela, il faut se rendre dans le code du contrôleur qu'on cherche à atteindre, ici `WelcomeViewController` et rajouter le code suivant :

```swift
@IBAction func unwindToWelcome(segue:UIStoryboardSegue) { }
```

Oui cette méthode est vide ! Elle ne sert qu'à déclarer le contrôleur comme cible potentielle d'un unwind segue.

> **:information_source:** Le nom `unwindToWelcome` peut bien sûr être changé, mais ne touchez pas au reste de la méthode ;).

> **:information_source:** Cette méthode sera exécutée lorsqu'on sera revenu à l'interface Welcome. Donc vous pouvez écrire du code à l'intérieur, si vous avez besoin d'effectuer une action à ce moment-là.

Maintenant, il faut lancer la flèche et pour cela, il faut faire... un control drag ! Il doit démarrer du bouton responsable de lancer la transition vers l'icône exit en haut du contrôleur.

|IMAGE Images/P1/P1C5_4.png| []

Quand vous lâchez, vous verrez une popup contenant la méthode que nous venons de créer dans `WelcomeViewController` ! Sélectionnez-la et... c'est terminé !

|IMAGE Images/P1/P1C5_5.gif| []

Vous pouvez tester et constater que le bouton ramène bien à la première page en supprimant ainsi les pages 2 et 3 de la pile de navigation en une fois !

#### En résumé
- Lorsqu'on travaille avec des segues de type *Modal*, on doit créer un bouton pour revenir en arrière.
- On utilise la méthode `dismiss` pour faire disparaître une vue créée par un segue modal.
- Le navigation controller est responsable de la navigation d'un segue de type *Push*.
- Les unwind segues permettent de sauter plusieurs pages dans la pile de navigation. Il faut d'abord créer une cible sur la page à atteindre puis créer le segue vers cette cible en utilisant l'icône *Exit*.

Dans le prochain chapitre, nous allons parler des autres modes de navigation en iOS.

### Ajoutez une barre d’onglets
Jusqu'à présent nous avons parlé d'un seul mode de navigation avec `UINavigationController`. Mais il est utile que vous connaissiez les autres pour pouvoir les utiliser dans vos applications !

#### Différents modes de navigations
Il existe 4 modes de navigations dans en iOS :
- Barre de navigation avec `UINavigationController`
- Barre d'onglets avec `UITabBarController`
- Côte à côte avec `UISplitViewController`
- Pagination avec `UIPageViewController`

Nous avons déjà étudié le premier et dans ce chapitre nous allons nous intéresser au second. En attendant, je vous propose de parcourir rapidement les différences entre chacun.

#### Navigation

C'est ce qu'on a vu jusqu'à présent. Les contrôleurs forment une pile de navigation et une barre de navigation permet de revenir en arrière en *dépilant* les pages.

|IMAGE Images/P1/P1C6_1.gif| []

#### Barre d'onglets

La barre d'onglets se situe en bas et est composée de différentes icônes. En général, à chaque icône correspond une section différente de l'application et on peut naviguer entre elles en cliquant sur l'icône correspondante.

|IMAGE Images/P1/P1C6_2.gif| []

##### Côte à côté

On en a déjà un peu parlé, lorsqu'on a mentionné le segue `Show Detail`. C'est le type de navigation ou l'interface est divisée en deux contrôleurs, l'un est le `master` et l'autre est le `detail`.

C'est très utile lorsqu'on a une liste d'éléments à montrer et qu'on veut visualiser le détail sans quitter la liste.

|IMAGE Images/P1/P1C6_3.gif| []

> **:information_source:** Nous ne verrons pas cela ensemble, je vous suggère ces deux tutoriels si vous souhaitez aller plus loin : [ici](http://nshipster.com/uisplitviewcontroller/) ou [là](https://www.raywenderlich.com/173753/uisplitviewcontroller-tutorial-getting-started-2).

##### Pagination

Dans ces interfaces, les pages sont les unes à côté des autres et on peut passer de l'une à l'autre en glissant de gauche à droite. En général, des points en bas permettent de situer l'utilisateur.

C'est souvent utilisé dans les tutoriels introductifs des applications.

|IMAGE Images/P1/P1C6_4.gif| []

> **:information_source:** Nous ne verrons pas cela ensemble, je vous suggère ce [tutoriel](http://www.seemuapps.com/page-view-controller-tutorial-with-page-dots) si vous souhaitez aller plus loin.

##### Résumé

Le schéma ci-dessous résumé la navigation en iOS. Prenez le temps de le parcourir.

|IMAGE Images/P1/P1C6_5.png| []

> **:information_source:** Pour information, les autres composants en jaune dans la bibliothèque des composants sont tous des contrôleurs comme `ViewController`. Mais à la différence de ceux cités ci-dessus, ils ont pour but d'afficher du contenu, ce sont des pages et non des outils pour gérer la navigation.

#### Il va falloir se mettre à Tab !

Assez parlé, nous allons maintenant améliorer notre application. En effet, je vous ai vendu une application de rencontre pour chien et chat et pour le moment, pas un miaou à l'horizon ! :D

Nous allons diviser notre application en deux, une partie pour les chats et l'autre pour les chiens. Et pour cela, nous allons ajouter une barre avec deux onglets, un pour chaque espèce.

Et vous allez voir que ce n'est pas bien compliqué ! Sélectionnez le Tab Bar Controller dans votre bibliothèque des composants.

|IMAGE Images/P1/P1C6_6.png| []

Faîtes-le glisser dans le storyboard et vous devriez obtenir ceci :

|IMAGE Images/P1/P1C6_7.png| []

Vous avez le Tab Bar Controller à gauche.

> **:information_source:** Son contenu est grisé comme notre Navigation Controller. Cela nous rappelle qu'on ne peut pas changer son contenu.

Et il est déjà relié à deux contrôleurs qui ont été créés et reliés automatiquement pour nous. Nous n'en avons pas besoin donc vous pouvez les supprimer tous les deux.

À la place, nous allons plutôt relier le Tab Bar Controller aux contrôleurs que nous avons déjà créés, ce sera l'onglet des chiens et à un nouveau contrôleur que nous allons rajouter tout de suite, ce sera l'onglet des chats !

#### Bienvenue les chats, ou pas...
Vous commencez à être extrêmement doué dans l'ajout de contrôleur donc je vous laisse créer une classe `CatWelcomeViewController` puis glisser un contrôleur correspondant dans le storyboard et le relier à la classe `CatWelcomeViewController`.

Pour l'instant, nous allons juste ajouter un petit message d'accueil... pas très accueillant car la phase d'inscription n'est pas prête pour les chats. Voici mon résultat, faîtes bien comme bon vous semble pour cette page :

|IMAGE Images/P1/P1C6_8.png| []

Maintenant nous allons relier le Tab Bar Controller à notre nouvelle interface. Et vous l'avez deviné, **nous allons faire un control drag** ! Il doit commencer dans le Tab Bar Controller et finir dans le contrôleur que l'on souhaite relier, ici `CatWelcomeViewController`.

Ensuite une popup apparaît, choisissez *view controllers*. Ce segue de relation indique que l'on va rajouter le contrôleur aux contrôleurs accessibles depuis la barre d'onglets.

|IMAGE Images/P1/P1C6_9.png| []

Quand c'est fait, la barre d'onglet apparaît sur le `CatWelcomeViewController` et sur la Tab Bar Controller avec un premier onglet.

|IMAGE Images/P1/P1C6_10.png| []

#### Ajoutons les chiens !

Maintenant, nous allons ajouter les chiens. Et c'est exactement la même manipulation. Mais il nous faut prendre deux petites précautions.

##### 1/ Le contrôleur initial

**Le point d'entrée de notre application va changer.** En effet, le Navigation Controller n'est plus le plus haut niveau de la navigation, c'est la barre d'onglets. Donc c'est elle qui devient le contrôleur initial.

Pour changer cela, vous pouvez aller dans l'inspecteur d'attributs comme on l'a vu ensemble ou simplement déplacer la flèche comme ceci :

|IMAGE Images/P1/P1C6_11.gif| []

##### 2/ Relier au Navigation Controller

**Faites bien attention à relier le Tab Bar Controller au `Navigation Controller`**.

> **:warning:** En effet, cet onglet doit mener vers toute la pile de navigation et pas seulement vers le `WelcomeViewController`.

##### Allez-y !

Vous pouvez maintenant faire votre control drag depuis le Tab Bar Controller vers le Navigation Controller et choisir l'option *view controllers*. Le deuxième onglet apparaît sur la barre d'onglet et cette dernière est rajoutée sur tous les contrôleurs jusqu'à `FormViewController`.

> **:information_source:** Le dernier est présenté en modal donc, comme on l'a dit, il sort de la navigation et n'a donc ni la barre de navigation, ni la barre d'onglets.

|IMAGE Images/P1/P1C6_12.png| [Le storyboard complet, c'est pas beau ?]

> **:information_source:** Avec la copie d'écran ci-dessus, vous pouvez voir l'un des grands intérêts du storyboard : on peut visualiser très facilement l'architecture de la navigation dans l'application.

#### Personnalisez la barre d'onglets

Tout ça, c'est bien beau, mais nos onglets se nomment pour l'instant *Item*, c'est pas incroyablement clair. On peut faire mieux !

Pour changer le contenu d'un onglet, il faut le sélectionner dans le contrôleur correspondant. Allez donc dans le Navigation Controller et choisissez Item.

|IMAGE Images/P1/P1C6_13.png| []

Puis dans l'inspecteur d'attribut, nous allons pouvoir modifier ses propriétés :

|IMAGE Images/P1/P1C6_14.png| []

Passez la propriété `Title` à "Chien" et choisissez "Dog" pour la propriété `Image`. Vous pouvez faire exactement la même chose pour les chats et vous obtenez cette magnifique barre d'onglets !

|IMAGE Images/P1/P1C6_15.png| []

> **:information_source:** Si vous voulez créer vos propres icônes pour la Tab Bar, l'idéal c'est de faire des images de 25*25px en png noire sur fond transparent.

Vous avez sans doute remarqué que le Tab Bar Controller colore automatiquement les onglets. En bleu pour l'onglet sélectionné et grisé pour les autres.

Vous pouvez modifier cela en sélectionnant la barre d'onglet dans le Tab Bar Controller et en vous rendant l'inspecteur d'attributs. Vous n'avez plus qu'à changer la propriété `Image Tint` et vos onglets seront sélectionnés dans un élégant et délicat violet.

|IMAGE Images/P1/P1C6_16.png| []

Et voilà vous avez une magnifique barre d'onglets ! Vous savez maintenant la grande majorité de ce qu'il y a à savoir sur la navigation en iOS ! Et si on fait le bilan, c'est seulement quelques control drags ! Pratique, non ?

> **:information_source:** Dernière petite info sur les Tab Bar Controller : une barre d'onglets peut contenir jusqu'à 5 onglets simultanément. Au-delà, le dernier onglet se transforme en ceci :  
|IMAGE Images/P1/P1C6_17.png| []  
En cliquant sur ce dernier onglet, l'utilisateur a accès aux autres onglets.

#### En résumé
- Il existe 4 types de navigation en iOS : Navigation, TabBar, Split, et Page.
- Pour créer une barre d'onglet, il suffit de glisser un Tab Bar Controller dans le storyboard et de le relier aux autres contrôleurs avec un control drag.
- Vous pouvez personnaliser chaque onglet en le sélectionnant dans le contrôleur correspondant et en ouvrant l'inspecteur d'attribut.

Le prochain chapitre et le dernier de cette partie est vraiment important. Vous allez comprendre ce qu'est et comment fonctionne le cycle de vie du contrôleur. Ce qui est à la base d'une bonne utilisation d'un contrôleur !

### Analysez le cycle de vie du contrôleur
Voilà un petit bout de temps que vous utilisez les contrôleurs et vous avez certainement croisé des méthodes comme :

```swift
override func viewDidLoad() {
	super.viewDidLoad()
	// Do any additional setup after loading the view.
}
```

Et à moins d'avoir déjà été suffisamment curieux pour chercher par vous même, vous ne savez sans doute pas précisément ce qu'il se passe dans cette méthode. Dans ce chapitre, nous allons lever un voile sur tout ça en parlant du cycle de vie du contrôleur.

|IMAGE Images/P1/P1C7_1.jpg| []

Certes, mais ne paniquez pas ! Ça va vous servir à peu près tous les jours dans votre vie de développeur iOS, donc ça vaut le coup ! Et puis, ça ne vous fera pas de mal, je vous trouve un peu trop heureux là...

#### De quoi ça va causer ?

Non, on ne va pas parler de biologie ! **Le cycle de vie du contrôleur décrit les étapes par lesquels passe le contrôleur entre la demande d'affichage d'une nouvelle page et sa disparition de l'écran**.

Autrement dit, le cycle de vie, c'est l'histoire de la naissance, la vie et la mort d'un contrôleur.

#### La naissance

Un contrôleur passe par de nombreuses étapes avant que la vue ne soit affichée à l'écran. Comprendre ces étapes va vous permettre de les utiliser pour effectuer certaines préparations ou actions sur ce dernier.

##### Initialisation
> **:warning:** Pour rappel, le contrôleur même si on a tendance à l'associer à une vue **n'est pas une vue**. Il contrôle la vue qui est un objet différent de lui même.

La première étape, comme pour n'importe quel objet, c'est l'initialisation du contrôleur. L'objet contrôleur est créé en mémoire avec toutes ses propriétés. Comme toute initialisation, cela se fait à l'occasion de la méthode `init` :

```swift
init?(coder aDecoder: NSCoder)
```
> **:information_source:** Vous pouvez faire l'override de cette initialisation dans vos sous-classes de `UIViewController` et initialiser des propriétés et dépendances dont vous avez besoin, mais dans le cas courant, vous ne ferez rien.

À cette étape, on a juste instancié un objet. Il n'est pas question de la vue. C'est comme lorsque vous écrivez ceci :

```swift
var monObjet = Objet()
```

> **:information_source:** Pour prendre une métaphore, c'est comme ci on construisait un lecteur DVD, mais on ne s'occupe pas du DVD.

##### Chargement de la vue
L'étape suivante, c'est le chargement de la vue. À cette étape, on crée en mémoire la propriété `view` du contrôleur, la vue principale (rappel sur cette notion [ici](https://openclassrooms.com/courses/concevez-une-application-iphone-avec-le-modele-mvc/decouvrez-uiview#/id/r-4573206)). On va y ajouter toutes les sous-vues. On va pouvoir les placer, les modifier, etc. À cette étape, on prépare toutes les propriétés de la vue et de ses sous-vues. Mais **on ne les affiche pas à l'écran**.

> **:information_source:** C'est l'étape où l'on construit le DVD.

Cela a lieu dans cette méthode :

```swift
func loadView()
```

Vous pouvez faire l'override de cette méthode si vous souhaitez créer vos vues dans le code. Mais si vous utilisez le storyboard, c'est fait automatiquement pour vous et vous pouvez ignorer cette étape.

Une fois cette étape terminée, la fameuse fonction `viewDidLoad` est appelée :

```swift
func viewDidLoad()
```

Quand cette fonction est appelée, **la vue est donc complètement chargée en mémoire, mais elle n'est pas affichée à l'écran**.

> **:information_source:** Dans cette étape, vous pouvez initialiser des objets dont vous aller avoir besoin pour la vue ou lancer des tâches de fond comme charger des données sur internet.


##### Affichage de la vue à l'écran
Le contrôleur est prêt, la vue est prête. On va pouvoir l'afficher à l'écran de l'iPhone.

> **:information_source:** C'est le moment où on met le DVD dans le lecteur et qu'on le lance.

Cette étape s'accompagne de deux méthodes :

```swift
func viewWillAppear(_ animated: Bool)
func viewDidAppear(_ animated: Bool)
```

La première est appelée **juste avant que la vue soit affichée à l'écran**. C'est le bon moment pour préparer une animation que l'on veut jouer à l'affichage de la vue.

La deuxième est appelée **juste après que la vue soit affichée à l'écran**. C'est le bon moment pour lancer une animation, un son ou une vidéo. La vue vient d'arriver à l'écran, l'utilisateur va pouvoir en profiter !

#### La vie

Ça y est ! La vue est à l'écran. L'utilisateur va interagir avec en cliquant sur des boutons, en la visualisant simplement ou en faisant des gestes sur l'écran tactile.

> **:information_source:** Le DVD est tranquillement en train d'être joué.

C'est là qu'intervient la majeure partie de votre travail en tant que développeur. Il y a simplement une petite chose à noter ici : la gestion de la mémoire.

Vous avez peut-être aperçu cette méthode :

```swift
func didReceiveMemoryWarning()
```

Un iPhone, contrairement à un ordinateur, c'est petit. Du coup, ses capacités sont limitées. Il ne peut retenir qu'un nombre limité d'objets en même temps dans ce qu'on appelle sa mémoire vive. Et s’il est sur le point d'atteindre sa limite, il vous prévient avant pour que vous puissiez libérer la mémoire de choses inutiles.

> **:information_source:** Prenons un exemple, si vous voulez afficher le texte complet de toute la saga Harry Potter dans une seule vue, la mémoire de votre iPhone risque de flancher et vous aurez l'occasion dans la fonction `didReceiveMemoryWarning` de supprimer une partie du texte pour alléger la charge.

#### La mort
Eh oui, cette histoire ne se finit par très bien... :/

##### Disparition de l'écran
Lorsque votre vue va disparaître de l'écran, si vous passez à la vue suivante par exemple, deux méthodes vont être appelées :

```swift
func viewWillDisappear(_ animated: Bool)
func viewDidDisappear(_ animated: Bool)
```

Comme précédemment, la première est appelée avant la disparition de la vue à l'écran et la deuxième juste après.

> **:information_source:** Vous pouvez utiliser la deuxième pour interrompre des processus dont vous n'avez plus besoin dans le contrôleur, par exemple l'exécution d'une animation ou l'écoute d'une notification.

> **:information_source:** Pour poursuivre la métaphore, le DVD est éjecté.

##### Suppression du contrôleur
Si votre vue n'est plus à l'écran, cela ne signifie pas forcément la fin définitive pour votre contrôleur. Prenons un exemple pour bien comprendre ce point.

Mettons que j'ai un Navigation Controller qui gère la navigation entre deux contrôleurs A et B.

1/ A l'allumage de l'application, le contrôleur A est créée puis la vue A correspondante est chargée en mémoire et ensuite la vue A est montré à l'écran.  

2/ Ensuite, l'utilisateur navigue vers le contrôleur B. La vue A du coup disparaît de l'écran et le contrôleur B est créé puis la vue B est chargée et enfin elle apparaît à l'écran.

Notre pile de navigation ressemble à ceci :

| Pile |
|------|
|  B   |
|  A   |

Donc **le contrôleur A existe toujours puisqu'il est stocké dans la pile de navigation**. Mieux, la vue est toujours chargée ! Elle n'est juste pas montrée à l'écran.

3/ L'utilsateur revient à la vue A et la pile de navigation ressemble à ceci :

| Pile |
|------|
|  A   |

Non seulement la vue B a disparu de l'écran, mais cette fois le contrôleur B n'est plus stocké dans la pile de navigation. Le contrôleur B a bel et bien été supprimé de la mémoire.

> **:warning:** Il faut donc bien que vous reteniez que la présence ou non de la vue à l'écran n'est pas directement corrélée à l'existence ou non du contrôleur. **Le contrôleur peut continuer à vivre sans que la vue ne soit à l'écran**. Il suffit qu'il soit toujours stocké dans la pile de navigation.

**La mort effective du contrôleur a donc lieu lorsqu'il quitte la pile de navigation.**

##### viewDidLoad VS viewDidAppear

Cela a une conséquence importante pour deux méthodes que vous risquez d'utiliser souvent : `viewDidLoad` et `viewWillAppear` :
- `viewDidLoad` est appelée **une seule fois** dans la vie du contrôleur
- `viewDidAppear` est appelée **plusieurs fois**

> **:question:** Pourquoi ?

Reprenons notre exemple avec les contrôleurs A et B. Et concentrons-nous uniquement sur l'enchaînement des méthodes du cycle de la vie de A.

1/ A est appelée à l'écran, les méthodes suivantes sont exécutés :

```swift
// Le contrôleur est créé en mémoire
init?(coder aDecoder: NSCoder)

// La vue est chargée
loadView()
viewDidLoad()

// La vue apparaît à l'écran
viewWillAppear(_ animated: Bool)
viewDidAppear(_ animated: Bool)
```

Jusque là `viewDidLoad` et `viewDidAppear` ont toutes les deux été appelées une fois.

2/ On passe à la vue B. Sur le contrôleur A, les méthodes suivantes sont exécutées.

```swift
// La vue disparaît de l'écran
viewWillDisappear(_ animated: Bool)
viewDidDisappear(_ animated: Bool)
```

3/ On revient à la vue A. Les méthodes suivantes sont appelées :

```swift
// La vue revient à l'écran
viewWillAppear(_ animated: Bool)
viewDidAppear(_ animated: Bool)
```

Et voilà, `viewDidAppear` (et `viewWillAppear` d'ailleurs) est appelé une seconde fois, mais `viewDidLoad` n'a pas été appelée.

> **:question:** Pourquoi on ne repasse pas par `viewDidLoad` ?

Vous connaissez déjà la réponse ! Alors, débrouillez-vous !

> **:question:** Si je pose la question a priori...

Bon OK. Comme on l'a vu juste au-dessus, le contrôleur A reste stocké dans la pile de navigation quand B est à l'écran. **Donc le contrôleur A continue à exister et il garde la vue chargée en mémoire pour pouvoir à tout moment la refaire passer à l'écran sans avoir à tout recharger.**

Et donc si je fais dix fois l'aller-retour entre A et B, je vais passer dix fois par `viewDidAppear,` mais je ne repasse plus par `viewDidLoad` car la vue n'a pas été rechargée.

> **:question:** OK je vois.

Merci ;) !

Du coup, si vous voulez recharger le contenu d'une page à chaque fois qu'elle apparaît, il faudra mettre cela dans `viewWillAppear` plutôt que `viewDidLoad`. En revanche, si vous souhaitez vous placer en tant qu'observeur pour une notification par exemple, vous n'avez besoin de le faire qu'une fois donc faîtes le dans `viewDidLoad`.

> **:information_source:** Si tout cela n'est pas encore parfaitement clair pour vous, je vous suggère de jeter un oeil à l'animation suivante. Vous pouvez également retrouver le projet Github correspondant à [cette adresse](https://github.com/AmbroiseCollon/ControllerLifeCycle/blob/master/README.md).
|IMAGE Images/P1/P1C7_2.gif| []

#### Résumé

En guise de résumé, je vous propose le schéma ci-dessous :

|IMAGE Images/P1/P1C7_3.png| []

Ça y est  ! Vous avez toutes les bases de navigation et comme tout en iOS, il y a beaucoup d’autres choses que vous pouvez aller découvrir par vous même ! Mais si la fondation est solide, le reste ira tout seul, vous n’avez plus besoin de moi !

Dans la prochaine partie, nous allons créer le formulaire d’inscription et vous allez découvrir comment utiliser les composants principaux d’un formulaire, comme les switchs, les champs de texte, les sélecteurs et d’autres !

## Créez un formulaire

### Mettez en forme votre formulaire
Nous avons créé dans la partie précédente l'intégralité de la navigation de notre application ! Mais nous avons un peu délaissé l'interface. En particulier, celle correspondant au `FormViewController`...

|IMAGE Images/P2/P2C1_1.png| []

Nous avons un joli bouton Valider qui pour le moment ne valide pas grand-chose... Dans ce chapitre, nous allons créer l'interface de ce formulaire et découvrir certains composants essentiels en iOS !

Voici l'objectif :

|IMAGE Images/P2/P2C1_2.png| []

#### Le nom
Pour s'inscrire, l'utilisateur va devoir renseigner son nom. Et pour cela nous allons utiliser ce qu'on appelle un **champ de texte**. Un champ de texte se matérialise par une barre blanche dans laquelle on peut écrire du texte.

La classe correspondante en iOS se nomme `UITextField`. Je vous invite à aller chercher un champ de texte dans la bibliothèque des composants et à le faire glisser sur l'interface.

|IMAGE Images/P2/P2C1_3.png| []

Le champ de texte a plusieurs propriétés intéressantes que l'on va regarder ensemble du côté de l'inspecteur d'attributs :

|IMAGE Images/P2/P2C1_4.png| []

##### 1/ Text
La propriété `Text` permet de **préremplir le champ de texte avec le texte de son choix**.
> **:information_source:** Ensuite les propriétés `Color` et `Font` permettent bien sûr de modifier la couleur et la police du texte.

##### 2/ Placeholder
La propriété `Placeholder` permet de **préremplir le champ de texte avec une indication grisée qui s'effacera dès que l'utilisateur commence à écrire**.

> **:warning:** Il faut bien faire la différence avec la propriété `Text`.

Vous pouvez par exemple écrire *Médor* ici pour donner un exemple de nom.

##### 3/ Border Style
La propriété `Border Style` permet de **changer le style de la bordure** autour du champ de texte.

> **:information_source:** À noter que le premier choix corresponds à "Pas de bordure". Cela peut-être pratique si vous travaillez sur un design particulier de champ de texte. Je vous laisse choisir ce qu'il vous plaît !

##### 4/ Clear Button
La propriété `Clear Button` permet d'afficher un bouton qui supprime le contenu complet du champ de texte pour que l'utilisateur puisse revenir à zéro. C'est très utile dans les champs de recherche notamment.

|IMAGE Images/P2/P2C1_5.png| []

> **:information_source:** Vous pouvez aussi choisir que le champ de texte se vide dès que l'édition démarre en cochant la case `Clear when editing begins`.

##### 5/ Text Input Traits

Les propriétés sous `Text Input Traits` concernent le clavier ! Elles permettent de customiser ce dernier. En effet, le clavier en iOS est géré par le champ de texte. Parmi les propriétés intéressantes, vous avez :
- `Content Type` : cela permet de donner des informations au système sur le **rôle** du champ de texte et d'adapter ainsi certains aspects du clavier. Je vous invite à choisir la valeur `Nickname`.
- `Capitalization` : si le clavier passe automatiquement les débuts de phrases, de mots ou tous les caractères en **capital**.
- `Correction` : cela permet d'activer ou non la **correction automatique** du clavier. Si elle est activée, les mots sont automatiquement corrigés sans intervention de l'utilisateur. Je vous invite à la désactiver. Ça risque de gêner plutôt qu'autre chose l'écriture du nom.
- `Spell Checking` : cela permet d'activer ou non le **détecteur de fautes**. S'il est activé, les fautes sont surlignées. Même chose, désactivez-le ici.
- `Keyboard Type` : cette propriété très importante permet de **changer de clavier**. En effet, il y a plusieurs claviers différents : pour entrer des numéros de téléphone, des emails, des urls, des chiffres, etc.
- `Keyboard Look` : Le clavier a deux **aspects** possibles : sombre ou clair.
- `Return Key` : Vous pouvez choisir ce qui est écrit dans la **touche de retour** (la touche bleue). Le plus pertinent ici c'est sans doute *continue*.

> **:information_source:** Je vous invite à jouer un peu avec toutes ces propriétés pour vous familiariser avec le clavier iOS.

Vous pouvez rajouter un petit label avec la mention *Nom* pour clarifier ce qui est attendu dans ce champ de texte.

|IMAGE Images/P2/P2C1_6.png| []

#### Le sexe

Nous bâtissons un site de rencontre, ne l'oublions pas ! Donc le sexe de nos membres est une information essentielle ! Pour leur demander, nous n'allons pas leur demander de le taper puisqu'il suffit de choisir entre deux possibilités. Dans ce genre de cas, on va faire appel à ce qu'on appelle un **contrôle segmenté** ou `UISegmentedControl`.

Sélectionnez-le depuis la bibliothèque des objets et glissez-le sur l'interface.

|IMAGE Images/P2/P2C1_7.png| []

Cela prend la forme d'une barre sur laquelle vous avez plusieurs segments. On peut sélectionner l'un d'entre eux. Voyons dans l'inspecteur d'attributs comment personnaliser ce composant.

|IMAGE Images/P2/P2C1_8.png| []

La propriété la plus importante, c'est la propriété `Segments`. Cette propriété permet de **choisir le nombre de segments** du composant. Dans notre cas, nous avons deux options, Male ou Femelle, donc vous pouvez laisser 2.

Ensuite dessous vous pouvez sélectionner dans la propriété `Segment` le segment à modifier. Vous avez deux options principales de modifications :
- `Title` : vous pouvez modifier le texte affiché dans le segment. Je vous invite à écrire *Male* pour le premier et *Femelle* pour le second. Ou l'inverse si vous êtes galant... :D
- `Image` : à la place du texte, vous pouvez choisir de mettre une icône. Vous pouvez vous amuser à en trouver et à les utiliser ici !

> **:information_source:** Un petit mot sur la propriété `Selected`. C'est elle qui permet de choisir quel sera le segment sélectionné par défaut au chargement de la vue. Là, c'est trop politique pour que je vous conseille lequel choisir ! À vous de voir ;) !

Une fois que vous avez modifié votre composant correctement, nous allons pouvoir passer à la suite !
> **:question:** Et la couleur ? C'est quand même pas magnifique ce bleu...

Hmm... Je suis d'accord avec vous !

La classe `UIView` a une propriété `tintColor`, accessible depuis l'inspecteur d'attributs. Cette couleur définit la teinte générale d'une vue. Cette propriété est souvent utilisée par les sous-classes d'`UIView` pour définir leur couleur.

Et `UISegmentedControl` ne fait pas exception ! Vous pouvez donc descendre dans l'inspecteur d'attributs jusqu'à la section View et modifier la propriété `Tint`.

|IMAGE Images/P2/P2C1_9.png| []

Même chose, je vous invite enfin à rajouter un petit label pour organiser notre formulaire.

|IMAGE Images/P2/P2C1_10.png| []

#### Plus de 3 ans ?

Comme chacun sait, une année de chien vaut 7 années d'hommes. Donc la majorité canine a lieu à 3 ans.

> **:question:** Mais 3 x 7, ça fait pas...

OUI ! Je sais... mais je me basais sur la majorité américaine à 21 ans bien sûr...

Bref, toujours est-il que pour inscrire nos chiens, il faut évidemment vérifier qu'ils ont la majorité sinon on va avoir la SPA sur le dos ! Et pour cela, on veut leur poser tout simplement la question :

> Avez-vous plus de trois ans ?

Pour ce genre de questions qui se répondent par oui ou par non, il existe un composant très pratique : le switch ou `UISwitch`. Sélectionnez-le dans la bibliothèque des objets et glissez-le dans l'interface :

|IMAGE Images/P2/P2C1_11.png| []

En tapant dessus, on l'active ou on le désactive. Le switch a deux valeurs : `on` et `off`.

Dans l'inspecteur d'attributs, vous avez trois propriétés très simples :

|IMAGE Images/P2/P2C1_12.png| []

- `State` : cette propriété permet de décider de l'état par défaut du bouton. Je vous invite à le passer à off pour forcer nos utilisateurs à l'activer et donc à se poser la question de leur âge. Oui c'est le genre de question qu'un chien peut se poser...
- `On Tint` : vous pouvez choisir la couleur du composant lorsqu'il est dans l'état `On`. Autrement dit, vous pouvez choisir autre chose que ce vert flash.
- `Thumb Tint` : vous pouvez changer la couleur du rond blanc.

À vous d'exprimer vos talents de designer ! Voici ce que ça donne pour moi :

|IMAGE Images/P2/P2C1_13.png| []

#### Téléphone

Pour pouvoir contacter les chiens afin de les mettre en relation, nous allons leur demander leur numéro de téléphone. Pour cela, vous allez choisir le champ de texte et je vous invite à passer la propriété `Content Type` à `Phone Number` et la propriété `Keyboard Type` à `Phone Pad`.

Voici mon résultat :

|IMAGE Images/P2/P2C1_14.png| []

> **:information_source:** `UITextField` a un cousin : `UITextView`. Le premier est dédié à de petites entrées de textes sur une seule ligne comme un nom, un numéro de téléphone, une recherche, etc. Le second que nous ne verrons pas, mais qui est très proche, permet de plus longues entrées de texte comme des commentaires, des messages, etc. `UITextView` est aussi utilisé pour afficher de grands messages textuels.

#### Race

Enfin, comme tout réseau de rencontre malheureusement, l'aspect physique importe. Donc sans aller jusqu'à réclamer une photo, nous allons demander la race du chien.

Mais nous ne voulons pas imposer à nos utilisateurs d'avoir à la taper, ce qui est long et fastidieux. Il y a un nombre fini de races de chiens, donc on va mettre cela dans une liste et ils vont pouvoir choisir.

Et pour cela, il existe un composant qui a le mérite d'être très beau et très utile : le sélecteur ou `UIPickerView`.

Sélectionnez-le dans la bibliothèque des objets et glissez-le dans l'interface.

|IMAGE Images/P2/P2C1_15.png| []

Le *PickerView* prend la forme d'une roulette (oui, comme dans les machines à sous :D) que l'on peut diviser en plusieurs colonnes qui vont chacune montrer des listes différentes. Dans notre cas, nous n'avons qu'une seule liste à afficher, la liste des races.

Sa grande beauté vient avec un petit défaut, il ne peut pas être configuré dans le storyboard, mais uniquement dans le code. Donc pour l'instant, nous allons le laisser tel quel.

> **:information_source:** Le `UIPickerView` a une sous-classe bien pratique : le `UIDatePickerView` qui permet de sélectionner une date. Nous ne la verrons pas, mais si vous savez utiliser le premier vous saurez encore plus facilement vous servir du second.

Vous devriez maintenant avoir l'interface complète du formulaire :

|IMAGE Images/P2/P2C1_2.png| []

#### Exercice
Cette interface est assez complexe, car elle contient de nombreux composants. Je vous invite à la rendre responsive au moins sur les iPhone en mode portrait.

Vous retrouvez la correction sous forme de vidéo explicative à cette adresse [AJOUTEZ LIEN]. Dans cette vidéo, j'aborde une technique nouvelle pour rendre vos interfaces adaptables : les **Stack View**.

> **:information_source:** N'hésitez pas à vous renseigner et à essayer les Stack View par vous même avant de regarder la correction. Suivez ce [tutoriel](https://www.raywenderlich.com/160646/uistackview-tutorial-introducing-stack-views-2) par exemple ainsi que les excellentes 4 premières minutes de cette [vidéo](https://www.youtube.com/watch?v=a-W5SciZrXo).

C'est un bonus bien sûr puisqu'on s'écarte un peu du sujet du cours, mais un peu d'entraînement ne vous fera jamais de mal et c'est un bon moment pour découvrir les Stack View.

#### Résumé
- `UITextField` : Les champs de texte permettent de récupérer du texte de la part d'un utilisateur. Ils sont directement reliés à la gestion du clavier.
- `UISegmentedControl` : Ce composant permet de sélectionner un choix parmi plusieurs options, en général entre 2 et 5.
- `UISwitch` : Le switch est un composant idéal, pour les situations Oui/Non ou On/Off.
- `UIPickerView` : Le sélecteur est une roulette qui permet de sélectionner un élément parmi une liste.

Dans le prochain chapitre, nous allons configurer notre sélecteur pour qu’il affiche les différentes races de chien.

### Remplissez le sélecteur

Dans le chapitre précédent, nous avons créé l'interface de notre application, mais malheureusement le sélecteur a échappé à notre folie artistique ! Nous n'avons pas pu le configurer dans le storyboard. Et du coup, quand vous lancez l'application, le résultat en la matière n'est pas probant...

|IMAGE Images/P2/P2C2_1.png| []


Qu'à cela ne tienne, nous aurons sa peau dans le code !

#### Delegate, Datasource et MVC

En MVC, vous savez qu'il existe plusieurs formes de communications entre les trois parties. Ce schéma doit vous rappeler quelque chose :

|IMAGE Images/P1/P1C1_3.png| []

Notamment, on y voit que la vue communique avec le contrôleur via les outlets et les actions. Nous allons découvrir ici deux nouvelles formes de communications : les datasource et les delegate.

##### Le dataSource

En MVC, **une vue ne détient pas ses données**. Car une vue n'a qu'un rôle d'affichage, ce n'est pas son rôle de savoir quoi afficher. C'est le contrôleur qui va lui dire.

Ainsi, dans le cas de notre liste de races, ce n'est pas la vue qui doit retenir la liste de races, c'est le contrôleur qui va lui dire quoi afficher. Et il va tirer cette information du modèle qui détient les données.

Donc pour savoir quoi afficher, le contrôleur va simplement utiliser des outlets pour les vues relativement simples et surtout qui ont peu de données à afficher. Mais pour des vues plus complexes avec beaucoup de données à afficher, **le contrôleur va se positionner en source de donnée pour que la vue puisse piocher dedans et donc n'avoir en même temps que très peu de données à afficher**.

Le contrôleur est donc le `dataSource`, celui qui détient les données. Et voilà comment cela va fonctionner :
1. Le PickerView va nommer le contrôleur source de donnée.
2. Cela implique que le contrôleur **s'engage à répondre à certaines questions précises** du PickerView, par exemple combien d'éléments y a-t-il dans la liste ?
3. Lorsque la vue en a besoin, le contrôleur répond aux questions.

|IMAGE Images/P2/P2C2_2.png| []

Vous venez de découvrir une nouvelle forme de communication aveugle entre le contrôleur et la vue.

##### Le delegate

Le delegate fonctionne de la même manière. **Une vue peut avoir besoin de poser des questions à son contrôleur selon les évènements qui lui arrivent.**

> **:information_source:** Certains évènements peuvent être gérés par des actions. Lorsqu'on appuie sur le bouton, le contrôleur propose systématiquement la même action. C'est une façon aveugle de communiquer avec la vue. Car la vue n'a aucune idée de ce que fait le contrôleur. Elle sait juste qu'il effectue une action, toujours la même.

Mais parfois, on ne veut pas faire toujours la même action. Par exemple, lorsque l'utilisateur va faire défiler la liste des races, la vue va devoir demander à chaque
fois : quel est le prochain nom de race que je dois afficher ? Et à chaque fois, le contrôleur va répondre une race différente. C'est lui qui choisit ce qu'on affiche.

Pour prendre un autre exemple, on peut parler des scroll view. Une scroll view va utiliser le mécanisme de delegate pour dire au contrôleur :
- Je viens de scroller de quelques pixels, tu veux faire une action ?
- Je viens d'atteindre la fin du scroll, on fait quelque chose ?
- Je viens de m'arrêter de scroller, que veux-tu faire ?

Autrement dit, **la vue *délègue* toute la prise de décision au contrôleur**. D'où le nom de ce mécanisme.

Le contrôleur devient ce qu'on appelle le `delegate`, celui à qui est déléguée la responsabilité. Et cela va fonctionner exactement comme pour le data source :

1. Le PickerView va nommer le contrôleur délégué.
2. Cela implique que le contrôleur s'engage à répondre à certaines questions précises du PickerView.
3. Lorsque la vue en a besoin, le contrôleur répond aux questions.

|IMAGE Images/P2/P2C2_3.png| []

Encore une nouvelle forme de communication aveugle entre le contrôleur et la vue. Vos compétences en MVC ont fait un bond en avant !

Ces 3 étapes vont être les trois étapes que nous allons suivre pour configurer le delegate et le dataSource de notre PickerView.

> **:information_source:** C'était une petite introduction aux notions de `delegate` et de `dataSource`, si tout n'est pas parfaitement clair, pas de soucis, nous aurons l'occasion d'y revenir pendant le cours sur les Table View.

#### Nommez le dataSource et le delegate

Lors de la première étape, la vue nomme le contrôleur son dataSource et son delegate. Et nous allons faire cela avec... deux control drags !

Il vous suffit de faire le control drag depuis le Picker View vers le contrôleur comme ceci :

|IMAGE Images/P2/P2C2_4.gif| []

Une Popup apparaît. Cliquez sur `dataSource` puis répétez l'opération et cliquez cette fois sur `delegate`.

#### Le contrôleur s'engage à répondre aux questions
Deuxième étape : le contrôleur s'engage à répondre aux questions de la vue. Pour cela, le contrôleur va implémenter ce qu'on appelle un **protocole**.

Un protocole, c'est un outil en Swift dont nous n'avons pas encore parlé. **Un protocole est une liste de méthodes vides et de propriétés.**

> **:question:** De méthodes vides ?

Oui un protocole, c'est juste une liste de méthodes vides. Contrairement à une classe dans laquelle, on écrit une méthode et son implémentation, dans un protocole, on n'a que la déclaration des fonctions.

Pour vous donner un exemple, voici le protocole `UIPickerViewDataSource`.

```swift
protocol UIPickerViewDataSource {
	func numberOfComponents(in pickerView: UIPickerView) -> Int
	func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
}
```

C'est juste une liste de méthodes.

> **:question:** À quoi ça sert ?

Justement, ça va nous être très utile ici. On veut que le contrôleur s'engage à répondre à des questions. Et les questions, ce sont simplement les méthodes du protocole !

Pour cela, notre contrôleur va se *conformer* au protocole. C'est un terme technique pour dire qu'**il s'engage à fournir une implémentation aux méthodes qui se trouvent dans le protocole**.

Pour concrétiser cet engagement, il suffit d'ajouter le nom du protocole au moment de la déclaration de notre classe comme ceci :

```swift
class FormViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

}
```

On rajoute les protocoles après la super classe, s'il existe, et on les sépare par des virgules.

Une fois que vous avez écrit cela, vous devriez voir des erreurs s'afficher.

```console
Type 'FormViewController' does not conform to protocol 'UIPickerViewDataSource'
```
Le problème c'est qu'on s'engage à implémenter des méthodes, mais on ne le fait pas ! Xcode n'est pas content !

Résolvons cela !

> **:information_source:** Ceci, encore une fois, est une rapide introduction à la notion complexe de protocole. Nous aurons l'occasion d'y revenir dans le cours sur les Table View.

#### Le contrôleur répond aux questions

Il ne nous reste plus qu'à répondre aux questions. Et pour cela, nous allons implémenter les méthodes de nos deux protocoles : `UIPickerViewDataSource` et `UIPickerViewDelegate`.

##### Méthodes du dataSource

La première, c'est donc :
```swift
func numberOfComponents(in pickerView: UIPickerView) -> Int {
}
```

Ajoutez cette fonction dans le code du `FormViewController`. Nous allons l'implémenter. Cette méthode doit apparemment renvoyer un entier. Cet entier correspond au *numberOfComponents* de notre PickerView.

> **:question:** C'est quoi les *components* du PickerView ?

Les *components* représentent les différentes colonnes de notre PickerView. Souvenez-vous, le PickerView fonctionne comme la roulette au casino. Par exemple, sur la roulette suivante, il y a quatre *components*.

|IMAGE Images/P2/P2C2_5.png| []

> **:information_source:** Au passage, ceci est un `UIDatePickerView`.

Le nôtre est bien plus simple puisqu'on veut ajouter seulement une liste, celle des races de chiens.

Donc on va répondre simplement à la question en implémentant la méthode comme ceci :

```swift
func numberOfComponents(in pickerView: UIPickerView) -> Int {
	return 1
}
```

Maintenant, la vue sait combien de *components* afficher.

Passons maintenant à la deuxième méthode :

```swift
func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
}
```
Cette méthode retourne également un entier. Cette fois il correspond au nombre d'éléments présent dans chaque colonne. C'est la raison pour laquelle, nous avons *component* en paramètre pour pouvoir adapter la réponse en fonction de la colonne.

Nous nous n'avons qu'une seule colonne, donc on va simplement répondre par le nombre de races de chien à afficher. Et pour cela, nous allons tout simplement utiliser le tableau `dogRaces` qui se trouve dans notre modèle.

```swift
func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
	return dogRaces.count
}
```

Et voilà ! La vue connait maintenant le nombre d'éléments à prévoir dans la liste.

##### Méthode du delegate

`UIPickerViewDelegate` est un protocole qui contient bien plus de méthodes qui permettent de personnaliser complètement la vue. Mais il y en a une seule qui nous intéresse vraiment, c'est celle-ci que je vous invite à rajouter dans votre code :

```swift
func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
}
```

Cette méthode renvoie un String optionnel qui correspond au titre que l'on veut mettre pour chaque élément. Évidemment ce titre dépend de la colonne et de la ligne dont on parle. C'est la raison pour laquelle nous avons les entiers `row` et `component` en paramètre de cette méthode.

Encore une fois, le paramètre `component` ne nous importe pas puisque nous n'avons qu'une seule colonne. En revanche, on va utiliser le paramètre `row` en index de notre tableau `dogRaces`.

Vous donc implémenter la méthode comme ceci :

```swift
func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
	return dogRaces[row]
}
```

Et voilà ! Maintenant la vue sait quel titre afficher en fonction de la ligne à laquelle on se trouve, vous pouvez lancer l'application et confirmer que tout fonctionne correctement !

|IMAGE Images/P2/P2C2_6.gif| []

Voici le code complet de la classe `FormViewController` :

```swift
class FormViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
	func numberOfComponents(in pickerView: UIPickerView) -> Int {
		return 1
	}

	func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
		return dogRaces.count
	}

	func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
		return dogRaces[row]
	}
}
```

#### Résumé
- En MVC, une vue peut utiliser le mécanisme du `dataSource` pour ne pas être propriétaire de ses donner et les réclamer au contrôleur.
- En MVC, une vue peut utiliser le mécanisme du `delegate` pour déléguer les prises de décision au contrôleur.
- Un protocole est une liste de méthodes vides et de propriétés.
- Pour utiliser le mécanisme de `dataSource` ou `delegate`, on suit trois étapes :
	1. La vue **nomme** le contrôleur son `dataSource` et/ou `delegate`.
	2. Le contrôleur **s'engage à répondre aux questions** de la vue en **adoptant le protocole** correspondant.
	3. Le contrôleur **répond aux questions** de la vue en **se conformant au(x) protocole(s)** et donc en implémentant les méthodes de ce dernier.

Dans le prochain chapitre, nous allons revenir sur nos champs de texte et apprendre à gérer le clavier !

### Gérez le clavier
Si vous vous êtes amusés à jouer un peu avec votre formulaire, vous vous êtes sans doute aperçu que sans que vous n'ayez rien à faire, votre clavier apparaît automatiquement lorsque vous cliquez sur un champ de texte.

C'est pratique, mais du coup ça prend une bonne partie de l'écran et on ne peut plus cliquer sur le bouton *Valider*...

|IMAGE Images/P2/P2C3_1.png| []

Dans ce chapitre, nous allons apprendre à gérer la disparition du clavier !

#### Rappel sur le champ de texte
Tant qu'on en est à parler du clavier, laissez-moi vous faire un petit rappel sur ce qu'on a vu avec le champ de texte.

**Le clavier est entièrement lié au champ de texte**.

Par exemple, c'est le champ de texte qui décide du type de clavier qui s'affiche. On a ensemble modifié la propriété `Keyboard Type` pour que le champ de texte *Téléphone* affiche le clavier suivant plutôt.

|IMAGE Images/P2/P2C3_2.png| []

Cela veut dire que c'est également **le champ de texte qui décide de l'apparition et de la disparition du clavier**.

#### Clavier dans le simulateur

Si vous lancez l'application dans le simulateur, le clavier ne s'affichera peut-être pas. Cela est dû à un réglage spécial du simulateur. Quand vous interagissez avec une application dans le simulateur, vous avez l'option d'utiliser **le clavier iOS présent sur l'écran du simulateur** ou d'utiliser **le clavier de votre Mac**.

> **:information_source:** Cela a été rendu possible, car taper du texte en cliquant sur les touches d'un clavier virtuel à la souris, ce n'est vraiment pas l'idéal ! :D

Vous pouvez alterner entre les deux options en allant dans Hardware > Keyboard > Connect Hardware Keyboard. Vous pouvez également utiliser le raccourci <kbd>shift + cmd + K</kbd>.

#### Une tape et... disparition !

Le clavier apparaît donc automatiquement, mais il ne disparaît pas ! Le réflexe commun, c'est de taper n'importe où en dehors du champ de texte pour faire disparaître le clavier. Alors, essayons de rajouter cette fonctionnalité à notre page !

##### Ajout du Tap Gesture Recognizer
Pour y parvenir, il faut associer le geste "*Tap*" à "*n'importe où sur la page*". Et vous savez déjà faire cela ! Nous allons utiliser `UITapGestureRecognizer` et nous allons le relier à la vue principale du `FormViewController`.

Sélectionnez `Tap Gesture Recognizer` dans la bibliothèque des objets :

|IMAGE Images/P2/P2C3_3.png| []

Et glissez-le sur la vue principale. Je vous suggère d'utiliser le panneau de droite (*Document Outline*) pour être certain d'atterrir au bon endroit.

|IMAGE Images/P2/P2C3_4.gif| []

Le `Tap Gesture Recognizer` est maintenant ajouté et relié à la vue principale.

> **:information_source:** Vous pouvez vérifier que c'est bien le cas, en faisant un clic droit sur le `Tap Gesture Recognizer`, vous devriez obtenir ceci :
|IMAGE Images/P2/P2C3_4Bis.png| []

##### Création de l'action

Nous allons maintenant pouvoir créer l'action correspondant à notre `Tap Gesture Recognizer`. Vous savez faire, il suffit de faire un control drag depuis le `Tap Gesture Recognizer` vers le code. Vous pouvez nommer l'action : `dismissKeyboard`.

Le code suivant est généré :

```swift
@IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
}
```
Dans cette méthode, nous allons rédiger le code permettant de cacher le clavier.

##### À vos outlets
On l'a dit, c'est la responsabilité du champ de texte de cacher le clavier. Donc nous allons avoir besoin d'accéder aux champs de texte dans le code. Pour cela, créez deux outlets correspondant aux deux champs de texte.

Voici mon résultat :

```swift
@IBOutlet weak var nameTextField: UITextField!
@IBOutlet weak var phoneTextField: UITextField!
```

#### La notion de firstResponder

Tout est prêt ! Nous avons le geste, l'action et les outlets. Il ne reste plus qu'à rédiger la commande. Et cette commande, elle ressemble à ceci :

```swift
nameTextField.resignFirstResponder()
```

> **:question:** Pourquoi ça ne s'appelle pas `nameTextField.hideKeyboard()` ? C'est quoi un `responder` ?

Très bonnes questions ! En iOS, un `responder` (répondeur en français) est **un objet qui peut répondre à des évènements et les gérer**. En gros, toutes les vues sont des répondeurs, car elles peuvent toutes au moins gérer des gestes sur l'écran tactile.

Le premier répondeur (`firstResponder`) est l'objet qui est en train d'être utilisé. **Il ne peut y en avoir qu'un seul**. Par exemple, lorsqu'on tape du texte dans un champ de texte, il n'y a qu'un seul champ de texte qui répond. On ne peut pas taper du texte sur plusieurs champs en même temps.

Autre exemple, mettons que j'ai deux boutons l'un en dessous de l'autre et que j'appuie dessus. Techniquement, les deux boutons ont été touchés. Mais un seul lancera son action, on l'appelle le `firstResponder`.

> **:information_source:** Pour ceux qui connaissent le développement web, la notion de `firstResponder` est très proche de `focus`.

Lorsque l'on touche le champ de texte, il devient `firstResponder`. Et lorsqu'un champ de texte devient `firstResponder`, il affiche le clavier. N'importe quelle vue peut devenir le `firstResponder` en appelant la méthode :

```swift
nameTextField.becomeFirstResponder()
```

> **:information_source:** C'est pratique si vous souhaitez que le clavier soit déjà affiché à l'arrivée d'une page par exemple. Vous pouvez copier cette ligne dans `viewDidAppear` par exemple.

À l'inverse, n'importe quelle vue peut décider de ne plus être le `firstResponder` et pour cela, elle utilise la méthode qu'on a vue au-dessus :

```swift
nameTextField.resignFirstResponder()
```

Lorsqu'un champ de texte n'est plus `firstResponder`, cela veut dire que l'utilisateur n'est plus en train d'interagir avec lui et du coup le clavier n'a plus de raison d'être présenté. Il disparaît.

Vous pouvez faire la même chose avec `phoneTextField` et votre action devient :

```swift
@IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
	nameTextField.resignFirstResponder()
	phoneTextField.resignFirstResponder()
}
```

Vous pouvez tester dans le simulateur et ça marche !

Je résume :
- On a créé un geste (Tap) que l'on a associé à la vue principale pour qu'il soit disponible n'importe où sur la page.
- On a associé une action au geste.
- Dans l'action, on appelle la méthode `resignFirstResponder` sur les deux champs de texte pour que le clavier disparaisse.

#### Et la touche de retour ?

La touche de retour sur le clavier c'est celle-ci :

|IMAGE Images/P2/P2C3_5.png| []

> **:information_source:** On a vu que le texte "Continuer" pouvait être changé avec la propriété `Return Key`.

Lorsqu'on appuie cette touche, l'utilisateur peut vraisemblablement s'attendre à ce que le clavier disparaisse. Et pour cela, il faut que la vue puisse prévenir le contrôleur de l'évènement "a appuyé sur la touche retour". Si seulement elle pouvait lui déléguer la....

> **:question:** On va utiliser un `delegate` !

Mais quelle vivacité d'esprit ! Je suis ébahi. Je vous adore !

En effet, on va utiliser un `delegate`. Et on suit toujours les mêmes étapes :
1. Le champ de texte va nommer le contrôleur comme son delegate
2. Le contrôleur s'engage à répondre aux questions du champ de texte en adoptant le protocole correspondant.
3. Le contrôleur répond aux questions en se conformant au protocole et donc en implémentant les méthodes de ce dernier.

##### 1. Le champ de texte nomme le contrôleur comme son delegate

Pour cela, vous vous souvenez on utilise un control drag depuis le champ de texte vers le contrôleur et dans la popup, on clique sur delegate.

|IMAGE Images/P2/P2C3_6.gif| []

Vous pouvez répéter l'opération pour le deuxième champ de texte.

##### 2. Le contrôleur adopte le protocole
Le protocole correspondant s'appelle `UITextFieldDelegate`. Oui... ils ne font pas dans la créativité. En même temps, heureusement :D !

Et pour que le contrôleur l'adopte, il faut l'ajouter à la déclaration de la classe comme on l'a vu au chapitre précédent.

```swift
class FormViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {
}
```
##### 3. Le contrôleur se conforme au protocole
Il ne nous reste maintenant plus qu'à implémenter la méthode qui nous intéresse dans ce protocole et qui correspond à l'évènement "*a appuyé sur la touche retour*". Cet évènement s'appelle :

```swift
func textFieldShouldReturn(_ textField: UITextField) -> Bool {
}
```

Cette fonction prend en paramètre un `textField`. C'est le champ de texte qui vient de subir l'évènement "*a appuyé sur la touche retour*". Et elle renvoie un booléen qui est à `true` si vous souhaitez que la méthode suive son implémentation normale, ce qui sera presque toujours le cas.

Mais avant de renvoyer le booléen, on peut faire ce qu'on veut et notamment :

```swift
textField.resignFirstResponder()
```

Et maintenant le champ de texte disparaîtra lorsqu'on appuiera sur la touche de retour !

Voici le code complet de la fonction :
```swift
func textFieldShouldReturn(_ textField: UITextField) -> Bool {
	textField.resignFirstResponder()
	return true
}

```

> **:information_source:** Le protocole `UITextFieldDelegate` contient de nombreuses autres fonctions pour gérer d'autres types d'évènements. Je vous invite à jeter un oeil si vous le souhaitez.

#### Allez plus loin
Un dernier cas courant que vous rencontrerez en manipulant les claviers, c'est celui d'**un clavier qui recouvre un champ de texte**. C'est notamment le cas si vos champs de texte sont situés en bas de l'écran.

Dans ce cas, l'utilisateur ne voit pas ce qu'il écrit !

Il y a deux solutions :
1. **Ne pas mettre de champ de texte en bas**. C'est évident, mais je le précise parce que ça vaut parfois le coup de modifier le design de son application dans ce but.
2. **Faire glisser la vue principale vers le haut pour que le champ de texte soit plus haut que le clavier**. Dans ce cas, c'est bien toute la vue principale qui glisse vers le haut, pour ne pas altérer le design.

Je ne détaillerais pas cette deuxième option, mais il faut que le contrôleur écoute les notifications d'apparition et disparition du clavier et ensuite, on fait une translation de la vue principale vers le haut en calculant bien la distance nécessaire.

Je vous invite à jeter un oeil à [ce tutoriel](https://blog.apoorvmote.com/move-uitextfield-up-when-keyboard-appears/) si vous rencontrez le problème. Vous pouvez aussi compléter avec [cette réponse Stack Overflow](https://stackoverflow.com/questions/28813339/move-a-view-up-only-when-the-keyboard-covers-an-input-field) qui est moins détaillée, mais régulièrement mise à jour.

#### En résumé
- Le champ de texte est l'objet qui gère le clavier.
- On peut utiliser un `Tap Gesture Recognizer` associé à la vue principale pour faire disparaître le clavier après l'appui sur n'importe quel écran.
- Lorsque le champ de texte devient `firstResponder`, le clavier apparaît. Lorsque le champ de texte ne l'est plus, le clavier disparaît. Deux méthodes sont associées à ces évènements :
```swift
textField.becomeFirstResponder()
textField.resignFirstResponder()
```
- Pour que le clavier disparaisse à l'appui sur la touche de retour, on utilise le `UITextFieldDelegate` et en particulier la méthode `textFieldShouldReturn`.

Dans le prochain chapitre, nous allons apprendre à récupérer les données de notre formulaire !

### Récupérez les données du formulaire
Notre formulaire est fin prêt et fonctionnel ! Bravo ! Il ne nous reste plus qu'à récupérer les données de ce formulaire ! Sinon... il ne sert à rien... :/

Avant cela, nous allons corriger quelque chose qui vous chagrine, je le sais. Notre application n'a pas de modèle ! Or, c'est le modèle qui est responsable de sauvegarder les données ou de discuter avec un éventuel serveur. Et c'est donc lui qui va nous permettre de récupérer les informations du formulaire correctement.

Donc avant de récupérer nos données, nous allons créer le modèle. Et vous allez faire ça avec l'exercice ci-dessous.

[EXERCICE CODEVOLVE]

> **:information_source:** Vous pouvez télécharger le fichier `Model.swift` [ici](https://s3-eu-west-1.amazonaws.com/static.oc-static.com/prod/courses/files/Parcours+DA+iOS/Cours+7+-+Plusieurs+pages/Model.swift) et l'intégrer dans votre application.

#### Bouton Valider
Pour l'instant, notre bouton *Valider* lance une transition modale vers le `SuccessViewController`. Or, avant de passer à la page suivante, nous voulons :
- récupérer les données du formulaire : on va faire ça juste en dessous.
- vérifier que les données sont valides : on va faire ça dans la prochaine partie.
- les envoyer sur un serveur, les sauvegarder en base de données, etc. : si on travaillait sur un véritable projet...

Du coup, on ne peut pas déclencher automatiquement le segue modal puisqu'il faut faire tout ça avant. À la place, nous allons créer une action pour sauvegarder les données.

Donc commencez par supprimer le segue Modal entre le bouton.

> **:information_source:** Rassurez vous, nous allons recréer cette transition dès le prochain chapitre.

Et maintenant vous pouvez créer une action pour le bouton que nous allons simplement appeler `validate` :

```swift
@IBAction func validate() {
}
```

Ensuite, je vous suggère de créer une fonction privée dans laquelle nous allons faire la première moitié du travail : créer un objet `Pet`.

```swift
@IBAction func validate() {
	createPetObject()
}

private func createPetObject() {
}
```

> **:information_source:** C'est une bonne pratique de séparer l'action de la méthode correspondante. Cela sépare les responsabilités de chaque méthode.

#### Récupérons les informations
Maintenant nous allons récupérer les informations de nos différents composants. Pour les récupérer, il va nous falloir créer des outlets pour tous les composants.

Vous êtes des pros, je vous laisse faire :

```swift
@IBOutlet weak var racePickerView: UIPickerView!
@IBOutlet weak var majoritySwitch: UISwitch!
@IBOutlet weak var nameTextField: UITextField!
@IBOutlet weak var phoneTextField: UITextField!
@IBOutlet weak var genderSegmentedControl: UISegmentedControl!
```

Et maintenant à l'attaque !

##### Les champs de texte

Les champs de texte sont très simples. Ils ont une propriété `text` de type `String?` qui contient le texte entré par l'utilisateur. Vous allez donc pouvoir écrire dans la fonction `createPetObject` :

```swift
let name = nameTextField.text
let phone = phoneTextField.text
```

Nous stockons les textes dans deux constantes pour l'instant.

> **:information_source:** À noter que la propriété `text` est de type `String?`. En effet, si le champ de texte est vide, la propriété renvoie `nil`.

##### Le switch
Le switch ne peut prendre que deux valeurs *On* ou *Off*. C'est donc un booléen. La propriété qui permet de récupérer ce booléen se nomme `isOn`. Donc vous pouvez écrire :

```swift
let hasMajority = majoritySwitch.isOn
```

##### Le contrôle segmenté
Le contrôle segmenté (`UISegmentedControl`) est un composant qui a plusieurs segments. Et l'utilisateur peut en sélectionner un. L'information intéressante à connaitre, c'est donc : quel segment est sélectionné ? Cette information est donnée par la propriété `selectedSegmentIndex`. Cette propriété est un entier, qui représente l'index du segment sélectionné.

> **:information_source:** Comme n'importe quel index, il commence à zéro. Donc si le premier segment est sélectionné, la propriété renvoie `0`.

On peut donc commencer par récupérer l'index :

```swift
let genderIndex = genderSegmentedControl.selectedSegmentIndex
```

Ensuite, on sait que si l'index vaut 0, l'utilisateur a sélectionné Male et s'il vaut 1 il a sélectionné Femelle.

On peut donc écrire :

```swift
var gender: Pet.Gender
if genderIndex == 0 {
	gender = .male
} else {
	gender = .female
}
```

> **:information_source:** On peut également utilisé un ternaire pour une version plus concise de tout ceci :
```swift
let gender: Pet.Gender = (genderSegmentedControl.selectedSegmentIndex == 0) ? .male : .female
```
Si les ternaires ne vous disent rien, vous pouvez jeter un oeil [ici](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/BasicOperators.html#//apple_ref/doc/uid/TP40014097-CH6-ID71).

##### Le sélecteur

Le sélecteur (`UIPickerView`) nous permet de parcourir la liste de race. L'information qui nous intéresse ici c'est : quel élément de la liste a été sélectionné ? Même chose que pour le contrôle segmenté, on va récupérer l'index de l'élément sélectionné, mais cette fois-ci avec une méthode :

```swift
let raceIndex = racePickerView.selectedRow(inComponent: 0)
```
Cette méthode prend en argument la colonne  (*component*) dont on veut récupérer l'élément sélectionné. Nous n'avons qu'une seule colonne, donc on peut écrire 0.

Maintenant que nous avons l'index, il ne nous reste plus qu'à l'utiliser dans notre tableau de races : `dogRaces`.

```swift
let race = dogRaces[raceIndex]
```

#### Créez l'objet
Voilà, nous avons récupéré toutes les informations de notre formulaire. Il ne nous reste plus qu'à créer l'objet `Pet` correspondant. Vous êtes capable de faire ça sans moi. Donc, essayez !

Voici la correction :

```swift
let dog = Pet(name: name, hasMajority: hasMajority, phone: phone, race: race, gender: gender)
```

Notre objet est maintenant créé, il va pouvoir être sauvegardé, utilisé dans une autre page, envoyé dans un serveur, etc.  

#### Les actions
Dans ce cours, nous avons vu ces composants uniquement comme *outlets*, c'est à dire des objets dont on peut obtenir une information. Mais ces objets peuvent aussi être à l'origine d'actions, comme l'est un bouton. Voici quelques exemples en iOS :

|IMAGE Images/P2/P2C4_1.gif| []

Vous pouvez voir ici que le switch est utilisé pour afficher une section et que le contrôle segmenté permet de modifier l'aspect de la carte.

> **:information_source:** Pour information, lorsque vous créez une action avec un bouton, vous utilisez l'évènement `Touch Up Inside`. L'action est lancée quand l'utilisateur appuie sur le bouton. L'évènement que vous choisirez pour UISwitch, UISegmentedControl, UITextField ou UIPickerView est `Value Changed`, c'est à dire le moment où la valeur de la vue change (le texte, le booléen, l'index sélectionné, etc.).

Garder en tête que tous ces composants peuvent donc à la fois servir pour recueillir des informations, mais aussi pour contrôler votre interface.

#### En résumé
- Pour récupérer des informations des différents composants, on utilise :
	- la propriété `text` pour `UITextField`
	- la propriété `isOn` pour `UISwitch`
	- la propriété `selectedSegmentIndex` pour `UISegmentedControl`
	- la méthode `selectedRow(inComponent: Int)` pour `UIPickerView`

Dans la prochaine partie, nous allons contrôler la validité des informations de notre formulaire, présenter des alertes, passer des données entre contrôleurs et d'autres bonnes surprises ! À tout de suite

## Validez votre formulaire

### Passez des données entre contrôleurs
Dans le chapitre précédent, nous avons créé un objet `Pet` avec les informations rentrées par l'utilisateur dans le formulaire. Dans un véritable projet, on utiliserait sans doute ces données pour les envoyer sur un serveur et inscrire effectivement notre chien dans une base de données.

Mais ce n'est pas l'objet de ce cours et nous allons essayer de faire quelque chose d'un peu plus simple. Nous allons passer les données à la page suivante (`SuccessViewController`) pour personnaliser le message avec le nom du chien qui vient de s'inscrire.

#### La transmission de donnée entre contrôleurs
De manière générale, il y a trois façons de passer des données entre contrôleurs :

##### 1/ Les données sont stockées par un tiers

Si les données sont stockées par un tiers, les contrôleurs n'ont qu'à venir piocher dedans les uns après les autres dedans. Le tiers fait office de base de données pour tout le monde.

> **:question:** C'est quoi le tiers ?

Le tiers peut représenter différentes choses :
- Un serveur dans le cloud qui détient les données.
- Le modèle qui retient les données via des mécanismes comme le singleton pattern dont on parlera dans un prochain cours.
- Une base de données en local, c'est à dire dans votre application iPhone. Vous avez par exemple `Core Data` dont nous parlerons dans un prochain cours.

> **:information_source:** Nous verrons la plupart de ces techniques dans de prochains cours.

##### 2/ Les données sont synchronisées directement entre les contrôleurs
Via un système de notifications, un contrôleur peut notifier un ou plusieurs autres contrôleurs qu'une donnée vient d'être mise à jour. Les autres contrôleurs peuvent réagir à la nouvelle et adapter leur interface en conséquence.

> **:information_source:** C'est exactement le même mécanisme que la notification entre le modèle le contrôleur que nous avons vu en deux parties [ici](https://openclassrooms.com/courses/concevez-une-application-iphone-avec-le-modele-mvc/envoyez-les-questions-au-controleur) et [là](https://openclassrooms.com/courses/concevez-une-application-iphone-avec-le-modele-mvc/connectez-le-controleur-et-le-modele). Donc je ne reviendrais pas là dessus. D'autant plus que ce n'est pas forcément la méthode la plus propre ou la plus utilisée.

> **:warning:** A la place des notifications, on peut aussi mettre en place un delegate pour cela implique de créer un delegate et nous ne verrons pas cela ensemble.

##### 3/ Les données sont transmises lors de la transition entre deux contrôleurs
Lorsque l'on passe d'un contrôleur à un autre, via un segue par exemple, on peut associer à cette transition une transmission de données.

L'idée générale, c'est :
- Le premier contrôleur détient des données.
- Avant que la transition n'ait lieu, il récupère une référence au contrôleur suivant via laquelle il peut lui transmettre les données.

> **:information_source:** Ne vous inquiétez pas, c'est beaucoup plus simple qu'il n'y paraisse et je vous montre tout ça dans ce chapitre !

#### Recréez la transition
Au chapitre précédent, nous avons supprimé le segue modal entre le `FormViewController` et le `SuccessViewController`. La raison, c'est que nous voulons effectuer certaines actions, comme créer un objet `Pet` et maintenant le transmettre à `SuccessViewController`, **avant que la transition n'ait lieu**.

Il ne faut donc pas que la transition ait lieu automatiquement lorsqu'on tape sur le bouton *Valider*. Pour cela, nous n'allons pas associer la transition au bouton comme on a appris à le faire jusqu'à présent, mais **au contrôleur** directement.

> **:information_source:** Ainsi, le contrôleur va être responsable de la transition et la déclencher quand on le souhaitera, moyennant quelques lignes de code bien entendu !

Pour faire cela, il vous suffit de recréer un segue `Present Modally,` mais qui part cette fois du contrôleur `FormViewController` et qui atterrit toujours vers `SuccessViewController`.

|IMAGE Images/P3/P3C1_1.gif| []

Maintenant, sélectionnez le segue nouvellement créé et ouvrez l'inspecteur d'attributs :

|IMAGE Images/P3/P3C1_2.png| []

La propriété `Identifier` va nous permettre de nommer ce segue. Nous allons utiliser ce nom pour faire référence à ce segue quand on voudra l'utiliser côté code.

Vous pouvez écrire par exemple : `segueToSuccess`.

> **:information_source:** Je vous suggère de nommer vos segue selon une nomenclature constante. Par exemple, je démarre toujours par `segue` puis je rajoute `To` suivi du nom de la destination et si cela ne suffit pas à l'identifier je rajoute `From` suivi du nom du contrôleur de départ.

#### Préparer la transition
Notre segue est prêt et identifiable. Nous allons pouvoir l'utiliser dans le code pour lancer notre transition. Mais juste avant cela, il nous faut passer les données d'un contrôleur à l'autre.

Pour cela, nous allons utiliser une méthode que vous avez peut-être déjà vue, car elle est par défaut dans le code d'un ViewController :

```swift
override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
}
```

La méthode `prepareForSegue` est exécutée juste avant que la transition n'ait lieue. Et elle prend en paramètre le segue responsable de la transition de type `UIStoryboardSegue` et un `sender`, c'est l'objet d'où part le segue, ici c'est le contrôleur.

Vous implémenterez presque toujours cette méthode de la même façon :
1. On vérifie que l'identifiant du segue est le bon.
2. On récupère le contrôleur en destination du segue.
3. On passe les données au contrôleur de destination.

C'est parti !

##### 1/ Vérification de l'identifiant

La classe `UIStoryboardSegue` a une propriété `identifier` de type `String?` qui contient l'identifiant. Donc pour vérifier que l'identifiant est bon, nous allons simplement faire :

```swift
override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
	if segue.identifier == "segueToSuccess" {
	}
}
```

##### 2/ Récupération du contrôleur de destination
Nous allons maintenant récupérer une référence du contrôleur vers lequel nous allons. Et pour cela, nous allons utiliser une autre propriété de `UIStoryboardSegue` : `destination`.

Et nous allons du coup écrire ceci :

```swift
override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
	if segue.identifier == "segueToSuccess" {
		let successVC = segue.destination as! SuccessViewController
	}
}
```

On crée une constante à partir de la propriété `destination` du paramètre `segue`. Et ensuite, on vérifie avec le contrôle de type (`as!`) que le contrôleur de destination est bien du type `SuccessViewController`.

> **:information_source:** Si le contrôle des types ne vous dit rien, vous pouvez retourner jeter un oeil [ici](https://openclassrooms.com/courses/approfondissez-swift-avec-la-programmation-orientee-objet/controlez-vos-types).

##### 3/ Passage des données

La donnée que l'on souhaite transmettre, c'est l'objet `dog` que nous avons créé dans la méthode `createPetObject` :

```swift
let dog = Pet(name: name, hasMajority: hasMajority, phone: phone, race: race, gender: gender)
```

Il faut commencer par récupérer cette donnée dans la méthode `prepareForSegue`. Et pour partager les données entre méthodes, on crée bien sûr une propriété. Créez la propriété `dog` dans la classe `FormViewController` :

```swift
var dog: Pet!
```
> **:information_source:** On utilise un optionnel déballé, car on ne connaît pas la valeur de la propriété au chargement du contrôleur. Mais on sait qu'elle aura une valeur lorsqu'on l'utilisera dans `prepareForSegue,` car on sera passé par `createPetObject` d'abord.

Du coup, dans `createPetObject` la déclaration devient simplement une assignation :

```swift
dog = Pet(name: name, hasMajority: hasMajority, phone: phone, race: race, gender: gender)
```

Maintenant, pour transmettre la donnée au `SuccessViewController`, il faut qu'il puisse la recevoir et pour cela, on va tout simplement créer une propriété dog du côté du `SuccessViewController` aussi.

```swift
class SuccessViewController: UIViewController {
	var dog: Pet!
	// (...)
}
```
Il ne nous reste plus qu'à faire la transmission effective de donnée en écrivant ceci :

```swift
override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
	if segue.identifier == "segueToSuccess" {
		let successVC = segue.destination as! SuccessViewController
		successVC.dog = dog // On passe la donnée via les propriétés
	}
}
```

Donc **le passage de données entre contrôleurs lors d'une transition se fait via les propriétés du contrôleur de destination**.

#### Lancer la transition

Notre transition est prête à transmettre les données. Il ne manque plus qu'une seule chose : lancer la transition !

Pour lancer un segue programmatiquement, il suffit d'utiliser la méthode suivante :

```swift
performSegue(withIdentifier: String, sender: Any?)
```

Cette méthode de `ViewController` prend en paramètre l'identifiant du segue à lancer et l'objet qui est à l'origine du segue. En pratique, on mettra souvent `self` puisque c'est le contrôleur qui initie la transition.

Je vous suggère donc d'écrire dans l'action validate :

```swift
@IBAction func validate() {
	createPetObject()
	performSegue(withIdentifier: "segueToSuccess", sender: nil)
}
```

Et voilà ! Vous pouvez vérifier que la transition modale a de nouveau lieu lorsqu'on tape sur le bouton *Valider*. La différence, c'est que maintenant, on récupère les informations du formulaire, on les passe au contrôleur suivant et **ensuite** on lance la transition.

#### Exercice

À vous de jouer ! La donnée a atterri dans le `SuccessViewController`. Il faut maintenant l'utiliser pour afficher le nom du chien dans le message affiché à l'écran.

Le message que vous devez afficher dans le label est le suivant :

> Wouf de bienvenue à [NOM DU CHIEN] !  
Vous avez bien été ajouté à notre base de données ! Nous vous enverrons un SMS dès que nous avons une âme soeur à vous proposer !

Pour y parvenir, vous allez devoir :
- créer un outlet pour modifier le texte du label
- créer le texte ci-dessus en incluant le nom du chien, récupéré dans la propriété `dog`
- modifier le texte au **chargement de la vue**

Bonne chance !

> **:information_source:** Vous pouvez trouver la correction [ici](https://s3-eu-west-1.amazonaws.com/static.oc-static.com/prod/courses/files/Parcours+DA+iOS/Cours+7+-+Plusieurs+pages/SuccessViewController.swift) !

#### En résumé
- Il existe trois façons de faire passer des données entre contrôleurs :
	1. Les données sont stockées par un tiers.
	2. Les données sont synchronisées directement entre les contrôleurs.
	3. Les données sont transmises lors de la transition entre deux contrôleurs

- Pour cette troisième façon, on suit les étapes suivantes :
	1. On crée un segue entre les contrôleurs et on lui donne un identifiant
	2. Dans la méthode `prepareForSegue` on récupère une référence au contrôleur de destination et on lui passe les données
	3. On lance la transition avec la méthode `performSegue`.

Dans le prochain chapitre, nous allons rajouter une étape à notre formulaire : sa vérification.

### Présentez une alerte à l’utilisateur
Notre formulaire a une bonne tête et il est fonctionnel, mais il reste quelque chose que nous n'avons pas encore abordé : les erreurs.

En effet, dans tout formulaire, il peut y avoir des erreurs et il faut les traiter en alertant l'utilisateur que les données qu'il a rentrées ne sont pas valides.

Par exemple, dans notre formulaire, nous ne souhaitons pas que les chiens mineurs (de moins de trois ans) puissent accéder à notre site de rencontre. Donc nous allons vérifier cela avant de les faire passer sur la page `SuccessViewController`.

Et pour ceux qui ne sont pas majeurs, nous allons leur présenter une alerte.

#### Les alertes en iOS

Sur votre iPhone, vous avez sans doute déjà rencontré des alertes. Elles permettent d'interrompre l'expérience d'une application pour poser une question à l'utilisateur ou attirer son attention sur quelque chose. Elles ressemblent à ceci :

|IMAGE Images/P3/P3C2_1.png| []

Vous en avez certainement déjà croisé. Elles sont gérées par une classe nommée `UIAlertController` que nous allons découvrir dans ce chapitre.

#### Création du modèle
Nous allons afficher ces alertes selon certaines conditions. Et il n'aura pas échappé à votre vigilance que nous nous apprêtons à faire de la logique. Et qui dit logique dit ?

> **:question:** Modèle !

Oh... C'est tellement touchant... J'en ai les larmes aux yeux ! Nous allons en effet devoir écrire un peu de logique dans le modèle.

Et vous allez faire ça avec un exercice ! Il est quasiment obligatoire et en tout cas très très recommandé de le faire. Car non seulement vous allez découvrir la notion de valeur associée dans les énumérations, mais en plus vous comprendrez la suite bien plus facilement si vous le faites !

Donc à vous de jouer !

[EXO CODEVOLVE]

> **:information_source:** Vous avez la correction de l'exercice [ici](https://s3-eu-west-1.amazonaws.com/static.oc-static.com/prod/courses/files/Parcours+DA+iOS/Cours+7+-+Plusieurs+pages/Model2.swift), si besoin.

> **:information_source:** Si vous avez besoin d'un autre exemple d'énumération avec valeur associée [celui du Swift Guide](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/Enumerations.html#//apple_ref/doc/uid/TP40014097-CH12-ID148) est très bien.

#### Implémentation du switch
Avant d'appeler notre méthode `performSegue` dans le contrôleur, nous allons avoir besoin d'évaluer le statut de notre objet `dog`. Je vous propose d'écrire une méthode pour faire cela :

```swift
@IBAction func validate() {
	createPetObject()
	checkPetStatus()
}

// (...)

private func checkPetStatus() {
}
```

Bien. Maintenant, nous allons vérifier le statut. La propriété `status` de `Pet` est une énumération donc pour l'évaluer, nous allons faire un switch :

```swift
private func checkPetStatus() {
	switch dog.status {
	case .accepted:
		performSegue(withIdentifier: "segueToSuccess", sender: nil)
	case .rejected(let error):
		// Il y a une erreur
	}
}
```

> **:warning:** Ici, vous noterez la particularité de la ligne :
```swift
case .rejected(let error):
```
Lorsqu'on fait un switch sur une énumération qui a une valeur associée, on peut récupérer cette valeur associée avec la syntaxe ci-dessus.

Dans le cas où le statut est bon, on passe à la page suivante avec `performSegue`. S'il y a une erreur, on va l'afficher avec une alerte.

#### Affichage de l'alerte
Pour afficher une alerte, nous allons utiliser la classe `UIAlertController`. On commence par initialiser une instance de cette classe comme ceci :

```swift
let alertVC = UIAlertController(title: "Erreur", message: "Message d'erreur", preferredStyle: .alert)
```
Détaillons ça :
- `title` contient le titre du message
- `message` contient le corps du message
- `preferredStyle` corresponds au style désiré de l'alerte. On en reparle juste en dessous. Choisissez `alert` pour le moment.

Ensuite, nous allons créer une ou plusieurs actions. Ces actions correspondent aux boutons en bas de l'alerte :

```swift
let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
```

Regardons cela :
- `title` corresponds au titre sur le bouton.
- `style` corresponds au style du bouton. Il y en a plusieurs aussi et on en parle juste après. Choisissez `cancel` pour le moment.
- `handler` : il s'agit d'un bloc qui permet de rajouter du code à exécuter lors de l'appui sur le bouton. Vous pouvez y mettre ce que vous voulez.

Ensuite, il faut ajouter l'action à notre alerte via la méthode `addAction` de `UIAlertController` :

```swift
alert.addAction(action)
```

Enfin, nous n'avons plus qu'à présenter l'alerte avec la méthode `present` de `UIViewController` :

```swift
present(alert, animated: true, completion: nil)
```

On a fait le tour de la théorie et du coup la mise en pratique donne ceci :

```swift
private func checkPetStatus() {
	switch dog.status {
	case .accepted:
		performSegue(withIdentifier: "segueToSuccess", sender: nil)
	case .rejected(let error):
		presentAlert(with: error)
	}
}

private func presentAlert(with error: String) {
	let alert = UIAlertController(title: "Erreur", message: error, preferredStyle: .alert)
	let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
	alert.addAction(action)
	present(alert, animated: true, completion: nil)
}
```

J'ai créé une méthode `presentAlert` qui prend en paramètre le message d'erreur `error` contenu comme valeur associée dans l'énumération `status`. Ce paramètre est utilisé comme message de notre `UIAlertController`. Le reste devrait être à peu près limpide sinon n'hésitez pas à reprendre les paragraphes précédents.

#### Les styles d'alertes

Comme promis, nous allons revenir sur les différents styles d'alertes que vous pouvez utiliser.

> **:information_source:** J'ai même préparé une application qui vous permettra de jouer avec tous ces styles. Vous pouvez la trouver [ici](https://github.com/AmbroiseCollon/UIAlertController) et je vous invite à jeter un oeil au code !

Il y a deux styles d'alertes : `.alert` et `.actionSheet`. Vous les avez ci-dessous :

|IMAGE Images/P3/P3C2_2.png| []

> **:warning:** Le premier a plus vocation à afficher des messages à l'utilisateur, il est plutôt **informatif**. Alors que le second sera plus souvent utilisé comme un moyen de sélectionner plusieurs options, il est plutôt **orienté vers l'action**.

Avec cela vous pouvez combiner trois styles de boutons :
- `.default` : le style par défaut.
- `.destructive` : ce style indique que l'action risque de modifier ou supprimer des données.
- `.cancel` : ce style indique que l'action annule l'opération et laisse les choses inchangées.

|IMAGE Images/P3/P3C2_3.png| []

> **:information_source:** Enfin, sachez que vous pouvez aussi rajouter un champ de texte dans une alerte via la méthode `addTextField` de `UIAlertController`. Vous pouvez en savoir plus avec cet [exemple](https://www.hackingwithswift.com/example-code/uikit/how-to-add-a-uitextfield-to-a-uialertcontroller).

#### En résumé

- **Lorsque vous faites la validation d'un formulaire, n'oubliez pas que la logique doit se trouver côté modèle !**
- Un cas d'une énumération peut avoir une valeur associée.
- Les alertes permettent d'interrompre l'expérience d'une application pour afficher un message ou poser une question à l'utilisateur. Le code général pour les afficher est le suivant :
```swift
let alert = UIAlertController(title: "Erreur", message: "Message", preferredStyle: .alert)
let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
alert.addAction(action)
present(alert, animated: true, completion: nil)
```
- Il existe deux types d'alertes et trois styles de boutons.

Dans le prochain chapitre, je vous propose un petit bonus bien pratique ! Vous allez découvrir les extensions, une fonctionnalité de Swift bien pratique !

### Allez plus loin avec les extensions
Ce chapitre est un petit chapitre bonus pour vous parler d'un concept très pratique de Swift : les extensions !

|IMAGE Images/P3/P3C3_1.jpg| []

Oui je sais ! Mais courage, prenez un petit remontant parce que ça vaut vraiment le coup !

#### Présentation du concept
**Les extensions permettent de rajouter des fonctionnalités à un type, que ce soit une classe, une structure, une énumération ou même un protocole.**

Le principe est vraiment simple et ce sera limpide avec un exemple. Je vais vous montrer comment étendre le type `Int`.

> **:information_source:** Je vous suggère d'ouvrir un Playground pour me suivre.

Pour créer une extension, on utilise le mot-clé `extension` suivi du nom du type et on ouvre des accolades :

```swift
extension Int {

}
```

Maintenant vous pouvez rajouter des méthodes par exemple :

```swift
extension Int {
	func addTwo() -> Int {
		return self + 2
	}
	func square() -> Int {
		return self * self
	}
}
```

Désormais dans votre projet, **tous les entiers pourront utiliser ces méthodes**. C'est comme si elles avaient toujours existé dans le code original de la classe.

Donc vous pouvez écrire :

```swift
var x = 3
x.addTwo() // Renvoie 5
x.square() // Renvoie 9
```

Et vous pouvez même écrire directement :

```swift
3.addTwo() // Renvoie 5
3.square() // Renvoie 9
```

Bien sûr, ici ce n'est pas particulièrement utile. Mais les extensions permettent de rajouter des fonctionnalités très pratiques à des classes auxquels vous n'avez pas accès.

Par exemple, si vous avez suivi le [cours d'introduction à iOS](https://openclassrooms.com/courses/introduction-a-ios-plongez-dans-le-developpement-mobile), vous vous souvenez que le code pour obtenir un entier aléatoire n'est pas très agréable :

```swift
Int(arc4random_uniform(UInt32(10)))
```

On va en créer une méthode de classe qui soit plus simple à utiliser que le code ci-dessus :

```swift
extension Int {
	// (...)
	static func random(max: Int) -> Int {
		return Int(arc4random_uniform(UInt32(max)))
	}
}
```

La partie illisible et compliquée se retrouve cachée dans notre méthode et maintenant pour obtenir un entier aléatoire entre 0 et 9, on n'a plus qu'à faire :

```swift
Int.random(max: 10)
```

C'est quand même beaucoup plus lisible et plus clair !

#### Philosophie de l'extension

**Lorsque vous travaillez dans une extension, c'est comme si vous étiez dans la classe, structure ou autre que vous étendez !**

Du coup, vous pouvez rajouter :
- des méthodes
- des méthodes de classe
- des propriétés calculées de classe ou d'instance
- des initialisations
- des sous-types (déclaration d'un type à l'intérieur de l'extension)

Les deux seules choses que vous ne pouvez pas faire dans une extension sont :
- **ajouter des propriétés stockées** ou modifier les observeurs d'une propriété stockée existante.
- modifier une méthode existante.

> **:information_source:** La raison derrière cela, c'est que **l'extension ne doit jamais altérer la classe originale**. Or, si vous modifiez les méthodes, évidemment vous altérer la classe. Et si vous ajoutez des propriétés stockées, comme celles-ci sont sauvegardées en mémoire. Leur ajout va altérer la structure de la classe en mémoire.

#### Ajouter des constantes

En plus de rajouter des fonctionnalités à une classe, les extensions peuvent être utilisées pour rajouter des constantes. Laissez-moi vous donner 3 exemples.

##### UIColor

Le designer avec qui vous travaillez utilise sans doute une palette de couleur bien précise pour l'application. Cette palette, vous pouvez la reproduire dans le storyboard et cela évite de devoir recréer la couleur à chaque fois que vous voulez l'utiliser !

> **:information_source:** On en a parlé [ici](https://openclassrooms.com/courses/concevez-une-application-iphone-avec-le-modele-mvc/creez-votre-page-de-lancement#/id/r-4570954).

Mais quand vous voulez utiliser vos couleurs dans le code, c'est nettement moins simple et vous devez constamment répeter du code qui ressemble à :

```swift
UIColor(red: 205/255, green: 240/255, blue: 255/255, alpha: 1.0)```

> **:information_source:** Si vous avez besoin d'un rappel sur `UIColor`. Suivez ce [lien](https://openclassrooms.com/courses/concevez-une-application-iphone-avec-le-modele-mvc/implementez-la-classe-questionview#/id/r-4571793).

Avouons -le, ce n'est pas merveilleux de répeter ça partout. Non seulement c'est difficile à écrire : qui se souviendra des valeurs ? En plus, c'est difficile à lire, on ne sait pas quelle couleur ça représente.

Pourtant, pour les couleurs par défaut comme le blanc, on peut écrire plus simplement :

```swift
UIColor.white
```

Et bien avec les extensions, nous allons essayer d'obtenir ce résultat, mais pour les couleurs de notre choix. Et voilà comment nous allons faire :

```swift
extension UIColor {
	public class var lightBlue: UIColor {
		return UIColor(red: 205/255, green: 240/255, blue: 255/255, alpha: 1.0)
	}
	public class var deepBlue: UIColor {
		return UIColor(red: 41/255, green: 180/255, blue: 206/255, alpha: 1.0)
	}
	public class var purple: UIColor {
		return UIColor(red: 173/255, green: 79/255, blue: 139/255, alpha: 1.0)
	}
	public class var pink: UIColor {
		return UIColor(red: 219/255, green: 167/255, blue: 201/255, alpha: 1.0)
	}
}
```

Nous créons une extension de `UIColor`. Dans l'extension on crée simplement des propriétés calculées de classe de type `UIColor`. Ces propriétés calculées renvoient les couleurs de notre choix.

Et maintenant on peut utiliser nos couleurs partout dans l'application comme ceci :

```swift
UIColor.lightBlue
UIColor.purple
UIColor.deepBlue
UIColor.pink
```

C'est pas magnifique ? Je vous suggère de créer un fichier `Colors.swift` dans tous vos projets dans lequel vous utilisez cette technique systématiquement !

##### UIFont

On peut faire la même chose pour la police ! Pour utiliser les polices dans le code, on doit écrire :

```swift
UIFont(name: "MyCustomFont", size: 12)
```

Je n'aime pas garder une chaîne de caractère comme ça au milieu de mon code, c'est la porte ouverte à des fautes de frappe, car l'autocomplétion ne fonctionne pas pour les chaînes de caractères.

À la place, j'aimerais obtenir quelque chose comme ce qui existe pour la police par défaut d'iOS :

```swift
UIFont.systemFont(ofSize: 12)
```

Et pour cela, nous allons créer une extension :

```swift
extension UIFont {
	public class func myCustomFont(ofSize size: CGFloat) -> UIFont {
		return UIFont(name: "MyCustomFont", size: 12)!
	}
}
```

Et on peut maintenant utiliser notre police aisément dans l'application :

```swift
UIFont.myCustomFont(ofSize: 12)
```

On peut même aller plus loin en créant des propriétés calculées pour les différentes tailles de polices utilisées dans l'application :

```swift
extension UIFont {
	public class func myCustomFont(ofSize size: CGFloat) -> UIFont {
		return UIFont(name: "MyCustomFont", size: 12)!
	}

	public class var textFont: UIFont {
		return myCustomFont(ofSize: 12)
	}

	public class var titleFont: UIFont {
		return myCustomFont(ofSize: 20)
	}
}
```

Et vous pouvez utiliser vos polices comme cela :

```swift
UIFont.textFont
UIFont.titleFont
```

C'est pas beau franchement ? Je vous suggère de faire cela à chaque fois que vous devrez gérer des polices !

##### Notification

Autre exemple : les notifications. Lorsque vous voulez envoyer une notification, vous devez écrire :

```swift
let name = Notification.Name(rawValue: "LeNomDeMaNotification")
let notification = Notification(name: name)
NotificationCenter.default.post(notification)
```

Et pour recevoir la notification, vous devez écrire :

```swift
let name = Notification.Name(rawValue: "LeNomDeMaNotification")
NotificationCenter.default.addObserver(
	self, selector: #selector(unMéthode), name: name, object: nil)
```

> **:information_source:** Si vous avez besoin d'un rappel, vous pouvez jeter un œil [ici](https://openclassrooms.com/courses/concevez-une-application-iphone-avec-le-modele-mvc/envoyez-les-questions-au-controleur) et [là](https://openclassrooms.com/courses/concevez-une-application-iphone-avec-le-modele-mvc/connectez-le-controleur-et-le-modele).

Il y a plusieurs choses que je n'aime pas. Déjà, on se trimballe encore une chaîne de caractères partout dans le code comme pour les polices ! Ensuite, on doit répéter la ligne de déclaration du nom de la notification à chaque fois.

Pour éviter tout cela et rendre notre code plus propre, nous allons étendre le type `Notification.Name`.

> **:information_source:** Oui, on peut étendre les types imbriqués. ;)

Et ça donne ça :

```swift
extension Notification.Name {
	static let leNomDeMaNotification = Notification.Name("LeNomDeMaNotification")
}
```

Je crée une propriété de classe constante qui contient le nom de ma notification. Et maintenant je peux envoyer ma notification comme ceci :

```swift
let notification = Notification(name: .leNomDeMaNotification)
NotificationCenter.default.post(notification)
```

Et je peux même gagner encore une ligne en utilisant une variante de la méthode `post` :

```swift
NotificationCenter.default.post(name: .leNomDeMaNotification, object: nil)
```

Et je peux recevoir la notification sans avoir à créer une nouvelle instance de Notification.Name :

```swift
NotificationCenter.default.addObserver(
	self, selector: #selector(unMéthode), name: .leNomDeMaNotification, object: nil)
```

Et voilà ! C'est quand même bien plus propre. Maintenant je veux que vous n'utilisiez les notifications que comme ça !

Avec seulement trois exemples, vous pouvez améliorer de beaucoup la qualité de votre code en évitant les chaines de caractères qui se baladent et la répétition de code compliqué ou illisible. **Les extensions sont une particularité de Swift qui contribue beaucoup à la qualité du langage !**

Mais il y a plus !

#### Organiser son code
Les extensions sont aussi utiles pour organiser son code. En effet, **on peut créer autant d'extensions qu'on veut d'un même type**. Donc on va pouvoir faire des choses de ce genre-là :

```swift
class MaClasse {
	// Une partie du contenu de ma classe
}

extension MaClasse {
	// Une autre partie du contenu de ma classe
}

extension MaClasse {
	// Une troisième partie du contenu de ma classe
}
```

Voyons ce qu'on peut faire avec ça :


##### Séparer le contenu et le comportement
C'est une bonne pratique de séparer ses classes ou structures en deux :
- le contenu (*la structure de données*): les propriétés stockées
- le comportement (*ce que fait la classe*) : les initialisations, méthodes, propriétés calculées, etc.

Par exemple, faisons cela avec notre structure `Pet`, cela donne :

```swift
struct Pet {
	enum Gender {
		case male, female
	}

	var name: String?
	var hasMajority: Bool
	var phone: String?
	var race: String?
	var gender: Gender
}

extension Pet {
	enum Status {
		case accepted
		case rejected(String)
	}

	var status: Status {
		if name == nil || name == "" {
			return .rejected("Vous n'avez pas indiqué votre nom !")
		}
		if phone == nil || phone == "" {
			return .rejected("Vous n'avez pas indiqué votre téléphone !")
		}
		if race == nil || race == "" {
			return .rejected("Quel est votre race ?")
		}
		if !hasMajority {
			return .rejected("Les mineurs ne sont pas admis.")
		}
		return .accepted
	}
}
```

On voit tout de suite quelles sont les données que détient la structure et ensuite on peut s'intéresser à ce qu'elle fait. C'est bien propre ! :)

#### Se conformer à des protocoles

Ce découpage se fait aussi souvent lorsque **le type se conforme à des protocoles**. Par exemple, pour notre `FormViewController`, on peut créer une extension pour traiter tout ce qui concerne les protocoles `UIPickerViewDataSource` et `UIPickerViewDelegate` à part.

```swift
extension FormViewController: UIPickerViewDelegate, UIPickerViewDataSource {
	func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
		return dogRaces.count
	}

	func numberOfComponents(in pickerView: UIPickerView) -> Int {
		return 1
	}

	func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
		return dogRaces[row]
	}
}
```

> **:warning:** Vous noterez que les protocoles `UIPickerViewDataSource` et `UIPickerViewDelegate` ont été rajoutés à la suite de la déclaration de l'extension après les `:`. C'est la même syntaxe que pour la déclaration de la syntaxe.

#### Organisation du code par groupe de méthodes

Dans la même logique, on peut organiser le code d'une classe complexe en **regroupant des méthodes qui se rapportent à la même fonctionnalité**. Ainsi, notre code du `FormViewController` devient :

```swift
class FormViewController: UIViewController {
	// MARK: - Properties
	var dog: Pet!

	// MARK: - Outlets
	@IBOutlet weak var racePickerView: UIPickerView!
	@IBOutlet weak var majoritySwitch: UISwitch!
	@IBOutlet weak var nameTextField: UITextField!
	@IBOutlet weak var phoneTextField: UITextField!
	@IBOutlet weak var genderSegmentedControl: UISegmentedControl!
}

// MARK: - Keyboard
extension FormViewController: UITextFieldDelegate {
	@IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
		nameTextField.resignFirstResponder()
		phoneTextField.resignFirstResponder()
	}

	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		textField.resignFirstResponder()
		return true
	}
}

// MARK: - PickerView
extension FormViewController: UIPickerViewDataSource, UIPickerViewDelegate {
	func numberOfComponents(in pickerView: UIPickerView) -> Int {
		return 1
	}

	func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
		return dogRaces.count
	}

	func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
		return dogRaces[row]
	}
}

// MARK: - Validate
extension FormViewController {
	@IBAction func validate() {
		createPetObject()
		checkPetStatus()
	}

	private func createPetObject() {
		let name = nameTextField.text
		let phone = phoneTextField.text
		let hasMajority = majoritySwitch.isOn
		let gender: Pet.Gender = (genderSegmentedControl.selectedSegmentIndex == 0) ? .male : .female
		let raceIndex = racePickerView.selectedRow(inComponent: 0)
		let race = dogRaces[raceIndex]

		dog = Pet(name: name, hasMajority: hasMajority, phone: phone, race: race, gender: gender)
	}

	private func checkPetStatus() {
		switch dog.status {
			case .accepted:
			performSegue(withIdentifier: "segueToSuccess", sender: nil)
			case .rejected(let error):
			presentAlert(with: error)
		}
	}

	private func presentAlert(with error: String) {
		let alert = UIAlertController(title: "Erreur", message: error, preferredStyle: .alert)
		let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
		alert.addAction(action)
		present(alert, animated: true, completion: nil)
	}
}


// MARK: - Navigation
extension FormViewController {
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "segueToSuccess" {
			let successVC = segue.destination as! SuccessViewController
			successVC.dog = dog
		}
	}
}
```

Le code de `FormViewController` est bien plus facile à lire. On voit au premier coup d'oeil quelles sont les propriétés de cette classe et qu'elles en sont les fonctionnalités principales.

> **:information_source:** J'utilise les marqueurs MARK pour séquencer le code. Plus d'infos [ici](https://stackoverflow.com/questions/35963128/swift-understanding-mark).


#### En résumé
- **Les extensions permettent d'étendre les fonctionnalités d'un type**
- Il y a trois cas d'utilisations majeures :
	- Rajouter une nouvelle fonctionnalité
	- Rajouter des constantes
	- Organiser le code

Bravo d'être venu à bout de ce gros chapitre bonus ! Je savais bien que je n'avais pas encore pressé tout le jus de votre cerveau !

### Conclusion

Bravo ! L'étendue de vos compétences en iOS grandit à vue d'oeil !

Vous êtes maintenant capable de créer des applications de plusieurs pages et donc d'envisager des applications bien plus complexes.

Par ailleurs, vous maîtrisez maintenant la plupart des composants d'une interface d'application iPhone et vous pouvez donc créer des formulaires aussi sophistiqués que vous le souhaitez !

#### En résumé

##### La navigation en iOS
Dans ce cours, vous avez découvert la navigation en iOS ! Vous savez désormais créer de nouvelles pages et organiser la navigation entre elles.

Vous savez manier les différents modes de navigation comme `UINavigationController` ou `UITabBarController`.

Vous avez également tout vu sur les segues : comment les créer dans le storyboard, les différents types existants. On a même parlé des *unwind segue* pour dépiler plusieurs pages d'un coup.

|IMAGE Images/P1/P1C6_5.png| [Les modes de navigations disponibles en iOS]

Concernant la navigation, vous avez également appris à faire passer les données d'un contrôleur à l'autre en utilisant la méthode `prepareForSegue`. Et vous savez également présenter des alertes avec `UIAlertController`.

##### Les formulaires
Nous avons vu comment utiliser des composants bien pratiques dans les formulaires comme les champs de texte, les switchs, les contrôles segmentés et les sélecteurs.

On a vu ensemble comment gérer l'affichage, la personnalisation et la disparition du clavier.

On a eu l'occasion de parler d'une notion avancée de Swift : les protocoles et comment cela est utilisé dans le MVC en iOS avec les `delegate` et les `dataSource`. Nous aurons l'occasion d'y revenir en détail lorsqu'on parlera des `TableView.`

Enfin, on a fait un tour du côté des extensions qui sont vraiment une des grosses raisons pour laquelle les développeurs adorent Swift ! Donc j'espère que vous vous joindrez à eux !

#### Et maintenant ?

Je vous invite à aller explorer les autres modes de navigation comme `UIPageViewController` ou `UISplitViewController` et essayer de construire de petites applications avec.

Vous pouvez aussi vous amuser à explorer d'autres composants comme `UIDatePickerView` pour sélectionner une date ou `UITextView` pour afficher des longs textes !

Bref, continuez à être curieux et à explorer l'univers iOS !

En attendant, je n'ai plus qu'à vous quitter avec le mot de la fin et le mot de la fin évidemment, c'est...

|IMAGE Images/P3/P3C4_1.jpg| []
