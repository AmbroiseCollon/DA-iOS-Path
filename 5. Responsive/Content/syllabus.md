# Créez une application responsive pour l'iPhone et l'iPad

## Découvrez le responsive

### Tirez le meilleur de ce cours

Bienvenue dans ce cours sur la création d'application responsive en iOS ! Nous allons apprendre à adapter une interface à toutes les tailles d'écran existantes en iOS !

==> (Images/P1/P1C1_0.jpg)

#### Prérequis
Dans ce cours, nous allons travailler sur l'application OpenQuizz. Si vous avez suivi le cours précédent, vous connaissez bien cette application pour l'avoir conçu de A à Z !

> **:information_source:** En effet, ce cours fait partie d'un [parcours](https://openclassrooms.com/paths/developpeur-se-dapplication-ios) sur le développement iOS. À moins que vous ayez déjà une bonne connaissance de Swift et du développement en iOS (en particulier de l'interface builder), je vous invite en prendre les cours dans l'ordre suivant :
- Cours [1](https://openclassrooms.com/courses/introduction-a-ios-plongez-dans-le-developpement-mobile) : Introduction à iOS. *Dans ce cours, vous allez faire votre première application mobile à partir de zéro !*
- Cours [2](https://openclassrooms.com/courses/apprenez-les-fondamentaux-de-swift) et [3](https://openclassrooms.com/courses/approfondissez-swift-avec-la-programmation-orientee-objet) : Swift. *Avec ces deux cours, vous saurez tout du langage Swift !*
- Cours [4](https://openclassrooms.com/courses/concevez-une-application-iphone-avec-le-modele-mvc) : Développer une application iPhone avec le modèle MVC. *C'est dans ce cours que l'on crée l'application OpenQuizz.*

Si vous ne connaissez pas l'application, mais que vous avez les compétences nécessaires pour suivre le cours, pas de panique ! Nous allons voir ensemble ce qu'est OpenQuizz pour que vous ne soyez pas perdu.

#### L'application OpenQuizz

L'application OpenQuizz est comme son nom l'indique un **jeu de quizz**.

Dans ce jeu, l'utilisateur peut répondre à 10 questions par vrai ou faux. Pour cela, il peut glisser la question vers la droite ou la gauche pour donner sa réponse.

==> (Images/P1/P1C1.gif)

À chaque bonne réponse, il marque un point ! À la fin des 10 questions, la partie se termine.

Pour relancer une partie l'utilisateur peut cliquer sur `New Game` recharger de nouvelles questions.

#### Inspecter OpenQuizz

Pour suivre ce cours, vous allez donc avoir besoin du projet OpenQuizz. Je vous invite à le télécharger à [cette adresse](https://github.com/AmbroiseCollon/OpenQuizz).

Ouvrez le projet avec Xcode et lancez l'application pour vous familiariser un peu avec.

Une fois que c'est fait, je vous propose de regarder comment est construite l'interface en ouvrant le fichier `Main.storyboard`. Nous allons exclusivement travailler sur ce dossier dans ce cours.

==> (Images/P1/P1C2.png)

L'interface est composée de 4 éléments :
- Une vue question : la vue grise qui contient deux sous-vues :
	- Un label qui affiche le texte de la question.
	- Une icône qui varie en fonction de la réponse de l'utilisateur.
- Un label qui affiche le score de l'utilisateur
- Un bouton `New Game` pour relancer la partie.
- Un indicateur d'activité positionné derrière le bouton pour notifier l'utilisateur que les questions sont en cours de chargement.

> **:warning:** Dans ce cours, nous allons travailler sur toutes ces vues donc assurez-vous que vous avez bien compris la structure de cette interface.

#### Le problème

> **:question:** Bon on a compris qu'elle était belle ton appli... C'est quoi le problème ?

J'y viens ! **Notre interface n'est belle pour l'instant que sur un iPhone 7 (ou 6). Sur les autres tailles d'iPhone, l'interface ne s'adapte pas.** Vous ne me croyez pas ? Laissez-moi vous montrer.

Ouvrez le storyboard. Et cliquez en haut pour vous placer en mode assistant.

À la place du *ViewController* qui devrait s'afficher sur la gauche par défaut, nous allons afficher le **mode aperçu**. Pour cela cliquez en haut sur *Automatic* puis glissez en bas dans la liste déroulante jusqu'à *Preview* et choisissez `Main.storyboard (Preview)`.

==> (Images/P1/P1C1_3.gif)

Votre interface devrait ressembler à ceci :

==> (Images/P1/P1C1_4.png)

Sur la gauche vous avez le storyboard et sur la droite le mode aperçu. **Le mode aperçu permet de visualiser votre interface sur plusieurs appareils différents.** Pour cela, cliquez sur le `+` en bas à gauche de la section aperçu et rajoutez autant d'appareils que vous le souhaitez.

==> (Images/P1/P1C1_5.png)

J'ai de mon côté décidé de rajouter toutes les tailles possibles d'iPhone et cela donne :

==> (Images/P1/P1C1_6.png)

Et là c'est flagrant :O ! On constate avec le mode aperçu que **notre interface ne s'affiche correctement que sur l'iPhone 7** :
- sur les plus petits iPhone : le bouton est trop bas et donc n'est même plus visible à l'écran.
- de manière générale : le contenu n'est plus centré.
- sur les iPhone "Plus" : le bouton ne reste pas en bas de l'interface

Et encore, nous n'avons même pas essayé de regarder ce que cela donne sur un iPad ou si on tourne l'écran de l'iPhone en mode paysage !

Dans ce cours, nous allons donc apprendre à adapter notre interface à toutes les tailles d'écran de l'iPhone et iPad et pour les deux orientations paysage et portrait.

> **:x:** Et c'est essentiel, car **Apple n'accepte pas sur l'App Store les applications qui ne sont pas responsive**, car elles n'offrent pas une expérience équivalente aux utilisateurs quel que soit leur appareil.

#### La solution

Pour résoudre notre problème, nous allons commencer dès le prochain chapitre par apprendre quelles sont les différentes tailles d'écran de la famille iOS.

Ensuite dans la partie 2, nous allons adapter notre interface à **tous les iPhone en mode portrait**. Pour cela, nous allons apprendre à créer des contraintes avec **AutoLayout**.

Enfin en partie 3, nous découvrirons comment les **catégories de taille** vont nous permettre d'adapter notre interface à tous les écrans de l'iPhone et de l'iPad en mode paysage et portrait.

### Classez les tailles d'écran des appareils iOS

Pour aborder sereinement la question de la gestion des tailles d'écran, commençons par faire le tour des tailles que vous allez devoir gérer en iOS.

#### Les tailles d'écran

On parle généralement des tailles d'écran en **pouce** (noté `''`) et on **mesure la diagonale**.

En iOS, il y a deux grandes familles de tailles :
- les tailles iPhone et iPod
- les tailles iPad

Dans chaque famille il y a 4 tailles différentes, que je vous résume dans le schéma ci-dessous.

==> (Images/P1/P1C2_1.png)

Ce schéma résume les 8 tailles existantes dans la famille iOS avec la liste exhaustive de tous les appareils iOS associés. Inutile que vous connaissiez tout cela par coeur. Sachez seulement qu'il y a 4 tailles par famille. Et ces 8 tailles, vous pouvez toutes les visualiser dans le storyboard !

> **:information_source:** Les noms *iPad Pro Small* et *iPad Pro Big* ne sont pas les noms officiels des produits Apple. Il y a juste deux iPad Pro différents par leurs tailles et il y a eu deux générations de cette gamme.

#### Visualiser les tailles dans le storyboard

Pour changer la taille de l'interface dans le storyboard, il faut utiliser le sélecteur de tailles. En bas à gauche du storyboard, vous avez le bouton suivant :

==> (Images/P1/P1C2_2.png)

Cliquez dessus pour révéler le sélecteur de taille.

==> (Images/P1/P1C2_3.png)

Ici vous pouvez sélectionner la taille à laquelle vous souhaitez afficher les interfaces de votre storyboard. Par défaut, la taille est celle de l'iPhone 7 (*4,7 pouces*), mais vous pouvez modifier ça à votre guise.

Je vous invite à jouer un peu avec. Il y a trois réglages possibles :
- la **taille**
- l'**orientation**
- l'**adaptation**

##### La taille

La taille de l'écran permet de choisir tou simplement la taille d'écran que l'on souhaite visualiser.

==> (Images/P1/P1C2_4.png)

> **:question:** Il y a bien quatre tailles pour l'iPhone, mais il n'y a que trois tailles pour l'iPad ! Ils en ont oublié une ?

Bien vu ! La taille de l'iPad Mini (*7,9 pouces*) ne peut pas être visualisée. Pourquoi ? Et bien, car cette taille garde exactement les proportions de l'iPad normal (*9,7 pouces*). Donc on peut développer pour l'iPad et iOS s'occupe automatiquement de mettre à l'échelle l'interface pour l'iPad Mini. Pratique !

##### L'orientation

On peut décider d'afficher l'orientation paysage ou portrait.

==> (Images/P1/P1C2_5.png)

##### L'adaptation
Si vous choisissez l'un des iPad dans le sélecteur, un troisième réglage est disponible : l'adaptation.

==> (Images/P1/P1C2_6.png)

En effet sur l'iPad, on peut afficher deux applications l'une à côté de l'autre. Apple appelle cela [Split View](https://support.apple.com/fr-fr/HT207522). Du coup l'application ne prendra plus tout l'écran, il faut donc prévoir la variation de la taille de l'interface dans ce cas. Et c'est avec le réglage *Adaptation* qu'on peut le visualiser.

#### En résumé
- Il a 8 tailles d'écran différentes pour les appareils iOS, 4 pour l'iPad et 4 pour l'iPhone et l'iPod touch
- Comme avec le mode aperçu dans le chapitre précédent, le sélecteur de taille vous permet donc de visualiser ce que donne votre application sur différents appareils directement dans le storyboard. Et vous pouvez voir que dès que l'on quitte l'iPhone 7, ça n'est pas très probant !

Dès le prochain chapitre, nous allons commencer à résoudre ce problème !


## Placez vos vues avec AutoLayout

### Découvrez AutoLayout
Pour adapter notre interface, nous allons découvrir ensemble **AutoLayout**. Dans cette partie, nous allons nous fixer un objectif simple : que l'interface s'adapte bien à toutes les tailles d'écran d'**iPhone en mode portrait**.

Pour l'instant, dans le mode aperçu, on voit ceci :

==> (Images/P2/P2C1_1.png)

Nous allons faire en sorte d'obtenir plutôt ceci à la fin de la partie :

==> (Images/P2/P2C1_2.png)

On veut donc que :
- Toutes les vues restent centrées horizontalement.
- Le bouton reste toujours à la même distance du bas de l'écran.
- La vue question reste toujours à la même distance du haut de l'écran.
- Le label score reste toujours à la même distance de la vue question.

#### Qu'est-ce qu'AutoLayout ?

AutoLayout permet de créer des **contraintes** qui définissent des **relations** entre deux vues.

> **:question:** Contraintes ? Relations ? Tu peux être moins vague ? :D

Ok ok... Notre travail va être de donner des informations à AutoLayout, pour qu'il puisse modifier la position et la taille de nos vues en fonction de la taille de l'écran. Ces informations, on appelle cela des **contraintes**.

##### Les contraintes

**Une contrainte, c'est une distance** (en *points*) **qui doit rester constante**. Par exemple, pour le bouton *New Game*, nous allons créer une contrainte qui va dire à AutoLayout : "*garde toujours une distance de 20 points entre le bas de l'écran et le bas du bouton*".

==> (Images/P2/P2C1_3.png)

Avec cette information, AutoLayout sait maintenant que, quelle que soit la taille de l'écran (iPhone, iPad, mode portrait ou paysage), le bouton doit **toujours** rester à 20 points du bord bas de l'écran.

##### La vue racine

Il existe une vue pour laquelle nous n'avons pas besoin de faire ce travail, c'est la vue racine.

> **:information_source:** Souvenez-vous, chaque contrôleur a une propriété `view` qui est la vue racine dans notre hiérarchie des vues.

Dans le cas d'OpenQuizz, c'est la vue bleu foncé au fond qui prend tout l'écran. Et justement elle prend tout l'écran grâce à AutoLayout.

En effet **la vue racine a automatiquement 4 contraintes**. Ces 4 contraintes indiquent à AutoLayout que la vue racine doit toujours garder une distance de 0 point avec le bord de l'écran dans les 4 directions (haut, bas, gauche droite).

==> (Images/P2/P2C1_4.png)

Donc **la vue racine prend toujours tout l'écran**. Et cela va nous être bien pratique, car on va pouvoir se servir du coup de cette vue comme repère pour définir les contraintes sur les autres vues.

#### Types de contrainte

Pour l'instant, je vous ai dit qu'une contrainte, c'est une distance constante entre deux vues. Pour la plupart des contraintes, c'est vrai et je pense que c'est la meilleure façon de retenir le rôle d'une contrainte.

Mais quelques contraintes échappent à cette définition. En effet, il existe plusieurs types de contraintes pour permettre des placements plus ou moins fins :
- **Distance** entre deux vues : ce qu'on a vu jusqu'à présent.
- **Alignement** entre deux vues : ce type de contrainte permet d'aligner deux vues entre elles par rapport à leur centre vertical ou horizontal, ou sur un de leur côté (haut, bas, gauche ou droite).
- **Taille** d'une vue : ce type de contrainte permet de fixer la largeur ou la hauteur d'une vue ou le rapport entre ces deux valeurs.
- **Égalité des tailles** : ce type de contrainte permet de décider que deux vues doivent garder la même taille, même si celle-ci doit varier.

Nous verrons dans le prochain chapitre comment créer tous ces types de contraintes.

#### Quatre contraintes

Comme vous l'avez appris, une vue c'est un rectangle et pour définir la place qu'il occupe sur un écran, il faut quatre informations :
- **x** (sa position horizontale)
- **y** (sa position verticale)
- **largeur**
- **hauteur**

AutoLayout a besoin de ces 4 informations pour savoir comment placer chaque vue sur toutes les tailles d'écran.

Si on reprend l'exemple de notre bouton, nous avons déjà une contrainte qui nous permet de définir sa **position verticale**.

==> (Images/P2/P2C1_4.png)

On veut également que notre bouton soit centré. Donc on va définir une contrainte d'alignement qui indique à AutoLayout : "*le bouton doit rester centré horizontalement par rapport à la vue principale*". Cela permet de **positionner horizontalement** notre bouton.

==> (Images/P2/P2C1_5.png)

Pour assurer que notre bouton garde toujours sa taille, nous allons définir deux contraintes supplémentaires : "*le bouton doit toujours avoir une largeur de 200 points et une hauteur de 80 points*". Cela permet de fixer sa **hauteur** et sa **largeur**.

==> (Images/P2/P2C1_6.png)

Avec toutes ces contraintes, notre bouton va garder la taille et la position que l'on souhaite, quelle que soit la taille de l'écran.

Pour donner ces quatre informations à AutoLayout (x, y, largeur et hauteur), on remarque que nous avons eu besoin de créer 4 contraintes. **Dans 95% des cas, il vous faudra créer au moins 4 contraintes par vue.** Sinon AutoLayout n'aura pas toutes les informations nécessaires pour placer correctement vos vues sur tous les écrans.

#### AutoLayout vs Frame

On a vu dans le [cours précédent](https://openclassrooms.com/courses/concevez-une-application-iphone-avec-le-modele-mvc/placez-vos-vues) que la propriété `frame` de `UIView` permet de placer les vues par rapport à leur vue parente.

AutoLayout remplit le même rôle, mais avec l'avantage de pouvoir adapter la position et la taille des vues en fonction de l'écran. **Donc dans la grande majorité des cas, vous allez désormais utiliser plutôt AutoLayout pour placer vos vues.**

> **:information_source:** D'ailleurs AutoLayout est prioritaire sur `frame` s'il y a concurrence entre les deux.

#### En résumé
- AutoLayout permet de créer des contraintes qui définissent des relations entre deux vues.
- Une contrainte est le plus souvent une distance entre deux vues qui doit rester constante.
- AutoLayout a toujours besoin de quatre informations pour positionner une vue avec précision, quelle que soit la taille d'écran : position horizontale et verticale, largeur et hauteur.
- Désormais vous utiliserez plutôt AutoLayout que `frame` pour placer vos vues.

Dans le prochain chapitre, nous allons apprendre à créer des contraintes avec AutoLayout.

### Créez vos contraintes

Alors comment fait-on pour définir toutes ces contraintes ? On va faire cela dans le storyboard. Et je vous propose de commencer par le bouton !

Cliquez sur le bouton pour le sélectionner. Ensuite nous allons nous intéresser aux 5 boutons **en bas à droite** dans le storyboard. Ce sont eux qui permettent de gérer les contraints de l'interface aux différentes tailles d'écran.

==> (Images/P2/P2C2_1.png)

Celui qui nous intéresse en premier, c'est le quatrième (en forme de TIE Fighter pour les fans de Star Wars ;)). Cliquez dessus :

==> (Images/P2/P2C2_2.png)

La popup qui s'affiche nous permet de définir des contraintes. En haut, vous avez 4 contraintes possibles. Ce sont des contraintes de type **distance entre deux vues**. Elles correspondent donc à **la distance au plus proche voisin** dans les 4 directions possibles (haut, bas, gauche, droite).

#### Les voisins

> **:question:** Le plus proche voisin ?

En haut du bouton par exemple, il y a quatre voisins possibles et vous pouvez les afficher en cliquant sur la petite flèche à droite de la valeur 234 :

==> (Images/P2/P2C2_3.png)

Le plus proche voisin en haut, c'est donc le label score. Puis la vue grise qui contient la question. Puis au-dessus, on a le *Top Layout Guide*, enfin il y a tout en en haut, le haut de la vue principale.

> **:information_source:** Dans le storyboard, vous avez ce qu'on appelle les layout guide. Ce ne sont pas des vues, mais des repères pour placer vos vues. En particulier, le *Top Layout Guide* est un repère situé juste en dessous de la barre de statut (là où se trouve les informations du téléphone comme la batterie, l'heure ou la qualité du signal réseau). Ce repère est donc légèrement plus bas que le haut de la vue principale qui se situe tout en haut de l'écran.

#### Les trois premières contraintes

Maintenant que la notion de plus proche voisin est claire, rajoutons notre première contrainte. Nous souhaitons que le bouton soit à une distance de 20 points du bas de la vue principale. Pour cela, il suffit de cliquer sur le petit segment rouge du bas dans la popup. En faisant, cela nous créons une contrainte de distance entre le bas du bouton et le bas de la vue principale. Le **positionnement vertical** est prêt à être fixé.

Avant de cliquer sur *Add 1 Constraint*, nous allons rajouter les contraintes de **largeur** et **hauteur**. Plus bas, dans la popup, vous trouvez les contraintes *Width* et *Height*. **Par défaut, leurs valeurs correspondent à la taille actuelle du bouton**. Vous pouvez les cocher pour ajouter ces contraintes. À la fin votre popup doit ressembler à ceci :

==> (Images/P2/P2C2_4.png)

Vous pouvez cliquer sur *Add 3 constraints* pour ajouter les trois contraintes. Les contraintes sont désormais visibles autour du bouton.

#### La dernière contrainte

Mais un warning (erreur jaune) apparaît dans Xcode ainsi que des lignes rouges autour du bouton :

==> (Images/P2/P2C2_5.png)

Elles sont rouges, car la position du bouton est toujours ambigüe. **En effet, sa position horizontale (sur l'axe des x) n'est pas encore fixée**. Et comme nous l'avons vu dans le chapitre précédent, AutoLayout exige les 4 informations (x, y, largeur et hauteur) pour fonctionner correctement.

Pour ajouter notre dernière contrainte, nous allons utiliser le **troisième bouton en bas à droite** qui permet de gérer l'alignement. En cliquant sur ce bouton, apparaît la popup suivante :

==> (Images/P2/P2C2_6.png)

Cette popup permet de créer des **contraintes d'alignement entre deux vues**. Ici, comme nous avons sélectionné une seule vue, nous avons seulement deux options :
- centrer horizontalement dans la vue qui contient le bouton (la vue principale)
- centrer verticalement dans la vue qui contient le bouton (la vue principale)

Ici, on veut centrer horizontalement donc on coche la première case et on clique sur *Add 1 constraint*.

==> (Images/P2/P2C2_7.png)

Notre bouton a désormais 4 contraintes qui permettent de déterminer sa position avec certitude, les lignes rouges ont disparu. Si on retourne sur le mode aperçu, on peut voir que notre bouton s'affiche correctement dans tous les cas :

==> (Images/P2/P2C2_8.png)

#### Les autres vues

Il faut maintenant rajouter les contraintes pour toutes les autres vues. Comme cela reprend ce que je viens de vous montrer et qu'une vidéo vaut bien mieux qu'un long texte pour ce sujet, je vous propose de consulter gratuitement [cette vidéo](INSERT LINK).

> **:warning:** J'y glisse plusieurs astuces sur lesquelles je ne reviendrais pas autrement donc prenez le temps de bien la regarder.

#### Exercice
Adaptez l’interface de la page de lancement
Correction en screencast

Dans le prochain chapitre, nous allons voir comment inspecter et modifier vos contraintes.

### Manipulez les contraintes

Parfois vous allez vouloir modifier les contraintes que vous avez créées ou simplement les inspecter pour faire le point sur ce qui va ou ne va pas. Voyons ensemble dans ce chapitre comment y parvenir.

#### Inspecter les contraintes

##### Les lignes bleues
Lorsque vous sélectionnez une vue à laquelle vous avez ajouté des contraintes, vous voyez des lignes bleues apparaître autour.

==> (Images/P2/P2C3_1.png)

Vous pouvez ensuite cliquer sur une de ces lignes et vous rendre dans l'inspecteur d'attribut. Vous y retrouverez les différents attributs de la contrainte. Ci-dessous vous retrouvez la contrainte de distance entre le bas de l'écran et le bas du bouton.

==> (Images/P2/P2C3_2.png)

En particulier, vous avez :
- Les deux vues concernées par la contrainte (`First Item` et `Second Item`)
- La relation entre les deux, le plus souvent ce sera `Egal` mais parfois pour des interfaces plus complexes, vous pourriez avoir besoin `Supérieur ou égal` ou `Inférieur ou égal`.
- La constante, c'est la distance souhaitée ici : 20 points.
- Enfin le paramètre `Priority` vous permet de définir des constantes prioritaires les unes sur les autres. Plus la valeur est élevée, plus la priorité est grande. Même chose, cela pourra vous être utile dans des interfaces complexes.

##### L'inspecteur de taille
En plus des lignes bleues autour du bouton, vous pouvez vérifier vos contraintes dans le panneau de droite dans l'onglet *Inspecteur de taille* (le 5ème).

==> (Images/P2/P2C3_3.png)

En bas, vous retrouvez les 4 contraintes que nous avons créées :
- En cliquant sur *Edit*, vous pouvez les modifier.
- En les sélectionnant et en utilisant la touche de suppression de votre clavier, vous pouvez les supprimer.

#### Les autres boutons
Nous n'avons vu que 2 boutons parmi les 5 situés en bas à droite de l'interface :

==> (Images/P2/P2C3_4.png)

Alors, laissez-moi vous présenter les autres qui vous seront sans doute utiles.

##### Mettre à jour les vues et les contraintes
Le premier n'est activé que si certaines de vos vues sont à une position qui ne correspond pas à leur contrainte. Essayez de déplacer le bouton par exemple :

==> (Images/P2/P2C3_5.png)

Dans ce cas, des lignes orange indiquent que le bouton est décalé par rapport à ses contraintes. Vous avez donc deux options :
- soit vous souhaitez **remettre le bouton à la place indiquée par ses contraintes**, dans ce cas, il suffit de cliquer sur le **premier bouton** (la flèche circulaire).
- soit vous souhaitez **modifier la valeur des contraintes** pour que le bouton reste à cette position, dans ce cas vous pouvez utiliser le **dernier bouton** (avec le triangle).

Dans ce deuxième cas, une popup vous propose plusieurs choix allant de la suppression de toutes les contraintes à la modification de leurs valeurs pour respecter la position actuelle du bouton.

==> (Images/P2/P2C3_6.png)

##### Les stack view
Enfin le deuxième bouton permet de placer vos vues dans des *Stack View*. Les stack view permettent de gérer des piles de vues horizontales ou verticales. Mais nous ne les verrons pas dans ce cours.

#### En résumé
- Vous pouvez inspecter une contrainte avec les lignes bleues ou en utilisant l'inspecteur de taille.
- Les boutons en bas à droite correspondent aux usages suivants :

==> (Images/P2/P2C3_7.png)

Dans la prochaine partie, nous allons adapter notre interface sur tous les écrans avec les catégories de taille.

## Adaptez votre interface avec les catégories de taille

### Découvrez les catégories de tailles
Grâce à AutoLayout, nous avons réussi à définir des contraintes pour que notre application s'affiche correctement sur toutes les tailles d'iPhone en mode portrait. Et le résultat est superbe ! Bravo !

Mais nous n'avons pas fait tout le travail ! En effet, notre designer a prévu des design bien précis, notamment **pour le mode paysage de l'iPhone et pour l'iPad**.

==> (Images/P3/P3C1_1.png)

Et dans cette partie, nous allons utiliser les catégories de taille pour respecter ce design.

#### Les limites d'AutoLayout
Si on met l'iPhone 7 en mode portrait, on se rend compte que le design ne correspond pas à ce qui a été prévu par notre designer. Tout est compressé, on ne voit même plus le label score et on ne profite pas de l'espace en largeur offert par cette orientation.

==> (Images/P3/P3C1_2.png)

De la même manière, si on essaye d'afficher notre interface au format iPad, tout parait trop petit dans cette grande interface.

==> (Images/P3/P3C1_3.png)

Pour adapter une interface, vous savez qu'il faut utiliser AutoLayout. Le problème, c'est qu'avec AutoLayout, **les contraintes sont toujours les mêmes**. Par exemple, nous avons défini une contrainte qui dit que le score est toujours en dessous de la question. Mais le design prévu dans l'orientation paysage positionne le score à droite de la question. Il faut donc pouvoir faire varier nos contraintes.

#### Les catégories de tailles

##### Qu'est-ce qu'une catégorie ?
Pour pouvoir faire varier nos contraintes, Apple aurait pu nous proposer une variation par taille d'écran. Il y a 8 tailles et 2 deux orientations donc on peut faire une variation spécifique de l'interface à chaque fois. Mais 16 variations à faire dans le storyboard, ça fait beaucoup ! :O

À la place, Apple propose **4 catégories de tailles** (en anglais *Size Classes*). Comme son nom l'indique, cela permet de travailler sur plusieurs tailles à la fois en les regroupant en catégorie.

Pour chaque catégorie, nous pouvons créer une interface complètement différente : changer la taille d'un composant modifier les contraintes, changer une couleur et même ajouter ou supprimer une vue ! **Les catégories peuvent être complètement indépendantes les unes des autres**. C'est cela qui va nous permettre d'avoir une disposition différente de nos vues entre le mode paysage et le mode portrait de l'iPhone par exemple.

##### Classification

Pour faire ces catégories, Apple propose deux paramètres : **largeur** (*width*) et **hauteur** (*height*). Pour chacun de ses deux paramètres, il y a deux valeurs :
- *compact* : lorsque la largeur (ou la hauteur) est petite
- *regular* : lorsque la largeur (ou la hauteur) est grande

Avec ces deux paramètres et ces deux valeurs, Apple a construit la classification suivante :

==> (Images/P3/P3C1_4.png)

On peut noter quelques points :
- Tous les iPad sont dans la catégorie (Regular, Regular), quelque soit leur orientation.
- Tous les iPhone sont dans la catégorie (Compact, Regular) en mode portrait.
- Tous les iPhone **SAUF les grands iPhone (6+, 6S+, 7+)** sont dans la catégorie (Compact, Compact) en mode paysage.

Avec ces catégories, nous allons pouvoir modifier notre interface en fonction du type d'appareil (iPhone ou iPad) et de l'orientation (Paysage ou Portrait).

> **:warning:** Lorsque les applications sont en mode Split View sur l'iPad, leur catégorie de taille est susceptible de changer. Je ne vous présente pas ici la classification du mode Split View pour ne pas compliquer les choses, mais si vous souhaitez la regarder, [cet article](https://medium.com/@craiggrummitt/size-classes-in-interface-builder-in-xcode-8-74f20a541195) la détaille clairement.

#### En résumé
- Les catégories de taille permettent de créer des interfaces différentes pour chaque catégorie.
- Il y a 4 catégories différentes organisées avec deux paramètres **largeur** et **hauteur** qui ont chacun deux valeurs **compact** ou **regular**.

Dans le chapitre suivant, nous allons voir comment les utiliser dans le storyboard pour adapter notre interface au mode paysage.

### Créez une variation en mode paysage
Nous allons maintenant essayer de modifier notre interface pour le **mode paysage**. À la fin de ce chapitre, notre interface sera belle, quelle que soit l'orientation de l'iPhone !

#### Orientations supportées
Avant de nous lancer, je me permets une toute petite parenthèse sur le support des différentes orientations. En tant que développeur, vous pouvez décider que votre application restera toujours en mode portrait, ou toujours en mode paysage ou de supporter les deux comme OpenQuizz.

> **:information_source:** Vous pouvez décider de cela à la création du projet Xcode, mais bien sûr ce n'est pas gravé dans le marbre et vous avez le droit de changer d'avis !

Il suffit d'aller dans les paramètres du projet en sélectionnant votre projet dans le navigateur.

==> (Images/P3/P3C2_1.png)

Sur cette interface, vous pouvez cocher les orientations supportées par votre application.

==> (Images/P3/P3C2_2.png)

- Les deux premières cases concernent le mode portrait avec l'iPhone à l'endroit ou à l'envers.
- Les deux dernières concernent le mode paysage avec l'iPhone couché en mode paysage vers la droite ou vers la gauche.

Donc si vous décochez par exemple les deux dernières, votre interface ne tournera pas si l'utilisateur couche son iPhone en mode paysage.

#### Créer une variation

Retournez maintenant dans le storyboard, nous allons créer notre première variation en utilisant les catégories de taille. Pour cela, il faut retourner en bas dans le sélecteur de taille.

==> (Images/P3/P3C2_3.png)

Ensuite, nous allons utiliser le bouton *Vary for Traits* qui se trouve sur la droite.

> **:warning:** Attention, ce bouton est très puissant ! :D

**Il permet de faire des modifications sur notre interface qui ne vont concerner que la catégorie de taille dans laquelle nous nous trouvons**. Cela veut dire que je peux modifier toutes les contraintes et même déplacer, ajouter ou supprimer des vues et cela ne concernera que la catégorie de taille actuelle.

Par exemple, plaçons-nous sur iPhone 7 en mode paysage. Si on se réfère au schéma du chapitre précédent, la catégorie de taille dans laquelle nous nous trouvons est : `(Compact, Compact)`.

Lorsqu'on clique sur le bouton, une popup apparaît qui nous demande sur quelle propriété on souhaite créer une variation : la hauteur, la largeur ou les deux.

==> (Images/P3/P3C2_4.png)

Si on coche les deux, la variation concernera uniquement les écrans dans la catégorie sélectionnée : `(Compact, Compact)`. Si on décoche la largeur par exemple, la variation concernera tous les écrans qui ont une **hauteur compact quelle que soit leur largeur**.

> **:information_source:** Lorsqu'on coche ou décoche les cases, le sélecteur de taille devient bleu et ne nous montre que les écrans qui correspondent à la variation que nous avons choisie.  
==> (Images/P3/P3C2_5.gif)

Dans notre cas, on souhaite créer une variation qui concerne **tous les iPhone en mode paysage**. Donc on veut que la hauteur soit compact mais la largeur peut être compact ou regular pour inclure les grands iPhone. On va donc cocher *Height* et laisser décochée *Width*.

#### Manipuler la variation

À partir de maintenant, on peut tout casser, cela ne concernera que le mode paysage sur iPhone ! Nous allons donc supprimer les contraintes qui ne sont plus pertinentes comme l'alignement au centre et en recréer de nouvelles spécifiques à notre design en mode paysage.

Comme cette partie du travail concerne plus AutoLayout et que nous avons déjà vu ça ensemble, **je vous laisse essayer de le faire**. Vous pouvez consulter la correction à [cette adresse]() [FAIRE LE SCREENCAST]. Je vous invite à la regarder, car j'y donne quelques astuces qui vous seront surement utiles !

Quand vous avez terminé, vous pouvez cliquer sur *Done Varying* pour terminer la variation.

==> (Images/P3/P3C2_6.png)

Vous pouvez ensuite vérifier en changeant l'orientation que tout s'affiche correctement dans les deux modes.

==> (Images/P3/P3C2_7.gif)

#### En résumé
- On peut sélectionner les orientations supportées dans les paramètres du projet.
- Pour créer une variation, on choisit la catégorie de taille désirée puis on clique sur le bouton *Vary for traits*.
- À partir de là, **tous les changements** que l'on peut faire ne concerneront que la catégorie de taille sélectionnée.


### Variez votre interface pour l’iPad

Nous allons maintenant essayer de modifier notre affichage sur l'**iPad**. Pour cela, nous allons tâcher de respecter les instructions du designer en grossissant les vues pour qu'elles prennent plus de place.

Et cette fois-ci, nous allons changer de stratégie. En effet, le design sur iPad n'est pas très différent du design sur iPhone, tout est juste plus gros, donc on va avoir besoin de faire moins de modifications.

Et on va commencer par grossir la question.

#### Variation sur les attributs

Dans Xcode, certains attributs peuvent varier. Commençons par exemple par faire varier la taille du texte de la question. Sélectionnez le label correspondant et allez dans l'inspecteur d'attributs :

==> (Images/P3/P3C3_1.png)

Tous les attributs marqués avec un petit `+` peuvent subir une variation. Et comme vous le constater la police (et donc sa taille) en fait partie.

Cliquez sur le `+` pour créer une variation.

==> (Images/P3/P3C3_2.png)

Dans cette popup, on choisit la catégorie de taille pour laquelle on souhaite créer une variation. Dans notre cas, c'est l'iPad donc `(Regular, Regular)`.

> **:information_source:** Le paramètre `Gamut` permets de créer une variation en fonction de la résolution de l'écran. La plupart du temps, cela ne vous intéresse pas donc vous pouvez le laisser à `Any`.

En cliquant sur la variation, la ligne de la police est dupliquée et vous pouvez maintenant changer la taille de la police pour l'iPad. Je vous suggère de doubler sa taille. Vous devriez obtenir ceci :

==> (Images/P3/P3C3_3.png)

Cela veut dire que pour la catégorie de taille `(Regular, Regular)`, la police a pour taille 46, et pour toutes les autres, elle vaut 23.

#### Variation sur les contraintes

Évidemment pour le moment, ça ne rend pas très bien, car la vue est trop petite. On va donc modifier cela en agrandissant la taille de notre vue.

> **:warning:** La taille de notre vue est fixée par des contraintes. Donc il nous faut agir sur les contraintes et non sur la taille de la vue directement.

Nous allons donc créer une variation sur la contrainte de largeur de cette vue. Commencez par sélectionner la contrainte de largeur en cliquant sur la ligne bleue qui la représente sous la vue grise.

==> (Images/P3/P3C3_4.png)

Sur la droite dans l'inspecteur d'attributs, vous avez accès aux propriétés de cette contrainte comme on l'a vu dans la partie précédente. On peut voir notamment la constante qui a pour valeur 245. Et comme vous pouvez le voir, **la constante est un paramètre qui peut subir une variation**. Pour cela, il suffit de cliquer comme précédemment sur le petit `+`.

Nous allons à nouveau choisir de créer une variation pour la catégorie de taille (Regular, Regular). Et nous allons fixer la constante à 480 pour cette variation.

==> (Images/P3/P3C3_5.png)

Et maintenant, notre vue profite de la grande taille de l'iPad !

==> (Images/P3/P3C3_6.png)

#### Exercice

##### La suite de l'interface
De la même façon, je vous propose d'essayer d'augmenter :
- la taille du bouton et la police de son titre
- la taille de la police du label score
- la taille de l'icône

Vous pouvez consulter la correction à cette adresse [FAIRE LE SCREENCAST].

##### La page de lancement
Je vous propose un deuxième exercice ! En utilisant une variation, rajoutez la mention "iPad Version" sur la page de lancement de l'application lorsqu'elle est lancée sur un iPad.

Vous pouvez consulter la correction à cette adresse [FAIRE LE SCREENCAST].

==> (Images/P3/P3C3_6.png)

#### En résumé
Pour créer des variations en fonction des catégories de taille, vous pouvez utiliser le bouton `Vary for Traits` pour de gros changements ou le petit `+` à côté des attributs pour des changements plus fins.

### Conclusion
Félicitations ! Vous êtes venus à bout de ce cours sur les applications responsive ! Désormais, vous savez adapter l'interface d'une application à toutes les tailles d'écran des appareils iOS et quelle que soit leur orientation !

#### En résumé

Dans ce cours, vous avez appris à adapter une interface responsive. Et pour cela nous avons vu trois éléments fondamentaux :

1. Nous avons fait le tour ensemble des **différentes tailles d'écrans** que vous allez devoir gérer et comment les visualiser dans le storyboard.
2. Nous avons découvert **AutoLayout** et le système de contraintes pour placer nos vues.
3. Nous avons appris à repérer et à utiliser les **catégories de taille** pour créer des variations en fonction de la taille ou de l'orientation de l'écran.

#### Pratiquez !
Si tout n'est pas encore automatique pour vous, pas de soucis. Vous allez avoir besoin d'utiliser les techniques vues dans ce cours dans toutes les applications que vous allez concevoir ! Car on ne vous reprendra plus à faire une application dont l'interface ne s'adapte pas !

Vous verrez que maîtriser le responsive en iOS prends beaucoup de pratique donc à chaque interface que vous dessinez, prenez le réflexe d'utiliser AutoLayout et les catégories de taille et tout cela sera bientôt un jeu d'enfant pour vous !

#### Et maintenant ?

Vous avez maintenant tout ce qu'il faut pour créer des applications responsive d'une seule page ! Mais pour la très grande majorité des apps, vous allez avoir besoin de plusieurs pages. Alors, comment créer plusieurs pages ? Comment organiser la navigation entre elles ? Comment faire passer des informations d'une page à une autre ? Nous verrons tout cela ensemble dans le prochain cours dédié aux applications de plusieurs pages.

En attendant, je n'ai plus qu'à vous laisser avec le mot de la fin et le mot de la fin évidemment, c'est :

==> (Images/P3/P3C4_1.jpg)
