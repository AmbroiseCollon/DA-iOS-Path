# Ajoutez des listes dans vos applications iOS

## Découvrez les protocoles

### Tirez le meilleur de ce cours

Bonjour et bienvenue dans ce cours sur la création de liste ! Dans ce cours, nous allons traiter en parallèle deux sujets incontournables en iOS :

- Les listes ou *Table View*
- Les protocoles en Swift

> **:information_source:** En effet, les *Table View* ont besoin des protocoles pour fonctionner, alors autant les voir ensemble !

===> P1/P1C1_0.jpg //

#### Prérequis

Ce cours fait partie de tout [un parcours sur le développement d'application iOS](https://openclassrooms.com/paths/developpeur-se-dapplication-ios). Je vous suggère fortement d'y jeter un oeil si vous souhaitez vous former et trouver un emploi en tant que développeur iOS.

> **:warning:** Pour profiter au mieux de ce cours, assurez-vous que vous maîtrisez a minima les compétences présentées dans les cours suivants :
- [Introduction à iOS : plongez dans le développement mobile !](https://openclassrooms.com/courses/introduction-a-ios-plongez-dans-le-developpement-mobile)
- [Apprenez les fondamentaux de Swift](https://openclassrooms.com/courses/apprenez-les-fondamentaux-de-swift)
- [Approfondissez Swift avec la Programmation Orientée Objet](https://openclassrooms.com/courses/approfondissez-swift-avec-la-programmation-orientee-objet)
- [Développez une application iPhone avec le modèle MVC](https://openclassrooms.com/courses/concevez-une-application-iphone-avec-le-modele-mvc)
- [Ajoutez plusieurs pages à votre application](https://openclassrooms.com/courses/ajoutez-plusieurs-pages-a-votre-application-ios)

#### Démo

Comme d'habitude, ce cours va s'appuyer sur la réalisation d'une application. Cette application se nomme Whishmas et comme son nom l'indique assez mal, elle permet de créer une liste de souhait (*wish*) pour le père Noël (*christmas*)...

La version finale de cette application ressemblera à ceci :

===> P1/P1C1_1.png //

La première vue contient la liste des souhaits de cadeaux pour le Père Noël. Un bouton `+` en haut à droite renvoie vers le choix de trois catégories : Voyage, Livre et Jouet. On choisit une catégorie et on est renvoyée à un formulaire qui permet de rajouter un élément de la catégorie sélectionnée. Cet élément est ensuite rajouté à la liste.

Nous avons notre objectif, je vous propose le point de départ suivant :

===> P1/P1C1_2.png //

Dans cette version de l'application, la liste n'est pas encore créée et nous avons un seul formulaire qui permet seulement de rajouter un jouet. Nous n'avons pas encore la notion de catégorie.

> **:information_source:** Je vous invite à télécharger [cette version du projet](https://s3-eu-west-1.amazonaws.com/static.oc-static.com/prod/courses/files/Parcours+DA+iOS/Cours+9+-+Table+View/Whishmas+-+Starter.zip) avant de passer à la suite.

#### Plan du cours

Pour arriver à nos fins, nous allons nous suivre le plan suivant :

1. Dans cette partie, nous allons présenter les protocoles en travaillant dessus dans le Playground. Ils nous sont indispensables pour attaquer sereinement la suite.
2. Dans la seconde partie, nous allons créer notre *Table View* et la remplir en utilisant le delegate pattern.
3. Dans la troisième partie, nous allons améliorer notre liste et notre application en découvrant de nouvelles fonctionnalités des protocoles et des *Table View*.

Vous êtes prêts ? Alors, allons-y !

### Découvrez les protocoles
C'est parti ! Nous allons parler des protocoles !

> **:information_source:** Si vous suivez [le parcours](https://openclassrooms.com/paths/developpeur-se-dapplication-ios), je sais, on en a déjà un peu parlé. Mais cette fois-ci, on va vraiment rentrer dans le détail !

#### Une histoire d'héritage...

Pour découvrir les protocoles, je vous ai concocté un petit Playground !

> **:information_source:** Je vous invite à le télécharger [ici](https://s3-eu-west-1.amazonaws.com/static.oc-static.com/prod/courses/files/Parcours+DA+iOS/Cours+9+-+Table+View/Animal+-+Starter.playground.zip).

Dans ce Playground, vous trouverez un code assez simple : une classe `Animal` et deux sous-classes `Bird` et `Dog`.

La classe `Animal` a deux méthodes et une propriété comme suit :

```swift
class Animal {
    func makeSound() {}
    func move() {}

    var description = ""
}
```

> **:question:** Mais les méthodes sont vides ! Elles ne servent à rien ?

Très bonne question ! En effet, les méthodes sont vides, car je ne peux pas prédire le son que va faire un animal sans savoir précisément de quel animal je parle. De la même manière, un oiseau ne se déplace pas de la même manière qu'un cheval. Donc je ne peux pas remplir la méthode `move`.

Autrement dit, la classe `Animal` est **trop générique** et du coup, elle ne sert à rien à part mettre en commun deux méthodes et une propriété que les sous-classes vont pouvoir implémenter.

En programmation, on n’aime pas trop ce qui ne sert à rien ! En biologie, non plus d'ailleurs... mais c'est un autre débat ! Du coup, on va supprimer cette classe `Animal` !

> **:question:** Mais attends ! Elle permet quand même aux sous-classes d'hériter de ces méthodes et de cette propriété !

Je sais, mais faîtes moi confiance, supprimez cette classe ! On va faire ça différemment... Avec un protocole !

#### Les protocoles à la rescousse !

En plus de beaucoup d'autres choses, les protocoles sont très pratiques dans notre situation. Et pour comprendre pourquoi, il faut comprendre ce que c'est !

##### Définition

> **Un protocole, c'est une liste d'exigences**.

Oui je sais, dis comme ça, ça ne fait pas rêver... Mais vous allez voir c'est puissant ! Rentrons dans le vif du sujet !

##### Syntaxe

Pour déclarer un protocole, on utilise le mot-clé `protocol` suivi d'un nom et d'accolades :

```swift
protocol Animal {

}
```

Oui, ça ressemble à une classe. Et la ressemblance ne s'arrête pas là !

##### Méthodes

**On peut ajouter des méthodes à un protocole**.

```swift
protocol Animal {
    func makeSound()
    func move()
}
```

> **:question:** Hé, mais attends ! Tu as oublié l'implémentation des méthodes.

Eh oui comme je l'ai dit, un protocole, c'est une liste d'exigences. Ensuite, on va demander à une classe de **se conformer** à ces exigences.

> **:information_source:** En gros, un protocole peut définir des méthodes, mais ce sont les classes qui les implémentent.

##### Propriétés

**Un protocole peut aussi contenir des propriétés.** Mais comme pour les méthodes, le protocole va seulement définir si cette propriété peut être modifiée ou non. Il ne va pas lui donner de valeur :

```swift
protocol Animal {
    func makeSound()
    func move()

	var description: String { get set }
}
```

Je définis ici dans mon protocole une propriété description de type `String`. Jusque là rien de nouveau. Ensuite, j'ajoute entre accolades les mots `get` et `set`. Cela signifie que cette propriété pourra être modifiée.

> **:information_source:** Si j'avais voulu définir une propriété en lecture seule, j'aurais écrit :
>
> ```swift
> var description: String { get }
> ```

> **:question:** Je veux bien toute cette histoire de protocole, mais à quoi ça sert vraiment ?

Je comprends que ce soit un peu flou pour le moment, mais on y vient !  

#### Se conformer à un protocole

Je le répète : un protocole, c'est **une liste d'exigences**. Autrement dit, un protocole, c'est une entité qui déclare :

> Si tu veux être ça, il faut que tu fasses ça.

Par exemple, dans notre cas :

> Si tu veux être un `Animal`, il faut que tu saches faire les choses suivantes :
>
> - `makeSound`
> - `move`
>
> Et donner une valeur à la propriété suivante :
>
> - `description`

Nous avons dans notre Playground deux classes qui voudraient bien être des animaux : `Dog` et `Bird`.

```swift
class Dog {
    var race = ""

    func fetch() {
        print("Je vais chercher la balle...")
    }
 }

class Bird {
    var color = ""
}
```

> **:information_source:** J'ai supprimé de ces classes tout ce qui était lié à l'héritage d'`Animal,` car nous avons supprimé cette classe.

Pour que `Dog` et `Bird` soient des animaux, ils doivent **se conformer au protocole**. Cela se fait en deux étapes :

1. Adopter le protocole
2. Répondre à ses exigences

Commençons par la première étape :

##### Adopter le protocole

Pour adopter un protocole, la syntaxe est exactement la même que pour l'héritage :

```swift
class Dog: Animal { (...) }

class Bird: Animal { (...) }
```

On ajoute <keyboard>:<keyboard> puis le nom du protocole (`Animal`) après la déclaration de la classe.

À ce moment-là, vous devriez avoir une erreur dans votre Playground :

===> P1/P1C2_1.png // Type 'Dog' does not conform to protocol 'Animal'

Cette erreur signifie simplement que nous avons adopté le protocole, mais que nous n'avons pas encore répondu à ses exigences. C'est normal, c'est notre deuxième étape !

##### Répondre à ses exigences

Pour répondre aux exigences d'un protocol, il suffit de rajouter l'implémentation des méthodes du protocole et de donner une valeur à ses propriétés comme ceci :

```swift
class Dog: Animal {
    var race = ""

    func fetch() {
        print("Je vais chercher la balle...")
    }

    // On répond aux exigences du protocole
    var description = ""

    func move() {
        print("Je cours !")
    }

    func makeSound() {
        print("Wouf !")
    }
}

class Bird: Animal {
    var color = ""

    // On répond aux exigences du protocole
    var description = ""

    func move() {
        print("Je vole !")
    }

    func makeSound() {
        print("Piou Piou")
    }
}
```

On a simplement rajouté les méthodes et leurs implémentations et on a donné une valeur à la propriété `description`. Et ça y est nos classes se conforment au protocole `Animal`.

On a remplacé notre classe inutile et trop générique par un protocole qui remplit le même rôle !

#### En résumé
- Un protocole est une **liste d'exigences**. Ces exigences peuvent être des méthodes ou des propriétés.
- Souvenez-vous de la phrase suivante. Un protocole est une entité qui déclare : "*Si tu veux être ça, il faut que tu fasses ça !*"
- Un protocole se déclare avec la syntaxe suivante :

```swift
protocol NomDuProtocole {
	func maMethode()
	func maMethodeAvecParametresEtValeurDeRetour(param1: Type, Param2: Type) -> Type

	var maPropriete: Type { get set }
	var maProprieteEnLectureSeule: Type { get }
}
```

- Une classe peut se conformer à un protocole en :
	1. Adoptant le protocole
	2. Répondant à ses exigences

```swift
// 1. On adopte le protocole
class MaClasse: MonProtocole {
	// 2. On répond à ces exigences
	func laMethodeDeMonProtocole() {
		// Implémentation de la méthode définie par le protocole
	}
}
```

Ceci constitue un premier tour d'horizon rapide des protocoles et avant de les mettre en pratique dans notre application, nous allons voir asseoir un peu plus votre compréhension du sujet ! Et ça se passe au prochain chapitre !

### Approfondissez les protocoles
Pour bien appréhender les protocoles, je vous propose que l'oncontinue à jouer un peu avec dans ce chapitre !

===> P1/P1C3_1.jpg // Vous êtes vraiment de grands enfants...

#### Le point sur les types

Je ne sais pas si vous y avez prêté attention, mais un protocole se déclare un peu comme une énumération, une structure ou une classe.

```swift
protocol MonProtocole {}

class MaClasse {}

struct MaStructure {}

enum MonEnumeration {}
```

Il y a une raison à cela ! Le protocole permet de créer un type de la même façon que les classes, les structures ou les énumérations. Cela veut dire que vous pouvez écrire cela :

```swift
protocol UnProtocole { (...) }

var uneVariable: UnProtocole
var unTableau: [UnProtocole]
func uneFonction(param: UnProtocole) -> UnProtocole { (...) }
```

La seule différence, c'est que vous ne vous pouvez pas créer d'instance à partir d'un protocole. En effet, une classe/structure/énumération définit des objets. Vous pouvez donc en créer des instances. Alors que les protocoles définissent seulement des listes d'exigences.

Autrement dit, vous ne pouvez pas écrire :

```swift
var uneVariable = UnProtocole()
```

> **:question:** Euh... Mais du coup, ça ne veut rien dire ça :
>
> ```swift
> var uneVariable: UnProtocole
> ```

Si ! Prenons un exemple avec notre protocole `Animal`. `Animal` est un protocole donc il définit un type donc je peux déclarer une variable de type `Animal`.

```swift
var unAnimal: Animal
```

Animal n'est pas un objet donc je ne peux pas créer une instance d'`Animal`. Mais en même temps tant mieux, car on a vu qu'Animal était un concept trop abstrait. En revanche, je peux définir cette variable de type Animal.

Cela signifie qu'elle pourra prendre comme valeur une instance de n'importe quelle classe qui implémente le protocole Animal. Du coup, on peut écrire ceci :

```swift
var unAnimal: Animal
unAnimal = Dog()
unAnimal = Bird()
```

> **:question:** Mais `unAnimal` change de type dans ton exemple ! C'est interdit en Swift !

Eh non ! `unAnimal` garde le type `Animal`, seulement celui fonctionne avec `Dog` et `Bird,` car ces deux classes se conforment au protocole `Animal`.

Du coup, on peut faire des trucs sympas avec les protocoles comme ceci :

```swift
var monTableauDAnimaux: [Animal] = [Dog(), Bird()]
```

On a un tableau qui contient des objets qui ne sont pas du même type, mais qui se conforment tous au type `Animal`. Lorsque je vais programmer en utilisant mon tableau d'animaux, je vais programmer autour de *l'interface* définie par mon protocole : je ne me soucie pas de savoir quel type d'animal je manipule, et c'est une bien meilleure pratique qui rend mon code plus *modulaire* !

#### Des protocoles partout !

Jusqu'à présent, on a parlé uniquement de classe qui se conforme à un protocole, mais sachez que n'importe quel type peut se conformer à un protocole. On peut donc écrire ceci :

```swift
protocol MonProtocole {}

class MaClasse: MonProtocole {}

struct MaStructure: MonProtocole {}

enum MonEnumeration: MonProtocole {}
```

Cela fonctionne exactement de la même manière !

Avant, seulement les classes pouvaient partager des comportements grâce à l'héritage. Mais les structures et les énumérations n'ont pas l'héritage.

Mais grâce aux protocoles, toutes les structures de donnée peuvent partager des comportements ! Encore mieux, une classe peut partager des méthodes avec une énumération.

> **:information_source:** On peut même aller encore plus loin ! Un protocole peut se conformer à un autre protocole :
>
> ```swift
> protocol MonProtocole {}
>
> protocol UnAutreProtocole : MonProtocole {}
> ```

#### Plusieurs protocoles

Une même classe/structure/énumération peut se conformer à plusieurs protocoles. En effet, un protocole est simplement une liste d'exigences, du coup, on peut combiner ces listes pour obtenir une plus grande liste.

Je vous propose qu'on rajoute du coup un deuxième protocole. On va appeler ce protocole `Nameable`. Et il sera implémenté par toute classe qui veut pouvoir avoir un nom et un prénom :

```swift
protocol Nameable {
    var firstName: String { get set }
    var lastName: String { get set }

    func getFullName() -> String
}
```

Notre classe `Dog` va adopter le protocole. Lorsqu'une classe adopte plusieurs protocoles, on les sépare par une virgule :

```swift
class Dog: Animal, Nameable { (...) }
```

Et ensuite il suffit de répondre à ses exigences.

```swift
class Dog: Animal, Nameable {
    var firstName: String = ""
    var lastName: String = ""

    func getFullName() -> String {
        return firstName + " " + lastName
    }

    // (...)    
}
```

#### En résumé
- Un protocole définit un type au même titre qu'une classe/structure/énumération.
- Un protocole peut être adopté par une classe, une structure, une énumération ou même un autre protocole.
- Une classe/structure/énumération peut se conformer à plusieurs protocoles. Dans ce cas, on sépare les protocoles avec des virgules.

### Sautez dans le Protocol Oriented Programming
Vous ne le voyez sans doute pas pour le moment, mais les protocoles changent vraiment votre approche du code. Et au fur et à mesure de ce cours, je vais essayer de vous le faire sentir.

#### Un aperçu du Protocol Oriented Programming

Le monde de la programmation est généralement sous le paradigme de l'orienté objet (*OOP : Object Oriented Programming*). On manipule des objets et certains peuvent hériter les uns des autres. Et c'est ce que vous avez fait jusqu'à présent.

Mais en Swift, les protocoles sont tellement puissants que beaucoup considèrent que **Swift est un langage de programmation orienté protocole** (*POP : Protocol Oriented Programming*).  

Pour comprendre ce que cela change, je vous propose de créer dans notre Playground, une classe `Human`.

```swift
class Human {
    func speak() {
        print("Bonjour !")
    }
}
```

Un humain n'est pas un animal. Mais en revanche, il a un nom et un prénom. Donc nous allons lui faire adopter le protocole `Nameable`.

```swift
class Human: Nameable {
    var firstName: String = ""
    var lastName: String = ""

    func getFullName() -> String {
        return firstName + " " + lastName
    }

    func speak() {
        print("Bonjour !")
    }
}
```

Vous voyez ici que le protocole `Nameable` peut s'appliquer à des objets qui n'ont a priori rien à voir entre eux. Il s'agit en effet d'**une brique de fonctionnalités que je peux donner à n'importe quelle classe/structure/énumération**.

#### Les extensions de protocole

> **:question:** Très bien, mais je dois redonner dans Human une implémentation de getFullName, qui en plus est la même que pour Dog ! C'est un peu pénible si ma brique de fonctionnalité devient plus complexe, non ?

Eh oui, c'est bien vu. Mais c'est de ma faute, je vous ai fait un petit mensonge tout à l'heure ! Je vous ai dit:

> Un protocole peut définir des méthodes, mais ce sont les classes qui les implémentent.

Et en Swift, c'est un peu faux. Et c'est précisement la raison pour laquelle les protocoles sont si important dans ce language !

En Swift, **un protocole peut définir l'implémentation de ses méthodes**.

Je répète: **En swift, un protocole peut définir l'implémentation de ses méthodes.**

> **:question:** Ok... ça a l'air chouette ?

C'est vraiment très très chouette. On va voir ça avec notre exemple de `Nameable` tout de suite. Voici la définition du protocole qu'on avait:

```swift
protocol Nameable {
    var firstName: String { get set }
    var lastName: String { get set }

    func getFullName() -> String
}
```

Et pour implémenter `getFullName`, on va faire ceci :

```swift
extension Nameable {

    func getFullName() -> String {
      return firstName + " " + lastName
    }
}
```

Du coup, pour que `Human` adopte `Nameable`, je peux simplifier le tout en:

```swift
class Human: Nameable {
    var firstName: String = ""
    var lastName: String = ""

    // Pas besoin d'implémenter getFullName, mais toute instance de Human pourra l'appeler !!

    func speak() {
        print("Bonjour !")
    }
}
```

Et voilà le travail ;) ! On utilise ce qu'on appelle une **extension de protocole** pour aller donner une implémentation par défaut de certaines de ses exigences. Du coup je peux vraiment facilement ajouter une brique de fonctionnalité bien définie à n'importe quelle classe/structure/énumération !

> **:question:** Mais si je veux donner une autre implémentation, par example dans Dog, je fais comment ?! Parce que `override`, ça marche pour les classes seulement !

En effet, on n'utilisera pas `override` dans ce genre de situation. Si dans ma classe `Dog`, je veux une implémentation de `getFullName` différente de celle par défaut, et bien je n'ai qu'à la redonner:

```swift
class Dog: Nameable {
    var firstName: String = ""
    var lastName: String = ""

    // Lorsque j'appelle cette méthode sur un chien,
    // c'est cette implémentation qui sera appellée,
    // et non celle définie par défaut.
    func getFullName() -> String {
      return "Waaaf \(firstName) ! WoofWoof \(lastName)"
    }

    // (...)
}
```

**L'implémentation donnée par l'objet qui adopte le protocole sera toujours prioritaire aux implémentations par défaut**. Ce qui est rassurant, puisque les protocoles sont à la base, un moyen de s'abstraire de la façon dont sont implémentés les choses, en se limitant à connaître simplement les exigences.

#### L'orienté protocole en image !
Je vous propose les schémas suivants pour comparer les approches orientées objet et orientées protocole.

===> P1/P1C4_1.png // Programmation Orientée Objet

En orienté objet, on partage des comportements grâce çà l'héritage. Mais on est **limité à une seule superclasse** et **toutes les classes récupèrent forcément toutes les fonctionnalités de la superclasse**. Cela oblige les sous-classes à une certaine homogénéité.

===> P1/P1C4_2.png // Programmation Orientée Protocole

En orienté protocole, on partage des comportements grâce aux protocoles. C'est bien plus flexible, car :

- On peut partager des comportements entre des classes/structures/énumérations.
- Une même classe/structure/énumération peut adopter plusieurs protocoles.
- En utilisant un protocole par fonctionnalité, on peut ajouter certaines fonctionnalités à certains objets sans l'ajouter à d'autres.
- On peut donner une implémentation par défaut de certaines fonctionnalités en utilisant les extensions de protocole.

> **:information_source:** L'orienté protocole est un peu à imaginer comme des legos. On va créer des objets. Et ensuite, on va leur ajouter des briques de fonctionnalités en leur faisant adopter à chaque fois un nouveau protocole.

#### L'orienté protocole dans le langage Swift

L'orienté protocole est au coeur de la conception de Swift. Le langage lui-même utilise de nombreux protocoles pour fonctionner.

Prenons un exemple avec `Equatable`. `Equatable` est un protocole qui permet de comparer deux valeurs pour voir si elles sont égales. Tous les types qui se conforment au protocole `Equatable` peuvent être utilisés avec les opérateurs `==` et `!=`.

> **:information_source:** Littéralement `Equatable` signifie qui peut être égal.

Il y a donc des centaines de types qui implémentent ce protocole comme String, Int, Double, et [beaucoup beaucoup d'autres](https://developer.apple.com/documentation/swift/equatable#relationships).

> **:information_source:** La fonctionnalité de pouvoir être égal à quelqu'un a donc été mis en boîte dans un protocole adopté ensuite par des centaines de types.

Je vous propose d'essayer d'implémenter ce protocole pour notre classe `Human`. Commençons par adopter le protocole :

```swift
class Human: Nameable, Equatable { (...) }
```

Ensuite, le Playground affiche une erreur, car on ne se conforme pas au protocole.

===> P1/P1C4_3.png //

Pour résoudre l'erreur, il faut répondre à la seule exigence de ce protocole, implémenter la méthode suivante :

```swift
static func == (lhs: Human, rhs: Human) -> Bool {
}
```

Cette fonction prend deux paramètres du type avec lequel on travaille, en l'occurrence `Human`. Ce sont les deux valeurs que nous essayons de comparer :

- `lhs` (*left hand side*) : la valeur à gauche du `==`
- `rhs` (*right hand side*) : la valeur à droite du `==`

Et la fonction renvoie un booléen, résultat de l'égalité.

Pour implémenter cette fonction, il faut indiquer selon quelles conditions deux humains sont égaux. Nous allons dire que deux humains sont égaux s'ils ont le même nom et prénom, donc le même nom complet :

```swift
static func == (lhs: Human, rhs: Human) -> Bool {
    return lhs.getFullName() == rhs.getFullName()
}
```

Et voilà ! Maintenant, nous pouvons écrire le code suivant :

```swift
let human1 = Human()
let human2 = Human()
if human1 == human2 {
    print("Vous êtes les mêmes !")
}
```

Grâce aux protocoles, notre classe supporte maintenant la fonctionnalité `==` !

> **:information_source:** Si ça vous a plu, sachez qu'il existe de nombreux autres protocoles de ce genre dans le langage Swift. Jetez un oeil à [Comparable](https://developer.apple.com/documentation/swift/comparable) par exemple.

#### En résumé

- En programmation orientée protocole, on va utiliser les protocoles pour partager des fonctionnalités entre différents objets, de façon bien plus flexible.
- Le langage Swift utilise beaucoup l'orienté protocole.

Maintenant que les protocoles sont, je l'espère, un peu plus clairs pour vous, nous allons nous attaquer à notre application et rajouter une liste !

Rendez-vous dans la prochaine partie ;) !

## Créez votre Table View

### Découvrez UITableView
Nous y sommes ! Nous allons créer notre liste pour notre belle application Wishmas.

Pour rappel, nous partons de la version suivante de l'application :

===> P1/P1C1_2.png //

Et je vous propose de commencer par faire un petit tour du propriétaire histoire que vous compreniez les quelques lignes de code déjà présentes dans le projet.

> **:information_source:** Si vous n'avez pas encore téléchargé le projet, il est encore temps ! Vous le trouverez [ici](https://s3-eu-west-1.amazonaws.com/static.oc-static.com/prod/courses/files/Parcours+DA+iOS/Cours+9+-+Table+View/Whishmas+-+Starter.zip).

#### Découverte du projet
Le projet est divisé en 5 fichiers organisés bien évidemment selon le modèle MVC.

===> P2/P2C1_1.png //

On va les parcourir rapidement.

##### Toy.swift

```swift
struct Toy {
    var name = ""
    var brand = ""
}
```

Pas grand-chose à dire là-dessus, il s'agit simplement d'une structure avec deux propriétés qui représente la marque et le nom d'un jouet.

##### ToyService.swift

```swift
class ToyService {
    static let shared = ToyService()
    private init() {}

    private(set) var toys: [Toy] = []

    func add(toy: Toy) {
        toys.append(toy)
    }
}
```

Cette classe utilise le singleton pattern comme on peut le voir dans les deux premières lignes.

> **:information_source:** Besoin d'un rappel sur le pattern singleton ? C'est par [ici](https://openclassrooms.com/courses/faites-des-appels-reseaux-dans-votre-application-ios/gerez-les-requetes-concurrentes-avec-le-singleton-pattern).

Ensuite on définit une variable `toys` qui est un tableau de `Toy`.

> **:information_source:** Ici, vous remarquerez le mot-clé `private(set)` dont nous n'avons pas encore parlé. Il permet de **laisser public l'accès à la propriété, mais de rendre privé sa modification**. Autrement dit, n'importe qui peut accéder à la propriété `toys`, mais seule la classe `ToyService` peut modifier sa valeur.

Ensuite, une fonction `add(toy: Toy)` permet de rajouter un jouet dans le tableau `toys`.

##### Main.storyboard

===> P2/P2C1_2.png //

RAS...


##### ToyViewController.swift

Cette classe gère la page qui permet de rajouter un jouet. Il s'agit principalement d'une fonction `save` qui récupère les données des deux champs de texte, crée un objet `Toy` et l'ajoute avec `ToyService` au tableau `toys` puis renvoie vers la page précédente.

```swift
@IBAction func save() {
    guard let name = nameTextField.text,
        let brand = brandTextField.text else {
            return
    }

    let toy = Toy(name: name, brand: brand)
    ToyService.shared.add(toy: toy)

    navigationController?.popViewController(animated: true)
}
```

> **:information_source:** Il y a aussi une petite extension qui permet de gérer le clavier. Vous avez [un chapitre dédié à la gestion du clavier](https://openclassrooms.com/courses/ajoutez-plusieurs-pages-a-votre-application-ios/gerez-le-clavier) si besoin ;) !

##### ListViewController.swift

```swift
class ListViewController: UIViewController {
}
```

Ce dernier fichier est vide, car c'est ici que nous allons coder notre Table View !

#### Présentation de Table View

Il est donc grand temps de parler de la Table View ! Alors une Table View, c'est quoi ?

**Une Table View est un objet de la classe `UITableView`** (qui hérite de `UIView`) **et dont le rôle est d'afficher des listes que l'on peut faire défiler.**

Et cet objet mérite un cours, car :

- Il est un peu plus complexe qu'un bouton par exemple
- Surtout, il y a des Table View partout en iOS

Partout où vous avez une liste qui défile, c'est une Table View qui se cache derrière.
Prenons quelques exemples :

===> P2/P2C1_3.png //

Mais cela peut prendre d'autres aspects. Voici d'autres exemples peut-être un peu moins évidents qui fonctionnent aussi avec des Table View :

===> P2/P2C1_4.png //

Comme vous pouvez le voir, les Table View sont partout et sont un outil très flexible et donc très utilisé par les développeurs.

#### Naming des éléments la table view
Une Table View est donc simplement une liste, mais plusieurs éléments permettent de la structurer pour bien organiser les données. Pour vous y retrouver, il est important que vous en connaissiez les différents éléments.

Et je vous ai fait un joli schéma que l'on va détailler ensemble :

===> P2/P2C1_5.png //

Une Table View peut-être divisée en **sections**. Ces sections permettent d'organiser les données.

> **:information_source:** Par exemple, dans l'application *Contact*, il y a une section par lettre de l'alphabet. Ou encore dans l'application *Réglages*, les réglages sont découpés en thématiques.

> **:warning:** Le découpage en sections n'est pas obligatoire ! Vous pouvez très bien ne pas utiliser de sections si vous n'en avez pas besoin. C'est ce que fait l'application message, par exemple.

Ensuite, au sein d'une section, vous avez trois éléments :

- `Section Header` (`UIView`) : c'est une vue en haut de la section (qui permet par exemple de lui donner un titre).
- `Section Footer` (`UIView`) : c'est une vue en bas de la section.
- `Cell` (`UITableViewCell`) : ce sont les vues qui contiennent les données de la liste. Chaque donnée est dans une cellule.

> **:warning:** Les `Header` et `Footer` sont optionnels. Vous n'êtes pas obligés d'en avoir.

Enfin, la Table View peut également avoir un header et un footer. À ne pas confondre avec les header et les footer des sections. Le header et le footer de la Table View sont respectivement tout en haut et tout en bas de la liste.

> **:warning:** De même, le footer et le header de la Table View sont optionnels. En fait, **le seul élément obligatoire dans une Table View, ce sont les cellules**. Sinon, la liste est vide !

> **:information_source:** Tous les footer et header dont j'ai parlé sont de type `UIView` donc vous pouvez mettre n'importe quelle vue dedans. Ils sont complètement customisables !

Enfin, il est important que vous fassiez la distinction entre `row` et `cell` :

- `row` représente le numéro de la ligne à laquelle on se trouve dans la section. Elle est de type `Int`.
- `cell` représente la vue, elle est de type `UITableViewCell` qui hérite comme toutes les vues de `UIView`.

Maintenant qu'on a dit tout ça : je vous remets le schéma, ça ne vous fera pas de mal ;) !

===> P2/P2C1_5.png //

##### Style de la Table View

Comme nous l'avons vu dans les exemples de liste au début de ce chapitre, la Table View peut prendre bien des aspects différents.

Mais vous devez savoir qu'il existe deux styles par défaut, `plain` et `grouped` que voici :

===> P2/P2C1_6.png //

En général, mais ce n'est pas obligatoire, on utilise le style `plain` pour des **données dynamiques** et `grouped` pour des **données statiques**.

> **:information_source:** Une liste contient des données dynamiques **si on ne peut pas prévoir à l'avance le contenu exact de la liste, car il est susceptible de varier**. C'est le cas d'une liste de contact ou de messages par exemple. À l'inverse, si on connaît à l'avance le contenu exact d'une liste, on dit qu'elle contient des données statiques. Elles ne bougeront pas. C'est le cas d'une liste de réglages ou d'un menu de navigation par exemple.

#### En résumé
- Une Table View (`UITableView`) permet d'afficher une liste en iOS. Cette liste peut avoir bien des aspects et des usages différents.
- Une Table View est organisée ainsi :

===> P2/P2C1_5.png //

- Une Table View peut prendre deux aspects : `grouped` ou `plain`.

Dans le prochain chapitre, nous allons installer notre Table View !

### Installez la Table View dans le Storyboard
C'est parti ! Nous allons rajouter notre Table View dans le storyboard !

#### Installation de la Table View
Pour cela, ouvrez le fichier Main.storyboard et allez chercher l'objet Table View dans la bibliothèque des objets.

===> P2/P2C2_1.png //

Et ensuite, glissez-le sur l'interface du `ListViewController` et redimensionnez-le pour qu'il prenne tout l'écran, vous devriez obtenir ceci :

===> P2/P2C2_2.png //

> **:information_source:** J'ai aussi rajouté des contraintes pour l'accrocher à chaque côté de l'écran.

Et voilà ! Vous avez une belle Table View dans votre application ! Bien sûr, si vous lancez votre application, vous risquez d'être déçu, car pour l'instant elle est vide, mais nous allons apprendre à la remplir dès le prochain chapitre.

Vous pouvez retrouver dans l'inspecteur d'attributs certaines propriétés dont nous avons parlé ensemble comme :

- `style` qui peut prendre les valeurs `grouped` ou `plain`
- `content` qui peut prendre les valeurs :
	- `Dynamic Prototypes` pour des données dynamiques
	- `Static Cells` pour des données statiques

===> P2/P2C2_6.png //

Je vous laisse jouer avec les attributs `separator` qui concernent la petite ligne grise de démarcation entre les cellules.

===> P2/P2C2_7.png //

> **:information_source:** Vous remarquez aussi dans cet inspecteur d'attribut que comme la plupart des vues dans lesquelles on peut défiler, `UITableView` hérite de `ScrollView`.

#### Fonctionnement de la Table View

Pour bien prendre en main la Table View, il faut comprendre comment elle fonctionne.

Comme vous le savez maintenant, une Table View, c'est simplement une liste de cellules organisée éventuellement en sections. Et **cette liste n'a pas de limite de tailles** !

Et c'est toute la magie des Table View ! Vous pouvez mettre 100 000 éléments dans la liste, ça ne posera pas de problème de performance. Votre iPhone supportera la charge.

Ce petit miracle de performance s'appuie sur une idée très simple.

Si vous voulez afficher par exemple 100 000 chansons dans une liste, il vous faut créer 100 000 vues qui affichent chacune une chanson différente. Le problème c'est que votre iPhone n'est pas capable de gérer 100 000 vues. Un objet `UIView` est particulièrement gourmand en capacité.

> **:question:** Mais tu as dit que les listes pouvaient contenir 100 000 éléments !

C'est vrai. En fait, une liste est capable de *gérer* 100 000 éléments, mais il n'est pas capable de créer que quelques dizaines de cellules. Mais ce n'est pas un problème ! De toute façon, on ne voit en même temps à l'écran qu'une dizaine de cellules.

Donc la Table View va créer suffisamment de cellules pour qu'il y en ait sur tout l'écran et ensuite, **il va les réutiliser** ! Lorsque vous allez faire défiler la liste vers le haut, la première cellule va disparaître. Pendant qu'elle n'est plus à l'écran, elle va être repositionnée en bas de la liste et ses données vont être modifiées. Ainsi la cellule affiche les données correspondantes à son nouvel emplacement.

Le schéma suivant résume cette idée :

===> P2/P2C2_5.png //

> **:information_source:** Pour information, cette liste est une [liste des films les mieux notés sur IMDB](https://www.imdb.com/search/title?groups=top_250&sort=user_rating).

Il faut donc bien que vous reteniez qu'une Table View n'est pas infinie ! Elle ne possède que quelques cellules dont le contenu est modifié et réutilisé dès qu'elles quittent l'écran.

> **:warning:** Bien sûr, si le défilement a lieu vers le bas, le cycle présent dans le schéma ci-dessus est inversé.

#### Un cousin de Table View
Je voudrais juste faire un petit aparté pour vous mentionner un cousin de Table View qui pourrait vous être utile. Il s'agit de `UICollectionView`.

===> P2/P2C2_3.png //

**Les Collection View sont des objets de l'interface qui permettent d'afficher des grilles**. Par exemple, l'application Photos de l'iPhone utilise les Collection View pour afficher la grille de photos.

===> P2/P2C2_4.png //

> **:information_source:** Nous ne verrons pas Collection View ensemble, car je pense que c'est très similaire à Table View. Donc si vous maîtrisez le premier, vous saurez apprendre à utiliser le second. Je voulais simplement que vous sachiez que cela existe pour pouvoir l'utiliser si vous en rencontrez le besoin.

#### En résumé
- On installe une Table View en la récupérant simplement depuis la bibliothèque des objets.
- La Table View réutilise ses cellules lorsqu'on l'a fait défiler de façon à ne gérer qu'un nombre réduit de cellules. Lorsqu'une cellule quitte l'écran, ses données sont modifiées et elle est repositionnée à l'autre extrémité de la liste.
- Lorsqu'on veut afficher une grille, on utilise plutôt Collection View.

Dans le prochain chapitre, nous allons mettre ensemble nos connaissances sur les protocoles et les Table View pour parler du delegate pattern !

### Appliquez le delegate pattern
Notre Table View est bien installée, mais pour l'instant, elle est complètement vide. Ça ne va pas durer ! Dans ce chapitre, je vais vous présenter le mécanisme qui va nous permettre de la remplir : le delegate pattern !

#### Présentation du delegate pattern

> **:information_source:** J'ai déjà fait une première présentation du delegate pattern dans [un chapitre](https://openclassrooms.com/courses/ajoutez-plusieurs-pages-a-votre-application-ios/remplissez-le-selecteur) d'un autre cours. N'hésitez pas à y jeter un oeil si vous souhaitez voir une approche différente. Ici, je vais plus m'appuyer sur votre compréhension des protocoles.

Commençons par faire un retour sur le MVC. Le MVC, pour l'instant, ça doit ressembler à ceci pour vous.

===> P2/P2C3_1.png //

Avec les outlets, le contrôleur peut donner à la vue les données dont elle a besoin pour s'afficher. Cette méthode fonctionne bien, mais a ses limites. Elle ne marche que pour de petites quantités de données.

Or, comme on l'a vu, une liste peut avoir des tonnes de données ! Et on ne va pas tout donner à la vue en lui demandant de se débrouiller avec. **La vue ne doit détenir que les données qui lui permettent de faire l'affichage, car c'est son seul rôle.**

Du coup, la vue va devoir demander régulièrement au contrôleur de lui donner de nouvelles données. À chaque fois que l'on fait défiler la vue, elle va réclamer de nouvelles données au contrôleur.

Le problème, c'est que ma tableView ne sait pas avec quel contrôleur elle va travailler. Ici nous utilisons notre `ListViewController` qui présente une liste de jouets, mais ailleurs nous pourrions en utiliser un autre qui fournit des listes de réglages, ou des listes de contact...

Pour faire fonctionner notre TableView on doit donc résoudre le problème suivant :

 1. Ma tableview doit pouvoir être informée de la composition de la liste par le contrôleur
 2. N'importe quel objet doit pouvoir faire ce travail, ma tableview se moque de savoir avec qui elle travaille, et cela me permet de la réutiliser dans de multiples situations

Pour résoudre ce double problème, on va utiliser le **delegate pattern**. On dit en effet que la tableView _délègue_ une partie de son fonctionnement à un autre objet.
Et au coeur du delegate pattern, on va voir ce que nous avons étudié dans la partie 1 : Un protocole !

**Le delegate pattern est une nouvelle méthode de communication aveugle entre la vue et le contrôleur.**

> **:information_source:** Et oui, si on dit aveugle, c'est grâce au protocole : ma vue va pouvoir demander des informations sans se soucier de savoir qui lui fournit. On retrouve l'aspect **modulaire** du code qu'on avait abordé en parlant des protocoles.

Et voici comment cela fonctionne :

1. On crée une liste de questions que la vue peut poser.
2. La vue nomme un objet son delegate, en l'occurrence notre contrôleur.
3. Le contrôleur s'engage à répondre aux questions sur la liste.
4. Le contrôleur répond effectivement aux questions.

#### Delegate pattern et protocoles

Détaillons maintenant ces 4 étapes en rentrant dans le détail du protocole.

##### 1. On crée une liste de questions que la vue peut poser.

La liste de questions est une liste d'exigences en fait. Donc ici on parle de **la création d'un protocole**. Pour `UITableView`, ce protocole se nomme `UITableViewDataSource,` car c'est la source de données.

```swift
protocol UITableViewDataSource: class {
	func numberOfSections(in tableView: UITableView) -> Int
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
	// (...)
}
```

> **:information_source:** Vous avez sans doute noté le petit mot réservé `class`. Il indique que notre protocole ne peut être adopté que par... des classes. Les struct et les enums ne pourront pas adopter ce protocole, et on verra bientôt pourquoi c'est important.

##### 2. La vue nomme un objet son delegate, en l'occurrence notre contrôleur.

`UITableView` a une propriété `dataSource` de type `UITableViewDataSource` :

```swift
class UITableView: UIScrollView {
	weak var dataSource: UITableViewDataSource?
}
```

Cette propriété est utilisée à l'intérieur de la classe `UITableView` pour appeler les méthodes du protocole au moment ou la Table View en a besoin. Comme promis, notre tableView se fiche bien de savoir que objet fera office de dataSource, elle a juste besoin de savoir qu'il répondra aux exigences de notre protocole.

> **:warning:** J'attire votre attention sur le fait qu'à ce stade, **il n'y a pas encore d'implémentations aux méthodes,** mais rien n'empêche de les appeler.

> **:information_source:** Encore un petit mot reservé que nous n'avons pas vu: `weak`. C'est lié au mot `class` qu'on a mis tout à l'heure, et c'est promis, vous aurez bientôt des explications sur ces nouveaux concepts.

Ensuite, cette propriété prend pour valeur le contrôleur :

```swift
class ViewController: UIViewController {

	var tableView: UITableView

    override func viewDidLoad() {
        super.viewDidLoad()
        // J'assigne le contrôleur comme valeur de la propriété dataSource.
        tableView.dataSource = self
    }
}
```

##### 3. Le contrôleur s'engage à répondre aux questions sur la liste.

Le contrôleur va ici adopter le protocole `UITableViewDataSource` :

```swift
class ViewController: UIViewController, UITableViewDataSource {
}
```

##### 4. Le contrôleur répond effectivement aux questions.

Le contrôleur implémente les méthodes de `UITableViewDataSource` :

```swift
class ViewController: UIViewController, UITableViewDataSource {
	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 10
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		// (...)
	}
}
```

Vous venez de découvrir un nouveau mode de communication aveugle entre la vue et le contrôleur :

===> P2/P2C3_2.png //

#### Mise en place du dataSource !

Mettons toute cette théorie en application dans notre code.

> **:information_source:** Dans les 4 étapes présentées précédemment, la première est la création d'un protocole et bien sûr, cette étape est déjà faîte par Apple. Donc nous allons commencer directement par la deuxième !

##### 2. La vue nomme un objet son delegate, en l'occurrence notre contrôleur.

Pour que la tableView nomme le contrôleur son dataSource, on peut faire de notre tableView un outlet de ListViewController et ensuite recopier le code que je vous ai donné au-dessus.

Mais nous allons faire encore plus simple en utilisant le control drag !

Faîtes un control drag dans le storyboard depuis la Table View vers le controller :

===> P2/P2C3_3.gif //

Et voilà, vous venez de nommer votre contrôleur, le dataSource de la Table View.

> **:information_source:** Les autres choix (`delegate` et `prefetchDataSource`) correspondent à deux autres protocoles qui utilisent eux aussi le delegate pattern. On parlera du premier (`delegate`) dans la troisième partie de ce cours.

##### 3. Le contrôleur s'engage à répondre aux questions sur la liste.

Comme on l'a vu à cette étape, nous allons faire adopter le protocole `UITableViewDataSource` à notre contrôleur `ListViewController` :

```swift
class ListViewController: UIViewController, UITableViewDataSource {}
```  

Lorsque vous faites adopter un protocole à une classe, je vous suggère d'utiliser une extension par protocole, donc on va légèrement modifier notre code comme ceci :

```swift
class ListViewController: UIViewController {}

extension ListViewController: UITableViewDataSource {}
```

> **:information_source:** Besoin d'un rappel, sur les extensions ? C'est [par ici](https://openclassrooms.com/courses/ajoutez-plusieurs-pages-a-votre-application-ios/allez-plus-loin-avec-les-extensions) !

##### 4. Le contrôleur répond effectivement aux questions.

Ensuite, nous allons implémenter les méthodes du protocole pour nous y conformer correctement. Nous n'allons en implémenter que trois. Car les autres sont optionnels.

> **:information_source:** Eh oui, au passage, sachez que vous pouvez signaler une exigence d'un protocole comme optionnel avec le mot clé optional :
>
> ```swift
> @objc protocol MonProtocole {
> 	optional func maMethodeOptionnelle()
> 	func maMethodeRequise()
> }
> ```
> Les exigences optionnelles ne fonctionnent que sur des protocoles Objective-C, d'où la présence du `@objc` devant mon protocole. En swift pur, ça n'est tout simplement pas possible de déclarer une fonction d'un protocole comme `optional`.

La première méthode que nous allons implémenter s'appelle `numbersOfSection` :

```swift
extension ListViewController: UITableViewDataSource {
	func numberOfSections(in tableView: UITableView) -> Int {
	    return 1
	}
}
```

Cette méthode permet de préciser à la Table View, le nombre de sections dont nous allons avoir besoin. Dans notre cas, nous ne voulons pas séparer notre code selon des sections donc nous allons simplement renvoyer 1 pour avoir une seule section.

La deuxième méthode se nomme `numbersOfRowsInSection` :

```swift
extension ListViewController: UITableViewDataSource {
	// (...)

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
	    return ToyService.shared.toys.count
	}
}
```

Elle permet de préciser le nombre de cellules que l'on veut pour chaque section. Dans notre cas, on veut autant de cellules que nous avons d'éléments dans notre tableau de jouet `toys`.

La troisième méthode va nous permettre de préciser le contenu de chaque cellule, mais je vous propose que l'on voie ça ensemble dans le prochain chapitre !

#### En résumé
- La delegate pattern est une communication aveugle entre la vue et le contrôleur. Elle s'organise en 4 étapes :
	1. On crée une liste de questions que la vue peut poser.
	2. La vue nomme un objet son delegate, en l'occurrence notre contrôleur.
	3. Le contrôleur s'engage à répondre aux questions sur la liste.
	4. Le contrôleur répond effectivement aux questions.
- La liste de questions est en fait un protocole auquel se conforme le contrôleur.
- Dans l'étape 2, on peut utiliser directement le control drag pour nommer le contrôleur le `dataSource`.

> **:information_source:** Dans ce chapitre, nous parlons de l'utilisation du delegate pattern en sautant l'étape 1. Pour comprendre cette mécanique en profondeur, je vous suggère d'essayer de créer un delegate pattern. [Cette vidéo](https://www.youtube.com/watch?v=DBWu6TnhLeY) détaille très bien cela.

Dans le prochain chapitre, nous allons remplir notre Table View en précisant le contenu de nos cellules !

### Remplissez la table view
Nous allons remplir notre Table View en précisant le contenu de nos cellules ! Ces cellules vont afficher les données de chaque jouet donc deux données :

- le nom du jouet
- sa marque

Et pour y parvenir, nous devons commencer par rajouter une cellule.

#### Ajouter une cellule dans le storyboard
Pour ajouter une cellule, rien de plus simple ! Choisissez `UITableViewCell` dans la bibliothèque des objets :

===> P2/P2C4_1.png //

Et glissez la cellule dans votre Table View :

===> P2/P2C4_2.png //

Votre Table View a maintenant une cellule, nous allons pouvoir travailler à partir de là !

> **:question:** Hé ! Mais on en a qu'une seule ! Il va nous en falloir beaucoup plus pour afficher toute une liste !

Hé non ! Souvenez-vous : les cellules sont réutilisées donc ici, on va juste définir le look d'une cellule type et ensuite, on réutilisera cette cellule plusieurs fois.

**Et pour pouvoir la réutiliser, il va falloir lui donner un identifiant.** Sélectionnez la cellule que vous venez de créer et donnez-lui l'identifiant suivant : `ToyCell`.

===> P2/P2C4_3.png //

> **:information_source:** Je vous recommande de définir des identifiants qui ont un rapport clair avec le type de données que la cellule va afficher.

#### Le style de notre vue

Notre cellule est bien configurée, maintenant nous allons pouvoir travailler son aspect.

Comme vous pouvez le voir dans l'inspecteur d'attribut, `UITableViewCell` a une propriété `style` qui permet de choisir parmi différents styles :

===> P2/P2C4_4.png //

Le style `custom` permet de choisir complètement l'aspect de la cellule. On fera ça dans la prochaine partie. Les 4 autres styles sont des styles prédéfinis que vous pouvez utiliser tels quels.

Le style `Basic` affiche un seul label, les autres en affichent deux selon différentes dispositions que vous pouvez voir ici :

===> P2/P2C4_5.png //

Nous voulons afficher deux informations donc je vous suggère de choisir un style parmi `Right Detail`, `Left Detail` et `Subtitle`.

#### Place aux données !

Maintenant que notre vue est configurée et toute belle, nous allons lui passer des données et cela a lieu dans la troisième méthode de `UITableViewDataSource` que nous n'avons pas encore implémentée. La voici :

```swift
extension ListViewController: UITableViewDataSource {
    // (...)

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    }
}
```

Cette méthode prend en paramètre un `IndexPath`. `IndexPath` est une structure très simple qui a deux propriétés :

- `section` : contient un numéro de section.
- `row` : contient un numéro de ligne.

Cette méthode renvoie une `UITableViewCell`. Donc le rôle de cette méthode est de construire la cellule qui va être affichée à la position précisée par `IndexPath`.

Implémentons cette méthode ! On va commencer par créer une cellule :

```swift
func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "ToyCell", for: indexPath)
}
```

La méthode `dequeueReusableCell` de `TableView` permet de récupérer la cellule qui se trouve à la position indiquée par `IndexPath` et qui a l'identifiant indiqué. Cet identifiant permet de récupérer la cellule que nous avons créée dans le storyboard.

Ensuite, nous allons modifier le contenu de cette cellule. Pour cela, il nous faut commencer par récupérer les données correspondant à cette cellule. Nous allons donc récupérer le jouet se trouvant au bon index dans notre tableau `toys` :

```swift
let toy = ToyService.shared.toys[indexPath.row]
```

`indexpath.row` donne la ligne à laquelle se trouve la cellule. Ainsi pour chaque ligne de la liste, on va afficher un jouet différent du tableau `toys`.

Il ne nous reste plus qu'à afficher ces données dans la cellule. Pour accéder aux deux labels contenus dans les styles par défaut, nous avons deux propriétés : `textLabel` et `detailTextLabel`. Nous allons modifier le texte de ces deux labels :

```swift
cell.textLabel?.text = toy.name
cell.detailTextLabel?.text = toy.brand
```

Je remplis les deux labels avec les données du jouet récupéré dans le tableau. Il ne me reste plus qu'à renvoyer la cellule et la fonction complète donne :

```swift
func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "ToyCell", for: indexPath)

    let toy = ToyService.shared.toys[indexPath.row]

    cell.textLabel?.text = toy.name
    cell.detailTextLabel?.text = toy.brand

    return cell
}
```

#### Charger les données

Le contrôleur répond maintenant à toutes les questions de la Table View. Il ne reste plus qu'une étape : initier le chargement des données dans la Table View.

Pour cela, il nous faut pouvoir accéder à une instance de notre Table View donc je vous propose de créer un Outlet et de le nommer `tableView`.

```swift
class ListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
}
```

Réfléchissons maintenant au moment où nous devons charger les données... L'idéal serait de recharger les données à chaque fois que nous revenons sur la page pour inclure les éventuels ajouts qui auraient pu avoir lieu.

Nous allons donc recharger nos données dans la méthode `viewWillAppear`.

> **:information_source:** Si vous ne comprenez pourquoi, je vous invite à (re)voir [ce chapitre](https://openclassrooms.com/courses/ajoutez-plusieurs-pages-a-votre-application-ios/analysez-le-cycle-de-vie-du-controleur).

La méthode qui permet de recharger les données s'appelle tout simplement `reloadData` :

```swift
override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    tableView.reloadData()
}
```

Et voilà ! Notre TableView va maintenant charger ses données à chaque fois que nous revenons sur la page.

Cette Table View est officiellement fonctionnelle ! Vous pouvez tester en lançant le simulateur et en ajoutant quelques données.

===> P2/P2C4_6.png // Tadaa !

#### En résumé
- On peut rajouter une cellule en la faisant glisser depuis la bibliothèque des objets vers la Table View.
- Il faut configurer la cellule dans le storyboard en lui donnant un identifiant unique.
- On peut choisir parmi 4 styles par défaut pour les cellules.
- On précise le contenu de la cellule avec la méthode `cellForRowAt` du protocole `UITableViewDataSource`.
- On lance le chargement des données avec la méthode reloadData de `UITableView`.

Dans la prochaine partie, nous allons ajouter plusieurs fonctionnalités à notre application : la gestion de plusieurs catégories, la possibilité de supprimer des messages, la création de cellules customisées et bien d'autres !

Et au passage, vous allez approfondir votre compréhension des Table View et des protocoles.

À tout de suite !

### Bonus : Découvrez le concept de références

> **:question:** Hop hop hop, tu ne voulais pas nous parler d'un truc important encore ?!

Ah si ! Quand je vous ai introduit le protocole `UITableViewDataSource`, on a d'une part limité ce protocole à des classes, en adossant `class` à la déclaration de notre protocole :

```swift
protocol UITableViewDataSource: class {
	// (...)
}
```

Et dans notre tableView, je vous ai dit qu'on avait notre objet `dataSource`, mais avec le mot réservé `weak`:

```swift
class UITableView: UIScrollView {
	weak var dataSource: UITableViewDataSource?
}
```

Alors, pourquoi est-ce qu'on a fait tout ça, et qu'est-ce que ça veut dire ? On va rapidement toucher au monde des **références** pour comprendre tout ça.

#### Les références

Dans les languages de programmation un peu modernes (comme Swift !), les objets que vous crééez restent dans la mémoire tant qu'au moins une référence existe vers cet objet.

Quand mon objet n'a plus aucun autre objet qui n'a de référence sur lui, pouf ! Il disparaît ! Sous iOS, la technologie qui fait tout ça s'appelle Automatic Reference Counting (ARC).

Dans d'autres languages, on parle de _Garbage collector_ pour désigner cette technologie : le programme nettoie la mémoire en enlevant les objets qui ne servent plus à rien. Et comment sait-on qu'un objet ne sert plus à rien ? Quand il n'a plus de références ! Dans ce cas, mon programme n'a plus aucun moyen d'accéder à cet objet, et il est considéré comme **perdu**.

**Tout ça ne s'applique qu'aux classes, les structures et les enums ne sont pas concernées.** D'où le petit mot `class` dans la déclaration de notre protocole, qui permet de garantir que seule une classe pourra adopter ce protocole.

Voilà un example d'une application simple qui contient une *Table View* et un bouton :

===> P2/P2C4_7.png //

> **:information_source:** Les flèches en noir représentent des références

Ici, ma Table View et mon bouton restent bien dans la mémoire puisque j'ai au moins un objet qui les référence, mon ViewController. Et celui-ci reste aussi dans la mémoire, puisqu'il a aussi une référence... Et ainsi de suite.

> **:question:** Ok, mais tout ça ne me dit pas ce que c'est une référence !

Une référence, c'est très simple ! Quand j'écris ceci :

```swift
class ListViewController: UIViewController {
	var tableView: UITableView
}
```

Je créé une référence de mon `ListViewController` vers ma propriété `tableView`. Tant que mon contrôleur est dans la mémoire (et généralement il y reste tant qu'il est présent dans ma navigation), ma Table View sera là aussi. C'est bien rassurant finalement !

#### Le mot-clé weak

Si on reprend notre example de delegate de tout à l'heure, ma Table View s'écrit comme ça si j'enlève ce fameux mot `weak`:

```swift
class UITableView: UIScrollView {
	var dataSource: UITableViewDataSource?
}
```

Du coup en terme de réference, quand j'écris après dans mon viewController `tableView.dataSource = self`, ça donne ça :

===> P2/P2C4_8.png //

Et là, c'est le drame. 😱😱😱

> **:question:** Pourquoi c'est le drame ?

Parce que sans faire attention, j'ai créé un **retain cycle**. En fait chaque objet a une référence vers l'autre. Même si mon View Controller n'est plus dans la navigation, et qu'aucun objet n'a de référence vers lui, le couple View Controller <> Table View ne disparaitra jamais car chacun a au moins une référence, celle de l'autre objet du couple. Ce qui créé finalement une _fuite mémoire_.

> **:question:** Mon Dieu, mais qu'est-ce qu'on va faire ??!

Pas de panique ! Vous l'aurez sans doute compris, c'est là que le mot `weak` entre en jeu ! Pour comprendre `weak`, on va d'abord regarder ce que fait son contraire: `strong`.

Par défaut, quand je déclare une propriété sur un objet de type `Objet`:

```swift
var monObjet: Objet
```

C'est en fait équivalent à écrire :

```swift
strong var monObjet: Objet
```

Ma référence vers mon instance de `Objet` doit être **forte** pour maintenir mon objet dans la mémoire. Quand le nombre de références fortes vers mon objet tombe à zéro, il n'y a plus rien pour le garder dans la mémoire et c'est là qu'il disparaît.

Du coup, quand je prépose `weak` à la déclaration de ma variable, j'indique que je veux une référence faible. Et au contraire d'une référence forte, une référence faible ne retient pas mon objet dans la mémoire ! Je peux accéder à mon objet dans la mémoire, mais ce n'est pas moi qui le retiendrai je ne vais pas le retenir s'il doit disparaître.

> **:information_source:** Autrement dit, lorsque ARC compte les références pour savoir si un objet doit être supprimé de la mémoire. Il ne compte que les références fortes, les faibles ne comptent pas.

Si on reprend notre schéma de tout à l'heure, avec la déclaration en weak, ça donne ça:

===> P2/P2C4_9.png //

Et voilà le travail, le mot weak permet de briser ce fameux **retain cycle** ! Quand mon contrôleur ne sera plus dans la navigation, et qu'il n'aura plus de référence vers lui, ma `tableView` ne l'empêchera pas d'être enlevé de la mémoire.

#### Retour sur les outlets

> **:question:** Ouais, mais on me la fait pas, ton schéma est faux, nous on a déclaré notre tableView avec un IBOutlet et avec le mot clef `weak`.

C'est vrai, quand on déclare un Outlet avec `weak`, en théorie notre objet ne devrait même pas pouvoir rester dans la mémoire puisqu'il n'y a aucune référence `strong` pour le retenir, non ?

Bien sûr, c'est faux, puisque sinon nos apps ne fonctionneraient pas depuis le début héhé.

Alors, qu'est-ce qu'il se passe au juste en réalité ? Et bien pour ça, il suffit de se souvenir que tout bon `UIViewController` gère une vue principale. Et si on reprend notre schéma, dans la réalité, on a ça:

===> P2/P2C4_10.png //

La vue principale maintient un lien fort sur l'ensemble de ses sous-vues via la propriété `subviews`. Et tant que mon contrôleur est présent, il maintient aussi un lien fort sur sa vue principale via la propriété `view`. Donc ma `tableView` reste bien dans la mémoire.

**On déclare donc nos outlets en `weak` pour éviter une redondance, ou pour éviter des problèmes si on créé des liens entre objets qui n'ont rien à voir !** Depuis le temps qu'on déclare des outlets, ça devait vous démanger de ne pas savoir non ? :)

Si tout ça vous paraît compliqué, pas de panique. Retenez simplement le concept de retain cycle, et que si deux objets s'auto-référencent, vous allez avoir des problèmes de mémoire. Lorsque vous créérez vos propres delegates, pensez à les indiquer en `weak` pour éviter ce problème, et tout ira bien !

#### En résumé
- Un objet reste dans la mémoire tant qu'au moins une référence **forte** existe vers cet objet.
- Si deux objets s'auto-référencent avec des références fortes, cela créé un **retain cycle**: mes objets ne peuvent plus être nettoyés de la mémoire.
- le mot réservé `weak` permet de résoudre ce problème : les références dites **faibles** ne comptent pas lorsque le programme détermine si l'objet est encore utile ou pas.
- On déclare un `delegate` en `weak` pour éviter de créer un cycle de rétention et du coup une fuite mémoire.
- Les propriétés avec des `IBOutlets` sont déclarées en `weak`: en général l'objet aura déjà une référence forte interne et en rajouter une autre ne servira pas.

## Améliorez la Table View

### Gérez des collections hétérogènes avec les protocoles

Bienvenue dans cette troisième partie ! Dans cette partie, nous allons améliorer les fonctionnalités de notre Table View. Et dans ce chapitre, nous allons commencer par l'ajout de plusieurs catégories de cadeaux.

> **:information_source:** Pour cela, j'ai un petit peu amélioré l'application pour vous faire gagner du temps. Je vous invite à télécharger le projet revisité [ici](https://s3-eu-west-1.amazonaws.com/static.oc-static.com/prod/courses/files/Parcours+DA+iOS/Cours+9+-+Table+View/Whishmas+-+Part+3+Starter.zip).

#### Quoi de neuf ?

Je vous propose de prendre quelques minutes pour parcourir les petits changements que j'ai apportés au projet pour que vous ne soyez pas perdus pour la suite.

La principale modification est l'ajout de la possibilité de créer des objets dans la liste **de trois catégories différentes** :

- Voyage (*Trip*)
- Livre (*Book*)
- Jouet (*Toy*)

Pour cela, j'ai ajouté une page qui permet de choisir la catégorie et qui redirige vers trois pages différentes, une pour chaque catégorie d'objet à créer.

Voilà ce que ça donne dans le détail :

##### Vue

Dans le fichier `Main.storyboard`, vous pouvez voir les nouvelles interfaces que je viens de mentionner. Il n'y a rien de très compliqué ici.

===> P3/P3C1_1.png //

#### Modèle
J'ai ajouté dans le modèle deux autres structures pour nos nouvelles catégories `Trip` et `Book`.

```swift
//  Trip.swift
struct Trip {
    var departure = ""
    var destination = ""
    var durationInDays = 0
}

//  Book.swift
struct Book {
    var title = ""
    var author = ""
}

```

> **:information_source:** `Toy` et `ToyService` n'ont pas changé.

#### Contrôleur
1/ `ListViewController` a à peine changé. J'ai juste rajouté une méthode pour avoir un *unwind segue*.

```swift
@IBAction func unwindToListVC(segue: UIStoryboardSegue) {}
```

> **:information_source:** Besoin d'un rappel sur les *unwind segue* ? C'est par [là](https://openclassrooms.com/courses/ajoutez-plusieurs-pages-a-votre-application-ios/revenez-en-arriere#/id/r-5063654) !

2/ Dans le même esprit, j'ai à peine changé le code `ToyViewController`, maintenant il utilise directement l'unwind segue pour revenir directement à la liste lors de l'appui sur le bouton `save` :

```swift
@IBAction func save() {
	// (...)

    performSegue(withIdentifier: "toyToListUnwind", sender: nil)
}
```

3/ J'ai rajouté deux contrôleurs `TripViewController` et `BookViewController` qui permettent respectivement de gérer les pages de création d'un objet `Trip` et `Book`. Ils sont extrêmement similaires à `ToyViewController`.

La seule grosse différence, c'est que je n'ai pas su comment ajouter des `Book` ou des `Trip` à notre liste, car ils ne sont pas du type `Toy`. Donc nous allons faire ça ensemble.

4/ Enfin, par acquit de conscience, j'ai ajouté un `CategoryViewController,` mais qui est vide, car toute la navigation est faite dans le storyboard directement.

#### Une liste hétérogène

Maintenant que nous avons notre projet bien en main, attaquons la suite ! Notre objectif est de rajouter dans la liste nos objets `Trip` et `Book` qui pour l'instant ne sont pas gérés.

Le problème, c'est qu'il faut donc créer un tableau avec trois types différents : `Toy`, `Book` et `Trip`. Et comme vous le savez, ce n'est pas possible... sauf si vous avez bien suivi la partie 1 de ce cours !

> **:question:** On va utiliser les protocoles !

Bien ! Je vois que certains suivent... ou font semblant ;) ! Nous allons en effet utiliser les protocoles.

Nous allons créer un protocole `Present` qui va nous permettre de regrouper nos trois types d'objets derrière un même type.

> **:information_source:** Je vous invite à faire ça dans un fichier `Present.swift` à part.

```swift
protocol Present {}
```

Pour l'instant, nous n'avons pas besoin de préciser les exigences de ce protocole, on veut juste un type.

Maintenant, nous allons faire adopter le protocole à nos trois types :

```swift
// Trip.swift
extension Trip: Present {}

// Book.swift
extension Book: Present {}

// Toy.swift
extension Toy: Present {}
```

> **:information_source:** Comme d'habitude, dès que j'adopte un protocole, je prends le réflexe de le faire avec une extension pour avoir une organisation claire de mon code.

Désormais, nos trois types adoptent `Present` et donc peuvent être regroupés derrière ce nouveau type.

Nous pouvons maintenant modifier notre classe `ToyService` pour utiliser `Present` :

```swift
// AVANT
class ToyService {
    static let shared = ToyService()
    private init() {}

    private(set) var toys = [Toy]()

    func add(toy: Toy) {
        toys.append(toy)
    }
}

// APRÈS
class PresentService {
    static let shared = PresentService()
    private init() {}

    private(set) var presents = [Present]()

    func add(present: Present) {
        presents.append(present)
    }
}
```

Ma liste est maintenant une liste de cadeaux (`presents`) et non de jouets. Et pour être cohérent, j'ai décidé de modifier le nom de ma classe en `PresentService`.

> **:information_source:** Lorsque vous modifiez le nom d'une classe, pensez à modifier le nom du fichier correspondant.

Nous allons maintenant utiliser cette classe dans nos trois contrôleurs d'ajout d'objets.

```swift
//  TripViewController.swift
@IBAction func save() {
	// (...)
    let trip = Trip(departure: departure, destination: destination, durationInDays: Int(daysStepper.value))
    PresentService.shared.add(present: trip)
	// (...)
}

//  BookViewController.swift
@IBAction func save() {
	// (...)
    let book = Book(title: title, author: author)
    PresentService.shared.add(present: book)
	// (...)
}

//  ToyViewController.swift
@IBAction func save() {
	// (...)
	let toy = Toy(name: name, brand: brand)
	PresentService.shared.add(present: toy)
	// (...)
}
```

Et voilà ! Nous avons réussi à remplir notre liste avec des objets de types différents en utilisant un protocole !

#### Ajouter des exigences

> **:question:** Hé, mais j'ai des erreurs dans mon code !
>
> ===> P3/P3C1_2.png //

Ah oui... J'ai oublié `ListViewController`. [La boulette](https://www.youtube.com/watch?v=au0ZMqyoWwg) ! Cette classe utilise toujours `ToyService` que nous venons de remplacer par `PresentService`.

Ce n'est pas grave, ce n'est qu'un petit changement rapide, faisons-le !

```swift
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return PresentService.shared.presents.count
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "ToyCell", for: indexPath)

    let present = PresentService.shared.presents[indexPath.row]

    cell.textLabel?.text = present.name
    cell.detailTextLabel?.text = present.brand

    return cell
}
```

> **:question:** Mais j'ai encore des erreurs !
>
> ===> P3/P3C1_3.png //

Décidément, je ne suis pas réveillé... En effet, notre type `Present` n'a pas de propriété `name` ou `brand`. Il n'a d'ailleurs pas de propriété du tout. Or on va en avoir besoin pour remplir notre cellule.

On va donc rajouter deux propriétés à notre protocole `Present` :

```swift
protocol Present {
    var description: String { get }
    var detail: String { get }
}
```

Ces deux propriétés vont nous permettre d'afficher deux informations sur chaque label de notre cellule :

```swift
cell.textLabel?.text = present.description
cell.detailTextLabel?.text = detail
```

Et avant que vous me tombiez dessus avec de nouvelles erreurs, j'anticipe ;) : maintenant que nous avons rajouté des exigences à notre Protocole, il faut que nos trois objets s'y conforment.

L'objectif ici est de répondre à la question : que veut dire `description` et `detail` pour `Trip`, `Book` et `Toy` ?

```swift
//  Trip.swift
extension Trip: Present {
    var description: String {
        return departure + " - " + destination
    }
    var detail: String {
        return "\(durationInDays) Days"
    }
}

//  Book.swift
extension Book: Present {
    var description: String {
        return title
    }
    var detail: String {
        return author
    }
}

//  Toy.swift
extension Toy: Present {
    var description: String {
        return name
    }
    var detail: String {
        return brand
    }
}
```

PAUSE ! Il faut admirer ce que vous venez de faire. **Vous avez créé ce qu'on appelle une interface**. Votre Table View peut maintenant manipuler un objet `Present` qui a deux propriétés très claires alors qu'en fait, se cachent derrière trois types qui ont des propriétés très différentes les unes des autres. `Present` est donc bien une interface entre les trois types d'un côté et `ListViewController` de l'autre.

===> P3/P3C1_4.png //

Cette méthode est extrêmement utile pour supprimer la dépendance d'une classe envers une autre. Ici, `ListViewController` ne connaît même pas l'existence de `Trip`, `Book` et `Toy,` car il n'en a pas besoin. Il n'a accès qu'au minimum d'informations que lui fournit `Present`.

#### En résumé
- Les protocoles permettent de gérer des collections de types hétérogènes.
- Les protocoles permettent de créer des interfaces qui peuvent uniformiser des types diversifiés afin de rendre leur utilisation plus simple et d'en supprimer la dépendance.

Dans le prochain chapitre, nous allons sortir nos pinceaux pour magnifier nos cellules qui pour l'instant gâchent un peu la beauté de notre interface !

### Créez une cellule customisée
Dans ce chapitre, nous allons modifier l'aspect de nos cellules pour qu'elles soient plus belles. L'objectif est le suivant :

===> P3/P3C2_1.png //

Vous allez voir que ces cellules sont particulièrement flexibles et c'est ce qui fait une bonne partie de la puissance des Table View. Vous allez donc la plupart du temps travailler avec des cellules de votre création.

#### Design dans le storyboard

Nous allons commencer par revoir le design directement dans le storyboard.

##### Couleur de fond

Démarrons avec la couleur de fond de notre Table View. Choisissez la Table View et modifiez la couleur de fond dans l'inspecteur d'attributs (comme d'habitude dans la section *View*).

===> P3/P3C2_2.png //

##### Séparateurs

Notre nouveau design nous permet de nous passer des séparateurs proposés par défaut dans une Table View, je vous suggère de supprimer ces séparateurs. Pour cela, sélectionnez la Table View et passez le paramètre *Separator* à *None* dans l'inspecteur d'attributs.

===> P3/P3C2_2_bis.png //

##### Taille de la cellule

Nous allons maintenant agrandir la taille de la cellule. Pour cela, sélectionnez la cellule et rendez-vous dans l'inspecteur de taille. Vous pouvez passer le paramètre *Row Height* à 90 :

===> P3/P3C2_3.png //

##### Couleur de fond de la cellule

Comme vous pouvez le voir dans la hiérarchie des vues, la cellule a une Content View. C'est cette view qui, comme son nom l'indique, *contient* l'ensemble des vues qui seront affichées dans la cellule.

===> P3/P3C2_4.png //

Cette vue est simplement de type `UIView`. Je vous invite à changer sa couleur pour qu'elle soit verte et se fonde avec la couleur de fond de la Table View. Cela va nous permettre de voir le fond vert de la Table View et obtenir l'effet désiré.

##### Contenu de la cellule
Ça y est ! Nous allons nous attaquer au design de la cellule en elle-même. Pour cela, il faut d'abord changer le style de la vue à custom dans l'inspecteur d'attribut.

===> P3/P3C2_5.png //

Regardons un peu le résultat que l'on souhaite obtenir :

===> P3/P3C2_6.png //

Il y a donc 4 vues :

- Une vue blanche avec un effet ombrée qui ne prend pas tout à fait tout le contenu de la cellule.
- Une icône qui dépend de la catégorie de l'élément.
- Un label de titre
- Un label de détail

Je vous invite à rajouter tout cela dans la cellule et à créer les contraintes nécessaires. Il n'y a rien de particulier ici. Voici ce que ça donne pour moi :

===> P3/P3C2_7.png //

#### Création d'une sous-classe
Maintenant que notre cellule est toute belle, il va falloir l'utiliser ! Pour cela, il faut que l'on puisse modifier les labels et l'image que nous avons ajoutés manuellement dans la cellule.

Le problème, c'est que `UITableViewCell` ne connaît pas ces vues que nous avons ajoutées.

Alors, comment faire ? La solution est simple, nous allons créer une sous-classe de `UITableViewCell` et lui ajouter nos vues sous forme de propriétés.

##### Création de la classe
Créez un nouveau fichier <keyboard>cmd + n<keyboard> et choisissez *Cocoa Touch Class* :

===> P3/P3C2_8.png //

Ensuite, choisissez de créer une sous-classe de `UITableViewCell`. Puis nommez la `PresentTableViewCell` (car elle va servir à afficher des cadeaux) :

===> P3/P3C2_9.png //

Et enregistrez le fichier dans votre dossier `View`. Vous devriez obtenir un fichier `PresentTableViewCell.swift` qui contient ceci :

```swift
import UIKit

class PresentTableViewCell: UITableViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
```

Dans ce fichier, on vous propose de faire l'override de deux méthodes de `UITableViewCell` :

- `awakeFromNib` : cette méthode est utilisée lorsqu'une vue est initialisée depuis un storyboard. C'est ici que vous pouvez customiser votre cellule. Par exemple, dans notre cas, nous allons rajouter une ombre sur notre vue blanche.
- `setSelected` : cette méthode vous permettra de modifier l'aspect selon l'état de la vue : sélectionnée ou non. Nous n'en aurons pas besoin, donc vous pouvez supprimer cette méthode.

> **:information_source:** Dans ce cours, on n'abordera pas la sélection d'une cellule, mais vous devez savoir qu'une cellule peut être sélectionnée dans une Table View. Par exemple dans une liste d'emails, vous pouvez sélectionner l'un d'entre eux pour accéder à l'email complet. Si vous voulez apprendre à gérer la sélection d'une cellule, je vous recommande [ce tutoriel rapide](https://www.simplifiedios.net/ios-tableview-tutorial-handling-clicks/).

##### Connexion avec le storyboard
Maintenant, il nous faut modifier le type de notre cellule pour lui dire que désormais elle utilise le type `PresentTableViewCell`. Pour cela, sélectionnez la cellule dans le storyboard, allez dans l'inspecteur d'identité et modifiez sa classe :

===> P3/P3C2_10.png //

> **:information_source:** Pour être cohérent, je vous suggère de modifier aussi son identifiant dans l'inspecteur d'attributs.
>  
> ===> P3/P3C2_11.png //
>
> N'oubliez de reporter la modification dans votre code :
>
> ```swift
> let cell = tableView.dequeueReusableCell(withIdentifier: "PresentCell", for: indexPath)
> ```

Nous allons maintenant connecter les différentes vues de notre cellule à notre nouvelle classe pour pouvoir les modifier comme nous le souhaitons. Pour cela, il suffit de créer des outlets entre les vues et notre classe. Vous savez faire, voici à quoi doit ressembler notre classe ensuite :

```swift
class PresentTableViewCell: UITableViewCell {
    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var whiteView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
```

##### Implémentation de la classe

Maintenant que notre classe est connectée, nous allons l'implémenter ! Je vous propose de commencer par rajouter notre petite ombre :

```swift
override func awakeFromNib() {
    super.awakeFromNib()
    addShadow()
}

private func addShadow() {
    whiteView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.7).cgColor
    whiteView.layer.shadowRadius = 2.0
    whiteView.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
    whiteView.layer.shadowOpacity = 2.0
}
```

> **:information_source:** Si vous ne comprenez pas ce morceau, ce n'est pas le plus important. Il permet juste de rajouter une ombre à notre vue blanche. Je vous suggère [ce tutoriel](https://spin.atomicobject.com/2017/07/18/swift-interface-builder/) qui vous montre comment ajouter vos ombres directement dans le storyboard.

Maintenant que ce petit détail de design est réglé, nous allons pouvoir configurer notre cellule. L'objectif ici est de créer une méthode que nous pourrons utiliser dans notre contrôleur pour configurer le contenu de notre cellule. Il faut configurer trois choses :

- le texte de nos deux labels
- l'icône que nous voulons afficher

Pour cela, nous allons créer la méthode `configure` suivante :

```swift
func configure(withIcon: String, title: String, subtitle: String) {
    iconView.image = UIImage(named: icon)
    titleLabel.text = title
    subtitleLabel.text = subtitle
}
```

Et voilà notre cellule customisée est tout prête ! Il ne nous reste plus qu'à l'utiliser dans le contrôleur.

#### Utilisation de PresentTableViewCell dans le contrôleur      

Nous allons modifier notre méthode `cellForRow` qui pour l'instant ressemble à ceci :

```swift
func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "PresentCell", for: indexPath)

    let present = PresentService.shared.presents[indexPath.row]

    cell.textLabel?.text = present.description
    cell.detailTextLabel?.text = present.detail

    return cell
}
```

Pour commencer, nous allons vérifier que notre cellule est bien du type `PresentTableViewCell`:

```swift
guard let cell = tableView.dequeueReusableCell(withIdentifier: "PresentCell", for: indexPath) as? PresentTableViewCell else {
    return UITableViewCell()
}
```

Si ce n'est pas le cas, on renvoie une cellule standard.

Maintenant qu'on sait qu'on à affaire à une `PresentTableViewCell`, on va pouvoir utiliser notre méthode `configure` :

```swift
let present = PresentService.shared.presents[indexPath.row]
cell.configure(withIcon: "À FAIRE", title: present.description, subtitle: present.detail)
```

Vous noterez ici que je ne me suis pas encore occupé de l'icône. Le problème, c'est que notre protocole `Present` n'a pas de propriété `icon` qui contiendrait le nom d'une image.

Nous allons régler ça tout de suite :

```swift
protocol Present {
    var description: String { get }
    var detail: String { get }
    var icon: String { get }
}
```

Il faut maintenant que nos trois types `Trip`, `Book` et `Toy` se conforment à cette nouvelle exigence. Pour cela, vous pouvez remarquer dans les assets du projet que j'ai rajouté pour vous trois images nommées respectivement `TripIcon`, `BookIcon` et `ToyIcon`.

C'est ce que nous allons utiliser :

```swift
extension Trip: Present {
	// (...)
    var icon: String { return "TripIcon" }
}

extension Book: Present {
	// (...)
    var icon: String { return "BookIcon" }
}

extension Toy: Present {
	// (...)
    var icon: String { return "ToyIcon" }
}
```

Et maintenant nous pouvons finaliser notre méthode `configure` :

```swift
cell.configure(withIcon: present.icon, title: present.description, subtitle: present.detail)
```

Et voilà ! Nous avons maintenant une cellule toute belle ! Je vous invite à lancer votre application dans le simulateur et admirer le résultat.

===> P3/P3C2_12.png // Tadaa !

#### En résumé
Pour créer une cellule customisée, vous devez :

- Designez votre cellule dans le storyboard.
- Créer une sous-classe de `UITableViewCell`.
- Connecter cette sous-classe à votre cellule dans le storyboard.
- Créer les outlets dont vous avez besoin.
- Créer une méthode qui vous permette de configurer facilement votre cellule.
- Utiliser votre nouvelle classe et sa méthode de configuration dans votre contrôleur.

Dans le prochain chapitre, nous allons apprendre à supprimer des éléments de votre liste.

### Supprimez une cellule
Notre liste est maintenant belle en plus d'être fonctionnelle ! Mais il y a un petit truc qui me chagrine et vous allez voir tout de suite de quoi je parle avec cette image.

===> P3/P3C3_1.png //

Un petit malin m'a piqué mon téléphone et s'est amusé à écrire n'importe quoi dans ma liste. Or pour l'instant, on ne peut pas supprimer les éléments de notre liste. On va changer ça dans ce chapitre.

#### Un deuxième delegate

Pour y arriver, nous allons revenir sur le delegate pattern. Vous vous souvenez, dans la partie précédente, nous avons utilisé le delegate pattern avec le protocole `UITableViewDataSource` pour remplir notre Table View.

**Il existe un autre protocole qui utilise le delegate pattern** et il se nomme `UITableViewDelegate`. Il fonctionne exactement comme `UITableViewDataSource,` mais son rôle est différent :

- `UITableViewDataSource` permet de **fournir les données** à la Table View.
- `UITableViewDelegate` permet de **gérer certaines actions** de la Table View comme la sélection des cellules, la suppression de cellules, la réorganisation de la liste ou la configuration des différents header et footer et d'autres.

C'est donc avec `UITableViewDelegate` qu'on va pouvoir supprimer des cellules de notre liste !

> **:information_source:** `UITableViewDelegate` est pas mal lié à des évènements qui peuvent avoir lieu sur la liste. Dès qu'un évènement a lieu, la Table View passe par son delegate pour demander quoi faire. C'est la raison pour laquelle en iOS, les méthodes d'un delegate commencent souvent par des mots comme *should*, *can*, *will*, *did*, etc.

Il ne nous reste plus qu'à implémenter ce delegate. Je vous redonne les 4 étapes de la création du delegate pattern :

1. On crée une liste de questions que la vue peut poser.
2. La vue nomme un objet son delegate, en l'occurrence notre contrôleur.
3. Le contrôleur s'engage à répondre aux questions sur la liste.
4. Le contrôleur répond effectivement aux questions.

> **:warning:** La première est faite, il s'agit du protocole `UITableViewDelegate`. Je vous invite à essayer de faire par vous même les deux suivantes. C'est exactement pareil que dans la partie précédente. Je vous donne la correction juste en dessous.

On va utiliser le storyboard avec un control drag depuis la Table View vers le contrôleur pour nommer le contrôleur delegate de la Table View.

===> P3/P3C3_2.gif //

Ensuite, il faut que le contrôleur adopte le protocole. Et nous allons faire ça comme d'habitude avec une extension :

```swift
extension ListViewController: UITableViewDelegate {
}
```

Dans cette extension, nous allons pouvoir maintenant ajouter les méthodes de notre delegate.

#### Implémentation de la méthode

Voici à quoi ressemble la méthode qui permet de gérer l'édition et donc la suppression d'une cellule :

```swift
func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
```

Cette méthode prend en paramètre `editingStyle` qui est une énumération qui contient les différents styles d'éditions (`none`, `insert`, `delete`). Ici c'est bien sûr `delete` qui va nous intéresser. Et en deuxième paramètre, vous avez l'index de la cellule qui subit l'édition.

Pour implémenter cette méthode, on va commencer par se placer dans le cas d'édition qui nous intéresse : la suppression.

```swift
func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
    if editingStyle == .delete {
    }
}
```

Maintenant nous allons pouvoir gérer la suppression. Et pour cela, il y a une règle que vous devez suivre, sans quoi votre code va planter :

> **On supprime d'abord les données correspondant à la cellule puis on supprime la cellule.**

Autrement dit, dans notre cas, il faut d'abord supprimer l'élément dans notre tableau `presents` puis on supprimera la cellule.

> **:information_source:** L'idée, c'est que les données et la Table View doivent **toujours rester synchronisés**.


Pour cela, nous allons rajouter la méthode `removePresent` dans notre classe `PresentService` :

```swift
class PresentService {
	// (...)
    func removePresent(at index: Int) {
        presents.remove(at: index)
    }
}
```

Maintenant, nous allons l'utiliser dans notre méthode d'édition de la Table View :

```swift
func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
    if editingStyle == .delete {
        PresentService.shared.removePresent(at: indexPath.row)
    }
}
```

On utilise ici `indexPath.row` pour supprimer le bon élément du tableau. Et enfin, pour supprimer la cellule, on utilise la méthode `deleteRows` de `UITableView` :

```swift
func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
    if editingStyle == .delete {
        PresentService.shared.removePresent(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }
}
```

Cette méthode prend en paramètre un tableau des index des cellules à supprimer. C'est pourquoi on lui passe un tableau contenant un seul élément : l'index de la cellule à supprimer. Le deuxième argument est une énumération de type `UITableViewRowAnimation` qui permet de choisir parmi différents styles de suppression de la cellule.

Et voilà ! Ces quelques lignes de code suffisent à ajouter la fonctionnalité désirée. Si vous lancez le simulateur et que vous glissez une cellule vers la gauche, vous devriez obtenir ceci :

===> P3/P3C3_3.png //

En glissant la cellule jusqu'au bout à gauche ou en cliquant sur *Delete*, la cellule est supprimée de la liste.

#### En résumé
Pour ajouter la fonctionnalité de suppression à vos listes, il faut :

- Utiliser le delegate pattern avec `UITableViewDelegate`
- Implémenter la méthode `tableViewCommitEditingStyleForRowAtIndexPath`  

### Conclusion

Bravo ! Si vous en êtes arrivés jusque là, c'est que vous êtes maintenant des maîtres de la Table View et des protocoles.

Ne laissez pas tomber ces compétences, comme je vous l'ai dit, les listes sont partout et vous serez très vite confronté à leur utilisation, quelle que soit l'application que vous allez créer.

#### En résumé

On a parlé ensemble des protocoles. Les protocoles sont une notion finalement assez simple de Swift, mais qui peut perturber au démarrage, car le concept est assez éloigné des classes et structures que vous avez vues jusqu'à présent.

Souvenez-vous d'une seule chose, **un protocole n'est qu'une liste d'exigences**. De tout ce qu'on a vu ensemble, les protocoles, c'est le sujet que je veux que vous reteniez. Certains développeurs ont peur de s'y frotter et restent bien au chaud dans leur orienté objet. Ne soyez pas de ceux-là, car les protocoles sont très puissants en Swift, à tel point que beaucoup parlent de Swift comme le premier langage orienté protocole.

> **:information_source:** Je vous redirige vers cette [excellente vidéo d'Apple](https://developer.apple.com/videos/play/wwdc2015/408/) sur l'orienté protocole. Vous ne pouvez pas passer à côté.

Ensuite, vous avez appris à créer et gérer des Table View. Je ne vais pas réinsister sur l'omniprésence de ce composant en iOS, mais vous venez de rajouter un gros outil dans votre caisse. Vous allez tellement en avoir besoin que je sais que vous allez le maîtriser sans problème.

Je vous suggère, du coup, de ne pas vous concentrer sur les Table View, mais de vous assurer que avez bien compris le principe du delegate pattern. Les Table View n'en sont qu'une application après tout. La seule difficulté est là donc relisez les chapitres sur le sujet et documentez-vous jusqu'à ce que vous soyez convaincu que ce pattern est maîtrisé, car il est l'un des plus répandus en iOS.

#### Et maintenant ?

Pour la suite, je vous suggère de vous reprendre vos projets précédents avec un oeil neuf. Entraînez-vous à modifier votre code pour prendre appui sur les protocoles dès que vous le pouvez. Essayez par exemple de remplacer vos classes et vos héritages par des structures et des protocoles.

Par ailleurs, si vous souhaitez mettre en application vos compétences, lancez-vous dans la création d'une application qui affiche une liste.

Et encore mieux, essayez de refaire la démo Whishmas de ce projet en remplaçant la liste par une grille. Vous allez devoir vous frotter aux Collection View ! Une fois passées les premières différences, vous allez vite vous rendre compte que les mécanismes sont très proches !

En attendant, il ne me reste plus qu'à vous laisser avec le mot de la fin. Et le mot de la fin évidemment, c'est :

===> P3/P3C4_1.jpg // Oui, j'ai manqué d'inspiration sur ce meme...
