# Débuggez et testez vos applications iOS

## Partez à la chasse aux bugs !

### Tirez le meilleur de ce cours

Bonjour à tous ! Et bienvenue dans ce cours grâce auxquels vos applications vont gagner en robustesse !

===> IMAGE(P1/P1C1_1.jpg) LEGENDE() <===

#### Présentation du cours
Lorsqu'on débute en programmation, certains imaginent que ce qui fait la qualité d'un développeur, c'est l'étendue de sa connaissance concernant un langage de programmation.

C'est faux. :D

> **:information_source:** A l'heure d'internet, l'accès à la connaissance est immédiat. Vous savez de quoi je parle ;). Si vous avez oublié un aspect d'un langage ou d'une technologie, vous le retrouvez en deux clics ! Donc même si ça aide bien sûr, il n'est pas nécessaire de tout connaître !

Un bon développeur se distingue avant tout par deux qualités :
- son **autonomie**
- la **propreté de son code**

Et on n'acquiert pas ces qualités en deux clics sur internet, mais avec de l'expérience et de la rigueur.

> **:question:** Si seulement il existait un cours pour les gagner...

Inutile de tourner autour du pot, ce cours dont vous rêver, vous y êtes ! En effet, ce cours est entièrement construit autour de ces deux qualités :

1. Dans cette première partie, nous allons apprendre à **dénicher, comprendre et éliminer les bugs**. Ce qui est indispensable pour devenir un développeur *autonome*.
2. Dans la deuxième partie, nous allons apprendre à **créer des tests unitaires**. Ils ont le double avantage de nous assurer que l'application fonctionne et de nous inciter fortement à rédiger un *code tout beau tout propre*.
3. Enfin les tests sont tellement importants que nous allons apprendre en troisième partie à **les rédiger avant le code** en utilisant le Test Driven Development !

#### Prérequis

