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

![](Images/P3/P3C1_1.gif)

Maintenant, sélectionnez le segue nouvellement créé et ouvrez l'inspecteur d'attributs :

![](Images/P3/P3C1_2.png)

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

![](Images/P3/P3C2_1.png)

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

![](Images/P3/P3C2_2.png)

> **:warning:** Le premier a plus vocation à afficher des messages à l'utilisateur, il est plutôt **informatif**. Alors que le second sera plus souvent utilisé comme un moyen de sélectionner plusieurs options, il est plutôt **orienté vers l'action**.

Avec cela vous pouvez combiner trois styles de boutons :
- `.default` : le style par défaut.
- `.destructive` : ce style indique que l'action risque de modifier ou supprimer des données.
- `.cancel` : ce style indique que l'action annule l'opération et laisse les choses inchangées.

![](Images/P3/P3C2_3.png)

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

![](Images/P3/P3C3_1.jpg)

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

![Les modes de navigations disponibles en iOS](Images/P1/P1C6_5.png)

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

![](Images/P3/P3C4_1.jpg)
