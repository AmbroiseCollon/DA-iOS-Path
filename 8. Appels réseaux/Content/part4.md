## Gérez les erreurs proprement
 
### Lancez des erreurs

Pendant ce cours, nous avons croisé différentes petites choses qui ne vous sont pas forcément familières. On a notamment parlé du protocole `Error` avec notre classe `QuoteError` et on a croisé le mot-clé `try`. On n'est pas rentré dans le détail, car je ne voulais pas vous perturber avec trop d'informations à la fois. 

Mais maintenant que les choses sont derrière nous, nous allons voir tout ça sérieusement !

#### La gestion d'erreur en Swift

Tout cela est du domaine de la gestion d'erreur en Swift. Concernant ce sujet, nous avons déjà parlé du mot-clé `guard`. Et nous allons maintenant nous attaquer à la suite avec :

- le protocole `error` et le mot-clé `throw` que nous allons voir **dans ce chapitre**.
- les mot-clés `try`, `do`, `catch` dont nous allons parler **dans le prochain chapitre**.

Pour découvrir tout ça, je vous propose de reprendre le Playground. Oui je sais, ça vous manquait ;) ! 

**Je vous invite à télécharger [ici](https://s3-eu-west-1.amazonaws.com/static.oc-static.com/prod/courses/files/Parcours+DA+iOS/Cours+8+-+Appels+réseaux/OrderError.playground.zip) un Playground que j'ai préparé pour vous**.

Dans ce Playground, vous trouverez l'implémentation très simple d'un système de commande. Imaginez-vous un *panier* sur un site web. Il y a donc une classe `Order` qui gère la commande.

Cette classe admet deux propriétés :

- `items` qui est un tableau d'items. Les items étant les objets de la commande.
- `status` : il y a deux statuts possibles : `pending`, si la commande est en cours et `payed` si la commande est payée.

Ensuite, il y a une méthode `pay` qui permet de payer la commande à condition qu'elle soit toujours en cours, pas vide, et que le moyen de paiement (`PaymentMethod`) soit valide et suffisamment approvisioné. Elle renvoie le prix total de la commande.

> **:warning:** Prenez quelques minutes pour bien comprendre cette classe avant de passer à la suite !

C'est parti !

#### Le protocole Error

**`Error` est un protocole qui définit les erreurs en Swift**.

> **:information_source:** Nous n'avons pas encore parlé en détail des protocoles. On les a seulement survolés. Un protocole permet, comme une classe ou une structure de **définir un type**. Mais à la différence de ces derniers, il n'y a **pas d'implémentation**. C'est simplement une liste de fonctions.

#### Créer les erreurs
La façon la plus classique d'utiliser ce protocole, c'est de **définir une énumération** en lui attribuant le protocole `Error`. Nous allons donc définir une énumération `OrderError` dans notre classe `Order` comme ceci :

```swift
enum OrderError: Error {
}
``` 

Dans cette énumération, nous allons lister les différents cas d'erreur possibles dans notre code. Il va y en avoir 4 :

- Ajout d'un élément dans la commande alors que celle-ci est déjà payée
- Payer une commande vide
- Payer alors que la méthode de paiement n'est pas valide (carte expirée par exemple)
- Payer au-delà du plafond de la méthode de paiement

Nous allons exprimer tout cela dans notre énumération.

```swift
enum OrderError: Error {
	case orderAlreadyPayed
	case orderIsEmpty
	case invalidPaymentMethod
	case insufficientFundings
}
```

#### Signalez les erreurs

Dans le code, nous allons maintenant utiliser les erreurs que nous venons de créer. Pour signaler, une erreur, on utilise le mot-clé `throw` comme ceci :

```swift
guard status == .pending else {
	throw OrderError.orderAlreadyPayed
}
```

Plusieurs choses à noter ici :

- `throw` vous fait quitter le contexte du code. Comme `return`, **lorsque `throw` est appelé on quitte la fonction**. 

> **:information_source:** Cela vous permet de voir une nouvelle façon de remplir la partie `else` d'un `guard`.

- `throw` s'utilise avec une erreur. Cette erreur nous permet d'avoir une information claire sur ce qu'il s'est passé, c'est beaucoup mieux qu'un `return 0` qui ne donne aucune explication du problème et en plus risque d'être mal interprété.

Lorsqu'on `throw` une erreur, la personne qui va utiliser ce code va devoir gérer l'erreur, sinon le code va planter. Pour prévenir qu'une fonction peut renvoyer une erreur, on doit lui ajouter le mot-clé `throws` :

```swift
func pay(with paymentMethod: PaymentMethod) throws -> Double { // On ajoute throws à la déclaration
	guard status == .pending else {
		throw OrderError.orderAlreadyPayed
	}
	
	// (...)
}
```

#### Exercice

À vous de jouer ! Rajoutez la gestion d'erreur pour le reste de la fonction `pay` ! Essayez par vous même avant de regarder la correction !

```swift
// NE TRICHEZ PAS !
































func pay(with paymentMethod: PaymentMethod) throws -> Double {
	guard status == .pending else {
		throw OrderError.orderAlreadyPayed
	}
	
	guard items.count > 0 else {
		throw OrderError.orderIsEmpty
	}
	
	var totalPrice = 0.0
	for item in items { totalPrice += item.price }
	
	guard paymentMethod.isValid else {
		throw OrderError.invalidPaymentMethod
	}
	
	guard paymentMethod.maxAmount >= totalPrice else {
		throw OrderError.insufficientFundings
	}
	
	status = .payed
	return totalPrice
}
```

#### En résumé
- On implémente le protocole error avec une énumération pour définir nos différents cas d'erreurs.
- On lance une erreur en utilisant le mot-clé `throw` suivi d'une erreur.
- L'exécution de `throw` fait quitter la fonction dans laquelle il est défini.
- On doit ajouter la mention `throws` pour toute fonction qui fait appel à `throw`.

Après avoir appris comment créer et lancer des erreurs, nous allons voir dans le prochain chapitre comment gérer ces erreurs !

### Levez le voile sur try

Vous savez comment créer des erreurs, voyons maintenant comment les gérer !

#### Le mot-clé try
Nous allons enfin parler de ce fameux mot-clé `try` que nous avons croisé plusieurs fois dans ce cours.

Copiez le code suivant dans votre Playground : 

```swift
func payFruits() {
	let order = Order()
	order.items = [
		Item(price: 2.40, description: "Melon"),
		Item(price: 4, description: "Fraises"),
		Item(price: 1.20, description: "Pomme")
	]
	
	let cb = PaymentMethod(isValid: true, maxAmount: 100)
	let price = order.pay(with: cb)
	print("Votre commande d'un montant de \(price)€ a bien été prise en compte.")
}
```

Vous devriez avoir une erreur du type :

```console
Call can throw, but it is not marked with 'try' and the error is not handled.
```

Ce message signifie que l'appel de la fonction `pay` peut lancer une erreur, mais cette erreur n'est pas gérée.

En Swift, **lorsqu'on fait appel à une fonction qui peut lancer une erreur, une fonction qui a donc la mention `throws` dans sa déclaration, on est obligé de prendre des précautions**.

Et ces précautions se traduisent concrètement par l'ajout du mot-clé `try` avant l'appel de la fonction.

```swift
let price = try order.pay(with: cb)
```

`try` signifie *essayer* en anglais. Donc l'idée, c'est de dire : "*Essaye d'exécuter cette fonction. Je sais que tu ne vas peut-être pas y arriver, car cette fonction peut renvoyer une erreur.*".

> **:question:** OK je veux bien, mais en attendant, j'ai toujours une erreur dans la console :
```console
Errors thrown from here are not handled.
```

C'est normal ! Il ne suffit pas d'écrire le mot-clé `try`, il faut aussi gérer l'erreur et il y a deux façons de le faire.
 
#### Gérer l'erreur avec do/catch

Pour gérer proprement les erreurs, il faut entourer l'appel de la fonction par l'instruction `do/catch` comme ceci :

```swift
do {
	let price = try order.pay(with: cb)
	print("Votre commande d'un montant de \(price)€ a bien été prise en compte.")
} catch {

}
```

Dans la partie `do`, j'essaye d'exécuter ma fonction. Et si jamais, elle renvoie une erreur, je vais gérer ça dans la partie `catch`.

Voyons d'ailleurs comment on gère les erreurs avec `catch`. Tout d'abord, nous allons récupérer une instance de l'erreur en contrôlant en même temps son type :

```swift
do {
	let price = try order.pay(with: cb)
	print("Votre commande d'un montant de \(price)€ a bien été prise en compte.")
} catch let error as Order.OrderError {

}
```

> **:question:** J'ai un peu l'impression que le prof est à la ramasse, j'ai encore un problème dans la console !
```console
Errors thrown from here are not handled because the enclosing catch is not exhaustive.
```

D'une part, je trouve ça pas très agréable et d'autre part, c'est encore normal :D ! Le catch doit être exhaustif. Or, il se peut que dans votre méthode `pay`, vous lanciez d'autres types d'erreurs que des `OrderError`. Il faut rajouter un bloc catch générique pour gérez les autres erreurs potentielles.


```swift
do {
	let price = try order.pay(with: cb)
	print("Votre commande d'un montant de \(price)€ a bien été prise en compte.")
} catch let error as Order.OrderError {

} catch {
	print("Oups ! Quelque chose a du mal se passer...")
}
```

> **:information_source:** Le deuxième `catch` est un peu comme la section `default` dans une énumération. Il va récupérer toutes les erreurs qui ne sont pas du type `OrderError`.

On va maintenant gérer l'erreur dans le premier `catch`. `OrderError` est une énumération, donc nous allons gérer l'erreur avec un `switch`.

```swift
do {
	let price = try order.pay(with: cb)
	print("Votre commande d'un montant de \(price)€ a bien été prise en compte.")
} catch let error as Order.OrderError {
	switch error {
	case .orderAlreadyPayed:
		print("Vous avez déjà réglé cette commande.")
	case .orderIsEmpty:
		print("Votre panier est vide.")
	case .invalidPaymentMethod:
		print("Votre méthode de paiement est invalide.")
	case .insufficientFundings:
		print("Votre méthode de paiement a été refusée. Contrôlez vos plafonds.")
	}
} catch {
	print("Oups ! Quelque chose a du mal se passer...")
}
```

Et voilà une très belle gestion d'erreur ! Votre utilisateur sait maintenant très clairement pourquoi sa commande n'a pas été passée, ce qui lui évite beaucoup de frustrations !

> **:question:** Certes, mais du coup ça fait beaucoup de code à rédiger !

Il ne faut pas être fainéant quand il s'agit de la gestion des erreurs ! Néanmoins je suis d'accord que parfois, on n'a pas besoin de donner autant de détail. 

Dans ces cas-là, il existe une méthode plus rapide.

#### try! et try?

Comme pour le déballage des optionnels ou le contrôle des types, on peut accoler les ponctuations `!` et `?` au mot-clé `try`. Voyons d'abord le point d'exclamation :

```swift
let price = try! order.pay(with: cb)
print("Votre commande d'un montant de \(price)€ a bien été prise en compte.")
```

> **:warning:** Ceci est la façon la plus violente de gérer une erreur ! En faisant, cela vous faîtes taire le compilateur en lui disant : "Je suis certain que dans cette situation, cette fonction ne renvoie pas d'erreur. Tais-toi, j'ai raison !".

C'est pratique, mais risqué, car s'il y a malgré tout une erreur, **votre code va planter**. Donc c'est à n'utiliser que si vous êtes absolument sûr de vous ou si vous souhaitez que votre code plante si jamais il y a une erreur.

Une autre façon plus sûre est d'utiliser le point d'interrogation :

```swift
let price = try? order.pay(with: cb)
```  

Lorsqu'on utilise `try?`, le code ne plante plus en cas d'erreur. Pour y arriver, il utilise les optionnels. En effet, avec le code ci-dessus, la fonction `pay` ne renvoie plus un `Double,` mais un optionnel.

La constante `price` est donc de type optionnel. Du coup, je peux la déballer comme je le fais avec n'importe quel optionnel :

```swift
if let price = try? order.pay(with: cb) {
	print("Votre commande d'un montant de \(price)€ a bien été prise en compte.")
} else {
	print("Oups ! Quelque chose a du mal se passer...")
}
```

C'est certes moins précis qu'avec `do/catch,` mais c'est un intermédiaire qui permet de faire un minimum de gestion d'erreur à moindres frais.

#### Qui utiliser quand ?
Dès que vous avez le choix se pose la question de quoi faire à quel moment. À vous de définir ou trouver vos propres règles, mais voici ce que je vous propose :

> **Si votre logique ou votre expérience utilisateur dépend de la nature de l'erreur, utilisez `try` avec `do/catch` et un `switch`. Dans les autres cas, utilisez `try?`.**

Ne réservez l'utilisation de `try!` qu'à de rares exceptions.

#### En résumé
- L'appel d'une fonction marquée avec `throws` doit être précédé de `try`.
- `try` ne peut pas être utilisé seul. Il a besoin soit :
	-  d'être entouré d'une instruction do/catch qui permet de gérer les erreurs précisément.
	-  d'être suivi du `?` qui renvoie le retour de la fonction sous forme d'optionnel.
	-  d'être suivi du `!` qui exécute la fonction quoi qu'il arrive au risque de planter le code s'il rencontre une erreur.

> **:information_source:** Vous pouvez télécharger le Playground complet à [cette adresse](https://s3-eu-west-1.amazonaws.com/static.oc-static.com/prod/courses/files/Parcours+DA+iOS/Cours+8+-+Appels+réseaux/OrderError-+Final.playground.zip).

> **:information_source:** Si vous souhaitez aller plus loin dans la gestion d'erreur avec Swift, je vous recommande cet excellent [tutoriel](https://www.raywenderlich.com/130197/magical-error-handling-swift).

### Conclusion

Félicitations ! Ce cours n'était pas facile ! Vous verrez avec la pratique que la gestion des réseaux n'est pas la partie la plus évidente du travail de développeur iOS. Pourtant, **vous venez de faire un grand pas vers la maitrise de ce sujet !**

#### En résumé
Dans ce cours, vous avez vu comment lancer des appels réseau avec la classe `URLSession`. 

> **:information_source:** Cela veut dire que vous êtes maintenant autonome pour créer une application avec des fonctionnalités sophistiquées comme un login, la gestion d'API tierces ou la communication avec un back-end. 
 
C'est une étape très importante vers la professionnalisation de vos compétences de développeur iOS !

Malgré le fait que vous découvriez tout juste les appels réseau avec Swift, j'ai voulu vous emmener vers des concepts plus avancés comme le pattern singleton ou le multithreading. Je sais que j'ai été particulièrement exigeant avec vous, mais je pense que c'est pour la bonne cause. Il est bien plus facile de prendre de bonnes habitudes dès le début que d'en changer plus tard !

Plus important encore que tout ceci, **nous avons vu ensemble comment tester vos appels**. C'est le sujet le plus difficile, car on a dû aborder des concepts denses comme l'injection de dépendances ou les doubles. Des développeurs professionnels expérimentés sont contraints à de grands efforts ou à des formations coûteuses pour apprendre à tester leurs appels réseau.

Alors, accrochez-vous à cette introduction que je vous ai proposée et allez plus loin pour ne JAMAIS devenir des développeurs qui ne testent pas leur code !

#### Pour allez plus loin
En particulier pour ce cours, je vous invite à vous exercer en développant une petite application de votre choix ! En mettant en application tout de suite ce que vous avez appris, cela vous permettra de confirmer vos acquis. Et si besoin, reprenez ce cours tranquillement.

> **:information_source:** Vous manquez d'idée ? Pas de soucis, jeter un oeil à [cette liste d'APIs publique](https://github.com/toddmotto/public-apis). Je suis certain que vous y trouverez de l'inspiration !

> **:information_source:** Par ailleurs, je vous recommande ce [blog](https://www.swiftbysundell.com). Il parle de comment tester son code, de comment écrire du code Swift propre et claire et des appels réseau. Certains articles sont une bonne suite à ce cours.

En attendant, je n'ai plus qu'à vous laisser avec le mot de la fin et le mot de la fin, évidemment c'est... 

![Images/P4/P4C3_1.jpg]()