Ce cours fait partie de tout [un parcours sur le développement d'application iOS](https://openclassrooms.com/paths/developpeur-se-dapplication-ios). Je vous suggère fortement d'y jeter un oeil si vous souhaitez vous former et trouver un emploi en tant que développeur iOS.

> **:warning:** Pour profiter au mieux de ce cours, assurez-vous que vous maîtrisez a minima les compétences présentées dans les cours suivants :
- [Introduction à iOS : plongez dans le développement mobile !](https://openclassrooms.com/courses/introduction-a-ios-plongez-dans-le-developpement-mobile)
- [Apprenez les fondamentaux de Swift](https://openclassrooms.com/courses/apprenez-les-fondamentaux-de-swift)
- [Approfondissez Swift avec la Programmation Orientée Objet](https://openclassrooms.com/courses/approfondissez-swift-avec-la-programmation-orientee-objet)
- [Développez une application iPhone avec le modèle MVC](https://openclassrooms.com/courses/concevez-une-application-iphone-avec-le-modele-mvc)

#### Jeu Set et Match

Pour venir à bout de nos objectifs, nous allons nous appuyer sur une application que j'ai déjà développée pour vous. Cette application s'appelle **Jeu Set & Match**. Les amateurs de Tennis auront déjà compris son utilité, elle permet de **compter les points au Tennis**.

===> IMAGE(P1/P1C1_2.png) LEGENDE(L'application Jeu Set et Match) <===

Pour cela, rien de plus simple, il suffit de lui indiquer le joueur qui vient de gagner le dernier point en appuyant sur le bouton correspondant. Et l'application calcule automatiquement le nouveau score. Quand un joueur a gagné la partie, on peut remettre les scores à zéro pour recommencer la partie.

> **:information_source:** Si vous ne connaissez pas les règles du Tennis, voici comment on compte le score :
1. Si un joueur gagne un point, son score augmente, il passe de 0 à 15 puis 30 et enfin 40. Donc pour avoir 40, il faut gagner 3 fois.
2. Si le joueur gagne une quatrième fois, il gagne ce qu'on appelle un **jeu**. Et on démarre un nouveau jeu avec les règles du point précédent.
3. Au bout de six jeux remportés, le joueur remporte ce qu'on appelle un **set**.
4. Au bout de trois sets remportés, le joueur gagne le **match**.
Ce quatrième point peut varier selon les tournois entre 2 et 3 sets gagnés, mais l'application est réglée sur 3 sets.

#### Exercice
Pour que vous puissiez suivre au mieux ce que nous allons faire dans ce cours, je vous ai concocté un exercice pour que vous puissiez concevoir le modèle de l'application Jeu Set & Match.

Je vous encourage vivement à le faire pour que vous ne soyez pas perdus lorsque nous naviguerons dans le code de l'application.

[EXERCICE Codevolve en cours de création]

#### Le projet

Bravo pour l'exercice, il n'était pas évident ! Il ne nous reste plus maintenant qu'à télécharger le projet Xcode complet de l'application Jeu Set & Match.

Vous pourrez le trouver à [cette adresse](https://github.com/AmbroiseCollon/JeuSetMatch). Je vous invite à le télécharger avant de passer au prochain chapitre.

#### En résumé
- Ce cours est essentiel si vous voulez devenir des développeurs **autonomes** qui produisent du **code de qualité** !
- Ce cours est basé sur le projet de l'application Jeu Set & Match qui permet de compter les points au Tennis !

Dans le prochain chapitre, vous allez apprendre comment analyser la pile d'exécution pour déceler les bugs !

### Analysez la pile après un plantage  

Je vous propose maintenant de regarder un peu le projet Xcode de l'application Jeu Set & Match que vous venez de télécharger !

Une fois le projet ouvert, notre premier réflexe est bien sûr de lancer l'application pour la prendre en main et bien comprendre son fonctionnement. Alors, allons-y !

> **:question:**, Mais... Mais... L'application a planté !

[Ah la boulette...](https://www.youtube.com/watch?v=au0ZMqyoWwg) Toutes mes excuses, je pensais pourtant vous avoir concocté un projet tout beau tout propre ! Comme quoi, ça arrive même aux meilleurs ;) !

Bon ne nous démontons pas, on va essayer de comprendre et détecter cette erreur. Pour cela, voyons ce que Xcode nous raconte dans la console :

===> IMAGE(P1/P1C2_1.png) LEGENDE() <===

Ouh là, on dirait qu'Xcode est bavard ! Pas de panique, je vais vous expliquer tout ça !

#### La pile d'exécution

La longue liste que vous affiche Xcode en cas d'erreur, c'est la pile d'exécution (ou *call stack* en anglais).

> **:question:** Quésaco ?

Une pile d'exécution permet de **mémoriser l'enchaînement d'appels des méthodes (ou fonctions) d'un programme**. Pour ce faire, une structure de données de type [*pile*](https://fr.wikipedia.org/wiki/Pile_(informatique)) est utilisée. Ce mécanisme permet de garder une trace des fonctions appelées, afin de pouvoir "revenir sur ses pas" lorsqu'une fonction est terminée.

Prenons un petit exemple pour illustrer cela :
- Imaginez que vous ayez une fonction nommée `getTemperature` qui vous renvoie la température extérieure.
- Cette fonction utilise une autre fonction `getTemperatureFromSensor`, qui permet d'interroger le thermomètre.
- Enfin, la fonction `getTemperatureFromSensor` utilise une dernière fonction nommée `convertFarenheitToCelsius` qui convertit en degrés Celsius une température initialement en degrés Farenheit.

Le code simplifié correspondant serait :

```swift
func  getTemperature() -> Int {
  return getTemperatureFromSensor()
}

func getTemperatureFromSensor() -> Int {
  let farenheitTemperature = sensor.getTemperature()
  return convertDegrees(farenheitTemperature)
}

func convertFarenheitToCelsius(farenheit: Int) -> Int{
  return (farenheit - 32) * 5 / 9;
}
```

Lorsque vous appelez la fonction `getTemperature`, elle est automatiquement ajoutée à la pile. La pile contient donc :

| Pile |
|---|
| getTemperature |

Ensuite, au sein de la fonction `getTemperature`, c'est au tour de la fonction `getTemperatureFromSensor` d'être appelée. Elle est également ajoutée à la pile. La pile contient donc :

| Pile |
|---|
| getTemperatureFromSensor |
| getTemperature |

Enfin, c'est au tour de la fonction `convertFarenheitToCelsius` d'être appelée. Après avoir été ajoutée à la pile, cette dernière contient donc :

| Pile |
|---|
| convertFarenheitToCelsius |
| getTemperatureFromSensor |
| getTemperature |

À la fin de l'exécution d'une fonction, elle est "dépilée", c'est-à-dire qu'elle est retirée de la pile. On revient à la fonction appelante. Par exemple, quand `convertFarenheitToCelsius` a terminé son exécution, elle est retirée de la pile et on retourne a `getTemperatureFromSensor` qui peut reprendre le cours de son exécution.

> **:information_source:** Ainsi la pile se remplit et se vide au fur et à mesure en continu.

#### Analyse de la pile

Regardons maintenant notre pile. Elle contient 48 appels des couches les plus basses de notre programme aux couches les plus élevées. Dans l'analyse, l'objectif est de retrouver les lignes qui correspondent à notre code, le reste ne nous intéresse pas a priori.

===> IMAGE(P1/P1C2_2.png) LEGENDE() <===

Ici, en vert vous pouvez trouver la pile d'appels de fonctions dans le ViewController. La voici en détail :

| Pile |
|---|
| updateAllSetsScore |
| updateUIScore |
| updateUI |
| viewDidLoad |

L'erreur a donc eu lieu alors qu'on était dans la méthode `updateAllSetsScore` de la classe `ViewController`.

> **:question:** OK, mais c'est quoi l'erreur ?

Xcode vous explique cette erreur tout en haut dans la console dès la première ligne :

===> IMAGE(P1/P1C2_3.png) LEGENDE() <===

Cette erreur semble signifier qu'on essaye d'accéder à un élément dans un tableau à l'index 5, mais le plus grand index disponible est 4. Il faut que nous allions investiguer le code pour vérifier tout ça !

#### Compilation VS exécution
Avant de corriger notre erreur dans le prochain chapitre, je voudrais profiter de celle-ci pour vous parler d'une notion importante de programmation.

##### Notion de compilation
Une grande partie des langages de programmation, dont Swift, sont dits **compilés**. C'est-à-dire que le langage est d'abord traduit dans un langage compréhensible facilement par la machine comme l'[assembleur](https://fr.wikipedia.org/wiki/Assembleur) par exemple. On appelle cette étape la **compilation** ou (*compile time* en anglais).

Ensuite, ce code traduit est exécuté et le programme tourne. Dans notre cas, l'application est lancée ! Cette étape, c'est l'**exécution** (ou *run time* en anglais).

===> IMAGE(P1/P1C2_4.png) LEGENDE() <===

> **:question:** OK, mais ça sert à quoi la compilation ?

La compilation permet de générer un code très facile et donc très rapide à lire pour la machine, ce qui permet d'optimiser grandement le programme !

##### Deux types d'erreurs
Puisqu'il y a deux étapes, il y a deux types d'erreurs :

**Les erreurs à la compilation** (*compile time error*)  
- Elles peuvent être détectées par Xcode avant même de lancer le programme, car Xcode compile votre code après chaque modification.
- Ces erreurs peuvent être des erreurs **syntaxiques** ou **sémantiques** : utilisations de mots interdits, code non interprétable, types non respectés, etc.
- Elles sont signalées en rouge dans votre code à la ligne correspondante.

**Les erreurs à l'exécution** (*run time error*)
- Elles ont lieu une fois que l'application est lancée comme c'est le cas pour nous ici.
- Ces erreurs sont en général dues à un problème **logique** dans le programme. Il est forcé d'essayer de faire une action interdite et donc il génère une erreur.
- Elles font planter l'application et s'affichent dans la console.

===> IMAGE(P1/P1C2_5.png) LEGENDE() <===

Dans un [cours précédent](https://openclassrooms.com/courses/introduction-a-ios-plongez-dans-le-developpement-mobile/resolvez-vos-erreurs-et-finissez-lapplication), vous avez appris à gérer les erreurs à la compilation. Dans ce chapitre et dans le suivant, vous allez apprendre à résoudre les erreurs à l'exécution !

#### En résumé
- Une **pile d'exécution** permet de mémoriser l'enchaînement d'appels des méthodes (ou fonctions) d'un programme.
- Lors d'un plantage de votre application, la pile d'exécution et l'erreur sont affichées dans la console. Ces deux informations vous permettent de retracer le problème !
- **Swift est un langage compilé**. Il est d'abord traduit en un code compréhensible facilement par la machine puis ce code est exécuté.
- Il y a donc deux types d'erreurs : à la **compilation** et à l'**exécution**.

Dans le prochain chapitre, nous allons retracer encore plus précisément notre erreur grâce aux points d'arrêts et la résoudre !

### Utilisez le débugger  
Dans ce chapitre, je vous propose de résoudre notre erreur ! Et pour cela, nous allons avoir besoin d'investiguer le code !

Dans le chapitre précédent, l'analyse de la pile d'exécution nous a révélé que l'erreur avait lieu dans la fonction `updateAllSetsScore`. Voici le code de celle-ci :

```swift
private func updateAllSetsScore(forPlayer player: Player) {
	for i in 0..<6 {
			if i < match.sets.count {
					let set = match.sets[i]
					playerSetScoreLabels[player]![i].text = "\(set.scores[player]!)"
			 } else {
					playerSetScoreLabels[player]![i].text = ""
			}
	}
}
```

Hmm... Difficile de trouver l'erreur du premier coup d'oeil dans cette fonction. Pour nous aider, nous allons utiliser un point d'arrêt !

#### Les points d'arrêts

Le principe d'un point d'arrêts (*breakpoint* en anglais) est très simple. Il permet comme son nom l'indique d'**interrompre l'exécution de notre code à la ligne qui nous intéresse**. Nous allons voir dans ce chapitre et dans le suivant que c'est extrêmement pratique pour repérer les problèmes.

> **:information_source:** Dans le prochain chapitre, nous allons apprendre à créer des points d'arrêts manuellement.

Mais pour résoudre notre erreur, nous allons avoir besoin pour l'instant d'un point d'arrêt un peu particulier et très puissant !

#### Le point d'arrêt d'exception

Le point d'arrêt d'exception (ou *exception breakpoint*) permet d'interrompre le code **dès que le programme rencontre une erreur qui va faire planter l'application**.

> **:information_source:** C'est comme si vous bousculiez un vase et qu'on mette pause juste avant que le vase ne chute pour que vous puissiez regarder comment vous l'avez fait tomber, est-ce votre coude votre main ou votre sac qui a causé le drame :O ?

Pour créer ce point d'arrêt, il faut aller dans le navigateur des points d'arrêts. C'est l'avant-dernier onglet du navigateur (panneau de droite) :

===> IMAGE(P1/P1C3_1.png) LEGENDE() <===

Cet onglet est vide pour le moment, car vous n'avez pas encore créé de points d'arrêts. Pour ajouter notre fameux point d'arrêt d'exception, allez tout en bas de l'interface, cliquez sur le `+` et choisissez dans la popup "Exception Breakpoint..." :

===> IMAGE(P1/P1C3_2.png) LEGENDE() <===

> **:warning:** Vous pouvez ignorer la popup qui s'affiche ensuite. Ce sont des réglages avancés dont nous n'avons pas besoin.

Ça y est ! Votre point d'arrêt d'exception est créé et il apparaît dans le navigateur de points d'arrêts :

===> IMAGE(P1/P1C3_3.png) LEGENDE() <===

Pour que vous puissiez admirer la puissance de ce point d'arrêt, vous n'avez plus qu'à relancer votre application et vous allez voir l'exécution s'interrompre juste avant notre erreur.

#### Naviguez dans la pile d'exception

Le point d'arrêt vous conduit directement jusqu'au fichier et même à la ligne qui pose problème :

===> IMAGE(P1/P1C3_4.png) LEGENDE() <===

Nous n'avons même pas besoin d'analyser la pile d'exécution. On est directement conduit au bon endroit.

> **:warning:** C'est tellement pratique que je vous conseille de **toujours avoir un point d'arrêt d'exception dans votre projet**, quelque soit sa taille.

En plus, grâce au point d'arrêt, votre pile d'exécution s'affiche sur la gauche dans le *navigateur de débogage* et vous pouvez naviguer à l'intérieur !

===> IMAGE(P1/P1C3_5.png) LEGENDE(Le navigateur de débogage) <===

Pour cela, il vous suffit de cliquer sur la ligne de votre choix sur la droite dans la pile d'exécution et vous êtes immédiatement conduit à la ligne de code correspondante.

===> IMAGE(P1/P1C3_6.gif) LEGENDE() <===

#### La vue des variables
> **:question:** Bon c'est bien beau de s'amuser, mais on la résout cette erreur ?

Oui... Mais ne soyez pas rabat-joie non plus :D ! La ligne qui semble poser problème est la suivante :

```swift
playerSetScoreLabels[player]![i].text = ""
```

On débarque un peu dans ce code qu'on ne connaît pas donc pour savoir un peu qui est qui, laissez-moi vous présenter la **vue des variables** ! Dans la zone de débogage, vous avez deux panneaux. A gauche, c'est la vue des variables et à droite la console que vous connaissez déjà.

===> IMAGE(P1/P1C3_7.png) LEGENDE() <===

> **:information_source:** Vous pouvez afficher ou masquer l'un de ces panneaux grâce aux petits boutons en bas à droite : ===> IMAGE(P1/P1C3_8.png) LEGENDE() <===

Cette vue permet de visualiser toutes les variables existantes au point d'arrêts ou nous nous trouvons. En l'occurrence, il y a ici :
- `player` : c'est le paramètre de la fonction. On voit qu'il est de type `Player` et vaux `one`.
- `i` : c'est le compteur de la boucle for qui vaut ici `5`.
- `self` : c'est la classe dans laquelle nous nous trouvons donc ici `ViewController`.

On peut déplier `self` pour inspecter l'état de toutes ses propriétés. Notamment on peut regarder la propriété `playerSetScoreLabels` qui intervient dans la ligne qui pose problème.

===> IMAGE(P1/P1C3_9.png) LEGENDE() <===

On comprend que son type est : `[Player: [UILabel]]` donc un dictionnaire qui a comme clé un joueur et comme valeur un tableau de labels. Mais le reste n'est pas très lisible !

#### Afficher les variables dans la console

Heureusement, nous avons une autre option pour voir nos variables et ça se passe juste à côté, dans la console !

> **:information_source:** Pour l'instant, la console est vide, car on s'est arrêté juste avant que n'intervienne l'erreur donc celle-ci n'est pas affichée dans la console.  

Enfin pas tout à fait vide ! On y voit l'inscription `(lldb)`, c'est un *Low Level Debugger*. C'est un peu comme un terminal, on peut écrire des commandes et l'ordinateur nous répond. On peut lui poser plein de questions pour comprendre l'état de notre application.

> **:warning:** Pour avoir accès au lldb, il faut s'être arrêté à un point d'arrêt.

Nous allons apprendre une seule commande, mais qui est de loin la plus utile, et elle se nomme sobrement `po` pour *Print Object*.

Essayons-la avec notre mystérieuse variable `playerSetScoreLabels`:

===> IMAGE(P1/P1C3_10.png) LEGENDE() <===

La console nous affiche plein de détails sur l'objet et cette fois, c'est assez clair. Il y a deux clés : Player.one et Player.two et chacune contient 5 labels. Si on va un peu plus loin, on peut écrire :

===> IMAGE(P1/P1C3_11.png) LEGENDE() <===

On a bien un tableau qui contient 5 labels.

#### Résoudre l'erreur

Maintenant, résumons-nous et je pense qu'on va pouvoir résoudre notre erreur. L'erreur intervient à la ligne suivante :

```swift
playerSetScoreLabels[player]![i].text = ""
```

On sait que ceci `playerSetScoreLabels[player]!` est un tableau de 5 éléments. On essaye donc d'accéder à son élément à l'index `i`, qui vaut 5. Or le plus grand index d'un tableau de 5 éléments, c'est 4. Donc il n'y a rien à l'index 5 !

Et voilà notre erreur ! Notre boucle va un coup trop loin ! Il nous suffit de réduire l'intervalle d'un cran !

```swift
for i in 0..<6 { // <= ici il faut mettre 5 à la place du 6 !
	// [...]
}
```

Faites la modification, lancez l'application et... ça marche ! Le bug a été éliminé ! Bravo !

> **:information_source:** Cela a pu vous paraître un peu long pour une solution finalement si simple. Mais la solution d'un bug est souvent simple même si la recherche peut être longue ! Et quand vous maîtriserez toutes les techniques que je vous ai présentées, vous irez bien plus vite ! Pensez à les utiliser le plus possible pour qu'elles deviennent des réflexes !

#### En résumé
- Pour identifier la source des erreurs à l'exécution, je vous suggère de créer un **point d'arrêt d'exception** qui vous emmène directement à la ligne qui pose problème !
- Un point d'arrêt permet d'interrompre l'exécution du code et d'inspecter les variables pour identifier un bug.
- Pour inspecter les variables suite à un arrêt, on peut utiliser la **vue des variables**, ou la **commande `po` dans la console**.

Dans le prochain chapitre, nous allons apprendre à positionner des points d'arrêts manuellement pour naviguer dans la pile d'exécution.

### Ajoutez des points d’arrêts manuellement
Dans les chapitres précédents, nous avons résolu notre bug et vous pouvez maintenant jouer un peu avec l'application Jeu Set et Match. Je vous propose de ne pas nous arrêter en si bon chemin et de passer à la suite de ce cours : les tests !

> **:question:** Hop hop hop ! Pas si vite mon garçon !

Comment ça ?! Je vous prie de ne pas m'interrompre en plein lancement d'un sujet aussi important que les tests !

> **:question:** Je suis désolé. Mais l'application bogue toujours...

Ah bon ?!!!

> **:question:** C'est peut-être pas vraiment un bug, mais l'app compte mal les points. Quand un joueur a 30 et qu'il gagne un point, il gagne le jeu, alors qu'il devrait passer à 40... Regarde !
===> IMAGE(P1/P1C4_1.gif) LEGENDE() <===

Ah oui en effet. Bon toutes mes excuses, regardons ça !

#### Une erreur métier
Précédemment, nous avons parlé des erreurs à la compilation et des erreurs à l'exécution. Nous rencontrons ici un troisième type d'erreur : une **erreur métier**.

Les erreurs métiers n'empêchent pas le lancement de l'application ni ne la font planter. Mais **l'application se comporte différemment de ce que l'on a prévu**.

> **:warning:** Même si ces erreurs ne font pas planter votre application, il faut bien s'en méfier, car, en général, **vos utilisateurs vont les repérer avant vous** ! Il faudra donc être réactif pour les résoudre.

#### Stratégie de résolution d'une erreur métier

Vous ne connaissez pas bien le code de Jeu Set & Match puisque vous ne l'avez pas entièrement rédigé. Et ici, nous n'avons ni pile d'exécution ni point d'arrêt d'exception pour nous guider vers l'erreur, car elle ne fait pas planter l'application.

Alors, comment trouver notre bug dans cette botte de foin ?

Pas de panique ! Nous allons procéder en trois étapes (*que vous suivrez souvent croyez-moi* ;)) :

1. Reproduire les étapes dans l'application qui conduisent au bug
2. Ajouter un point d'arrêt manuellement
3. Naviguer dans le code pour retrouver le bug

A l'assaut :pirate: !

#### 1. Reproduire les étapes du bug

Pour reproduire les étapes de ce bug, nous allons commencer par lancer l'application. Ensuite, il nous suffit d'appuyer deux fois sur le bouton `JOUEUR 1`. Le score du joueur 1 passe à 30. Lors du prochain appui, le bug devrait avoir lieu.

#### 2. Ajouter un point d'arrêt manuellement

Nous allons maintenant ajouter un point d'arrêt. Cela va nous permettre à l'étape suivante de naviguer dans le code pour voir se jouer notre erreur directement dans le code.

##### Trouver la ligne
Contrairement au chapitre précédent, notre point d'arrêt ne va pas se déclencher immédiatement à la ligne du bug. Il va falloir cette fois le rajouter nous-mêmes à la ligne de notre choix.

> **:question:**, Mais à quelle ligne ?! On ne sait pas où est le bug dans le code !

C'est vrai. Mais on sait quand il a lieu. On sait qu'il va avoir lieu quand je vais taper une troisième fois sur le bouton `JOUEUR 1`. Donc il nous suffit de retrouver l'action liée au bouton dans le code.

Et ça, ce n'est pas trop dur ! On sait qu'une action se trouve dans le contrôleur et qu'elle commence par `@IBAction`. Après une toute petite recherche, vous devriez la trouver :

===> IMAGE(P1/P1C4_2.png) LEGENDE(La voilà !) <===

Quand on va taper sur le bouton, la première ligne de code qui va s'exécuter, c'est la ligne 33. C'est ici que nous allons rajouter un point d'arrêt !

##### Ajouter le point d'arrêt
Et pour cela, rien de plus simple, il nous suffit de cliquer sur le chiffre 33 sur le côté. Et votre point d'arrêt apparaît en bleu :

===> IMAGE(P1/P1C4_3.png) LEGENDE() <===

> **:information_source:** Vous pouvez retrouver tous les points d'arrêts de votre projet dans le navigateur de points d'arrêts.
===> IMAGE(P1/P1C4_4.png) LEGENDE() <===  
Vous pouvez aussi les effacer en les sélectionnez dans le navigateur et tapant la touche "supprimer" de votre clavier. Ou en faisant un clic droit sur votre point d'arrêt dans le code puis choisissez "Delete Breakpoint" (cf image ci-dessous). Ou en le glissant-déposant en dehors de sa position.
===> IMAGE(P1/P1C4_5.png) LEGENDE() <===  
Vous pouvez aussi désactiver un point d'arrêt momentanément en cliquant dessus, il devient grisé :
===> IMAGE(P1/P1C4_6.png) LEGENDE() <===  


#### 3. Naviguez dans le code pour retrouver le bug

##### Les commandes de navigation
Maintenant que notre point d'arrêt est créé, nous pouvons appuyer une troisième fois sur le bouton `JOUEUR 1` de notre application. Le point d'arrêt se manifeste et nous sommes conduits automatiquement à la ligne 33 du `ViewController`. Le code s'est interrompu à cette ligne.

===> IMAGE(P1/P1C4_7.png) LEGENDE() <===  

Nous allons maintenant naviguer dans l'exécution du code à partir de ce point d'arrêt. Pour cela, nous allons utiliser les boutons situés en bas, dans la zone de débogage.

===> IMAGE(P1/P1C4_8.png) LEGENDE() <===  

En particulier, nous allons utiliser les 5 premiers :

1. ===> IMAGE(P1/P1C4_9.png) LEGENDE() <=== En cliquant sur ce bouton, il devient gris et tous les points d'arrêts rencontrés pendant l'exécution sont ignorés.
2. ===> IMAGE(P1/P1C4_10.png) LEGENDE() <=== Ce bouton permet de relancer l'exécution du code après un arrêt. Le code va s'exécuter jusqu'au prochain point d'arrêt ou jusqu'à la fin de la méthode.
3. ===> IMAGE(P1/P1C4_11.png) LEGENDE() <=== Ce bouton permet de passer à la ligne de code suivante.
4. ===> IMAGE(P1/P1C4_12.png) LEGENDE() <=== Ce bouton permet de rentrer dans le détail d'exécution d'une méthode, on descend dans la pile d'exécution.
5. ===> IMAGE(P1/P1C4_13.png) LEGENDE() <=== On remonte dans la pile d'exécution.

> **:warning:** Lorsque l'on navigue dans l'exécution du code, on ne peut qu'avancer. Par exemple, on peut aller à la ligne suivante, mais pas à la ligne précédente. Autrement dit, on ne peut pas défaire ce qui a été fait.

Maintenant que nous connaissons nos commandes, naviguons !

##### On se jette à l'eau !

L'exécution s'est arrêtée à la ligne suivante :

```swift
match.pointEnded(wonBy: Player.one)
```

Qui est `match` ? Quelle est cette méthode `pointEnded` ? Pour le savoir, nous allons descendre dans la pile en utilisant le 4e bouton.

Nous arrivons d'abord sur la propriété `match` :
```swift
var match = Match()
```

`match`, c'est donc notre modèle de type `Match`. Nous allons maintenant remonter la pile avec le 5e bouton, nous revenons à la ligne 33 du point d'arrêt. Nous allons ensuite la redescendre à nouveau avec le 4e bouton. Cette fois nous arrivons à la première ligne de la méthode `pointEnded`.

===> IMAGE(P1/P1C4_14.png) LEGENDE() <===

Cette première ligne vérifie que le match n'est pas terminé. Passons à la ligne suivante avec le 3e bouton.

===> IMAGE(P1/P1C4_15.png) LEGENDE() <===

C'est bon, on est passé à la ligne suivante donc le match n'est pas terminé. On appelle maintenant la méthode `incrementScore` sur le jeu en cours `currentGame`. Voilà qui semble être intéressant, descendons dans la pile à nouveau !

Même chose, on est d'abord conduit à la propriété `currentGame` donc remontons la pile et redescendons-la. Cette fois, on arrive bien dans la méthode `incrementScore` !

===> IMAGE(P1/P1C4_16.png) LEGENDE() <===

Regardons attentivement cette méthode. Si le score est inférieur à 30, on incrémente le score. Sinon le jeu se termine.

> **:question:** Bah voilà !!

Comment ça "bah voilà" ?

> **:question:** ...

Ah mais oui ! Bien vu ! Il est là notre problème, il faut vérifier que le score soit inférieur à 40 et non 30 ! Voilà pourquoi le jeu se terminait toujours avant d'atteindre 40 !

Faites la modification et relancez l'application ! Notre bug est résolu ! Qu'est-ce que vous devenez bon en résolution de bug !

#### En résumé

- Certaines erreurs ne font pas planter l'application, mais causent malgré tout un comportement anormal de l'app. On les appelle les **erreurs métiers**.
- En cliquant sur un numéro de ligne, on peut ajouter un point d'arrêt.
- **À partir d'un point d'arrêt, on peut naviguer dans l'exécution code** pour aller au prochain point d'arrêt, passer à la ligne suivante, monter ou descendre dans la pile d'exécution.

Dans le prochain chapitre, nous allons faire l'étude syntaxique de votre code pour que votre code reste toujours propre.

### Installez SwitLint pour contrôler votre syntaxe  
En introduction de ce cours, je vous ai dit que vous alliez apprendre à être **autonome** et à **rédiger du code propre**. Vous savez maintenant résoudre tous les types de bugs que vous pouvez rencontrer, ce qui vous fait beaucoup gagner en autonomie !

Ici, nous allons commencer à parler de la propreté de votre code, un sujet au moins aussi important !

#### Gare à votre style

En programmation, chacun a son style. On a tous notre propre façon d'écrire du code. Par exemple, les deux codes suivants sont équivalents techniquement, mais très différents pourtant :

===> IMAGE(P1/P1C5_1.png) LEGENDE() <===

> **:warning:** Normalement, il y en a un des deux qui doit vous piquer un peu les yeux...

Cette différence de style (on parle aussi de syntaxe) n'est pas sans conséquence ! Si les deux styles ci-dessus cohabitent dans un même projet, le projet va avancer beaucoup moins vite !

> **:question:** Je ne vois pas pourquoi, tant que le code marche, c'est bon non ?

Hé non ! 80% de l'activité d'un développeur, c'est de lire du code pour dénicher des bugs, analyser un problème ou préparer le code qu'il va produire. Ce n'est pas une activité si aisée pour le cerveau, alors si en plus vous lui imposer de lire des choses qui ne se ressemblent pas du tout, ne comptez pas sur lui pour progresser et aller plus vite !

D'autre part, si vous êtes en équipe et que chacun a son style, cela pose déjà une question sur la cohésion de l'équipe, mais surtout cela finit vite en guerre de style ou chacun essaye d'imposer sa syntaxe sur le code d'autrui et au final tout le monde perd du temps.

**Un code uniforme, c'est donc la base d'un projet sain !**

#### Un guide syntaxique

Pour résoudre ce problème, il faut décider de la syntaxe que l'on va adopter. Et comme cela représente un très gros travail, en général, on choisit un guide syntaxique (ou *style guide*) parmi ceux disponibles sur internet.

En Swift, il en existe deux particulièrement populaires :
- [Ray Wenderlich Swift StyleGuide](https://github.com/raywenderlich/swift-style-guide) : le plus complet et le plus populaire.
- [Github Swift StyleGuide](https://github.com/github/swift-style-guide) : très populaire et utilisé dans SwiftLint dont on parlera dans une minute.

Ces guides détaillent une syntaxe à suivre, qui privilégie la lisibilité du code. Cela va du nombre de lignes à sauter entre chaque méthode, à la façon de nommer les variables en passant par la bonne manière de déballer un optionnel.

> **:warning:** Ce n'est pas une lecture très agréable donc ne lisez pas tout d'un coup. Mais lisez-le quand même, vous apprendrez beaucoup de choses ! Et gardez-le sous la main pour vous y référer régulièrement !

#### Découvrez SwiftLint

Une fois que vous avez choisi et lu un guide, vous n'avez qu'une hâte, c'est d'appliquer toutes les conventions pour que votre code soit magnifique ! Mais vous êtes humains et vous risquez de ne pas tout retenir ou de faire des fautes.

Pour pallier à ce problème, il existe un outil que l'on appelle **lint**.
**Cet outil se base sur les guides syntaxiques et lit votre code pour vérifier automatiquement qu'il est conforme** ! Il saura dénicher le moindre espace de trop ! On dit qu'il fait l'**analyse statique** de votre code.

Le plus connu en Swift s'appelle **SwiftLint**. Vous pouvez le retrouver à [cette adresse](https://github.com/realm/SwiftLint).

#### Installez SwiftLint

Allons-y, installons SwiftLint ! Pour cela, il suffit de suivre les instructions données à [cette adresse](https://github.com/realm/SwiftLint).

##### Installez HomeBrew
Il existe plusieurs façons de l'installer. Je vous propose de choisir la première qui utilise HomeBrew. **HomeBrew est un gestionnaire de paquets pour Mac**. Son rôle est d'installer et mettre à jour des petits programmes comme SwiftLint.

Pour l'installer, il vous suffit d'aller sur le [site de présentation de HomeBrew](https://brew.sh). Les instructions sont très simples, il suffit de copier la commande suivante dans votre terminal :

```console
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

> **:warning:** Le script s'exécute tout seul, il s'arrête juste pour vous demander d'appuyer sur la touche entrée et de donner le mot de passe de votre ordinateur.

Et c'est tout, HomeBrew est installé !

##### Installez SwiftLint sur votre Mac

Maintenant, nous pouvons installer SwiftLint. En restant dans le terminal, il vous suffit d'entrer la commande suivante :

```console
brew install swiftlint
```

> **:information_source:** On utilise ici le gestionnaire de paquets HomeBrew pour installer SwiftLint. Vous utiliserez souvent la commande `brew install` en programmation pour installer ce genre de petit outil sur votre Mac.

Et voilà ! SwiftLint est installé sur votre Mac !

> **:information_source:** Vous pouvez mettre à jour un paquet installé avec HomeBrew, comme SwiftLint, en écrivant la commande `brew upgrade swiftlint`.

##### Ajoutez SwiftLint dans votre projet

Il ne nous reste plus qu'une petite étape, rajouter SwiftLint dans notre projet d'application. Ainsi, SwiftLint va pouvoir lire le code contenu dans notre projet pour y signaler des irrégularités de style.

Vous vous souvenez, il y a deux étapes en Swift : la compilation et l'exécution. C'est à l'étape de compilation que le code est interprété et traduit dans un autre code exécutable par la machine.

Notre objectif ici va être de **rajouter une séquence à la compilation : l'analyse statique de SwiftLint**. Pour rajouter cette séquence à la compilation (on parle parfois de *build*), on va suivre 5 étapes :
1. Sélectionnez le projet dans le navigateur
2. Sélectionnez la target
3. Sélectionnez l'onglet build phases
4. Appuyez sur plus
5. Choisissez *New Run Script Phase*

Vous pouvez retrouver toutes ces étapes dans l'illustration ci-dessous :

===> IMAGE(P1/P1C5_2.png) LEGENDE() <===

Une fois cela effectué, notre nouvelle séquence à la compilation (ou *phase du build*) est créée.

===> IMAGE(P1/P1C5_3.png) LEGENDE() <===

Nous allons maintenant la modifier pour qu'elle utilise SwiftLint. Pour cela, il suffit de copier le script suivant à l'endroit prévu à cet effet :

```console
if which swiftlint >/dev/null; then
	swiftlint
else
	echo "warning: SwiftLint not installed, download from https://github.com/realm/SwiftLint"
fi
```

> **:warning:** Ce script vérifie juste que SwiftLint est installé sur votre Mac et lance le programme si c'est le cas ou affiche un message d'erreur sinon.

A la fin, la phase doit ressembler à ceci :

===> IMAGE(P1/P1C5_4.png) LEGENDE() <===

Ça y est ! SwiftLint est prêt à l'emploi ! Bravo !

#### Utilisez SwiftLint

Nous avons installé SwiftLint comme la dernière étape de la compilation de notre code, donc pour qu'il fonctionne, il nous faut compiler le code. Pour cela, nous avons deux options :
- lancer le programme avec le gros bouton play en haut à gauche ou le raccourci <kbd>cmd + r</kbd>. Cela va lancer la compilation (*build*) puis l'exécution (*run*).
- lancer seulement la compilation (*build*) avec le raccourci <kbd>cmd + b</kbd>.

Le deuxième choix suffit donc je vous invite à essayer ! SwiftLint s'exécute et génère une vingtaine d'erreurs (18 dans mon cas) ! La bonne nouvelle, c'est que ce sont souvent des erreurs faciles à résoudre. Les trois plus courantes sont :
- *line_length* : une ligne trop longue, SwiftLint incite à faire des lignes de moins de 120 caractères pour qu'elles tiennent à l'écran.
- *vertical_whitespace* : trop de saut de lignes entre deux lignes de code.
- *trailing_whitespace* : une ligne vide qui contient des espaces : il faut suppimer les espaces inutiles.

> **:information_source:** Vous pouvez la liste complète des erreurs que peut générer SwiftLint [ici](https://github.com/realm/SwiftLint/blob/master/Rules.md).

Ces erreurs sont simples donc je vous laisse les résoudre tout seul. Mais il y en a une un peu plus sophistiquée qui a attiré mon attention :

```console
For Where Violation: `where` clauses are preferred over a single `if` inside a `for`. (for_where)
```

Cette erreur intervient pour le code suivant dans `Match.swift` :

```swift
private func getWinner() -> Player? {
	for (player, score) in scores {
		if score == Match.maxNumberOfWonSets {
			return player
		}
	}
	return nil
}
```

Dans ce code, on a une boucle for qui itère sur un dictionnaire, et cette boucle for contient un unique if. Dans ce cas courant, il existe un mot-clé qui permet de condenser les deux lignes en une seule : le mot-clé `where`. Il s'utilise comme ceci :

```swift
private func getWinner() -> Player? {
	for (player, score) in scores where score == Match.maxNumberOfWonSets {
		return player
	}
	return nil
}
```

Grâce à cette analyse de SwiftLint, notre code est plus concis, plus clair et nous avons découvert la clause `where` ! C'est un exemple qui illustre bien la puissance de la relecture syntaxique !

> **:x:** Une deuxième erreur de ce type a été révélée par SwiftLint ! A vous de la résoudre !

#### Quelques remarques
Avant de passer à la suite, je me permets trois petites remarques :

##### Niveaux d'erreurs

SwiftLint utilise les deux niveaux d'erreurs d'Xcode :
- les warnings qui n'empêchent pas le lancement de l'app
- les erreurs rouges qui empêchent le lancement de l'app

Par exemple, si une ligne est trop longue et qu'elle dépasse 120 caractères, on va avoir un warning. Mais si elle dépasse 200, là c'est vraiment exagéré et on obtient une erreur rouge.

##### Buildtime VS Runtime

Si vous allez dans le navigateur des erreurs, vous trouverez deux sous-onglets. Ils permettent de distinguer les erreurs à la compilation (*buildtime*) et les erreurs à l'exécution (*runtime*). Et comme vous pouvez le constater, toutes les erreurs de SwiftLint sont bien du côté de la compilation.

===> IMAGE(P1/P1C5_5.png) LEGENDE() <===

##### Choisir ses règles
SwiftLint est installé avec plus de 75 règles prédéfinies. Vous pouvez les modifier et les désactiver. Je ne détaillerais pas le fonctionnement de ces configurations ici, mais c'est expliqué assez clairement sur le [dépôt github du projet](https://github.com/realm/SwiftLint#rules).

#### En résumé
- Dans un projet, **la propreté du code passe en premier par une uniformité de la syntaxe**.
- Pour assurer cette uniformité, on utilise un **guide syntaxique** (ou *styleguide*).
- Un ***lint*** permet de faire l'**analyse statique** du code, en se basant sur les règles définies dans un guide syntaxique. **SwiftLint** est le plus populaire pour Swift.

Dans la prochaine partie, nous allons attaquer l'un des sujets les plus importants en programmation, si ce n'est LE plus important...  
Roulement de tambour...  
Musique de suspens...  
Accent dramatique...  

===> IMAGE(P1/P1C5_6.jpg) LEGENDE(Merci Tic pour ton enthousiasme...) <===

## Renforcez votre application avec les tests

### Découvrez les tests  
Bienvenue dans cette partie sur les tests unitaires ! Oui cette partie nécessite que je vous souhaite à nouveau la bienvenue, car sans vouloir en faire des tonnes, nous allons nous attaquer au sujet le plus important de votre vie !

> **:question:** Heureusement que tu as dit que tu n'en ferais pas des tonnes...

Bon, le sujet le plus important de votre vie de programmeur en tout cas.

Et ce sujet, c'est évidemment **les tests**.

===> IMAGE(P2/P2C1_1.jpg) LEGENDE(Bon Tac, ton frère vient de faire la blague...) <===

#### Qu'est-ce que les tests ?
Nous voilà déjà face à la grande question : **qu'est-ce que sont les tests ?**

C'est très simple et vous en faites déjà ! Lorsque vous développez une application, votre premier réflexe est de lancer l'app dans le simulateur pour voir si ça marche. Vous cliquez sur les boutons ou faites les actions que vous souhaitez contrôler et vous constatez que cela fonctionne comme prévu ou non.

Et bien c'est exactement un test ! **Vous testez que votre programme se comporte comme prévu**.

Plus précisément, vous faites ce que l'on appelle un **test manuel**. Les tests manuels sont utiles, mais ont deux défauts principaux :
- Ils sont **lents**, il faut compiler le code, lancer le simulateur, charger l'application, parfois faire plusieurs actions avant de pouvoir tester ce qu'on souhaite tester.
- Ils ne sont **pas fiables**. Avec un test manuel, vous allez vérifier qu'une action fonctionne, mais ce n'est pas suffisant. Il faudrait aussi vérifier que vous n'avez pas cassé les autres fonctionnalités de l'application. Et donc finalement, pour que les tests manuels soient fiables, il faudrait qu'à chaque fois que vous changez le code, vous retestiez tout le programme. Vous n'êtes pas près de créer le prochain Facebook à cette vitesse :) !

Alors, laissez-moi vous parler des autres formes de tests !

#### La pyramide des tests

On peut facilement se représenter la typologie des tests avec une pyramide. En haut de la pyramide, on a les tests les plus rarement utilisés qui sont effectués par des humains et en bas, ceux plus couramment utilisés effectués par des ordinateurs.

===> IMAGE(P2/P2C1_2.png) LEGENDE() <===

Comme vous pouvez le constater, la pyramide contient trois types de tests différents :
- Tout en haut, il y a les **tests manuels** conduits par des humains. Ils sont assez rares, car assez long comme nous venons de le dire.
- Tout en bas il ya les **tests unitaires**. Ce sont des tests automatisés rédigés par des humains, mais effectués par l'ordinateur. Ils sont bien plus nombreux, mais aussi bien plus fréquemment sollicités. On va en parler juste après.
- Enfin, nous avons entre les deux les **tests fonctionnels**. Selon les technologies et les méthodologies, ils sont réalisés par des humains ou par l'ordinateur. Dans notre cas en iOS, ce sera plutôt l'ordinateur et on les appelle UI Test. J'y reviens dans une minute.

Voilà la vision globale des tests. Rentrons un peu dans le détail maintenant.

#### Les tests unitaires
Les tests unitaires permettent de tester des toutes petites unités de votre programme. C'est pour cela qu'ils sont si nombreux. Un test unitaire va tester une seule méthode d'une seule classe au maximum. Si la méthode est grosse, il faudra même peut-être plusieurs tests pour la couvrir.

Prenons un exemple, avec la classe suivante :

```swift
class Personne {
	var age = 0

	func feterSonAnniversaire() {
		age += 1
	}
}
```

Je souhaite tester la méthode `feterSonAnniversaire` avec un test unitaire. Un test unitaire, c'est un petit morceau de code qui ferait la chose suivante :
1. Créer une instance de la classe `Personne` avec la propriété `age` qui vaux 12.
2. Appeler la méthode `feterSonAnniversaire` sur cette instance.
3. Vérifier que la propriété `age` vaux bien maintenant 13.

**Un test unitaire, c'est donc un morceau de code qui va tester une toute petite unité du programme**. Donc en général un test unitaire, c'est très simple !

Dit autrement, on a une donnée en entrée qui rentre dans le test unitaire. Si la donnée en sortie correspond à ce que l'on a prévu, le test est réussi.

===> IMAGE(P2/P2C1_3.png) LEGENDE() <===

> **:information_source:** La quasi-totalité de la suite de ce cours est dédié aux tests unitaires.

#### Les tests fonctionnels
Nous avons parlé des tests unitaires et des tests manuels. Parlons maintenant des tests fonctionnels qui se situent entre les deux !

**Les tests fonctionnels permettent de tester une fonctionnalité complète de l'application**, comme la phase de login par exemple.

En iOS, on les appelle **UI tests**, car ils ont lieu sur l'interface utilisateur. Le principe, c'est que nous allons indiquer au simulateur un certain nombre d'actions à réaliser (appui sur ce bouton, reviens à la page précédente, glisse vers le bas, etc.) et ensuite, nous allons lui demander de vérifier que ce qui se trouve à l'écran correspond à ce qu'on a prévu. Ce sont donc des tests automatisés : l'ordinateur suit le scénario qu'on lui a donné sur l'interface de l'application.

> **:information_source:** Nous ne verrons pas dans ce cours comment créer des tests fonctionnels, car cela allongerait le cours inutilement (cf. le paragraphe suivant) ;) !

#### Quels tests choisir ?

Avec notre pyramide de test, nous voilà bien embêtés ! Quels sont les tests que nous devons choisir d'implémenter dans notre projet ?

La réponse est plus compliquée qu'il n'y parait. Alors je vais la faire en 2 temps :

##### 1. Utilisez les tests manuels, mais ne vous y fiez pas !
Vous ne pouvez pas vous passer des tests manuels, car c'est un bon moyen de voir si votre application fonctionne dans son ensemble et surtout parce que vous pouvez toujours vous appuyez sur ce que vous voyez ! Donc il faut continuer à les faire, mais ne comptez pas exclusivement sur eux, ils sont lents et pas fiables !

##### 2. Fiez-vous aux tests unitaires
Les tests fonctionnels et les tests unitaires ont l'avantage d'être automatisés. Donc ils vont nous permettre de tester l'intégralité de notre code.

> **:question:** OK, mais on doit utiliser les deux ? Ou que les tests unitaires ? Ou que les tests fonctionnels ?

Je pense que chaque développeur a une réponse différente à cette question. Alors voici la mienne !

**Si votre programme est bien architecturé et que vous êtes rigoureux, les tests unitaires doivent vous suffire.**

> **:question:** Pourquoi ?

Si votre programme est bien architecturé, toute la logique de votre application est bien rangée dans des classes qui ont chacune un rôle clair et sont donc testables facilement.

De plus, les tests unitaires ont deux avantages sur les tests fonctionnels :
- Ils sont **plus rapides** à exécuter. Les tests fonctionnels nécessitent le lancement de l'app dans un simulateur suivi d'un scénario d'actions. Les tests unitaires se résument à évaluer un booléen.
- Les tests unitaires sont **plus faciles à rédiger et à maintenir**, car ils concernent chacun une toute petite unité du programme.

#### En résumé

- Il existe plusieurs types de tests, des plus couramment appelés aux plus rares :
	- Les tests unitaires
	- Les tests fonctionnels
	- Les tests manuels
- Un test unitaire, c'est donc un morceau de code qui va tester une toute petite unité du programme.
- Les tests fonctionnels permettent de tester une fonctionnalité complète de l'application,
- Je vous suggère de continuer à faire des tests manuels, mais qu'ils ne sont pas fiables complétez les avec une suite de tests unitaires qui sont rapides, fiables, rapides à rédiger et à maintenir.

### Décelez les éléments à tester
Maintenant que vous savez ce que sont les tests unitaires, tout votre être n'est plus animé que par une seule passion : les créer !

Je vous demande pourtant quelques petites minutes de patience. Je sais, c'est dur, mais avant de rédiger vos premiers tests, il faut se demander quels sont les éléments à tester !

Nous verrons donc la question du **comment** tester au chapitre suivant et pour l'heure concentrons-nous sur le **quoi** tester.

#### Tests et MVC

Comme tout développeur qui se respecte et qui maîtrise le MVC, vos applications sont toujours séparées en trois et votre modèle est bien isolé de la vue.

> **:x:** Si ce n'est pas le cas, inutile de commencer à parler de test, vous n'êtes pas encore prêt. Les tests ont besoin d'un code organisé rigoureusement. Mais si vous n'êtes pas à l'aise avec le MVC, pas de souci ! Il y a [un cours](https://openclassrooms.com/courses/concevez-une-application-iphone-avec-le-modele-mvc) pour vous aider !

En MVC, la logique de l'application se situe dans le modèle. C'est donc le cerveau de l'application. Et il faut avant tout s'assurer que le cerveau fonctionne bien ! Donc, **c'est le modèle que nous allons tester en MVC** !

> **:question:** Et la vue ?

La vue est une entité extrêmement simple, elle n'effectue aucune logique. Elle affiche juste ce qu'on lui demande d'afficher. Donc on n'a pas besoin de tester la vue.

> **:question:** Et le contrôleur ? Lui, il contrôle la vue et donc il peut y avoir un peu de logique d'affichage à tester !

C'est bien vu ! Et c'est là que l'on atteint les limites du MVC. Vous verrez que pour des projets ambitieux, vos contrôleurs vont devenir énormes, car en fait le rôle du contrôleur est trop important.

> **:information_source:** Dans certaines architectures plus avancées comme le [MVVM](https://medium.com/yay-its-erica/dabbling-with-mvvm-in-swift-3-3bbeba61b45b), [VIPER](https://www.objc.io/issues/13-architecture/viper/) ou [Clean](https://clean-swift.com), le contrôleur est divisé en deux ou trois pour justement isoler sa partie logique et ne lui laisser que son rôle basique de dire à la vue ce qu'elle doit faire. La partie logique du contrôleur récupérée ainsi dans d'autres classes peut être testée.

Pour l'heure, nous allons rester en MVC et nous contenter de tester le modèle, ce qui est déjà suffisamment ambitieux pour le moment ! Mais gardez en tête que vous pouvez aller plus loin en explorant d'autres architectures.

#### Tests et classes

Dans notre modèle, nous avons trois classes : `Game`, `Set` et `Match`. Ce sont les trois classes que nous allons tester.

##### Le concept d'interface
Je vous ai expliqué qu'un test unitaire ne testait qu'une petite unité de code comme la méthode d'une classe.

> **:question:** OK j'ai compris ! Ça veut dire qu'on va tester toutes les méthodes de toutes les classes !

Vous vous rapprochez, mais ce n'est pas exactement ça. Vous vous souvenez : une classe permet de cacher une implémentation. Par exemple, ici, la logique complète de la classe `Match` ne nous intéresse pas. On veut juste pouvoir ajouter un point et récupérer le nouveau score.

Et bien, avec les tests on ne s'intéresse pas à la logique interne de la classe, mais seulement à ce qu'on appelle son **interface**, c'est-à-dire les propriétés et méthodes disponibles à l'extérieur de la classe.

Autrement dit, **nous n'allons pas tester les méthodes et propriétés privées, mais seulement les méthodes et propriétés publiques**.

##### Visualiser l'interface

Pour que le concept d'interface soit clair, je vous propose de vous montrer comment la visualiser avec Xcode.

Et c'est très simple ! Il vous suffit de sélectionner le fichier dont vous souhaitez visualiser l'interface, par exemple : `Match.swift`. Puis vous allez dans l'onglet *Navigate* et vous cliquez sur *Jump to Generated Interface*.

===> IMAGE(P2/P2C2_1.png) LEGENDE() <===

Ensuite, Xcode vous montre l'interface de votre classe :

===> IMAGE(P2/P2C2_2.png) LEGENDE() <===

Sur cette vue, vous pouvez voir l'ensemble des propriétés et méthodes de vos classes au niveau `interne` et `public`. Toutes les autres sont cachées. Et les implémentations des méthodes aussi.

Vous pouvez voir ici du coup qu'il existe une seule méthode publique à la classe match : la méthode `pointEnded`. Toutes les méthodes privées ne font pas partie de l'interface.

##### Tester uniquement les interfaces

En résumé, **on teste uniquement les interfaces de nos classes**. Autrement dit, quand on rédige un test on ne doit même pas savoir comment est construite la classe à l'intérieur. C'est la même chose que quand on travaille sur le contrôleur.

> **:question:**, Mais du coup, on ne va pas tout tester !

Et si ! Les méthodes privées sont utilisées par les méthodes publiques. Donc lorsqu'on teste qu'une méthode publique fonctionne correctement, certaines méthodes privées sont appelées. Et finalement, l'ensemble de la classe est testée presque sans qu'on s'en rende compte !

#### Conditions pour tester

Les tests nous encouragent à nous concentrer sur les interfaces de nos classes et à leurs organisations. En particulier, pour que notre code soit facilement testable, il faut suivre deux principes :

- **Responsabilité unique** : Si une classe fait plusieurs choses à la fois, elle va devenir très grosse et du coup compliquée à tester. Lorsque vous créez une classe : assurez-vous qu'elle ne sert qu'à une seule chose.

- **Classes découplées** : Imaginons que vous installiez dans votre application un service de paiement. Si ce service de paiement est intégré dans plusieurs classes, cela va rendre le test de ces classes compliquées. À la place, il vaut mieux créer une classe dédiée à la gestion du paiement pour garder les autres classes indépendantes de ce service et testables facilement. On appelle cela découpler les classes.

> **:warning:** Pour tester, il faut un code testable ! Et c'est souvent la partie la plus difficile.

Et pour y arriver, souvenez-vous de créer des **classes découplées à responsabilité unique** !

#### Tests utiles
Enfin, ça paraît évident, mais ça va mieux en le disant, il faut créer des tests utiles.

> **:question:** Sans blague ?!

Oui j'enfonce un peu une porte ouverte, mais sauriez-vous me dire ce qu'est un test utile ?

> **:question:** Euh...

Vous voyez, ce n'est pas si évident ! **Un test utile, c'est un test qui peut échouer et qui peut réussir**. Autrement dit, un test qui échoue toujours est inutile, même chose pour un test qui ne peut que réussir.

Par exemple, ça ne sert à rien de tester que lorsque vous rajoutez un élément dans un tableau, la taille du tableau s'incrémente. Ce sera toujours bon (à moins que le langage Swift ne marche plus, mais là vous aurez d'autres problèmes... :O) !

Par contre, si vous avez prévu par exemple qu'à la fin d'un jeu, un nouveau jeu est rajouté au set, vous pouvez tester que la taille du tableau de jeux `games` de la classe `Set` s'incrémente. En effet, cette fois-ci, vous ne testez pas juste l'ajout d'un élément dans un tableau, mais la logique qui se déroule à la fin d'un jeu. C'est un test utile, car il peut échouer si votre code est mauvais ou réussir s'il est correct !

#### En résumé
- Dans le MVC, nous allons tester uniquement le modèle.
- On cherche à tester uniquement l'interface d'une classe sans s'occuper de l'implémentation de cette dernière.
- Pour tester, il faut un code testable. Les tests vous incitent à créer des classes découplées à responsabilité unique.
- Un test est utile s'il peut échouer et réussir.

Dans le prochain chapitre, vous allez créer votre tout premier test !

### Créez votre premier test  
Nous y sommes ! Le moment dont vous avez rêvé est arrivé ! Nous allons enfin créer nos tests !

===> IMAGE(P2/P2C3_1.png) LEGENDE(Bon Tic et Tac, ça suffit ! Vous déconcentrez tout le monde !) <===

Pour cela nous allons procéder en trois étapes :
1. Nous allons d'abord créer une target, dans laquelle nous allons écrire tous nos tests.
2. Nous allons ajouter un fichier de tests dans la nouvelle target.
3. Nous allons écrire nos tests dans ce fichier.

C'est parti !

#### Créer une target

##### Le concept de target
> **:question:** Euh c'est quoi une target ?

Xcode fonctionne par projet. Quand vous démarrez Xcode, vous ouvrez un projet dans lequel se trouve pour le moment une seule *target* : votre application. Un projet peut en fait contenir plusieurs targets.

Par exemple, vous pouvez avoir plusieurs versions d'une même application, une version pro et une version normale. Ces deux applications sont suffisamment proches pour faire partie du même projet, mais elles ne sont pas identiques donc vont être des targets différentes.

Les tests ne font pas partie de l'application. **Ils se comportent comme un module à part et donc nous allons les créer dans une target à part.**

##### Créer la target
Pour créer cette target, rien de plus simple, suivez le guide !

1/ Sélectionnez le projet dans le navigateur.  
2/ Cliquez sur le `+` en bas à droite du panneau central.

===> IMAGE(P2/P2C3_2.png) LEGENDE() <===

3/ Dans la popup qui s'ouvre, choisissez l'onglet iOS.  
4/ Dans la barre de recherche en haut à droite, vous pouvez taper "test".  
5/ Xcode ne vous propose plus que 2 types de target à tester. Choisissez *iOS Unit Testing Bundle* pour créer des tests unitaires.  
6/ Cliquez sur `Next`.

===> IMAGE(P2/P2C3_3.png) LEGENDE() <===

7/ Xcode vous propose de contrôler les paramètres de votre nouvelle target. Ce sont les mêmes qu'à la création d'un projet Xcode. À l'exception des deux derniers qui vous permettent de préciser le projet dans lequel créer la target ainsi que la target qui va être testée, ici c'est bien notre application. Cliquez sur `Finish` pour créer la target.

===> IMAGE(P2/P2C3_4.png) LEGENDE() <===

Et voilà notre target est créée ! Elle est visible dans la liste des targets et un nouveau dossier a été créé dans le navigateur.

===> IMAGE(P2/P2C3_5.png) LEGENDE() <===

> **:information_source:** Cette target peut également être créée pendant la création d'un nouveau projet. Il suffit de cocher la case *Include unit tests*.  
===> IMAGE(P2/P2C3_6.png) LEGENDE() <===

#### Ajoutez un fichier de test
Comme vous l'avez remarqué, la target contient déjà un fichier de test nommé `JeuSetMatchTests.swift`. Vous pouvez le supprimer, car son nom ne nous convient pas. Nous allons en créer un nouveau.

Pour cela, sélectionnez le dossier `JeuSetMatchTests` puis faites <kbd>cmd+n</kbd> (ou aller dans *File* > *New* > *File...*). Choisissez *Unit Test Case Class*. Puis cliquez sur `Next`.

===> IMAGE(P2/P2C3_7.png) LEGENDE() <===

Nommez ensuite votre fichier `GameTestCase`, car nous allons commencer par tester la classe `Game`. Et cliquez sur `Next`.

===> IMAGE(P2/P2C3_8.png) LEGENDE() <===

Enfin, vérifiez bien que la target sélectionnée est bien celle des tests. Et cliquez sur `create`.

===> IMAGE(P2/P2C3_9.png) LEGENDE() <===

Et voilà votre premier fichier de test est créé et vous pouvez le retrouvez dans votre navigateur !

===> IMAGE(P2/P2C3_10.png) LEGENDE() <===

> **:warning:** Si vous avez l'alerte ci-dessous, vous pouvez cliquer sur `Don't Create`. Tout notre code est en Swift donc nous n'avons pas besoin de faire le lien avec de l'Objective-C.  
===> IMAGE(P2/P2C3_11.png) LEGENDE() <===

#### Présentation de XCTestCase  
Regardons maintenant un peu le fichier que nous venons de créer.

===> IMAGE(P2/P2C3_12.png) LEGENDE() <===

Nous commençons par importer `XCTest` qui est le framework de test d'Xcode. Puis nous créons une classe `GameTestCase` qui est une sous-classe de `XCTestCase`.

`XCTestCase` est une classe qui permet de faire des tests comme son nom l'indique. **À chaque fois que vous voudrez faire des tests, il vous faudra créer une sous-classe de `XCTestCase`**. Dans ce cours, nous en créerons trois en tout : `GameTestCase`, `SetTestCase`, `MatchTestCase`. Elles reprennent les trois classes de notre modèle et dans chacune de ces sous-classes, nous allons pouvoir ajouter plusieurs tests.

#### Votre premier test

Je vous propose de supprimer tout le contenu de la classe. Nous verrons au fur et à mesure à quoi tout cela sert. Votre code doit ressembler à ceci :

```swift
import XCTest

class GameTestCase: XCTestCase {
}
```

##### Ajouter le test
Et maintenant, ajoutons notre tout premier test ! Pour créer un test, c'est très simple ! Il suffit d'**ajouter à notre classe une méthode qui commence par le mot `test`**. Par exemple :

```swift
func testMaMethode() {} // Ceci est un test
func maMethode() {} // Ceci n'est pas un test
```

Je vous propose de rajouter le test suivant comme ceci :

```swift
class GameTestCase: XCTestCase {
	func testExemple() {

	}
}
```

> **:information_source:** Lorsque vous créer un test, un losange apparaît sur sa droite. Cela vous confirme que le test a bien été reconnu par Xcode.  
===> IMAGE(P2/P2C3_13.png) LEGENDE() <===

##### XCTAssert
Maintenant nous allons remplir ce test ! Je vous l'ai dit : un test, c'est l'évaluation d'un booléen. Si le booléen est évalué à `true`, le test est réussi, sinon le test échoue.

La fonction qui évalue le booléen s'appelle `XCTAssert` et prends en paramètre... un booléen !

Essayez d'écrire dans le test :
```swift
func testExemple() {
	XCTAssert(true)
}
```

La fonction va évaluer que le booléen vaut `true`. Et donc le test va réussir.

##### Lancer le test

Pour voir le test réussir, il vous suffit de cliquer sur le petit losange à gauche du nom du test. Le test se lance et après quelques minutes d'un insoutenable suspens... le test est réussi !

===> IMAGE(P2/P2C3_14.png) LEGENDE() <===

Maintenant, réitérer l'expérience en remplaçant `true` par `false`. Relancez le test, et... il échoue !

===> IMAGE(P2/P2C3_15.png) LEGENDE() <===

Je vous invite à jouer avec la méthode `XCTAssert` et le lancement des tests. Par exemple, essayez les commandes suivantes :

```swift
XCTAssert(2*2 == 4)
XCTAssert(true || false)
XCTAssert(true && false)
XCTAssert(365%7 == 0)
XCTAssert([1, 2, 3, 4].count == [5, 6, 7, 8].count)
```

Il y a différentes façons de lancer les tests :
- Pour lancer **tous les tests de votre projet**, vous pouvez utiliser le raccourci <kbd>cmd + u</kbd>.
- Pour lancer **tous les tests d'une classe**, vous pouvez cliquer sur le losange à côté de la déclaration de la classe.
- Pour lancer **un seul test**, on clique sur le losange à côté du test.

#### Exercice
Je vous propose de créer les deux autres fichiers de tests : `SetTestCase.swift` et `MatchTestCase.swift`. Il suffit de reprendre les étapes vues ensemble ! Bonne chance !

#### En résumé
- Pour créer des tests, il faut rajouter une **target**. L'application est dans une target, les tests dans une autre et ces deux targets appartiennent à un même projet Xcode.
- Ensuite, il faut créer un fichier de test dans lequel on crée une sous-classe de `XCTestCase`.
- Pour créer un test, il faut **créer une méthode dont le nom commence par le mot `test`**.
- La fonction `XCTAssert` permet d'évaluer un booléen, s'il vaut `true`, le test réussit et inversement.
- Pour lancer les tests, on peut cliquer sur les losanges ou faire `cmd+u`.

Dans le prochain chapitre, nous allons tester toute la classe `Game` !

### Testez la classe Game  
C'est bien beau de s'amuser à faire des petits tests pour tester le fonctionnement des tests. Mais trop de tests tuent les tests et vous allez finir par les détester. :D

Alors, rentrons dans le vif du sujet et testons notre classe `Game` !

#### Importer l'application

Comme nous l'avons vu dans le projet précédent, les tests et l'application coexistent dans un même projet, mais se trouvent dans des targets séparées. Cela veut dire qu'ils ne sont pas dans le même module. Donc si vous essayez d'utiliser la classe Game ou toute autre classe dans les tests, Swift va vous signaler qu'il ne connaît pas cette classe.

Pour cela, pas de panique ! Il nous suffit d'importer le module qui correspond à notre application. Il a le nom de la target correspondante, à savoir : `JeuSetMatch`.

===> IMAGE(P2/P2C4_1.png) LEGENDE() <===

Vous pouvez écrire en haut de votre fichier test :
```swift
import JeuSetMatch
```

Désormais le module de l'application est importé dans votre fichier de tests.

Mais ce n'est pas suffisant ! Pour comprendre pourquoi, faisons un petit rappel du contrôle d'accès.

Il y a 4 niveaux que je vous résume dans ce schéma :

===> IMAGE(P2/P2C4_2.png) LEGENDE() <===

> **:information_source:** Si vous avez besoin de vous rafraîchir un peu plus la mémoire, vous pouvez retourner [ici](https://openclassrooms.com/courses/approfondissez-swift-avec-la-programmation-orientee-objet/protegez-vos-classes).

Le niveau par défaut, c'est le niveau interne. À ce niveau, la portée des classes et de leurs membres est limitée au module qui les contient. Donc en l'occurrence, notre classe `Game` et toutes ses méthodes ne sont pas disponibles en dehors de l'application. Donc lorsqu'on importe le module `JeuSetMatch` du côté des tests, nous n'avons pas accès à `Game` et aux autres classes du modèle, car nous sommes dans un autre module.

Pour y remédier, nous avons deux solutions :
1. Modifier les classes et les méthodes pour qu'elles soient toutes publiques. D'une part, ça va nous prendre un peu de temps et d'autre part ce n'est pas très sécurisé.
2. Utilisez le décorateur `@testable`. Et c'est ce que nous allons faire !

Le décorateur `@testable` se place avant l'import d'un module. Il permet de faire comme si le fichier de test faisait partie du même module. Ainsi, le fichier de test a accès à toutes les classes et leurs membres à partir du niveau interne.

Écrivez donc ceci ans votre code :
```swift
@testable import JeuSetMatch
```

Nous avons maintenant accès à la classe `Game` et nous allons pouvoir la tester !

#### Écriture du premier test

Vous pouvez supprimer le `testExemple`, nous allons écrire à la place notre premier vrai test. Et nous n'allons pas l'appeler n'importe comment !

Pour nommer vos tests, je vous suggère d'utiliser une technique bien pratique : le *Behavior Driven Development* (ou développement motivé par le comportement). En BDD, vos noms de tests vont être divisés en trois parties :
- *Given* : Etant donné que... [Situation de départ]
- *When* : Quand...[Action]
- *Then* : Alors...[Situation d'arrivée]

Par exemple, si on devait écrire le nom d'un test qui contrôle le fonctionnement d'un like, on écrirait :
```swift
GivenPostHasZeroLike_WhenPostIsLiked_ThenPostHasOneLike
// ETANT DONNÉ QUE le poste n'a pas de like
// QUAND le poste est liké
// ALORS le poste a un like
```
Faisons cela avec notre premier test de la classe `Game`, on va tester que le score du joueur 1 passe bien de 0 à 15 lorsqu'il gagne le premier point :

```swift
func testGivenScoreIsNull_WhenIncrementingPlayer1Score_ThenScoreShouldBeFifteen() {
}
```

Il ne nous reste plus qu'à coder ce qui est dit dans le nom du test :


```swift
func testGivenScoreIsNull_WhenIncrementingPlayer1Score_ThenScoreShouldBeFifteen() {
	// 1
	let game = Game()

	// 2
	game.incrementScore(forPlayer: .one)

	// 3
	XCTAssert(game.scores[.one]! == 15)
	XCTAssert(game.scores[.two]! == 0)
}
```

Voyons un peu ce que je viens de rédiger :
1. *Situation de départ* : un jeu avec un score nul.
2. *Action* : le point est gagné par le joueur 1.
3. *Situation d'arrivée* : le score du joueur 1 vaut 15, celui du joueur 2 vaut 0.

> **:information_source:** Sans écrire les commentaires 1, 2 et 3 bien sûr, je vous suggère de sauter des lignes entre chaque étape du test. Ainsi vous ferez apparaître clairement les trois étapes du BDD.

Nous avons rédigé notre premier test ! Vous pouvez le lancer et constater que cela fonctionne !

> **:warning:** La technique du BDD est incontournable. Vous devez séparer le contenu de vos tests en trois parties Given / When / Then. La meilleure façon de ne pas l'oublier quand on débute, c'est d'utiliser cette technique pour nommer vos tests. Néanmoins, cette technique a le défaut de vous obliger à écrire des noms de tests assez longs, parfois trop. Donc lorsque vous maîtriserez le BDD, vous pouvez essayer de nommer vos tests de façons plus concise mais en n'oubliant pas d'organiser le contenu du test selon les 3 étapes du BDD.

#### Écriture du deuxième test
Passons à la suite ! Nous allons maintenant tester qu'au deuxième point gagné, le score passe de 15 à 30. Essayez de le faire tout seul !

Voici la correction :
```swift
func testGivenScoreIsFifteen_WhenIncrementingPlayer1Score_ThenScoreShouldBeThirty() {
		let game = Game()
		game.scores[.one] = 15

		game.incrementScore(forPlayer: .one)

		XCTAssert(game.scores[.one]! == 30)
		XCTAssert(game.scores[.two]! == 0)
}
```
C'est quasiment la même chose. On a juste rajouté la deuxième ligne pour que le score démarre à 15 points.

Il y a quelque chose qui me choque quand même. La première ligne est rigoureusement identique dans les deux tests ! Or un bon développeur n'aime pas se répéter ! Il faut factoriser. Je vous propose d'extraire cette ligne et d'en faire une propriété :

```swift
class GameTestCase: XCTestCase {
    let game = Game()

    func testGivenScoreIsNull_WhenIncrementingPlayer1Score_ThenScoreShouldBeFifteen() {
        game.incrementScore(forPlayer: .one)

        XCTAssert(game.scores[.one]! == 15)
        XCTAssert(game.scores[.two]! == 0)
    }

    func testGivenScoreIsFifteen_WhenIncrementingPlayer1Score_ThenScoreShouldBeThirty() {
        game.scores[.one] = 15

        game.incrementScore(forPlayer: .one)

        XCTAssert(game.scores[.one]! == 30)
        XCTAssert(game.scores[.two]! == 0)
    }
}
```

C'est mieux comme ça ! Le seul problème, c'est que nos tests ne sont plus indépendants les uns des autres. Or ils doivent l'être, car un test unitaire s'occupe d'une petite unité de code. Si ce test porte avec lui l'historique des tests précédents, ça ne fonctionne plus !

Pour y remédier, nous allons utiliser la méthode `setup`. C'est une méthode de `XCTestCase` qui permet de faire un peu de préparation. **Cette méthode est rappelée avant chaque test**. Donc dans notre cas, elle va être appelée deux fois.

Je vous propose de l'utiliser pour initialiser notre propriété `game`. Ainsi avant chaque début de test, la propriété sera réinitialisée :

```swift
var game: Game!

override func setUp() {
	super.setUp()
	game = Game()
}
```

> **:information_source:** J'utilise un optionnel déballé pour la propriété `game` car je l'initialise ensuite dans la méthode `setup`. Je suis donc certain que la variable sera initialisée avant chaque début de test.

Vous pouvez relancer vos tests et vérifier qu'ils réussissent toujours !

#### Écriture du troisième test
Vous commencez à connaître la musique. On va tester maintenant que le troisième point gagné fait passer le score de 30 à 40. À vous de jouer !

Voici la correction :
```swift
func testGivenScoreIsThirty_WhenIncrementingPlayer1Score_ThenScoreShouldBeForty() {
	game.scores[.one] = 30

	game.incrementScore(forPlayer: .one)

	XCTAssert(game.scores[.one]! == 40)
	XCTAssert(game.scores[.two]! == 0)
}
```

Pas grand-chose de nouveau ici. Mais il y a encore quelque chose qui me chiffonne... La première ligne ressemble beaucoup à la première ligne du test précédent. Est-ce qu'on ne pourrait pas factoriser ?

On va créer une méthode pour factoriser cette ligne. Eh oui ! On est dans une classe, on peut écrire toutes les méthodes qu'on veut. On n'est pas obligé d'écrire que des tests. Il suffit qu'elles ne commencent pas par le mot `test`.

> **:warning:** D'ailleurs, je vous incite fortement à le faire ! **Vos tests sont à traiter avec le même soin que le reste de votre code, sinon plus !**

Allons-y :

```swift
func setPlayerOneScore(_ score: Int) {
	game.scores[.one] = score
}
```

Et dans nos tests on peut maintenant écrire :

```swift
setPlayerOneScore(15) // Pour le deuxième test
setPlayerOneScore(30) // Pour le troisième test
```

#### Écriture du quatrième test
Il ne nous reste plus qu'un test à écrire. Lorsque le score du joueur 1 vaut 40 et qu'il gagne le point, le jeu doit être terminé et gagné par le joueur 1. Vous voulez essayer de le faire seul ? Allez-y !

Voici la correction :
```swift
func testGivenScoreIsForty_WhenIncrementingPlayer1Score_ThenGameIsOverAndWonByPlayer1() {
	setPlayerOneScore(40)

	game.incrementScore(forPlayer: .one)

	XCTAssertEqual(game.winner, .one)
	XCTAssertTrue(game.isOver)
}
```

J'ai pris la liberté de vous montrer ici deux variantes de la méthode `XCTAssert` :
- `XCTAssertEqual` : Très utile, cette variante prend deux paramètres et le test réussit s'ils sont égaux. L'opposé `XCTAssertNotEqual` existe également.
- `XCTAssertTrue` : Elle fonctionne exactement comme `XCTAssert`, mais elle est plus lisible. L'opposé `XCTAssertFalse` existe également.

> **:information_source:** Il existe d'autres variantes comme `XCTAssertNil`, `XCTAssertNotNil` etc. Vous pouvez retrouver toutes les variantes de XCTAssert [ici](https://developer.apple.com/documentation/xctest) (section *Test Assertion*). Je vous invite à les utiliser, vos tests seront plus lisibles !

Et voilà ! Notre classe `Game` est intégralement testée ! Bravo !

#### Exercice
Je vous propose d'essayer de rédiger les tests de la classe `Set`. Il y a trois tests à créer :
1. Testez que la propriété calculée `scores` fonctionne bien. Les scores doivent correspondre au nombre de jeux gagnés par chaque joueur.
2. Testez que la propriété calculée `winner` fonctionne bien. Elle doit être à `nil`, si la partie n'est pas terminée.
3. Testez que si le joueur 1 a gagné 6 jeux, le set est terminé et gagné par le joueur 1.

Vous pouvez retrouver la correction [ici](https://s3-eu-west-1.amazonaws.com/static.oc-static.com/prod/courses/files/Parcours+DA+iOS/Cours+6+-+Tests/SetTestCase.swift). Bon courage, vous pouvez le faire !

#### En résumé
- On écrit les noms des tests en Behavior Design Development : on sépare le nom en trois parties : *Given*, *When*, *Then*.
- La méthode `setup` est rappelée avant chaque test. Elle permet de faire une initialisation.
- Vous devez traiter vos tests comme le reste du code. Donc n'hésitez pas à les factoriser en créant des méthodes dès que besoin.
- Il existe plusieurs variantes de `XCTAssert`. Je vous invite à les utiliser le plus possible pour améliorer la lisibilité de vos tests.

Maintenant que vous avez rédigé vos premiers tests et que vous avez compris la logique d'un test unitaire, nous allons parler de l'utilité de créer et maintenir vos tests unitaires ! Rendez-vous au prochain chapitre !

### Saisissez l’intérêt des tests
Maintenant que vous avez une meilleure idée de ce que sont les tests en général et les tests unitaires en particulier, nous allons pouvoir aborder l'épineuse question de ce cours :

**Pourquoi rédiger des tests unitaires ?**

Il y a de nombreuses raisons à cela. Et voici les 5 principales !

#### 1. Prouver que votre code fonctionne ✅
**Tout le code que vos tests unitaires couvrent fonctionne** par définition des tests unitaires. Donc vos tests vous donnent la preuve que votre code marche. Et cela vous donne un atout exceptionnel, vous avez confiance dans votre code !

Si vous vous êtes déjà frottés à une grosse base de code, vous avez sans doute ressenti ce vertige d'avoir peur de tout casser, car vous ne pouviez pas anticiper les implications de vos changements.

Avec des tests unitaires, **si un changement casse quelque chose, vous le verrez tout de suite, car un ou plusieurs de vos tests vont passer au rouge !**

#### 2. Prévenir les bugs et régressions 🐞
Comme les tests unitaires prouvent que votre code fonctionne, ils empêchent les bugs de se produire. Et comme tout est testé, vous pouvez modifier votre base de code sans craindre une régression, les tests la verront tout de suite !

Et vous pourrez faire les changements nécessaires avant d'envoyer votre nouvelle version de l'app sur l'App Store !

#### 3. Penser vos classes 🤔
Comme nous l'avons vu, les tests unitaires ont lieu à l'interface des classes. Donc pour pouvoir tester facilement, il va falloir que vous pensiez vos classes correctement.

Écrire vos tests vous incite à créer des classes dont les responsiblités sont **uniques** et **indépendantes**.

En somme, les tests vous facilitent l'organisation de votre code.

#### 4. Une documentation vivante de votre code 📚
Chaque test va couvrir un cas d'usage d'une de vos classes. Donc si tout votre code est testé, vos tests sont une vraie documentation fonctionnelle de votre programme. On peut y trouver tout ce que fait le code !

Regardez le code condensé de la classe `Game` que nous venons de tester :

```swift
func testGivenScoreIsNull_WhenIncrementingPlayer1Score_ThenScoreShouldBeFifteen() {}

func testGivenScoreIsFifteen_WhenIncrementingPlayer1Score_ThenScoreShouldBeThirty() {}

func testGivenScoreIsThirty_WhenIncrementingPlayer1Score_ThenScoreShouldBeForty() {}

func testGivenScoreIsForty_WhenIncrementingPlayer1Score_ThenGameIsOverAndWonByPlayer1() {}
```

On peut très bien lire les 4 cas d'utilisations de la classe `Game` grâce à notre nomenclature en *Behavior Driven Development*.

> **:information_source:** Vous pouvez plier les méthodes d'une classe directement dans Xcode avec le raccourci  <kbd>Shift+alt+cmd+flèche gauche</kbd>. Pour les déplier, vous pouvez faire: <kbd>Shift+alt+cmd+flèche droite</kbd>. Cela vous permet d'avoir la vue d'ensemble d'une classe, ce qui est loin d'être inutile ;) !

En plus, contrairement à une documentation classique rédigée en dehors du code, celle-ci a l'avantage d'être **toujours à jour** ! En effet, dès que vous modifiez votre code, vous devez modifier vos tests.

Une bonne suite de tests, c'est donc la meilleure documentation qui soit !

#### 5. Être professionnel 💼

Enfin, lorsque vous faites des tests, vous créez un code qui est facilement maintenable, qui prévient les bugs et dont vous êtes certains qu'il fonctionne. Et ce sont les composants essentiels d'une attitude professionnelle.

Si un plombier vient chez vous réparer une fuite et qu'il vous dit en partant que sa réparation va peut-être arrêter la fuite, vous vous dîtes que c'est un touriste ! Et bien, en développement c'est pareil, **il faut que vous soyez sûr de vous et seule une bonne suite de test vous le permettra !**

Alors, faites de beaux tests ! Vous ne voulez pas passer pour des touristes :) !

#### En résumé
Rédiger des tests unitaires doit devenir un réflexe, car c'est une étape incontournable si vous souhaitez devenir des développeurs iOS professionnels ! En effet, les tests unitaires vous permettent de :
- Prouver que votre code fonctionne
- Prévenir les bugs et les régressions
- Penser à vos classes
- Créer une documentation vivante de votre
- Être professionnel

Dans le prochain chapitre, nous allons améliorer la couverture en tests de notre code !

### Évaluez la couverture de vos tests  
Nous avons testé deux classes pour le moment : `Game` et `Set`. C'est bien, mais nous n'allons pas nous arrêter en si bon chemin ! On a dit qu'on allait tester tout le modèle !

> **:warning:** Oui, sauf que cette phrase pause un problème métaphysique ! **Comment être sûr qu'on a testé tout le modèle ?** Nous sommes de simples êtres humains et nous pouvons faire des erreurs, oublier un test, etc. Si seulement il existait un outil pour nous assurer que tout notre code est testé...

[Suspens insoutenable...]

Eh oui ! Bien sûr il existe ! On appelle cela le ***code coverage***. Cet outil regarde quelle partie du code est *couverte* par les tests. Pour cela, il regarde tout simplement quelles sont les lignes de code qui sont executées lorsqu'on lance les tests. Celles qui sont executées sont couvertes par les tests, les autres ne le sont pas.

#### Installer le code coverage

Pour installer le code coverage, nous allons devoir éditer le schéma de notre application (*scheme* en anglais).

Pour cela, cliquez sur le nom de l'application en haut à gauche.

===> IMAGE(P2/P2C6_1.png) LEGENDE() <===

Dans le menu déroulant qui s'affiche, cliquez sur `Edit Scheme...`.

===> IMAGE(P2/P2C6_2.png) LEGENDE() <===

Une popup apparaît et vous présente le schéma :

===> IMAGE(P2/P2C6_3.png) LEGENDE() <===

> **:question:**, Mais c'est quoi ce schéma ?

Ne vous inquiétez pas, je vais en parler. Un schéma, c'est la séquence des actions que peut subir votre code. Il y en a 6 qui sont données sur la gauche de la popup. Pour l'instant, vous en connaissez 3 :
- *Build* : compile votre code (<kbd>cmd + b</kbd>).
- *Run* : exécute votre code, une fois celui-ci compilé (<kbd>cmd + r</kbd>).
- *Test* : lance vos tests (<kbd>cmd + u</kbd>).

> **:information_source:** Chacune de ces actions peut être paramétrée comme vous le voyiez ici. Plus tard, vous aurez peut-être besoin de modifier votre schéma ou d'en créer d'autres.

Pour l'instant, nous allons cliquer sur la phase de Test (comme la flèche rouge l'indique). Et dans cette interface, nous allons cocher la case `Gather coverage data`. Puis vous pouvez cliquer sur `Close`.

===> IMAGE(P2/P2C6_4.png) LEGENDE() <===

Maintenant, lorsque vous allez lancer vos tests, Xcode va collecter les données de couverture et vous donnez les lignes de code qui ont été executées pendant les tests.

#### Inspecter la couverture de code  
Pour inspecter la couverture du code, il vous faut commencer par lancer les tests (rappel : <kbd>cmd + u</kbd>).

Une fois que vos tests ont réussi, vous pouvez aller dans le navigateur de tests :

===> IMAGE(P2/P2C6_5.png) LEGENDE() <===

> **:information_source:** Le navigateur de test vous permet de visualiser tous les tests de votre application, organisés par classe. Vous pouvez d'ailleurs, lancer les tests depuis cette interface en cliquant sur le bouton play sur la droite de chaque test, classe ou target.

Dans le navigateur, vous pouvez faire un clic droit sur n'importe quel test et choisir `Jump to Report`.

===> IMAGE(P2/P2C6_6.png) LEGENDE() <===

Vous arrivez sur la page de rapport des tests, vous pouvez voir tous les tests, s'ils ont réussi ou non, les trier selon certains critères. Mais l'onglet qui nous intéresse ici, c'est l'onglet `Coverage`.

===> IMAGE(P2/P2C6_7.png) LEGENDE() <===

Dans cet onglet, vous pouvez voir la couverture en pourcentage de chaque fichier, et même de chaque fonction. Ainsi vous pouvez visualiser très simplement où vos tests ne passent pas.

===> IMAGE(P2/P2C6_8.png) LEGENDE() <===

Et comme vous pouvez le voir, nos classes `Game` et `Set` sont testées à 100% ! Nous avons fait du bon travail ! Pour avoir plus de détail, vous pouvez afficher le fichier `Game.swift` et les informations de coverage sont maintenant disponibles à droite du fichier.

===> IMAGE(P2/P2C6_9.png) LEGENDE() <===

> **:information_source:** Les nombres indiquent le nombre de fois où la ligne a été exécutée pendant les tests.

En revanche, si on prend le fichier `Match.swift`, il contient plein de trous !

===> IMAGE(P2/P2C6_10.png) LEGENDE() <===

Toutes les lignes rouges sur la droite avec un zéro ne sont pas testées ! Nous allons y remédier.

#### La grande question
Juste avant de boucher les trous, je voudrais aborder la grande question de la couverture des tests :

> **:question:** Quel pourcentage de couverture dois-je atteindre ? 100% ? 90% ? 50% ?

Et la réponse est : **ce n'est pas une question de pourcentage, mais de stratégie**.

Par exemple, lorsque vous travaillez avec un modèle MVC, je vous suggère de faire du 100% de couverture pour votre modèle. Le reste est trop difficile à tester, comme nous en avons déjà parlé. Donc sur le total, je n'ai aucune idée du pourcentage de couverture que cela va donner pour votre code.

> **:information_source:** Dans d'autres architectures plus avancées, vous allez pouvoir approcher les 100% de couverture. C'est la limite du modèle MVC.

L'essentiel, c'est de choisir une stratégie et de s'y tenir ! Le pourcentage n'importe pas. C'est juste un outil.

#### Bouchez les trous

> **:question:** Allez on bouche les trous ! Il me faut 100% sur la classe `Match` !

Je suis ravi que vous soyez aussi enthousiastes ! Mais attention, ce n'est pas parce qu'on a appris à inspecter la couverture en tests de notre code qu'il faut oublier ce qu'on a appris avant !

**On teste en s'intéressant toujours uniquement à l'interface de notre classe, on ne s'occupe pas des méthodes privées**. La couverture est un outil qu'on utilise après avoir rédigé les tests, mais pas avant. Les tests ne doivent pas être motivés par la couverture, mais par les usages de la classe. La couverture n'intervient qu'à la fin en vérification.

En résumé, on est pas là pour boucher des trous, mais pour vérifier que notre classe fait bien ce qu'on lui demande !

Donc la première chose à faire, c'est de regarder l'interface de notre classe `Match` !

===> IMAGE(P2/P2C6_11.png) LEGENDE() <===

À partir de cette interface, nous pouvons déduire qu'il y a 4 propriétés calculées à tester `winner`, `isOver`, `scores`, `currentGame` et une méthode `pointEnded(wonBy player: Player).`

C'est cette trame qui va vous permettre de faire vos premiers tests. Ensuite on peut anticiper que la méthode `pointEnded` est assez grosse, donc il va falloir peut-être créer plusieurs tests pour la couvrir complètement. En effet, on ne va pas traiter un point lambda de la même manière qu'une balle de jeu, de set ou de match !

#### Exercice

Testez intégralement la classe `Match`. Partez de la trame que nous venons de définir et atteignez une couverture à 100% de la classe.

> **:warning:** Au fur et à mesure de l'écriture de vos tests, certains seront peut-être redondant. N'hésitez pas à en supprimer !

**Pensez à factoriser dès que vous constater une répétition dans votre code !** Vos tests doivent toujours rester lisibles !

Une fois l'exercice terminé, vous pouvez consulter la correction [ici](https://s3-eu-west-1.amazonaws.com/static.oc-static.com/prod/courses/files/Parcours+DA+iOS/Cours+6+-+Tests/MatchTestCase.swift).

#### En résumé
- Vous pouvez installer le *code coverage* en éditant le schéma de votre application dans la phase de test.
- Le *code coverage* permet de visualiser les zones de votre code qui ne sont pas couvertes par un test.
- Il ne faut pas chercher à atteindre les 100% de couverture à tout prix ! Il faut surtout choisir une stratégie de test et s'y tenir ! Le *code coverage* est un outil bien pratique, mais pas une direction à suivre !
- **Les tests ne doivent pas être motivés par la couverture, mais par les usages de la classe.**

Dans la prochaine partie, nous allons repenser intégralement votre approche de la programmation. Vous allez à apprendre à rédiger du code infaillible ! Et je n'exagère même pas. J'espère que vous aussi hâte que moi d'y être ! À tout de suite !

## Rédigez les tests avant le code

### Découvrez le Test Driven Development
Dans la partie précédente, vous avez découvert les tests et admettons-le : ça a un peu changé votre vie ! Désormais, vous avez un outil qui vous permet de vérifier que le code que vous avez écrit est correct. Et ça, c'est puissant !

Mais nous pouvons faire encore mieux. Et si nous étions sûrs que notre code fonctionne sans bug au moment même ou est en train de l'écrire ? Ça vous paraît être de la science-fiction ?
Et non je suis très sérieux, et c'est même assez simple.

Si les tests nous assurent que notre code est correct, et qu'on veut pouvoir que tout nouveau code fonctionne avec certitude dès son écriture, c'est qu'il faut rédiger les tests...

> **:question:** AVANT LE CODE ??!!!!

Eh oui ! Que vous êtes bons ! Ne faites pas cette tête-là pour autant et laissez-moi vous expliquer.

#### Comment ça marche

Rédigez les tests avant le code, on appelle ça du *Test Driven Development*, souvent abrégé TDD (Développement motivé par les tests en français).  

> **:question:** Comment ça marche ?

Prenons un exemple : vous travaillez sur une application de rappels. Votre boss vient vous voir et vous demande de rajouter une fonctionnalité. Il veut que l'on puisse supprimer un rappel.

Voyons comme réagissent un développeur normal et un développeur en TDD :

##### En développement normal
Vous vous exécutez immédiatement et créez la fonctionnalité désirée. Une fois que vous vous êtes assurés manuellement que ça fonctionne, vous écrivez le ou les tests correspondants, car vous êtes un bon développeur qui teste son code.

##### En TDD
Vous écrivez immédiatement un test qui contrôle que la suppression d'une note se passe bien. Forcément le test échoue, car vous n'avez même pas créé la fonction correspondante. Donc vous n'avez plus qu'une idée en tête : réparer le test. Pour cela, vous développer la fonctionnalité demandée par votre boss. Et sans aucun test manuel, vous savez qu'elle fonctionne, car votre test est passé au vert !

===> IMAGE(P3/P3C1_1.png) LEGENDE() <===

#### L'intérêt
Quel est l'intérêt de cette technique ? Il y a plusieurs bonnes raisons de faire du TDD et je vais essayer de vous en proposer quelques-unes :

##### Penser à ce que le code doit faire 🤔
En rédigeant d'abord votre test, vous êtes contraint de réfléchir à ce que vous voulez que votre code fasse avant de le rédiger. Vous avez une idée claire du résultat à obtenir, ce qui va vous faire gagner du temps.

##### Travailler dans un environnement de code sain 🍀
Lorsque vous développez en TDD, vos tests sont constamment présents et à jour. Donc vous évoluez dans votre code avec confiance, car vous savez que si vous causez le moindre bug, un test vous le dira avant même que vous vous en rendiez compte.

##### Être concentré 👩‍💻
Il est facile de se disperser lorsqu'on développe. Il y a souvent beaucoup de choses à faire et on peut s'éparpiller ce qui peut causer au mieux une perte de temps et de la fatigue et au pire des bugs !

Lorsque vous développez en TDD, vous rédigez un seul test qui échoue et ensuite vous le fixez en développant la fonctionnalité correspondante. Donc vous faites une seule chose à la fois.

Si vous commencez à vous disperser, vos tests vous le diront, ils deviendront rouges les uns après les autres. Et votre cerveau est câblé pour ne pas aimer le rouge donc vous allez vous concentrer pour réparer ce petit test rouge et ne pas en créer d'autres. Et ensuite seulement, vous aurez envie de passer au reste.

##### Validation automatique de votre code ✅
Lorsque vous développez votre fonctionnalité, vous n'avez même pas à tester manuellement. Vos tests s'en occupent automatiquement pour vous !
Pas de validation manuelle à faire.

##### Les tests sont importants ⚠️
Votre cerveau a l'habitude de considérer comme plus important ce qui vient en premier. Vous êtes faits comme ça. Donc en écrivant vos tests en premier, vous leur donnez une vraie valeur. Et cela vous assure qu'ils seront toujours de qualité.

> **:question:** Mais du coup le reste du code va perdre en qualité ?

Bien sûr que non, vous ne risquez pas de délaisser le reste du code ou même de ne pas le développer, car cela impactera directement votre app et donc vos clients, vos utilisateurs, votre boss et donc en définitive vous ! Ce n'est pas vrai pour les tests, il y a un risque que vous les oubliiez et ils sont trop importants pour ça ! Alors, faites-les en premier !

#### En résumé
- Le Test Driven Development (TDD) est une technique de développement très puissante dans laquelle *on écrit les tests avant le code*.
- Concrètement on écrit un test qui échoue, puis on écrit le code correspondant, ce qui répare le test.
- Les intérêts du TDD sont :
	- Penser à ce que l'on fait
	- Travailler dans un environnement de code sain
	- Être concentré
	- La validation automatique du code
	- Ne pas oublier les tests

Dans le prochain chapitre, nous allons apprendre la méthode "Red, Green, Refactor" qui nous permet de travailler en Test Driven Development.

### Appréhendez la méthodologie Red Green Refactor
Maintenant que vous savez ce qu'est le Test Driven Development, nous allons pouvoir parler de la méthodologie à appliquer pour faire proprement du TDD.

#### Présentation de la méthode
Cette méthode s'appelle "*Red, Green, Refactor*" et elle est composée de 3 étapes que l'on va répéter inlassablement !

===> IMAGE(P3/P3C2_1.png) LEGENDE() <===

##### Red
La première étape, c'est la **rédaction d'un test**. Le code correspondant n'existe pas encore donc **ce test va échouer** et donc rester rouge...

##### Green
La seconde étape, c'est **l'écriture du code**. Dans cette étape, on ne se concentre que sur une seule chose : faire passer notre test.

Peu importe le style du code, s'il y a un peu de répétitions ou si ce n'est pas parfait, votre seul objectif à cette étape, c'est de **faire passer le test au vert**.

##### Refactor
Pendant cette dernière étape, on **refactorise notre code et nos tests**. L'objectif ici est d'avoir un oeil attentif aux améliorations que nous pouvons faire. Est-ce qu'il y a du code dupliqué ? Est-ce que ma classe a bien une seule responsabilité ? Est-ce que ma méthode fait bien ce que son nom indique qu'elle fait ?

C'est l'occasion d'améliorer la qualité de votre code !

#### Faites des petits pas !
Avec cette méthode, vous allez donc parcourir un cycle. Dès que vous atteignez la dernière étape, vous revenez à la première.

Ce cycle, il doit être très court. En gros, une fois que vous maîtrisez la méthode, vous ne devriez pas mettre plus de 5 minutes à parcourir le cycle !

> **:question:** 5 minutes ?! Mais on ne peut rien coder en cinq minutes !

Si ;) ! Vous pouvez coder des toutes petites choses. Et c'est justement le but de la méthode, chaque cycle représente un tout petit pas. Souvent, votre premier cycle sera d'écrire un test qui contrôler l'existence d'une classe puis vous créerez la classe.

**L'idée c'est d'écrire le test qui vous permet de rédiger le minimum de code possible !**

> **:question:** Mais c'est ridicule ! On n'a pas besoin d'un test pour simplement créer une classe.

C'est sûr que ça parait un peu bizarre au début mais vous vous y ferez vous verrez ! L'avantage de faire des tout petits pas, c'est que le risque d'erreur est quasi inexistant et vous avancez du coup toujours en étant couvert.

> **:warning:** C'est comme si vous escaladiez une paroi et que toutes les 5 minutes, vous installiez un filet derrière vous. Vous ne risquez pas de chuter de bien haut ! Il vaut mieux ça qu'un filet installé toutes les 2 heures !

> **:question:** OK mais si je fais des tests toutes les 5 minutes pour tester des tout petits trucs, je vais avoir des tonnes de tests !

Eh non ! Car il y a la troisième étape : *refactor*. Cette étape sert aussi à refactoriser vos tests. Au fur et à mesure, certains vont devenir inutiles. Par exemple, le test qui permet de tester l'existence de votre classe va vite être inutile, car vous allez utiliser la classe dans d'autres tests, donc ces autres tests confirment que la classe existe.

Autrement dit, votre suite de tests va évoluer en continu, mais à chaque instant, elle reflète exactement ce que fait votre code !

#### Avantages
Pour finir de vous convaincre du bien-fondé de cette méthode, je vous propose de vous donner deux avantages de la méthode :

##### Vous n'êtes pas parfait !
Il faut l'admettre, dans une grande majorité des cas, le code que vous écrivez en premier n'est pas parfait. Il mérite d'être revu, corrigé, réorganisé. En même temps, personne ne joue un morceau de guitare parfaitement du premier coup ou n'écrit un roman d'une traite. En développement, c'est pareil.

Le problème, c'est que les développeurs n'ont pas toujours en tête de revenir sur leur code pour l'améliorer. Or c'est essentiel, car vous allez vivre avec votre code ! En suivant cette méthode, vous vous donnez une occasion de le refactoriser toutes les 5 minutes ! Vos chances d'écrire du code de qualité sont largement démultipliées !

> **:information_source:** C'est un peu comme la vaisselle, personne n'aime la faire et pourtant il le faut. Avec cette méthode, vous faites la vaisselle dès que vous avez sali une cuillère. Votre cuisine reste toujours propre !

##### Refactoriser dans le vert
La refactorisation arrive après l'étape *green*. Tous les tests passent ! Avec cette méthode, vous ne refactorisez que dans un code testé et fonctionnel. Donc au moindre problème causé par la refactorisation, vos tests vous alerteront. Vous repasserez à l'étape *red* et n'aurez plus qu'à dérouler tranquillement : *green*, puis *refactor* !

**Cette méthode vous apprend à ne refactoriser que *de vert à vert***.

#### En résumé
- La méthode *Red, Green, Refactor* se compose de trois étapes :
	- *Red* : On écrit un test qui échoue.
	- *Green* : On résout le test en écrivant le code correspondant.
	- *Refactor* : On refactorise le code ET les tests.
- Le cycle *Red, Green, Refactor* doit être le plus court possible. L'objectif est de rédiger le minimum de code possible à chaque cycle.

La méthode *Red, Green, Refactor*, est un peu plus qu'une méthode, c'est une tout autre manière de développer et je vous garantis que vous allez adorer ! Dans le prochain chapitre, nous allons utiliser cette méthode pour rajouter une fonctionnalité à notre application : le *tie break* !

### Ajoutez une fonctionnalité en TDD
Il est grand temps de laisser la théorie de côté ! Je vous ai suffisamment parlé du Test Driven Development pour que vous rêviez de vous y frotter !

Et c'est précisément ce que nous allons faire dans ce chapitre !

#### Présentation de la nouvelle fonctionnalité
Les tennismen l'auront sans doute remarqué, notre façon de compter les scores n'est pas correcte. Ou plutôt, elle est incomplète ! Nous n'avons pas prévu le ***Tie Break***.

Au Tennis, gagner 6 jeux n'est pas suffisant pour remporter le set. Il faut aussi deux jeux d'écarts. Donc si on mène 6-4 le set est gagné, mais si on gagne 6-5, le set n'est pas terminé et il y a deux cas de figure :
- Le joueur 1 gagne et on passe à 7-5. Le set est remporté par le joueur 1.
- Le joueur 2 gagne et on pase à 6-6. Dans ce cas, on va jouer un ultime jeu pour départager les deux joueurs. Et ce jeu, on l'appelle le *Tie Break*.

Les règles du *Tie Break* sont différentes d'un jeu classique. Chaque balle jouée vaut un point. Le premier arrivé à 7 avec deux points d'écart gagne le jeu. S'il n'y a pas deux points d'écart, le jeu peut continuer jusqu'à ce que mort s'ensuive !

Je vous propose d'implémenter cette nouvelle fonctionnalité en TDD en suivant la méthodologie *Red, Green, Refactor*.

#### Place à la vidéo !

Exceptionnellement, la suite de ce chapitre n'est pas retranscrite textuellement. À la place, je vous propose une démonstration de live coding dans lequel vous me verrez développer la nouvelle fonctionnalité de A à Z en Test Driven Development !

> **:information_source:** Le texte de cette vidéo serait bien trop long et ce format ne s'adapte pas du tout à ce genre de démonstration live. Par ailleurs, si vous n'avez jamais vu un t-shirt changer de couleur, c'est à ne pas rater !

[VIDEO LIVE CODING]

#### En résumé
J'espère que vous avez apprécié cette démonstration et qu'elle vous a convaincu de la puissance du Test Driven Development ! Souvenez-vous de bien répéter le cycle *Red Green Refactor* sans oublier aucune étape. À chaque fois, l'objectif est de trouver le plus petit test possible qui permet d'avancer.

C'est un gros changement dans la façon de développer. N'hésitez pas à pratiquer le Test Driven Development le plus possible et vous finirez par vous demander comment vous faisiez avant !

### Exprimez vos objections
Les tests en général et le TDD en particulier ont tendance à bousculer un peu les développeurs au début. On n'en comprend pas vraiment la puissance avant de s'y être frotté pendant un petit moment. Résultat, cela laisse place à quelques objections que vous avez sûrement envie de formuler !

Ici, je me propose de répondre aux doutes que vous avez peut-être ressentis à la découverte des tests. Alors, allez-y shootez vos meilleures questions !

===> IMAGE(P3/P3C4_1.jpg) LEGENDE() <===

#### Un petit jeu de question-réponse
> **:question:** Les tests ralentissent le développement, car ça fait plus de code à rédiger.

Oui si vous n'allez travailler qu'une heure sur ce projet...

Ensuite, les tests vous font gagner beaucoup de temps. **Vous allez diminuer drastiquement le temps passé à chercher les bugs** d'une part. D'autre part, vous travaillerez toujours sur du code propre grâce à la refactorisation que l’on peut faire sans risque. Donc **le code est plus facile à lire** et comme vous le savez maintenant, la majorité du travail de développeur consiste à lire du code. Donc votre code étant plus facile à lire, le développement est plus rapide.

> **:question:** Oui mais refactoriser c’est retravailler, ce ne serait pas mieux d’avoir le code correct du premier coup ?

Prévenez-moi quand vous savez comment on fait ça. Mais je pense que ce n’est pas possible ! **Rédiger du code est un processus créatif. Et comme tout processus créatif, on a jamais l'oeuvre parfaite du premier coup.** Un peintre fais des esquisses avant de se lancer dans son oeuvre, un musicien répète ses musiques avant de les jouer parfaitement, un journaliste fais des brouillons avant de publier son article.

Le code est simplement soumis à la même règle, donc si vous souhaitez produire du code de qualité, vous devez refactoriser !

> **:question:** Les tests testent le code en production. Mais les tests sont aussi du code. Alors qui teste les tests ?

En voilà une bonne question ! Les tests et le code en production sont imbriqués étroitement. **Et donc ce qui teste les tests, c'est le code en production.**

C'est comme un château de cartes, certaines penchent vers la droite, c'est le code, d'autres vers la gauche, c'est le test. Chaque carte de test soutient une carte de code et inversement.

===> IMAGE(P3/P3C4_2.jpg) LEGENDE() <===

> **:question:** Je suis d'accord que les tests prouvent la présence de bugs quand ils sont rouges. Mais en revanche, une suite de test toute verte ne prouve pas l'absence de bug.

En effet, mais ce n’est pas notre but et d’ailleurs ce n’est pas faisable. On ne fait que créer un parachute pour ne pas avoir peur de changer le code. Et comme avec un parachute, il peut y avoir des accidents. Mais si cela permet d’avoir 99% de chance de ne pas en avoir, ça vaut le coup d’en avoir un sur le dos, non ?

> **:question:** Le TDD incite les gens à suivent des règles, mais pas à réfléchir.

Le TDD, c’est une discipline. La discipline permet dans le feu de l’action de gagner du temps en éliminant le besoin de prendre certaines décisions. Pour autant, il faut toujours prendre du recul pour analyser ce que l’on est en train de faire, si le code est efficace et clair et parfois même il faut savoir remettre en question la discipline. Donc oui, **le TDD vous permet d’éviter de réfléchir pour vous concentrer sur ce qui importe : l'architecture de votre code.**

> **:question:** Si on doit travailler avec un gros paquet de code qui n’est pas testé, comment fait-on ?

Bonne question ! Le problème, c’est que pour tester, il faut que le code soit bien organisé, découplé et testable. Et si ce n’est pas le cas, il faut refactoriser. Mais sans tests, on ne sait pas si notre refactorisation ne va pas casser quelque chose Donc pour tester, il faut refactoriser et pour refactoriser, il faut des tests. Quelle est la solution de ce problème ?

**Il faut trouver une partie du code que l’on peut tester sans changer trop de choses.** Ensuite, on utilise ces tests comme garant pour commencer une refactorisation qui va nous permettre de créer de nouveaux tests et en suivant cette logique on peut étendre la couverture de tests à toute la base de code. Idéalement, il faudrait commencer à tester au moment de rajouter une nouvelle fonctionnalité, comme ça on est sûr de ne rien casser et au fur et à mesure, on étend les tests.

> **:question:** On ne peut pas tester l’interface utilisateur !

En effet, il est difficile de tester l’interface utilisateur. Par exemple, on ne peut pas facilement tester qu’un bouton soit rouge ou vert. En revanche, on peut tester que le booléen qui décide de la couleur du bouton a la bonne valeur.

Pour cela, **il faut séparer la logique de l’affichage de l’affichage en lui-même**. Dans notre exemple, la logique qui donne la valeur au booléen ne doit pas avoir lieu dans la même classe que celle qui donne la couleur au bouton. En MVC, tout se fait dans le contrôleur donc on est coincé mais je vous invite à aller jeter un oeil à d’autres architectures comme le [MVVM](https://medium.com/yay-its-erica/dabbling-with-mvvm-in-swift-3-3bbeba61b45b), [VIPER](https://www.objc.io/issues/13-architecture/viper/) ou [Clean](https://clean-swift.com).

> **:question:** Mais tester, c’est difficile ! On est des programmeurs, pas des testeurs.

**Vous êtes avant tout des programmeurs professionnels et si vous ne faites pas de tests, c’est que vous ne l’êtes pas.** C’est un parti pris fort alors laissez-moi vous expliquer en détail les raisons qui le motive.

Un logiciel est un système extrêmement sensible. Je peux modifier une ligne de code au bon endroit et causer le crash de toute l'application. Il existe très peu de systèmes aussi sensibles. Si j'enlève un clou dans une maison, elle ne va pas s'effondrer. Si je tue une de vos cellules, vous n'allez pas mourir.

Il existe pourtant un système aussi sensible : la comptabilité. Une erreur de compatibilité peut causer la ruine d'une entreprise et mettre ses dirigeants en prison. Seulement cette science est bien plus âgée que l'informatique et donc elle a eu le temps de résoudre son problème d'hyper sensibilité.

===> IMAGE(P3/P3C4_3.jpg) LEGENDE(Les joies de la comptabilité !) <===

Il y a 700 ans a été inventée la comptabilité à double entrée. En comptabilité à double entrée, tout est entré deux fois, du côté de l'actif et du côté du passif. L'actif et le passif suivent des logiques mathématiques très différentes. Mais à la fin, les deux valeurs du passif et de l'actif doivent être égales. Si elles ne le sont pas, il y a une erreur. Ce système permet donc de détecter les erreurs extrêmement rapidement avec une très grande certitude.

En programmation, ce sont les tests et le code qui forment une double entrée. Les deux ensemblent permettent de détecter très rapidement les erreurs et d'assurer la solidité globale du système.

Aucun comptable ne se passe de la double entrée. Est-ce que les programmeurs doivent être moins professionnels que les comptables ? Est-ce que leurs erreurs ont moins d’impacts sur l’entreprise ? Je pense que la réponse est non dans les deux cas.

Qui plus est, les comptables rentrent les données du côté de l’actif et du passif en même temps. C’est exactement ce que nous faisons en TDD.

#### En résumé
Quand vous partagez votre code à votre client ou à votre boss, vous devez être sûres de vous. Imaginez un cuisinier qui envoie son plat sans être sûr de l’avoir assaisonné correctement. Ce ne serait pas professionnel. Si le client trouve un bug, c’est que vous avez fait une erreur. Ça peut arriver mais ça doit être rare et l’occasion pour vous de remettre en question une partie de vos pratiques.

### Conclusion
Félicitations, si vous en êtes arrivés jusque là, c'est que vous avez compris l'importance du débogage et des tests unitaires !

Je vous avais promis un cours qui vous permettent de gagner en **autonomie** et d'apprendre à **rédiger du code propre** ! Et vous pouvez vous féliciter d'avoir fait un grand pas vers ces deux qualités essentielles pour devenir un excellent développeur !

#### En résumé
Dans ce cours, vous avez appris à **identifier et éliminer tout type de bugs**. Vous êtes maintenant capable de résoudre des erreurs à la compilation, à l'exécution et des erreurs métiers. En chemin, nous avons parlé de notions fondamentales de la programmation en général comme la pile d'exécution ou la compilation.
Vous avez également saisi l'importance d'une syntaxe uniforme et vous savez désormais utiliser SwiftLint pour automatiser l'analyse statique de votre code.

Ensuite, nous nous sommes attaqués aux **tests unitaires**. Vous avez appris à définir une stratégie de test et à organiser votre code pour le rendre testable. Nous nous sommes entraînés à rédiger des tests et au-delà de la technique, j'espère surtout que vous en avez compris l'intérêt.

Puis, vous vous êtes essayés au **Test Driven Development**. Si cette technique n'est pas encore naturelle pour vous, c'est normal ! Le TDD réinvente complètement votre façon d'approcher la programmation et forcément au début ce n'est pas agréable. Mais j'espère vous avoir convaincu de ses bienfaits !

> **:information_source:** Dans les prochaines semaines, astreignez-vous à programmer en TDD. Rapidement, vous serez plus à l'aise et ça deviendra beaucoup plus naturel.

#### Soignez vos tests
Je vous l'ai déjà dit mais je ne le dirais jamais assez : **vos tests vont vous faire gagner un temps fou.** Mais pour cela, il faut que vous ayez une confiance aveugle en eux. Et vous ne l'aurez qu'à condition de les traiter au moins aussi bien que le reste de votre code. Ce sont les deux parties de votre projet, alors elles doivent être aussi solides l'une que l'autre. Alors, réorganisez-les, factorisez-les si besoin, pensez votre structure de fichier. Bref, **soignez vos tests** !

#### Le mot de la fin
J'espère que vous avez eu autant de plaisir à suivre ce cours que moi à le concocter :) . Je considère que c'est l'un des plus importants si vous souhaitez devenir développeur iOS. Donc n'hésitez pas y revenir pour une piqûre de rappel autant que nécessaire.

En attendant, je n'ai plus qu'à vous laisser avec le mot de la fin, et le mot de la fin évidemment c'est :

===> IMAGE(P3/P3C5_1.jpg) LEGENDE() <===
