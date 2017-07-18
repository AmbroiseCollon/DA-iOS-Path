## Concevez une interface responsive  

### Découvrez UIView
Notre modèle est désormais tout beau tout propre ! Mais notre application semble toujours vierge lorsqu'on la lance ! Rassurez vous, dans cette partie, nous allons nous occuper de la vue !

![](Images/P3/P3C1_1.png)

Pour la remplir, il nous faut savoir quoi mettre de dedans. Et dedans, nous allons mettre exclusivement des `UIView` ! Vous ne savez pas que c'est ? Vous ne pourrez plus le dire à la fin de chapitre !

#### Qu'est-ce que UIView ?
`UIView`, c'est la classe qui permet de définir une **vue**.

> **:question:** Et une vue, c'est quoi ?

Une vue, c'est une **zone rectangulaire** qui a deux mission :
- **Afficher des choses**
- **Répondre à des gestes**

Donc comme vous pouvez le constater, c'est très générique ! Ça n'a pas l'air bien puissant comme ça. Mais sachez que **tout ce que vous voyez** à l'écran dans n'importe quel page de n'importe qu'elle application iOS **est une instance d'`UIView`**.

> **:question:** Mais les boutons, les images ce sont des UIView `aussi` ?

Et oui ! Et ce, grâce à l'héritage. Prenons l'exemple d'un bouton. Les boutons en iOS sont définis avec une classe qui s'appelle `UIButton`. Cette classe comme toute celle que je vais vous présenter dans le prochain chapitre **hérite** de `UIView`. Donc elles disposent toutes de la logique présentent dans `UIView`, notamment le placement, l'affichage et la réponse aux gestes. Donc un indirectement, un bouton c'est une `UIView`.

#### La hiérarchie des vues
Comme les dossiers sur votre ordinateur, les vues ont une **hiérarchie** (on parle en anglais de *view hierarchy*). Cela veut dire qu'une vue, c'est comme un dossier. Elle peut contenir d'autres vues et elle peut-elle même être contenue dans une vue parente.

##### Exemple
Le meilleur moyen de bien comprendre ça, c'est d'essayer ! Ouvrez votre fichier `Main.storyboard`. Nous allons jouer un peu avec *interface builder*. Dans la bibliothèque des composants, choisissez l'objet `UIView` et glissez en quelques-uns dans votre interface.

> **:information_source:** Vous pouvez filtrer en tapant `UIView` dans le champ de texte en bas de la bibliothèque des composants.

De mon côté, j'ai composé mon interface comme ceci :

![](Images/P3/P3C1_2.png)

J'ai plusieurs vues qui sont les unes à côté des autres ou **les unes dans les autres**. Sur la gauche, vous pouvez voir la hiérarchie des vues. Je vous la montre ici également :

![](Images/P3/P3C1_3.png)

On a donc une vue principale qui a 4 sous vues :
- La vue verte n'a pas de sous-vue
- La vue rouge a 2 sous-vues blanche
- La vue bleu claire a une sous-vue blanche
- La vue bleu foncée a une sous-vue grise qui a elle-même une sous-vue blanche

En glissant les vues les unes dans les autres, vous créez votre hiérarchie. Pour des interfaces complexes qui peuvent compter une vingtaine de vues différentes, il est important de bien organiser votre hiérarchie pour vous y retrouvez !

##### La vue principale
Vous avez noté dans l'exemple précédent que notre interface contenait déjà une vue : la grand rectangle blanc vertical.

En iOS, une page d'une application corresponds (presque) toujours à un `UIViewController`. Cette classe (que nous verrons en détail dans la prochaine partie) a une propriété `var view: UIView` qui constitue la vue principale de votre interface. Cela veut dire que **toutes les vues que vous allez rajouter sont des descendantes de la vue principale de votre contrôleur**. Elles sont toutes contenues dedans. C'est la racine de votre hiérarchie de vues.

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

Prenons un exemple pour les méthodes, mettons que j'ai une vue `myView` et un bouton `myButton`. Si je veux que le bouton soit inclu dans la vue, je fais ceci :
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
> **:warning:** Dans toute cette section sur la hiérarchie, ne faîtes pas la confusion avec l'héritage ! Ici, il s'agit juste de savoir **quelle vue est inclus dans quelle vue** et non qui hérite de qui.

