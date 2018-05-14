## Améliorez la Table View

### Gérez des collections hétérogènes avec les protocoles

Bienvenue dans cette troisième partie ! Dans cette partie, nous allons améliorer les fonctionnalités de notre Table View. Et dans ce chapitre, nous allons commencer par l'ajout de plusieurs catégories de cadeaux.

> **:information_source:** Pour cela, j'ai un petit peu amélioré l'application pour vous faire gagner du temps. Je vous invite à télécharger le projet revisité [ici](https://s3-eu-west-1.amazonaws.com/static.oc-static.com/prod/courses/files/Parcours+DA+iOS/Cours+9+-+Table+View/Whishmas+-+Part+3+Starter.zip).

#### Quoi de neuf ?

Je vous propose de prendre quelques minutes pour parcourir les petits changements que j'ai apporté au projet pour que vous ne soyez pas perdus pour la suite.

La principale modification est l'ajout de la possibilité de pouvoir créer des objets dans la liste **de trois catégories différentes** :

- Voyage (*Trip*)
- Livre (*Book*)
- Jouet (*Toy*)

Pour cela, j'ai ajouté une pages qui permet de choisir la catégorie et qui redirige vers trois pages différentes, une pour chaque catégorie d'objet à créer.

Voilà ce que ça donne dans le détail :

##### Vue

Dans le fichier `Main.storyboard`, vous pouvez voir les nouvelles interfaces que je viens de mentionner. Il n'y a rien de très compliqué ici.

![](Images/P3/P3C1_1.png)

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

La seule grosse différence, c'est que je n'ai pas su comment ajouter des `Book` ou des `Trip` à notre liste car ils ne sont pas du type `Toy`. Donc nous allons faire ça ensemble.

4/ Enfin, par acquis de conscience, j'ai ajouté un `CategoryViewController` mais qui est vide car tout la navigation est faite dans le storyboard directement. 

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

> **:question:** Hé mais j'ai des erreurs dans mon code !
> 
> ![](Images/P3/P3C1_2.png)

Ah oui... J'ai oublié `ListViewController`. [La boulette](https://www.youtube.com/watch?v=au0ZMqyoWwg) ! Cette classe utilise toujours `ToyService` que nous venons de remplacer par `PresentService`.

Ce n'est pas grave, ce n'est qu'un petit changement rapide, faisons le !

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
> ![](Images/P3/P3C1_3.png)

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
        return departure + " / " + destination
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

![](Images/P3/P3C1_4.png)

Cette méthode est extrêment utile pour supprimer la dépendance d'une classe envers une autre. Ici, `ListViewController` ne connaît même pas l'existence de `Trip`, `Book` et `Toy` car il n'en a pas besoin. Il n'a accès qu'au minimum d'informations que lui fournit `Present`.

#### En résumé
- Les protocoles permettent de gérer des collections de types hétérogènes.
- Les protocoles permettent de créer des interfaces qui peuvent uniformiser des types diversifiés afin de rendre leur utilisation plus simple et d'en supprimer la dépendance.

Dans le prochain chapitre, nous allons sortir nos pinceaux pour magnifier nos cellules qui pour l'instant gâchent un peu la beauté de notre interface !

### Créez une cellule customisée
Section 1 : Création de la cellule dans le storyboard      
Section 2 : Création de la sous-classe      
Section 3 : Utilisation de la sous-classe dans le Controller      

### Supprimez une cellule
Section 1 : Ajout de la méthode      
Section 2 : Test sur l’iPhone       

### Réutilisez vos animations avec les protocoles
Section 1 : Création du protocole      
Section 2 : Explication de l’extension de protocole      
Section 3 : La vue adopte le protocole    