#### En résumé
- Une `UIView` est une **zone rectangulaire** qui permet d'afficher des choses et de répondre à des gestes.
- Tous les composants d'une interface héritent de la classe `UIView`.
- Les vues dans une interface sont organisés selon une hiérarchie comme des dossiers. En particulier une vue peut avoir une vue parente et des sous-vues. Dans le code, on manipule la hiérarchie avec les propriétés et méthodes de UIView suivantes :
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

> **:information_source:** J'ai créé pour vous une application qui va vous permettre de jouer un peu avec le système de coordonnée. Je vous invite à [télécharger le code](https://github.com/AmbroiseCollon/UIView-Coordinate-System) et à lancer l'application sur votre simulateur ou iPhone.

###### La position
Une position sur un écran, ça nécessite deux valeurs :
- x : représente la position **horizontale**
- y : représenta la position **verticale**

L'origine se situe en haut à gauche. Donc cela veut dire que :
- x augmente quand on va **vers la droite**
- y augmente quand **on descends**

![](Images/P3/P3C2_1.png)

Il faut savoir que quand on parle de la position d'une vue, on parle de **la position de son point supérieur gauche**.

![](Images/P3/P3C2_2.png)

> **:information_source:** Sur l'application que vous avez téléchargée, vous pouvez déplacer le rectangle bleu et voir évoluer les valeurs `x` et `y`.

###### La taille
Pour décrire la taille d'une vue, comme c'est une zone rectangulaire, on a à nouveau deux valeurs :
- la **largeur** (en anglais *width*)
- la **hauteur** (en anglais *height*)

![](Images/P3/P3C2_3.png)

#### Frame et bounds
En tout, il faut donc 4 valeurs pour décrire précisément l'espace qu'occupe une vue :
- x
- y
- largeur
- hauteur

Ces quatres informations sont disponibles dans une propriété de `UIView` qui s'appelle `frame`. Cette propriété décrit donc **l'espace occupé par une vue par rapport à la vue parente**.

Donc les valeurs `x` et `y` indiquent **la position par rapport au coin supérieur gauche de la vue parente** et donc pas forcément par rapport au coin supérieur gauche de l'écran. C'est le cas dans l'application que vous avez téléchargée.

`UIView` a une seconde propriété : `bounds`. Cette propriété contient 4 informations aussi : x, y, largeur et hauteur. Mais elle décrit **l'espace occupé par la vue par rapport à elle-même**. Cela signifie que `x` et `y` vaudront toujours `0` pour cette propriété.

On utilise `frame` lorsqu'on s'intéresse au placement de **soi-même dans la vue parente**.
On utilise `bounds` lorsqu'on s'intéresse au placement de **ses sous-vues**.

Aussi, les propriétés `frame` et `bounds` n'ont pas forcément la même taille. Vous pouvez essayer de faire tourner le rectangle dans l'app téléchargée et vous verrez que lors de la rotation la taille décrite par `bounds` ne change pas. Mais `frame` doit grandir pour trouver le plus petit rectangle qui contient la vue.

![](Images/P3/P3C2_4.png)

> **:information_source:** En pratique, vos vues seront rarement en rotation. Mais cela doit vous rappeler de ne pas confondre `bounds` et `frame`, le premier regarde à l'intérieur, l'autre à l'extérieur.

#### Les structures de données
Les coordonnées en iOS s'appuient sur 4 types différents : `CGFloat`, `CGPoint`, `CGSize`, `CGRect`.

> **:information_source:** Le préfixe CG veut dire *Core Graphics*.

`CGFloat` est un type qui a été introduit pour gérer aussi bien les appareils 32 bits et 64 bits. En pratique, tout ce que vous avez besoin de savoir c'est qu'il décrit un **nombre décimal** et que c'est ce type et non `Float` ou `Double` que vous devez utiliser lorsque vous travailler sur le placement d'une vue.

Vous pouvez convertir un `Double` ou un `Float` en `CGFloat` comme ceci :
```swift
var unDouble = 100.0
var unCGFloat = CGFloat(unDouble)
```

CGPoint est une structure qui a deux propriété `x` et `y`. Elle décrit donc un point.
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

> **:information_source:** CGRect a un autre initialiseur assez pratique qui prends directement en paramètre les 4 informations nécessaires pour décrire un rectangle :
```swift
var unRectangle = CGRect(x: 12.0, y: 34.0, width: 120.0, height: 200.0)
```

Les propriétés `frame` et `bounds` sont du type `CGRect`.

#### En résumé
- Les vues se placent grâce au système de coordonnées et des 4 informations suivantes `x`, `y`, `width` et `height`. Les x augmentent vers la droite et les y augmente vers la bas.
- Les vues ont une propriété `frame` qui permet de les placer par rapport à la vue parente. Elles ont aussi une propriété `bounds` qui permet de placer les sous-vues.
- Le système de coordonnées est utilisé avec les types `CGFloat`, `CGPoint`, `CGSize` et `CGRect`.

### Organisez les composants de l’interface  
Vous posséder maintenant toutes les connaissances pour que l'on remplisse notre belle application ! C'est ce que nous allons faire dans ce chapitre !

#### Les composants principaux d'iOS
Apple fourni avec le framework *UIKit*, plusieurs composants qui sont prêts à l'emploi. Il y en a qui sont assez simples comme les boutons ou les images et d'autres qui sont plus évolués commes les sélecteurs de date.

> **:information_source:** Comme je suis sympa, je vous ai fait une petite application qui vous présente les principaux composants à votre disposition en iOS. Je vous invite fortement à la [télécharger](https://github.com/AmbroiseCollon/Discovering-UIKit-Components) et à jouer avec, c'est le meilleur moyen de les découvrir !

Vous apprendrez à utiliser la plupart d'entre eux par vous-même au fur et à mesure de votre besoin. Une fois qu'on en a utilisé un ou deux, c'est assez facile. Ici, je vais seulement vous les présenter pour que vous les connaissiez et ayez le réflexe d'aller les utiliser le jour où vous en aurez besoin.

En plus de l'application, je vous ai résumé la liste des composants dans ce tableau :

![](Images/P3/P3C3_1.png)

#### Ajoutez un bouton et un label
Nous allons maintenant créer notre interface ! Nous allons découvrir et utiliser ensemble quatre des principaux composants d'iOS : `UIView`, `UILabel`, `UIButton` et `UIImageView`.
Je vous propose de démarrer par simplement changer la couleur de fond de votre interface avec le bleu foncé de notre palette. Je vous laisse faire ça sans moi.

##### Le bouton
Maintenant nous allons rajouter un bouton. Depuis la bibliothèque des composants, faîtes glisser un bouton au milieu en bas de l'interface.

![](Images/P3/P3C3_1bis.png)

En double-cliquant dessus vous pouvez changer le titre de ce bouton. Et vous allez écrire `New Game`. C'est avec ce bouton que nous allons lancer une nouvelle partie.

> **:information_source:** L'interface de l'application est anglais car la base de données de questions est anglaise. Et ce serait bizarre d'avoir des questions en anglais au milieu d'une interface française. Je suis désolé mais je n'ai pas trouvé de base de données gratuites de questions en français...

Je vous l'invite à redimensionner le bouton pour qu'il ait une taille confortable.

> **:information_source:** Apple suggère une taille minum de 44 * 44 points pour un bouton. Afin que l'on puisse le taper facilement.

Ensuite dans l'**inspecteur d'attribut** sur la droite, vous avez **toutes les propriétés de `UIButton`** que vous pouvez modifier avec *Interface Builder*. Si vous défilez vers le bas, vous avez également toutes les propriétés de `UIView` car `UIButton` hérite, comme on l'a vu, de `UIView`. Dans ces propriétés, je vous propose de passer `Text Color` en blanc. Nous allons également modifier la police avec la propriété `font`. Pour cela suivez les étapes effectuées dans l'image ci-dessous :

![](Images/P3/P3C3_2.gif)

> **:information_source:** A retenir que lorsque vous souhaitez utiliser une police de votre choix, il faut donc choisir *custom*.

Maintenant nous allons changer la couleur de fond du bouton. Et pour cela, nous allons faire comme pour la couleur de fond de la vue principale, les deux sont des `UIView` et donc les deux ont une propriété *background* que vous trouverez en descendant dans l'inspecteur d'attribut. Cette fois ci, je vous suggère de choisir le bleu clair. Votre bouton doit maintenant ressembler à ceci :

![](Images/P3/P3C3_3.png)

#### Le score
Nous allons maintenant afficher le score de la partie en cours. Une partie c'est 10 questions, donc le score aura pour format : *X / 10*.

Pour afficher du texte, nous allons utiliser `UILabel`. Vous pouvez glisser un composant `UILabel` depuis la bibliothèque des composants vers le centre de l'interface. En double-cliquant dessus, vous pouvez modifier le texte et écrire pour le moment "*0 / 10*". Nous allons changer la couleur du texte en blanc grâce à la propriété `color`. Vous pouvez également centrer le contenu de votre texte avec la propriété `alignment`.

Comme pour le bouton, nous allons changer la police avec la propriété *font*. Cette fois-ci, je vous invite à choisir à nouveau *Balham* et 30 pour la taille.

Le label est alors trop petit pour contenir le texte. Nous allons changer sa taille. Pour cela nous allons utiliser l'**inspecteur de taille** sur la droite. Vous l'ouvrez en cliquant en haut à droite sur l'icône en forme de règle.

![](Images/P3/P3C3_4.png)

Dedans, vous retrouvez les quatres propriétés nécessaires au placement d'une vue que nous avons vu dans le chapitre précédent `x`, `y`, `width` et `height`. Vous pouvez choisir :
- x : 37,5
- y : 273
- width : 300
- height : 60

Notre interface commence à ressembler à quelque chose ! :D

![](Images/P3/P3C3_5.png)

#### Ajouter la question
La question va être une vue un peu compliquée, car comme vous pouvez le voir ci-dessous, elle doit contenir un label et une image (l'icone verte ou rouge en bas):

![](Images/P3/P3C3_6.png)

Notre stratégie va être donc de créer d'abord une `UIView` simple **à l'intérieur de laquelle** nous allons rajouter un label et une image.

Commençons par rajouter une `UIView` (vous pouvez en retrouvez l'icône dans le tableau plus haut). Elle va être carré de longueur `245` et avec pour couleur de fond gris. Vous allez le placer au milieu, au dessus du score. Je vous laisse le faire.

![](Images/P3/P3C3_7.png)

Ensuite vous allez glisser à l'intérieur un label. En vous aidant des guides bleus, vous allez l'agrandir pour qu'il prenne toute la place dans la vue grise en laissant pour chaque bord 8 points de marge. Ensuite, vous allez à nouveau changer ses propriétés et cette fois-ci je vous laisse faire :
- *police* : Balham, taille 23
- *couleur* : blanc
- *alignement* : centré

Vous allez également modifier la propriété `lines`. Cette propriété indique **le nombre maximum de lignes** que peut avoir le label. Ce label va contenir les questions et comme cela va changer souvent, on ne connait pas à l'avance le nombre de lignes nécessaires. L'astuce est de choisir `0`. Avec cette valeur, le label décidera automatiquement du nombre de lignes en fonction de la taille du texte. Votre label doit maintenant ressembler à ceci :

![](Images/P3/P3C3_8.png)

Il ne nous reste plus qu'à rajouter l'icône. Pour cela, vous avez deux options :
- soit vous glissez un **composant `UIImageView`** depuis la bibliothèque des **composants** vers l'interface
- soit vous glissez une **image** depuis la bibliothèque des **medias** vers l'interface

Les deux donnent un résultat équivalent : cela rajoute une `UIImageView` sur l'interface. L'avantage de la 2e option, c'est que la `UIImageView` contient déjà l'image de son choix et à la bonne taille.

> **:information_source:** Pour que les images apparaissent dans la bibliothèque des médias, il faut que vous les ayez préalablement rajoutées dans les *assets* de l'application. C'est ce que nous avons fait dans la première partie de ce cours.

Nous allons donc choisir la deuxième option ! Allez dans la bibliothèque des médias en cliquant sur l'icône en forme de pellicule de film :

![](Images/P3/P3C3_9.png)

Et nous allons glisser l'icône verte dans notre vue grise en bas au centre.

Si vous allez maintenant dans l'inspecteur d'attribut, vous verrez que `UIImageView` a une propriété `image` qui prends comme valeur le nom de notre image, en l'occurence *Icon Correct*. Vous pouvez changer le nom en *Icon Error*. Et vous verrez que la `UIImageView` affiche désormais l'icône rouge. Ce qui qu'il faut que vous compreniez ici, c'est que `UIImageView` ce **n'est pas une image** directement, c'est une **vue qui affiche une image** et cette image peut changer à tout moment ! C'est d'ailleurs ce que nous allons faire dans la dernière partie de ce chapitre : l'image va changer selon si l'utilisateur glisse la question à gauche ou à droite.

Nous avons maintenant tous les éléments nécessaires dans notre interface ! Elle est prête !

![](Images/P3/P3C3_10.png)

Dans les deux prochains chapitres, nous allons voir comment faire en sorte qu'elle s'adapte à toute les tailles d'écran et dans les deux orientations paysage et portrait.

#### En résumé
- Il existe tout un tas de composants en iOS que vous pouvez glisser très facilement dans votre interface. Identifiez les pour avoir le réflexe de les utiliser le jour où vous en aurez besoin.
- Pour modifier les paramètres d'une vue, vous pouvez utiliser l'**inspecteur d'attributs**. Les propriétés modifiables diffèrent selon le type de la vue sélectionnée.
- Pour modifier la position ou la taille d'une vue, vous pouvez :
	- La déplacer à la souris et utiliser les poignées aux angles de la vue
	- Aller dans l'**inspecteur de taille** pour modifier les paramètres `x`, `y`, `width` et `height` directement.
- Pour ajouter une image, le plus simple est d'aller la chercher directement dans la **bibliothèque des média**.


### Adaptez l’interface avec AutoLayout
Nous commençons à avoir une belle interface ! Mais pas toujours...

> **:question:** Comment ça ?

Et bien, notre interface n'est belle pour l'instant que sur un iPhone 7 (ou 6). Sur les autres tailles d'iPhone, l'interface ne s'adapte pas. Vous ne me croyez pas ? Laissez moi vous montrer.

#### Le mode aperçu
Ouvrez le storyboard. Et cliquez en haut pour vous placez en mode assistant (en utilisant le bouton ci-dessous).  
![](Images/P3/P3C4_1.png)  
Le mode assistant permet d'afficher deux fichiers l'un à côté de l'autre. Sur la gauche, vous avez le storyboard et sur la droite le fichier `ViewController.swift`.

A la place du *ViewController*, nous allons afficher le mode aperçu. Pour cela cliquez en haut sur *Automatic* puis glissez en bas dans la liste déroulante jusqu'à *Preview* et choisissez `Main.storyboard (Preview)`.

![](Images/P3/P3C4_2.gif)

Le mode aperçu permet de visualiser votre interface sur plusieurs appareils différents. Pour cela, cliquer sur le `+` en bas à gauche de la section aperçu et rajoutez autant d'appareils que vous le souhaitez. J'ai de mon côté décidé de rajouter toutes les tailles possibles d'iPhone et cela donne :

![](Images/P3/P3C4_3.png)

On constate avec le mode aperçu que notre interface ne s'affiche correctement que sur l'iPhone 7. Sur les plus petits iPhone le bouton est trop bas et donc n'est même plus visible à l'écran et de manière générale le contenu n'est plus centré. Et encore, nous n'avons même pas essayé de regarder ce que cela donne sur un iPad ou si on tourne l'écran de l'iPhone en mode paysage.

Dans ce chapitre, nous allons faire en sorte que notre application s'affiche correctement pour **toutes les tailles d'iPhone en mode portrait**. Nous verrons l'affichage en mode paysage et l'iPad dans le chapitre suivant.

#### Découvrir AutoLayout
Pour adapter notre interface, nous allons découvrir ensemble **AutoLayout**. AutoLayout permet de créer des **contraintes** qui définissent des **relations** entre deux vues.

> **:question:** Contraintes ? Relations ? Tu peux être moins vague ? :D

Prenons notre bouton par exemple, on souhaite qu'il reste en bas quelque soit la taille de l'écran. Pour cela nous allons créer une contrainte qui va dire à notre storyboard : "*garde toujours une distance de 20 points entre le bas de l'écran et le bas du bouton*".

![](Images/P3/P3C4_4.png)

Cela permet de **positionner verticalement** notre bouton (sur l'axe des y). Cette contrainte définit une relation de distance entre deux vues : le bouton et l'écran.

> **:information_source:** Quand je dis l'écran, c'est en fait inexact. Il s'agit plutôt de la vue principale du contrôleur, c'est à dire la vue bleue foncée au fond. Cette vue prends par défaut automatiquement la taille de l'écran. C'est pour l'instant la seule qui s'adapte selon la taille de l'écran et c'est du coup par rapport à cette vue que nous allons toujours nous positionner.

On veut également que notre bouton soit centré. Donc on va définir une contrainte qui dit : "*le bouton doit rester centré horizontalement par rapport à la vue principale*". Cela permet de **positionner horizontalement** notre bouton.

![](Images/P3/P3C4_5.png)

Pour assurer que notre vue garde toujours la taille que l'on souhaite, nous allons définir deux contraintes supplémentaires : "*le bouton doit toujours avoir une largeur de 200 points et une hauteur de 80 points*".

![](Images/P3/P3C4_6.png)

Avec toutes ces contraintes, notre bouton va garder la taille et la position que l'on souhaite quelque soit la taille de l'écran. Comme on l'a vu dans le chapitre sur le placement des vues, il faut 4 informations pour placer avec certitude une vue : x, y, width, height. De la même façon, avec AutoLayout, **on va avoir besoin de 4 contraintes pour placer avec précision nos vues**.

#### Utiliser AutoLayout

##### Le bouton
Alors comment fait-on pour définir toutes ces contraintes ? On va faire cela dans le storyboard en commençant par le bouton. Cliquez sur ce dernier. Ensuite nous allons nous intéresser aux 4 boutons en bas à droite dans le storyboard. Ce sont eux qui permettent de gérer l'adaptation de l'interface aux différentes tailles d'écran.

![](Images/P3/P3C4_7.png)

Celui qui nous intéresse en premier, c'est le quatrième (en forme de TIE Fighter pour les fans de Star Wars ;)). Cliquez dessus :

![](Images/P3/P3C4_8.png)

La popup qui s'affiche nous permet de définir des contraintes. En haut, vous avez 4 contraintes possibles qui correspondent à **la distance au plus proche voisin** dans les 4 directions possibles (haut, bas, gauche, droite).

> **:question:** Le plus proche voisin ?

Vers le haut par exemple, il y a quatre voisins possibles et vous pouvez les afficher en cliquant sur la petite flèche à droite de la valeur 234 :

![](Images/P3/P3C4_9.png)

Le plus proche voisin en haut, c'est donc le label *0 / 10*. Puis la vue grise qui contient la question. Puis au-dessus, on a le *Top Layout Guide*, enfin il y a tout en en haut, le haut de la vue principale.

> **:information_source:** Dans le storyboard, vous avez ce qu'on appelel les layout guide. Ce ne sont pas des vues mais des repères pour placer vos vues. En particulier, le *Top Layout Guide* est un repère situé juste en dessous de la barre qui permet d'afficher les informations du téléphone comme la batterie, l'heure ou la qualité du signal réseau. Ce repère est donc plus bas que le haut de la vue principale qui se situe tout en haut de l'écran.

Maintenant que la notion de plus proche voisin est claire, rajoutons notre première contrainte. Nous souhaitons que le bouton soit à une distance de 20 points du bas de la vue principale. Pour cela, il suffit de cliquer sur le petit segment rouge du bas dans la popup.

Plus bas, dans la popup, vous trouvez les contraintes *Width* et *Height*. **Par défaut, leur valeurs correspondent à la taille actuelle du bouton**. Vous pouvez les cocher pour ajouter ces contraintes. A la fin votre popup doit ressembler à ceci :

![](Images/P3/P3C4_10.png)

Vous pouvez cliquer sur *Add 3 constraints* pour ajouter les trois contraintes. Les contraintes sont désormais visibles sur le bouton. Mais certaines sont rouges :

![](Images/P3/P3C4_11.png)

Elles sont rouges car la position du bouton est toujours ambigüe. En effet, sa position horizontale (sur l'axe des x) n'est pas encore fixée. Pour cela nous allons utiliser le troisième bouton en bas à droite qui permet de gérer l'alignement. En cliquant sur ce bouton, apparaît la popup suivante :

![](Images/P3/P3C4_12.png)

Cette popup permet d'aligner plusieurs vues entre elles sur leur différents bords ou sur leur centre si vous séléctionner plusieurs vues en même temps. Ici, nous avons séléctionné une seule vue donc nous avons seulement deux options :
- centrer horizontalement dans la vue qui contient le bouton (la vue principale)
- centrer verticalement dans la vue qui contient le bouton (la vue principale)

Ici, on veut centrer horizontalement donc on coche la première case et on clique sur *Add 1 constraint*.

![](Images/P3/P3C4_13.png)

Notre bouton a désormais 4 contraintes qui permettent de déterminer sa position avec certitude, les lignes rouges ont disparues. Si on retourne sur le mode aperçu, on peut voir que notre bouton s'affiche correctement dans tous les cas :

![](Images/P3/P3C4_14.png)

En plus des lignes bleus autour du bouton, vous pouvez vérifier vos contraintes dans le panneau de droite dans l'onglet *Inspecteur de taille* (le 5ème). En bas, vous retrouvez les 4 contraintes que nous avons crées :
- En cliquant sur *Edit*, vous pouvez les modifier.
- En les sélectionnant et en utilisant la touche de suppression de votre Mac, vous pouvez les supprimer.

![](Images/P3/P3C4_14bis.png)


##### La vue question

Nous allons désormais nous attaquer à la vue grise des questions. Nous allons la garder centrée en haut en conservant sa taille. Vous savez déjà centrer une vue horizontalement, on vient de le voir donc je vous laisse le faire.

Passons à la suite, allons dans les contraintes de positionnement et cette fois-ci, nous allons rajouter une contrainte vers le haut pour que cette vue reste accrochée en haut de l'interface.

![](Images/P3/P3C4_15.png)

En dessous, nous allons fixer sa largeur à 245 avec la propriété width comme pour le bouton. Mais pour plus de flexibilité, nous n'allons pas fixer sa hauteur.

A la place, nous allons utiliser la contrainte en dessous *Aspect Ratio*. Cette contrainte signifie : garde le ratio largeur / hauteur constant. Dans notre cas, on veut que ce ratio soit toujours égal à 1 car on veut que la vue garde toujours une forme carré. Vous pouvez donc cocher cette case. Nous avons donc les contraintes suivantes :

![](Images/P3/P3C4_16.png)

Cliquez sur `Add 3 constraints` pour rajouter les contraintes. Désormais la question reste bien toujours centrée horizontalement et fixée en haut lorsque la taille de l'écran varie.

Pour plus de sécurité, nous allons également fixer le label à l'intérieur ainsi que la petite icône. On souhaite que le label soit toujours à la taille de la vue avec une marge de 8 points. Donc on va utiliser les segments rouges pour accrocher le haut, le bas, la gauche et à la droite à la vue grise.

![](Images/P3/P3C4_17.png)

> **:warning:** On a bien 4 contraintes pour cette vue. Les deux contraintes gauche et droite ensemble permettent de définir la largeur du label. Et les deux contraintes en haut et en bas permettent de définir la hauteur du label.

Pour la petite icône, nous allons la laisser centrée horizontalement en bas de la vue grise en fixant sa taille. C'est la même chose que pour le bouton donc je vous laisse faire.

##### Le label score
Il nous reste maintenant le label qui affiche le score. Nous voulons qu'il reste centrée à une distance fixe de la vue question. Pour cela, nous allons définir une contrainte vers la vue grise en haut, deux contraintes pour fixer la hauteur et la largeur et une contrainte pour centrer horizontalement le label.

Et pour éviter de me répéter, je vais vous montrer une autre façon pratique de créer des contraintes : le **control-drag**. En laissant, la touche control <kbd>ctrl</kbd> enfoncée, vous allez essayer de glisser le label vers la vue grise comme ceci :

![](Images/P3/P3C4_18.gif)

Lorsque vous lâchez le clic de la souris, Xcode vous demande quelle genre de contraintes vous souhaitez créer. La contrainte sera créée entre la vue de départ et la vue d'arrivée (ici le label score et la vue grise).  Ici c'est *Vertical Spacing*, à savoir l'espace verticale entre la vue grise et la question.

> **:warning:** **En fonction de la direction du glissement, Xcode vous propose les contraintes les plus pertinentes.** Si vous souhaitez créer une contrainte qui concerne la largeur ou le positionnement horizontal, vous devez faire un glissement horizontal et inversement.

Pour rajouter les autres contraintes, vous pouvez répéter l'opération. Pour la hauteur par exemple, vous pouvez faire **un control-drag depuis le label score vers lui-même** et choisir *Height*. Même chose pour la largeur en choisissant *Width*. Vous pouvez également glisser horizontalement vers la vue principale et choisir *Center Horizontally in Container* pour centrer horizontalement le label.

Avec cette dernière vue, toute notre interface s'adapte désormais parfaitement sur toutes les tailles d'écrans de l'iPhone en mode portrait.

![](Images/P3/P3C4_19.png)

#### Les autres boutons
Nous n'avons vu que 2 boutons parmi les 5 situés en bas à droite de l'interface :

![](Images/P3/P3C4_7.png)

Alors laissez moi vous présenter les autres qui vous seront sans doute utile. Le premier n'est activé que si certaines de vos vues sont à une position qui ne corresponds pas à leur contrainte. Essayez de déplacer le bouton par exemple :

![](Images/P3/P3C4_20.png)

Dans ce cas, des lignes oranges indiquent que le bouton est décalé par rapport à ses contraintes. Vous avez donc deux options :
- soit vous souhaitez **remettre le bouton à la place indiqué par ses contraintes**, dans ce cas, il suffit de cliquer sur le **premier bouton**.
- soit vous souhaitez **modifier la valeur des contraintes** pour que le bouton reste à cette position, dans ce cas vous pouvez utiliser le **dernier bouton** (avec le triangle).

Dans ce deuxième cas, un pop up vous propose plusieurs choix allant de la suppression de toutes les contraintes à la modification de leur valeurs pour respecter la position actuelle du bouton.

![](Images/P3/P3C4_21.png)

Enfin le deuxième bouton permet de placer vos vues dans des *Stack View*. Les stacks view permettent de gérer des piles de vues horizontales ou verticales. Mais nous ne les verrons pas dans ce chapitre.


#### Exercice
Adaptez l’interface de la loading page  
Correction en screencast

#### En résumé
- Pour adapter une interface à plusieurs tailles d'écran, on utilise AutoLayout. AutoLayout permet de créer des **contraintes** qui définissent des **relations** entre deux vues.
- Pour définir parfaitement la position d'une vue, il faut utiliser au moins 4 contraintes qui permettent de définir la position horizontal et vertical ainsi que la hauteur et la largeur de la vue.
- On peut créer des contraintes en utilisant les boutons en bas à droite du storyboard ou en utilisant le control-drag.
- Les boutons en bas à droite correspondent aux usages suivants :
![](Images/P3/P3C4_22.png)

### Utilisez les catégories de tailles pour une expérience utilisateur optimale  

Section 1 : Présentation des différentes tailles d’iPhone et d’iPad (mention des orientations supportées dans les réglages du projet)  
Section 2 : Présentation des catégories de taille  
Section 3 : Implémentation des catégories de taille pour le mode portrait  
Section 4 (présenté comme exercice mais demo en screencast quand même) : Implémentation des catégories de taille pour l’iPad  
EXERCICE : Adaptez l’interface de la loading page  

### Sous-classez UIView  
Objectif : Ecrire une vue customisée  
Section 1 : Pourquoi sous-classer ?  
Section 2 : Créer la sous-classe avec Xcode  
Section 3 : Ajouter les outlets  
Section 4 : Ajouter les propriétés et méthodes  
