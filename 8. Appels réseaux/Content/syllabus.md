# Lancez des appels réseau en iOS

## Faites des appels réseau simples


### Tirez le meilleur de ce cours

Bonjour et bienvenue dans ce cours sur les appels réseau !

======> P1/P1C1_1.jpg

#### Prérequis

Ce cours fait partie de tout [un parcours sur le développement d'application iOS](https://openclassrooms.com/paths/developpeur-se-dapplication-ios). Je vous suggère fortement d'y jeter un oeil si vous souhaitez vous former et trouver un emploi en tant que développeur iOS.

> **:warning:** Pour profiter au mieux de ce cours, assurez-vous que vous maîtrisez a minima les compétences présentées dans les cours suivants :
- [Introduction à iOS : plongez dans le développement mobile !](https://openclassrooms.com/courses/introduction-a-ios-plongez-dans-le-developpement-mobile)
- [Apprenez les fondamentaux de Swift](https://openclassrooms.com/courses/apprenez-les-fondamentaux-de-swift)
- [Approfondissez Swift avec la Programmation Orientée Objet](https://openclassrooms.com/courses/approfondissez-swift-avec-la-programmation-orientee-objet)
- [Développez une application iPhone avec le modèle MVC](https://openclassrooms.com/courses/concevez-une-application-iphone-avec-le-modele-mvc)
- [Débuguez et testez vos applications iOS](https://openclassrooms.com/courses/debuggez-et-testez-vos-applications-ios)

Par ailleurs, ce cours s'appuie sur une compréhension solide des requêtes HTTP et API REST. Si ce n'est pas votre cas, pas de panique, on a justement un cours pour vous à ce sujet : [Utilisez des API REST dans vos projets web](https://openclassrooms.com/courses/utilisez-des-api-rest-dans-vos-projets-web).

#### Objectifs

Ce cours a évidemment pour objectif principal de vous faire découvrir les **appels réseau**. C'est une notion incontournable pour un développeur d'application, car cela permet de créer des applications collaboratives et qui interagissent avec des données distantes, disponibles sur internet.

> **:information_source:** Sans appels réseaux, pas de réseau social, pas de service de messagerie, pas de partage de photos, pas de collaboration, pas de jeu en ligne, bref pas grand-chose ! **Alors, mettez-y toute votre énergie, car c'est un sujet important !**

En plus, faire un appel réseau, comme vous allez le voir, c'est assez simple ! Il suffit de quelques lignes de code Swift. Et on pourrait d'ailleurs en rester là. Mais ce serait ne traiter que 20% de la question et je ne veux pas vous laisser vous dépêtrer tout seul avec le reste.

Les 80% restants existent pour une simple raison : **un appel réseau est fatalement associé à un délai aléatoire, celui qui a lieu entre le lancement de l'appel et la réponse.** Et ce délai pose quelques questions :

- Que faire si deux appels partent en même temps et ne reviennent pas dans le bon ordre ?
- Comment lancer des tests unitaires qui dépendent d'un appel réseau ?
- Comment gérer une erreur de réseau (connexion perdue, serveur en panne, etc.) ?
- Comment ne pas bloquer votre application en attendant la réponse du réseau ?

Bref, voilà autant de questions face auxquelles je ne veux pas vous laisser seul. **L'objectif de ce cours est donc non seulement de vous faire découvrir les appels réseau, mais aussi de vous frotter à tout ce qui fera de vous des professionnels du sujet !**

#### Démo

Comme d'habitude, nous allons accompagner ce cours de la création d'une jolie petite application. Je l'ai nommé **ClassQuote** et elle va nous permettre de récupérer des citations aléatoires sur internet associées à une belle photo inspirante trouvée aussi aléatoirement.

======> P1/P1C1_2.png

Ce combo permettra des interprétations infinies de milliers de citations inspirantes ! C'est pas beau ?

La réalisation de son interface ne devrait pas vous poser trop de problèmes aussi. Je vous propose de réaliser vous-même le début de l'application.

Les informations disponibles dans cette capture d'écran sont tout ce qu'il vous faut pour réussir. Vous pouvez l'obtenir également [ici en version HD](https://s3-eu-west-1.amazonaws.com/static.oc-static.com/prod/courses/files/Parcours+DA+iOS/Cours+8+-+Appels+réseaux/Exo+P1C1+HD.png).

======> P1/P1C1_3.png

> **:information_source:** Pour les plus fainéants, je vous donne quand même le projet téléchargeable [ici](https://s3-eu-west-1.amazonaws.com/static.oc-static.com/prod/courses/files/Parcours+DA+iOS/Cours+8+-+Appels+réseaux/ClassQuote+-+Starter.zip). Mais bien sûr, je vous le déconseille. Faire le début du projet par vous même vous permettra vraiment de tirer le meilleur de ce cours !

> **:warning:** J'ai rajouté une ombre noire sur le label pour qu'il soit lisible aussi bien sur les fonds clairs que foncé. Vous pouvez faire ça avec la propriété `Shadow` dans l'inspecteur d'attribut.

#### Plan

Nous allons aborder ce cours en 4 étapes :
1. Nous allons découvrir purement et simplement les appels réseau
2. Nous allons apprendre à professionnaliser nos appels
3. Nous allons apprendre à gérer les tests unitaires avec les appels réseau
4. Nous allons apprendre la gestion d'erreur avec Swift

Vous êtes prêts ? Alors je vous retrouve tout de suite dans le chapitre 2 où nous allons parler de la prise en main d'une API !

### Prenez en main l’API de Forismatic avec Postman  

Pour faire cette application, je vous propose d'utiliser l'**API de Forismatic**. Cette API permet de récupérer des citations générées de manière aléatoire.

> **:information_source:** Je vous invite à aller jeter un oeil à la documentation disponible [ici](https://forismatic.com/en/api/).

Dans ce chapitre, vous allez découvrir comment vous frottez à une API que vous ne connaissez pas !

> **:warning:** Je vous rappelle qu'en prérequis de ce cours, vous devez maîtriser les requêtes HTTP et les API REST. Aussi, si les mots suivants ne vous disent pas grand-chose : *GET, POST, HTTP, API, Erreur 404*, je vous suggère de suivre d'abord ce [cours](https://openclassrooms.com/courses/utilisez-des-api-rest-dans-vos-projets-web). Inutile de continuer sinon ;) !

#### Présentation de Postman

Pour explorer une API que vous ne connaissez pas, je vous suggère d'utiliser le logiciel **Postman**. Postman est un logiciel très pratique, car il permet de lancer des requêtes sur les URL de votre choix en indiquant tous les paramètres que vous voulez et sans écrire une seule ligne de code !

L'intérêt, c'est que **cela vous permet de tester le comportement d'une API sans avoir à coder les appels réseau avant**. Ce prétravail vous fera gagner beaucoup de temps ensuite lorsque vous développerez dans l'application.

> **:information_source:** En plus, Postman a plein de fonctionnalités chouettes qui vous permettent par exemple d'automatiser des tests d'API avec des scripts et beaucoup d'autres choses ! C'est un logiciel incontournable lorsqu'on travaille régulièrement avec des API.

##### Installation de Postman

Pour installer, Postman rien de plus simple ! Rendez-vous simplement à cette adresse : [https://www.getpostman.com/apps](https://www.getpostman.com/apps). Ensuite, choisissez la version pour Mac et cliquer sur `Download`.

##### Premier aperçu de Postman
Lorsque vous ouvrez Postman pour la première fois, vous arrivez sur ceci :

======> P1/P1C2_1.png

En haut, vous avez un champ qui vous permet de rentrer une URL, vous pouvez également choisir la méthode HTTP, qui est à GET dans la capture d'écran ci-dessus. Vous pouvez aussi modifier les paramètres de la requête juste en dessous.

Ensuite en cliquant sur Send, vous recevrez la réponse dans la partie basse de l'interface.

#### Exercice

Je vous invite maintenant à jeter un oeil à l'API de Forismatic [ici](https://forismatic.com/en/api/), et à essayer de récupérer une citation aléatoire dans Postman.

Vous avez tout pour y arriver par vous-même ! ;)

#### Test de l'API forismatic

Que vous ayez réussi ou non, l'essentiel c'est d'avoir essayé ! Regardons maintenant ensemble comment faire.

Tout d'abord, vous avez noté que cette API ne propose qu'une seule URL (on parle aussi de *endpoint*) : http://api.forismatic.com/api/1.0/. Par ailleurs, elle fonctionne aussi bien avec les méthodes GET et POST. Dans notre cas, nous allons essayer la méthode POST.

Voilà ce que ça donne du coup pour l'instant en haut de l'interface :

======> P1/P1C2_2.png

Maintenant, nous allons nous intéresser aux paramètres de la requête. Selon la documentation, voici ceux que nous pouvons préciser :
```
method=getQuote — method name to invoke
format=<format> — one of the server supported response formats
key=<integer> — numeric key, which influences the choice of quotation, the maximum length is 6 characters
lang=<string> — response language ("ru" or "en")
jsonp=<string> — callback function name, used for jsonp format only (usage example)
```

Voyons ceux qui nous intéressent :
- `method` : il a l'air obligatoire et c'est celui qui nous permet de récupération la citation avec la valeur `getQuote`.
- `format` : le type de format que l'on souhaite pour la réponse. La documentation précise les différents formats disponibles. Je vous propose qu'on choisisse `json` car c'est un format de donnée très populaire dans le développement mobile.
- `key` : ce paramètre n'est pas très clair et nous allons du coup essayer sans.
- `lang` : il y a deux langages disponibles, on va favoriser l'anglais (sauf si vous parlez russe !) et choisir du coup la valeur `en`.
- `jsonp` : nous n'avons pas besoin de ça non plus puisqu'on va utiliser du json et non du jsonp.

Du coup, nous allons indiquer 3 paramètres :

```
method:getQuote
format:json
lang:en
```

Ce qui donne ceci dans Postman (*on utilise l'onglet Body pour indiquer nos paramètres*):

======> P1/P1C2_3.png

Vous n'avez plus qu'à cliquer sur *Send* ! Et vous devriez voir la réponse apparaître dans le bas de l'interface  de Postman :

======> P1/P1C2_4.png

Et voilà ! Nous avons récupéré une citation aléatoire sans avoir écrit une seule ligne de code ! **Cela nous permet de séparer la compréhension du fonctionnement de l'API d'une part de la fiabilité de notre code d'autre part**. Ainsi, si ça ne marche pas, on sait qui est le fautif !

En plus, cela nous permet d'avoir déjà des informations intéressantes sur le format de la réponse. On sait déjà que deux paramètres risquent de nous intéresser : `quoteText` et `quoteAuthor`.

#### En résumé
- Postman vous permet de tester des API sans écrire de code. C'est un travail préliminaire que je vous recommande avant d'explorer chaque API !
- Nous savons maintenant comment utiliser l'API de Forismatic pour récupérer des citations aléatoires !

Dans le prochain chapitre, nous allons découvrir `URLSession` : la classe qui permet de gérer les appels réseau en Swift !

### Découvrez URLSession  
Dans ce chapitre, nous allons découvrir la classe qui gère les requêtes en Swift : `URLSession`.

#### Présentation d'URLSession

Quand on parle de `URLSession`, on parle en même temps de la classe **et** de la suite de classes correspondantes. En effet, il y a au moins trois classes qui fonctionnent avec `URLSession` :
- `URLSession`
- `URLSessionConfiguration`
- `URLSessionTask`

Ces trois classes s'articulent comme suit :

======> P1/P1C3_1.png

#### Configuration d'URLSession
`URLSession` s'initialise avec `URLSessionConfiguration`. C'est cette classe qui permet de configurer la session. Lors de la configuration, on essaie de répondre à ce genre de questions :
- Accepte-t-on les cookies ?
- Quelle est la politique de cache ?
- Quel est le timeout d'une requête ?
- Doit-on rajouter des éléments dans le header ? Etc.

> **:information_source:** Il existe des **configurations par défaut** et pour l'instant, elles seront largement suffisantes pour nous.

#### Lancement d'une tâche
Une fois que `URLSession` est initialisé avec la bonne configuration, il peut lancer une "*tâche*". Une tâche lance une requête réseau, reçoit la réponse, décide de l'interrompre, etc. Cela est géré par la classe `URLSessionTask`. Elle est responsable de la gestion du cycle de vie de la requête.

> **:information_source:** La requête, elle, est gérée avec la classe `URLRequest`. C'est elle qui décide des éléments constituants la requête : l'URL, la méthode (GET, POST, PUT, etc.), et le contenu éventuel.

Il existe plusieurs types de tâches. Pour chaque type de tâche, Apple a créé une sous-classe de `URLSessionTask` :

- `URLSessionDataTask` : Cette tâche permet d'**envoyer ou de recevoir des données**.
- `URLSessionUploadTask` : Cette tâche permet d'effectuer un **téléchargement ascendant** : l'envoi de fichiers lourds (vidéo, enregistrement audio, etc.) vers un serveur.
- `URLSessionDownloadTask` : Cette tâche permet d'effectuer un **téléchargement descendant** : la réception de fichiers lourds (vidéo, enregistrement audio, etc.) depuis un serveur.

> **:information_source:** Les deux dernières tâches vous permettent de suivre et donc d'indiquer à l'utilisateur la progression du chargement.

> **:warning:** En pratique, **vous n'utiliserez donc jamais URLSessionTask,** mais une de ses trois sous-classes. Dans ce genre de cas, on dit qu'`URLSessionTask` est une classe *abstraite*. Elle définit un comportement - gérer une requête et sa réponse, et **les sous-classes implémentent de façon concrète** ce comportement: télécharger / uploader un fichier, envoyer / recevoir des données.

#### Format de la réponse
Une fois la requête envoyée, la réponse est formatée et disponible dans la classe `URLResponse` ou dans sa sous-classe `HTTPURLResponse` (spécifique aux requêtes HTTP). Vous pouvez notamment y vérifier le `status code` de la réponse pour vérifier que la requête a fonctionné.

Cette réponse est accompagnée d'une éventuelle erreur (`Error`) et d'éventuelles données (`Data`).

#### En résumé
- `URLSession` est initialisée avec `URLSessionConfiguration` et permet de lancer des requêtes avec les 3 sous-classes d'`URLSessionTask` : `URLSessionDataTask`, `URLSessionUploadTask` et `URLSessionDownloadTask`.
- `URLRequest` permet de spécifier la requête: quelle URL, quelle méthode, quels paramètres: Quel endpoint de l’API j’utilise et comment.
- La réponse est le plus souvent disponible en trois objets : `URLResponse` (ou `HTTPURLResponse`), `Data` et `Error`.

Dans le prochain chapitre, nous allons utiliser la suite de classes `URLSession` pour lancer notre première requête avec Swift !

### Récupérez la citation avec une requête POST
C'est parti ! Accrochez vos ceintures ! Nous allons lancer notre première requête !

======> P1/P1C4_1.jpg

#### Création du fichier

Les appels réseau concernent la logique de l'application et ont donc lieu dans le modèle. On va donc rajouter un fichier `QuoteService.swift` dans le modèle.

> **:information_source:** On parle souvent de "service" lorsqu'on gère les appels réseaux.

Dans ce fichier, créez la classe `QuoteService`, vide pour l'instant.

#### Création de la requête

Souvenez-vous, pour faire un appel réseau, il nous faut une instance `URLSession` qui lance une `URLSessionTask`, cette dernière étant initialisée avec une `URLRequest`. Nous allons commencer par créer cette requête.

Pour cela, nous avons besoin de l'URL. Comme on l'a vu dans le chapitre avec Postman, l'URL la voici : `http://api.forismatic.com/api/1.0/`. Je vous propose de la rajouter dans la classe sous la forme d'une constante de classe privée :

```swift
private static let quoteUrl = URL(string: "https://api.forismatic.com/api/1.0/")!
```

> **:information_source:** On utilise l'initialisation de la classe `URL` avec un `String`. Elle renvoie un optionnel qu'on déballe sauvagement, car on sait que la chaîne de caractère correspond bien à une URL.

> **:information_source:** Je vous suggère de bien indiquer en haut de vos classes vos URL pour qu'elles soient bien visibles et donc modifiables facilement si besoin.

> **:information_source:** Sur de plus gros projets où vous utilisez votre propre API, je vous conseille de séparer la racine de l'url de la partie variable. Si vous avez de nombreux appels réseaux et que vous changez de version d'API, cela vous évitera de changer *toutes* vos URL.

Maintenant, nous allons créer une fonction statique que nous allons appeler simplement `getQuote` et à l'intérieur de laquelle nous allons créer notre requête :

```swift
static func getQuote() {
	var request = URLRequest(url: quoteUrl)
	request.httpMethod = "POST"
}
```

J'initialise une instance de `URLRequest` en lui passant notre url en paramètre. Ensuite, je précise la méthode HTTP choisie (en l'occurrence `POST`) avec la propriété `httpMethod` de `URLRequest`.

Par ailleurs, nous avons besoin de passer des paramètres dans cette requête. Nous allons les rajouter avec la propriété `body` de `URLRequest` :

```swift
let body = "method=getQuote&lang=en&format=json"
request.httpBody = body.data(using: .utf8)
```

J'écris les paramètres sous la forme d'une chaîne de caractère. Vous reconnaissez les paramètres que l'on a utilisés précédemment avec Postman. Ensuite, j'utilise la méthode `data(using:)` du type `String` qui permet de convertir une chaîne de caractère vers le format `Data`. Et je précise l'encodage de mon choix, en l'occurrence `utf8` le plus courant dans l'univers du développement.

Et voilà notre requête est créée, nous avons précisé son url, sa méthode et ses paramètres. On va pouvoir créer et lancer notre tâche !

#### Lancement de la tâche
On l'a vu au chapitre précédent, pour lancer une tâche, il faut une instance d'`URLSession`. Pour cela, nous allons créer une instance d'`URLSession` avec une configuration par défaut :

```swift
let session = URLSession(configuration: .default)
```

Ensuite, nous allons créer une tâche et plus précisément une instance de `URLSessionDataTask` :

```swift
let task = session.dataTask(with: request) { (data, response, error) in

}
```

Plusieurs choses ici :
- On crée une tâche qu'on stocke dans la constante `task`.
- Pour cela, on utilise la méthode `dataTask` de `URLSession`.
	- Elle prend en paramètre notre requête `request` de type `URLRequest`.
	- Elle admet un deuxième paramètre : une fermeture. C'est dans cette fermeture que nous allons gérer la réponse de l'appel. Il admet 3 paramètres comme on l'a vu au chapitre précédent : `data` de type `Data?`, `response` de type `URLResponse?` et `error` de type `Error?`.

> **:information_source:** Besoin d'un petit rappel sur les fermetures ? C'est [par là](https://openclassrooms.com/courses/concevez-une-application-iphone-avec-le-modele-mvc/ameliorez-le-chargement-avec-les-fermetures) ;) !

Notre tâche est maintenant créée et pour lancer l'appel, il ne nous reste plus qu'à écrire :

```swift
task.resume()
```

Et voilà ! Votre appel va être lancé !

> **:information_source:** À ce stade, **je vous invite à rajouter `QuoteService.getQuote()` dans la fonction `tappedNewQuoteButton` du contrôleur pour pouvoir tester votre appel en appuyant sur le bouton New Quote dans le simulateur**.  
Vous pouvez ajouter des `print` dans la fermeture pour inspecter la réponse reçue.

#### Gestion de la réponse
Lorsque l'on gère la réponse, nous allons vérifier qu'elle contient bien les données qui nous intéressent et que nous n'avons pas d'erreur. Nous allons donc commencer par écrire ceci :

```swift
let task = session.dataTask(with: request) { (data, response, error) in
	if let data = data, error == nil {
	}
}
```

Ensuite, nous allons contrôler que le `status code` de la réponse est bien à 200 :

```swift
let task = session.dataTask(with: request) { (data, response, error) in
	if let data = data, error == nil {
		if let response = response as? HTTPURLResponse, response.statusCode == 200 else {
		}
	}
}
```

On vérifie d'abord que la réponse est bien du type `HTTPURLResponse` et ensuite que le code vaut bien 200.

#### Lecture du JSON
Avec les vérifications que nous avons faites, nous savons maintenant que la requête renvoie bien des données et qu'il n'y a pas d'erreur. Seulement, souvenez-vous, nous avons demandé à ce que les données soient au format JSON :

```swift
let body = "method=getQuote&lang=en&format=json" // <= ICI
```

Or, nous ne savons pas manipuler ce format en Swift. En Swift, on manipule des dictionnaires, des tableaux, des objets, mais pas des JSON !

Heureusement, il existe une classe qui va nous permettre de faire la conversion depuis le format JSON vers un dictionnaire Swift classique. Elle s'appelle : `JSONDecoder`. Et elle a une méthode `decode` qui renvoie un dictionnaire. Voici comment on l'utilise :

```swift
if let responseJSON = try? JSONDecoder().decode([String: String].self, from: data),
    let text = responseJSON["quoteText"],
    let author = responseJSON["quoteAuthor"] {
}
```

> **:question:** Woooooh...

Oui je sais, il y a pas mal de choses ici, mais à part la première ligne, rien de vraiment compliqué :

- Ligne 1 : On utilise la méthode `decode` de `JSONDecoder` qui prend en paramètre deux choses :
	- le type attendu des données que l'on va recevoir, ici on s'attend à recevoir un dictionnaire qui a comme type `String` pour la clé et pour la valeur. Le `.self` permet de faire référence au type.
	- les `data` reçues en réponse à l'appel réseau et d'éventuelles options que nous laissons vides.

> **:information_source:** Ce qui est hyper puissant ici, c'est que vous pouvez utiliser n'importe quelle type, même un type de votre création pourvu qu'il se conforme au protocole `Decodable`. Plus d'info avec [cet article](http://roadfiresoftware.com/2018/02/how-to-parse-json-with-swift-4/).

- Lignes 2 et 3 : Comme on a déjà vu à quoi ressemblaient les données reçues grâce à Postman, on sait que la citation est stockée avec la clé `quoteText` et l'auteur avec la clé `quoteAuthor`. On récupère du coup simplement les valeurs correspondantes.

Ensuite, vous pouvez faire des `print` sur les variables `text` et `author` et vous devriez voir les citations s'afficher dans votre console en appuyant sur le bouton *New Quote* dans votre simulateur !

Et voilà ! Dans le prochain chap...

> **:question:** Hop hop hop ! Tu ne vas pas t'en sortir comme ça ! Tu n’aurais pas oublié quelque chose ?

Comment ça ?

> **:question:** C'est quoi ça : `try?` ?!

Aaaah ! Certes... Bon, pour la faire courte, certaines fonctions comme la fonction `decode` peuvent planter et dans ce cas, on dit qu'on essaye de lancer la fonction avec `try?`. Je ne vous en dis pas plus pour le moment pour qu'on ne s'éparpille pas. Mais c'est le sujet de la dernière partie de ce cours. Alors, heureux ?

> **:question:** Hmmm.... On va dire oui :) !

#### En résumé

En guise de résumé, voici le fichier complet `QuoteService.swift` (avec une petite refactorisation pour que le code soit bien propre ;) ) !

```swift
import Foundation

class QuoteService {
	private static let quoteUrl = URL(string: "https://api.forismatic.com/api/1.0/")!

	static func getQuote() {
		let request = createQuoteRequest()
		let session = URLSession(configuration: .default)

		let task = session.dataTask(with: request) { (data, response, error) in
			if let data = data, error == nil {
				if let response = response as? HTTPURLResponse, response.statusCode == 200 {
					if let responseJSON = try? JSONDecoder().decode([String: String].self, from: data),
					    let text = responseJSON["quoteText"],
					    let author = responseJSON["quoteAuthor"] {
					    	print(text)
							print(author)
					}
				}
			}
		}
		task.resume()
	}

	private static func createQuoteRequest() -> URLRequest {
		var request = URLRequest(url: quoteUrl)
		request.httpMethod = "POST"

		let body = "method=getQuote&lang=en&format=json"
		request.httpBody = body.data(using: .utf8)

		return request
	}
}
```

Dans le prochain chapitre, nous allons mettre en place le téléchargement de l'image aléatoire associée à la citation !

### Téléchargez l'image avec une requête GET  
Nous avons le code pour télécharger la citation, mais toute nouvelle citation doit être accompagnée d'une nouvelle photo. Dans ce chapitre, nous allons télécharger les images !

#### L'API d'Unsplash

Nous allons récupérer nos photos sur Unsplash. Unsplash est un site de partage de photos libre de droit. Elles sont souvent très esthétiques et je vous recommande le site pour vos applications, présentations, etc.

Unsplash propose une API que je vous invite à explorer à cette adresse : [https://source.unsplash.com](https://source.unsplash.com). Leur API est un peu plus complète que Forismatic, mais une seule fonctionnalité nous intéresse : la récupération de photos aléatoire. Pour cela il suffit de faire une requête GET à cette adresse :

```
https://source.unsplash.com/random
```

On peut même préciser la taille en pixels que l'on souhaite obtenir en l'indiquant comme ceci :

```
https://source.unsplash.com/random/1000x1000
```

> **:information_source:** Je choisis 1000 par 1000 pixels, car cela permet d'obtenir une image carrée de taille suffisante pour être de bonne qualité sur les écrans retina sans être pourtant trop lourde à télécharger.

Je vous invite à tester cette API dans Postman. Vous devriez voir l'image dans le body en bas :

======> P1/P1C5_1.png

Je vous laisse jouer un peu avec et quand vous maîtrisez cette partie de l'API Unsplash, passez à la suite !

#### Création de la tâche

Comme au chapitre précédent, nous allons commencer par créer notre url :

```swift
private static let pictureUrl = URL(string: "https://source.unsplash.com/random/1000x1000")!
```

Ensuite, nous allons lancer notre appel dans une fonction `getImage` :

```swift
private static func getImage() {
}
```

Dans cette fonction, on commence par créer notre `URLSession` avec une configuration par défaut :

```swift
let session = URLSession(configuration: .default)
```

Et ensuite on crée notre tâche avec la méthode `dataTask` de `URLSession` :

```swift
let task = session.dataTask(with: pictureUrl) { (data, response, error) in
}
```

> **:question:** Mais on n’a pas créé de requête avec URLRequest !

Wow ! Quelle perspicacité ! Et moi qui pensais que ça allait passer inaperçu...

Eh oui ! Ici nous faisons une **simple requête GET sans paramètre**. Dans ce cas, on peut simplement passer une URL directement à la fonction `dataTask`. Par défaut la tâche sera une requête GET sur l'URL indiquée. C'est plus rapide !

Ensuite, on n'oublie pas de lancer l'appel avec :

```swift
task.resume()
```

#### Gestion de la réponse

Comme au chapitre précédent, on va gérer la réponse en vérifiant que la réponse n'a pas d'erreur, contient des données et a bien pour `status code` 200 :

```swift
let task = session.dataTask(with: pictureUrl) { (data, response, error) in
	if let data = data, error == nil {
		if let response = response as? HTTPURLResponse, response.statusCode == 200 {
		}
	}
}
```

Jusque là rien de nouveau !

La difficulté apparaît maintenant. En effet, on souhaite modifier la photo et la citation en même temps sur l'interface. Donc pour que cela fonctionne, **on va chaîner les appels**.

> **:information_source:** Cela veut dire que nous n'allons pas faire nos requêtes séparément, mais l'une après l'autre. Une fois qu'on a récupéré la citation, on lance la requête pour récupérer la photo et une fois qu'on a les deux, on envoie le tout au contrôleur pour qu'il l'affiche sur l'interface.

Il faut donc qu'on appelle la fonction getImage une fois qu'on a reçu la citation :

```swift
let task = session.dataTask(with: request) { (data, response, error) in
	if let data = data, error == nil {
		if let response = response as? HTTPURLResponse, response.statusCode == 200 {
			if let responseJSON = try? JSONDecoder().decode([String: String].self, from: data),
			    let text = responseJSON["quoteText"],
			    let author = responseJSON["quoteAuthor"] {
					getImage() // Une fois la citation reçue, on va chercher l'image
			}
		}
	}
}
```

Maintenant, comme on veut tout envoyer en même temps en contrôleur, il va nous falloir **rassembler les données de la citation et de l'image au même endroit** et pour cela nous allons créer une fermeture.

#### Une fermeture pour l'image

> **:warning:** Avant de vous lancer dans cette partie, assurez-vous d'être bien à l'aise avec les fermetures : jetez un oeil [ici](https://openclassrooms.com/courses/concevez-une-application-iphone-avec-le-modele-mvc/ameliorez-le-chargement-avec-les-fermetures) si besoin !

Nous allons ajouter une fermeture en paramètre de la fonction `getImage`, on va appeler cela `completionHandler` et il sera appelé dès qu'on a récupéré les données de l'image. Modifiez votre fonction `getImage` comme ceci :

```swift
private static func getImage(completionHandler: @escaping ((Data?) -> Void)) {
	let session = URLSession(configuration: .default)
	let task = session.dataTask(with: pictureUrl) { (data, response, error) in
		if let data = data, error == nil {
			if let response = response as? HTTPURLResponse, response.statusCode == 200 {
				completionHandler(data) // On passe les données via le completionHandler
			}
		}
	}
	task.resume()
}
```

Alors que se passe-t-il ici ?
- Ligne 1 : On rajoute le paramètre `completionHandler` de type `((Data?) -> Void)` soit une fonction qui prend en paramètre une valeur de type `Data?` et qui ne renvoie rien.

> **:information_source:** On utilise le type optionnel pour `Data?` car si la requête échoue, il n'y aura pas de donnée.

> **:information_source:** La mention `@escaping` est une notion assez avancée de Swift. Pour ceux qui veulent comprendre pourquoi on doit l'écrire, je vous invite à regarder cette [ressource](https://medium.com/@kumarpramod017/what-do-mean-escaping-and-nonescaping-closures-in-swift-d404d721f39d).

- Ligne 6 : Si la requête s'est bien passée, on passe les données reçues `data` dans le `completionHandler`.

Maintenant, il ne nous reste plus qu'à utiliser ça lorsqu'on appelle la fonction `getImage` lors de la réception de la citation :

```swift
getImage(completionHandler: { (data) in
	if let data = data {
		print(data)
	}
})
```

Ou alors dans sa version abrégée :

```swift
getImage { (data) in
	if let data = data {
		print(data)
	}
}
```

Désormais, les données de l'image, de la citation et de l'auteur sont réunies au même endroit !


```swift
if let responseJSON = try? JSONDecoder().decode([String: String].self, from: data),
    let text = responseJSON["quoteText"],
    let author = responseJSON["quoteAuthor"] {
		getImage { (data) in
			if let data = data {
				print(data)
				print(text)
				print(author)
			}
		}
}
```

On va pouvoir utiliser ces trois données ensemble au prochain chapitre !

#### En résumé
En guise de résumé, voici le fichier complet `QuoteService.swift` :

```swift
import Foundation

class QuoteService {
	private static let quoteUrl = URL(string: "https://api.forismatic.com/api/1.0/")!
	private static let pictureUrl = URL(string: "https://source.unsplash.com/random/1000x1000")!

	static func getQuote() {
		let request = createQuoteRequest()
		let session = URLSession(configuration: .default)

		let task = session.dataTask(with: request) { (data, response, error) in
			if let data = data, error == nil {
				if let response = response as? HTTPURLResponse, response.statusCode == 200 {
					if let responseJSON = try? JSONDecoder().decode([String: String].self, from: data),
					    let text = responseJSON["quoteText"],
					    let author = responseJSON["quoteAuthor"] {
					    	getImage { (data) in
							if let data = data {
								print(data)
								print(text)
								print(author)
							}
						}
					}
				}
			}
		}		
		task.resume()
	}

	private static func createQuoteRequest() -> URLRequest {
		var request = URLRequest(url: quoteUrl)
		request.httpMethod = "POST"

		let body = "method=getQuote&lang=en&format=json"
		request.httpBody = body.data(using: .utf8)

		return request
	}

	private static func getImage(completionHandler: @escaping ((Data?) -> Void)) {
		let session = URLSession(configuration: .default)
		let task = session.dataTask(with: pictureUrl) { (data, response, error) in
			if let data = data, error == nil {
				if let response = response as? HTTPURLResponse, response.statusCode == 200 {
					completionHandler(data)
				}
			}
		}
		task.resume()
	}
}
```

Dans le prochain chapitre, nous allons utiliser nos données pour faire fonctionner notre contrôleur !

### Utilisez le résultat de la requête  
Nos appels réseau fonctionnent et nous permettent de récupérer en une fois une nouvelle citation et une nouvelle photo.

Nous n'avons plus qu'à utiliser ces données dans le contrôleur pour les afficher à l'écran.

#### Création du modèle Quote
Pour manipuler des données, il faut être structuré. On ne va pas juste envoyer des `String` et des `Data` comme ça au contrôleur. À la place, on va envoyer un joli petit objet `Quote`.

Je vous laisse donc créer un fichier `Quote.swift`. Il contiendra une structure `Quote` qui admet 3 propriétés :
- `text` et `author` de type `String`
- `imageData` de type `Data`

Vous pouvez télécharger la correction [ici](https://s3-eu-west-1.amazonaws.com/static.oc-static.com/prod/courses/files/Parcours+DA+iOS/Cours+8+-+Appels+réseaux/Quote.swift).

#### Les callbacks

Souvenez-vous, en MVC, **le modèle discute avec le contrôleur via les notifications**.

======> P1/P1C6_1.png

Mais il y a d'autres mécanismes et dans ce cours, nous allons parler d'un deuxième mécanisme : **les callbacks**.

======> P1/P1C6_2.png

Les callbacks sont très simples. Le contrôleur va appeler une fonction du modèle, et il va indiquer en paramètre de la fonction, l'action à effectuer lorsque la réponse est reçue. Et pour cela, nous allons simplement utiliser les fermetures.

> **:information_source:** C'est exactement comme ce que nous venons de faire avec la fonction `getImage`. Donc assurez vous d'avoir bien compris le chapitre précédent car nous allons faire la même chose avec la fonction `getQuote`.

Nous allons commencer par modifier la déclaration de notre fonction `getQuote` en ajoutant le paramètre `callback`. Ce paramètre est une fermeture et donc du type fonction.

Pour définir précisément son type, il faut réfléchir à ce que l'on veut que le callback renvoie :

- un booléan `success` qui permet de savoir si l'appel a réussi ou non.
- un objet `quote` qui est l'objet que nous avons récupéré et construit avec nos requêtes.

Cela donne la déclaration suivante pour getQuote :

```swift
static func getQuote(callback: @escaping (Bool, Quote?) -> Void) { (...) }
```

> **:information_source:** De nouveau, je ne détaille pas le paramètre `@escaping`. Je vous invite à regarder l'[article suivant](https://medium.com/@kumarpramod017/what-do-mean-escaping-and-nonescaping-closures-in-swift-d404d721f39d).

On utilise en paramètre de notre fermeture un booléan et un objet `Quote` optionnel car si la requête échoue, on n'a pas d'objet à renvoyer.

#### Envoie du callback

##### Succès
Nous allons maintenant envoyer le callback. Et pour cela, nous allons commencer par créer notre objet quote à partir des trois données reçues : `author`, `text` et `data`.

```swift
let quote = Quote(text: text, author: author, imageData: data)
```

Ensuite, nous allons envoyer le callback comme ceci :

```swift
callback(true, quote)
```

On passe le booléen à `true` car on est dans le cas où la requête a réussi et ensuite, on passe l'objet `quote` que nous venons de créer.

##### Erreur

Voyons maintenant, les cas d'erreur. Si on regarde notre fonction `getQuote`, on ne gère pas du tout les erreurs pour l'instant :

```swift
let task = session.dataTask(with: request) { (data, response, error) in
	if let data = data, error == nil {
		if let response = response as? HTTPURLResponse, response.statusCode == 200 {
			if let responseJSON = try? JSONDecoder().decode([String: String].self, from: data),
			    let text = responseJSON["quoteText"],
			    let author = responseJSON["quoteAuthor"] {
			    	getImage { (data) in
					if let data = data {
						let quote = Quote(text: text, author: author, imageData: data)
						callback(true, quote)
					}
				}
			}
		}
	}
}
```

On fait plein de vérifications, mais si ça ne se passe pas comme prévu, on ne fait rien ! On va rajouter des `else` à tout ces `if` et si ça ne se passe pas comme prévu, on va envoyer un callback d'échec :

```swift
callback(false, nil)
```

Voici ce que ça donne :

```swift
let task = session.dataTask(with: request) { (data, response, error) in
	if let data = data, error == nil {
		if let response = response as? HTTPURLResponse, response.statusCode == 200 {
			if let responseJSON = try? JSONDecoder().decode([String: String].self, from: data),
			    let text = responseJSON["quoteText"],
			    let author = responseJSON["quoteAuthor"] {
			    	getImage { (data) in
                    if let data = data {
                        let quote = Quote(text: text, author: author, imageData: data)
                        callback(true, quote)
                    } else {
                        callback(false, nil)
                    }
                }
            } else {
                callback(false, nil)
            }
        } else {
            callback(false, nil)
        }
    } else {
        callback(false, nil)
    }
}
```
> **:information_source:** Oui je sais, c'est pas bien joli, mais dans la prochaine partie, on va apprendre une technique qui va rendre tout ça beaucoup plus propre !

Il nous reste maintenant à faire l'équivalent dans la méthode `getImage`. En effet, on ne gère pas plus les erreurs dans celle-ci :

```swift
let task = session.dataTask(with: pictureUrl) { (data, response, error) in
	if let data = data, error == nil {
		if let response = response as? HTTPURLResponse, response.statusCode == 200 {
			completionHandler(data)
		}
	}
}
```

De la même manière, on va rajouter des `else` à ces `if` comme ceci :

```swift
let task = session.dataTask(with: pictureUrl) { (data, response, error) in
	if let data = data, error == nil {
		if let response = response as? HTTPURLResponse, response.statusCode == 200 {
			completionHandler(data)
		} else {
			completionHandler(nil)
		}
	} else {
		completionHandler(nil)
	}
}
```

Si le téléchargement échoue, on ne peut pas renvoyer de données et donc à la place, on renvoie `nil`. Cette information est utilisée ensuite dans la fonction `changeQuote` pour envoyer les bons paramètres dans le callback.

#### Réception des callback

Nos callback sont envoyées et maintenant, il faut les réceptionner dans le contrôleur.

Nous allons commencer par appeler la méthode `getQuote` dans notre fonction `tappedNewQuoteButton` :

```swift
@IBAction func tappedNewQuoteButton() {
    QuoteService.getQuote { (success, quote) in
    }
}
```

Ensuite, nous allons vérifier que le paramètre `success` est à `true` et que l'objet `quote` ne vaut pas `nil`.

```swift
QuoteService.getQuote { (success, quote) in
	if success, let quote = quote {
		// Afficher la citation
	} else {
		// Présenter un message d'erreur
	}
}
```

Si tout va bien, on affiche la citation, sinon on présente une alerte à l'utilisateur.

> **:information_source:** Besoin d'un rappel sur les alertes ? C'est par [ici](https://openclassrooms.com/courses/ajoutez-plusieurs-pages-a-votre-application-ios/presentez-une-alerte-a-lutilisateur) !

Essayez de le faire par vous même d'abord ! Voici ma version :

```swift
@IBAction func tappedNewQuoteButton() {
    QuoteService.getQuote { (success, quote) in
        if success, let quote = quote {
            self.update(quote: quote)
        } else {
            self.presentAlert()
        }
    }
}

private func update(quote: Quote) {
    quoteLabel.text = quote.text
    authorLabel.text = quote.author
    imageView.image = UIImage(data: quote.imageData)
}

private func presentAlert() {
    let alertVC = UIAlertController(title: "Error", message: "The quote download failed.", preferredStyle: .alert)
    alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
    present(alertVC, animated: true, completion: nil)
}
```

J'ai factorisé chaque cas dans deux fonctions, le reste ne devrait pas poser problème.

#### Tadaaa...

Et voilà ! Il n'y a plus qu'à tester ! Vous pouvez lancer le simulateur et appuyez sur le bouton *New Quote*.

Et.... c'est le drame ! Ça ne marche pas ! À la place, vous avez un message d'erreur dans la console qui vous dit :

```console
Main Thread Checker: UI API called on a background thread: -[UILabel setText:]
```

Alors oui je sais, après tous ces efforts, c'est frustrant de finir sur une erreur ! Mais ne vous inquiétez pas, on va résoudre tout ça dès le prochain chapitre en parlant du concept de *thread* !

## Professionnalisez vos requêtes  

### Débloquez votre interface le multi-threading  
Dans le chapitre précédent, nous avons voulu tester notre application dans le simulateur et nous avons obtenu cette erreur :

```console
Main Thread Checker: UI API called on a background thread: -[UILabel setText:]
```

Et on ne va pas tirer beaucoup d'informations du message puisqu'on ne sait pas ce qu'est un **thread**. Ce chapitre va y remédier !

#### Présentation du multi-threading
Pour comprendre ce qu'est un *thread*, il faut savoir comment fonctionne le processeur de votre téléphone.

> **:information_source:** Le processeur, c'est le composant électronique qui fait tous les calculs dans votre ordinateur / tablette / téléphone / frigo connecté, etc.

Un processeur est une machine à calculer, mais contrairement à nous autres êtres pensants, **le processeur ne fait qu'une seule chose à la fois**.

Le problème c'est que parfois, vous avez besoin qu'il fasse deux plusieurs à la fois, surtout avec un smartphone réputé pour être multitâche !

Par exemple, lorsque vous vous déplacez dans une carte, l'iPhone doit gérer en même temps l'interprétation de votre geste sur l'écran tactile, le chargement de nouvelles zones de la carte sur le réseau et la modification de l'affichage à l'écran à partir des données de votre mouvement et de celles des zones chargées.

Pour y arriver et que le résultat soit fluide pour l'utilisateur, le processeur utilise la technique du **multithreading : il va séparer son activité en plusieurs threads et il va passer très rapidement de l'un à l'autre** en fonction de ses besoins, jusqu'à qu'il ait terminé de tout traiter. Cela donne quelque chose comme ça :

======> P2/P2C1_1.png

On voit sur ce schéma le processeur passer rapidement d'un thread à l'autre.

> **:information_source:** Cela a lieu tellement vite que l'utilisateur ne s'en rend pas compte, on parle de millisecondes.

Mais il y a encore plus efficace ! La dernière fois que vous avez acheté un ordinateur, vous avez peut-être entendu parler des processeurs bicoeur ou quadricoeur. Ce sont des processeurs qui eux ont vraiment la capacité de faire deux ou quatre choses à la fois, car ils ont deux ou quatre centres de calculs.

> **:information_source:** Certains processeurs très puissants ont jusqu'à 24 coeurs.

L'intérêt d'avoir plusieurs coeurs, c'est que du coup les calculs ont *vraiment* lieu en parallèle. Et le schéma précédent devient :

======> P2/P2C1_2.png

Les threads prennent tout leur sens avec ce genre de puce, car ils avancent en même temps et du coup les calculs sont bien plus rapides !

#### Les queues et GCD

Les threads sont un concept très bas niveau, c'est-à-dire très proche de la réalité matérielle d'un processeur. Du coup, les développeurs ont créé une logique un peu plus abstraite, mais plus facile à manipuler : les **queues**.

> **:information_source:** On fait souvent ça en développement. Par exemple, en tant que développeur, vous n'allez pas vous amuser à modifier directement la mémoire vive de votre téléphone. Si vous voulez stocker, lire ou modifier des données, vous allez utiliser des variables et non des capacités et adresses mémoires. Les queues sont aussi abstraites et pratiques que les variables et permettent d'éviter de gérer directement les threads.

Le mécanisme qui permet de s'affranchir des threads en tant que développeur s'appelle **Grand Central Dispatch**. C'est un peu comme une gare de triage. En tant que développeur, on va pouvoir créer des lignes de chemin de fer, les unes à côté des autres, c'est ce qu'on appelle des **queues**. Et on va pouvoir rajouter des trains sur ces queues, c'est ce qu'on appelle des **tâches**.

*Grand Central Dispatch* (GCD) est la technologie qui va s'occuper de faire avancer les trains en fonction des ressources du processeur, en minimisant l'impact sur la batterie du téléphone et selon un ordre de priorité défini par le développeur.

Autrement dit le développeur va créer les queues, leur assigner des tâches, définir les niveaux de priorités de chaque queue et GCD va faire avancer tout ce petit monde.

Il y a trois types de queues :
- ***Main Queue*** : c'est la queue principale, la plus prioritaire. Elle existe toujours. On va y revenir.
- ***Global Queues*** : ce sont des queues standard du système qui peuvent être utilisées par le développeur. Elles ont 4 niveaux de priorités. Les tâches dans les queues les plus prioritaires seront exécutées plus vite :
	- `User-interactive` : très prioritaire. À utiliser pour tout ce qui est lié à l'interface pour obtenir une expérience utilisateur fluide.
	- `User-initiated` : pour les tâches qui sont lancées par l'utilisateur, mais pour lesquelles on peut attendre une réponse.
	- `Utility` : pour les longues tâches dont l'utilisateur suit la progression : traitement d'images, téléchargement de ressources, etc.
	- `Background` : pour les tâches de fond dont l'utilisateur n'est pas au courant et qui ne sont donc pas urgentes.
- ***Custom Queue*** : ce sont des queues complètement paramétrables par le développeur.

#### Application à URLSession
> **:question:** OK, mais concrètement qu'est-ce que ça donne ?

Je sais, c'est beaucoup à digérer. Raccrochons les wagons et revenons au problème qui nous occupe.

Par défaut, **tout le code que vous rédigez s'exécute dans la *Main Queue*** (par habitude, certains parlent aussi de Main Thread, mais faites attention, ce ne sont pas des synonymes).

Le problème, c'est que lorsque vous faites un appel réseau dans la *Main Queue*, il faut attendre le retour et parfois cela prend du temps. Mais du coup, tout le reste de votre application est bloqué, interface comprise !

Pour empêcher cela, `URLSessionTask` effectue ses tâches de façon asynchrone dans une queue séparée. Et quand la réponse revient, je suis toujours dans une queue séparée. Pour être très concret, voici ce qui se passe dans le code :

```swift
static func getQuote(callback: @escaping (Bool, Quote?) -> Void) {
	// On est dans la Main Queue par défaut
	let request = createQuoteRequest()
	let session = URLSession(configuration: .default)

	// Pour éviter de bloquer l'application, la tâche va avoir lieu dans une queue séparée.
	let task = session.dataTask(with: request) { (data, response, error) in
		// A la réception de la réponse je suis toujours dans la queue séparée
	}
	task.resume()
}
```

Et c'est là qu'est le problème ! Car il existe une règle d'or avec les threads en iOS (et si vous ne retenez qu'une seule chose de ce chapitre, retenez ça !) :

> **Tout ce qui touche à l'interface doit avoir lieu dans la Main Queue !**

Or, ici quand on reçoit la réponse de notre appel réseau, on est dans une queue séparée, et tout ce qu'on fait ensuite a lieu dans une queue séparée, que ce soit l'envoi du callback ou la mise à jour de l'interface.

Et maintenant, on comprend mieux ce que nous dit Xcode :

```console
Main Thread Checker: UI API called on a background thread: -[UILabel setText:]
```

Il ne veut pas effectuer la méthode `setText` de `UILabel,` car on n'est pas dans la `Main Queue`.

Qu'à cela ne tienne, on va y retourner !

#### Résolution du problème

Pour gérer les queues avec Swift, on utilise la classe `DispatchQueue`. Elle permet de créer des queues Custom, Global ou de revenir dans la Main Queue. Pour revenir dans la Main Queue, on écrit :

```swift
DispatchQueue.main.async {
	// Le code qui a lieu s'exécute dans la Main Queue
}
```

Il ne nous reste plus qu'à rajouter ça dans nos deux appels ce qui donne ceci pour la fonction `getQuote` :

```swift
static func getQuote(callback: @escaping (Bool, Quote?) -> Void) {
	let request = createQuoteRequest()
	let session = URLSession(configuration: .default)

	let task = session.dataTask(with: request) { (data, response, error) in
		DispatchQueue.main.async {
			// (...)
		}
	task.resume()
}
```

et pour la fonction `getImage` :

```swift
private static func getImage(completionHandler: @escaping ((Data?) -> Void)) {
	let session = URLSession(configuration: .default)
	let task = session.dataTask(with: pictureUrl) { (data, response, error) in
		DispatchQueue.main.async {
			// (...)
		}
	}
	task.resume()
}
```

Vous pouvez lancer votre application dans le simulateur et ça y est ! Tout fonctionne ! Bravo !

#### En résumé
- Les threads permettent au processeur de faire plusieurs choses à la fois en parallélisant ses calculs.
- Les queues sont des objets qui permettent au développeur des répartir des tâches sur plusieurs files différentes, notamment dans le but de ne pas bloquer l'application lorsqu'une tâche est trop longue.
- Il existe plusieurs types de queues.
- `Grand Central Dispatch` est le nom de la technologie qui gère l'avancement des tâches sur les différentes queues.
- **Tout ce qui touche à l'interface doit avoir lieu dans la Main Queue !**
- Pour revenir dans la Main Queue, on fait la commande suivante :
```swift
DispatchQueue.main.async {
	// Le code qui a lieu s'exécute dans la Main Queue
}
```

Dans le prochain chapitre, nous allons améliorer notre code pour gérer le cas des requêtes concurrentes.

### Gérez les requêtes concurrentes avec le singleton pattern  
Notre application fonctionne bien, mais nous ne gérons pas parfaitement nos appels. En effet, si vous appuyez plusieurs fois d'affiler sur le bouton *New Quote*, sans attendre la réponse du serveur, les résultats sont assez aléatoires... Ce n'est donc pas une expérience utilisateur de qualité !

Le problème, c'est qu'on envoie plusieurs appels à la fois et en fonction du réseau, ils ne vont pas forcément revenir dans le bon ordre. Pour résoudre ce problème, nous allons faire en sorte de n'autoriser qu'un seul appel à la fois !

#### Utiliser une seule tâche
Si on réfléchit à la façon dont fonctionnent nos appels pour l'instant, on se rend compte qu'à chaque appel, on crée une tâche différente.

En effet, lorsqu'on appelle notre méthode static `QuoteService.getQuote`, on crée un nouvel objet `URLSessionTask` à chaque fois :

```swift
let task = session.dataTask(with: request) { (data, response, error) in
	// (...)
}
```

Pour changer ça, nous allons commencer par faire de cette tâche une propriété de notre classe `QuoteService` :

```swift
private var task: URLSessionDataTask?
```

> **:information_source:** Je lui donne le type optionnel pour ne pas avoir à l'initialiser ici.

Ensuite, je peux utiliser cette tâche dans `getQuote` et `getImage` comme ceci :

```swift
task = session.dataTask(with: request) { (data, response, error) in
	// (...)
}
```

Le problème, c'est que maintenant nous utilisons une propriété dans une méthode statique donc Xcode ne va pas être content... Qu'à cela ne tienne ! Nous allons modifier toutes nos méthodes statiques en méthodes d'instances en supprimant les mot-clés `static`.

> **:x:** Cela cause 2/3 tout petits soucis, mais je vous fais confiance à votre niveau pour les résoudre comme des grands ! ;)

Maintenant, nous devons modifier notre appel dans le contrôleur comme ceci :

```swift
QuoteService().getQuote { (success, quote) in (...) }
```

On appelle la fonction `getQuote` **sur une instance** de `QuoteService` et non sur la classe directement.

#### Annuler une tâche

Avec ce petit travail préalable, **nous allons pouvoir travailler sur une instance fixe de `task`** et donc on va pouvoir annuler la tâche si une autre tâche est lancée.

On a vu qu'on pouvait lancer un appel avec la méthode `resume` de `URLSessionTask`. Pour l'annuler, on va utiliser la méthode `cancel`.

```swift
task?.cancel()
task = session.dataTask(with: request) { (data, response, error) in
	// (...)
}
task?.resume()
```

Si une tâche est en cours, on l'annule avant de créer puis lancer une nouvelle tâche !

> **:warning:** Il faut bien sûr faire cela pour les deux appels, celui de `getQuote` et celui de `getImage`.

#### La dure confrontation avec le réel...

Avec le travail que l'on vient de faire, vous pouvez tester dans le simulateur que les appels ont maintenant bien lieu les uns après les autres.

> **:question:** Euh... Rien à changer !

Eh oui ! Je vous ai (encore ;) ) bien eu !

Pourquoi rien à changer ? À cause de cette ligne :

```swift
QuoteService().getQuote { (success, quote) in (...) }
```

À chaque fois, qu'on appuie sur le bouton et qu'on appelle la fonction `getQuote`, **on crée une nouvelle instance de `QuoteService`**. Du coup, on créée à chaque fois une nouvelle instance de `task` et donc on ne peut jamais annuler la tâche en cours, car on ne travaille jamais avec la même tâche !

Pour résoudre ce problème, il faudrait que l'on travaille toujours avec la même instance de `QuoteService` et pour cela, nous allons découvrir et utiliser le pattern Singleton.

#### Le pattern Singleton

##### Définition
**Le pattern Singleton permet de limiter l'usage d'une classe à une seule instance.** Cela veut dire que l'on ne va pas pouvoir créer plusieurs instances de la classe, on ne va pouvoir en utiliser qu'une seule !

Ce pattern est souvent utile lorsqu'on a besoin de gérer **un unique objet**. Par exemple, en iOS, la classe `UIDevice` (qui permet notamment d'avoir des informations sur le modèle, la version d'iOS du téléphone, etc.) utilise ce pattern.

En effet, votre code est exécuté sur un appareil unique. Du coup, pour accéder aux informations stockées dans cette classe, vous n'allez pas utiliser ceci :

```swift
UIDevice()
```

Mais ceci :

```swift
UIDevice.current
```

`UIDevice` définit une propriété statique `current` de type `UIDevice` qui est la seule instance disponible de cette classe :

```swift
class UIDevice {
	static var current = UIDevice()
}
```

##### Utilisation

Nous allons faire la même chose avec notre classe `QuoteService`. Nous allons définir une propriété statique de type `QuoteService` :

```swift
static var shared = QuoteService()
```

> **:information_source:** On nomme souvent `shared` l'instance unique, car c'est l'instance qui va être **partagée** par toutes les autres classes qui vont l'utiliser.

Maintenant, nous allons protéger la classe pour empêcher la création d'autres instances. Une idée de comment faire ?

> **:question:** Il suffit de ne pas créer d'initialiseur. Et c'est déjà le cas, donc c'est bon ?

Bien vu ! Mais pas tout à fait exact ! Souvenez-vous, les classes ont un initialiseur par défaut qui n'a aucun paramètre. C'est cet initialiseur par défaut qui nous avait permis d'écrire ceci :

```swift
QuoteService().getQuote()
```

L'initialiseur par défaut est présent dans les parenthèses après `QuoteService`. Nous ne pouvons pas supprimer cet initialiseur par défaut, mais nous pouvons le rendre inaccessible en dehors de la classe `QuoteService` en le rendant privé :

```swift
private init() {}
```

Et voilà ! Vous pouvez maintenant essayer d'écrire `QuoteService()`, cela ne marche plus qu'à l'intérieur de la classe `QuoteService`.

On a maintenant une instance unique de notre classe que nous allons pouvoir utiliser comme ceci :

```swift
QuoteService.shared.getQuote { (success, quote) in (...) }
```

Vous pouvez essayer dans le simulateur ! Si vous lancez deux appels sans attendre le retour du premier, vous aurez maintenant une alerte qui s'affiche :

======> P2/P2C2_1.png

Cela signifie que la première tâche a bien été annulée avant qu'une deuxième ne soit créée.

#### Protégez l'interface

Nous avons enfin réussi à ne faire qu'un seul appel à la fois ! Et c'est très bien ! Mais l'expérience utilisateur n'est pas incroyable avec cette alerte.

Nous allons faire en sorte que de toute façon, l'utilisateur ne puisse pas lancer deux appels en même temps. Et pour cela, **nous allons cacher le bouton le temps de la requête et le remplacer par un indicateur d'activité**.

Rien de plus simple ! Il suffit d'utiliser la propriété `isHidden` pour cacher le bouton et afficher l'indicateur puis faire l'inverse lorsque la réponse revient :

```swift
@IBAction func tappedNewQuoteButton() {
    newQuoteButton.isHidden = true
    activityIndicator.isHidden = false

    QuoteService.shared.getQuote { (success, quote) in
        self.newQuoteButton.isHidden = false
        self.activityIndicator.isHidden = true

        if success, let quote = quote {
            self.update(quote: quote)
        } else {
            self.presentAlert()
        }
    }
}
```

Et comme nous sommes des développeurs qui détestons nous répéter, on va créer une jolie méthode et écrire plutôt ceci :

```swift
@IBAction func tappedNewQuoteButton() {
    toggleActivityIndicator(shown: true)

    QuoteService.shared.getQuote { (success, quote) in
        self.toggleActivityIndicator(shown: false)

        if success, let quote = quote {
            self.update(quote: quote)
        } else {
            self.presentAlert()
        }
    }
}

private func toggleActivityIndicator(shown: Bool) {
	activityIndicator.isHidden = !shown
	newQuoteButton.isHidden = shown
}
```

Et voilà ! Vous pouvez lancer votre application dans le simulateur et maintenant, vous avez une belle roue qui tourne pour signifier à l'utilisateur le chargement de la citation et l'empêcher de lancer un deuxième appel.

======> P2/P2C2_2.png

> **:warning:** Cela ne veut pas dire qu'il suffit de protéger l'interface ! Même si c'est pratique, **vos appels doivent aussi être protégés dans le modèle**. On ne sait jamais comment l'interface peut évoluer dans le futur.

#### En résumé

- Pour annuler une tâche, vous pouvez utiliser la méthode `cancel`. Pour cela, il faut que vous ayez accès à la même instance et donc éviter la création d'une nouvelle tâche à chaque appel.
- **Le pattern Singleton permet d'obtenir une classe qui admet une unique instance.**
- Pour le créer, on crée une instance dans une propriété statique et on rend privée l'initialisation par défaut :  
```swift
class Singleton {
	static var shared = Singleton()
	private init() {}
}
```
- Pour une bonne expérience utilisateur, il est conseillé d'empêcher les appels multiples en utilisant un indicateur d'activité

Dans le prochain chapitre, vous allez découvrir une fonctionnalité toute simple de Swift, mais qui va rendre votre code bien plus propre : le mot-clé guard !

### Fuyez la pyramide condamnée avec guard  
Oui le titre de ce chapitre sonne comme le début d'un mauvais film d'horreur des années 80... Et pour autant, nous allons parler d'un sujet très sérieux en programmation : la Pyramide Condamnée (ou Pyramid of Doom en anglais, tout de suite ça fait moins rire... Ils sont fort ces Américains...) !


#### La pyramide condamnée

> **:question:** Très bien, mais c'est quoi ?

Une illustration vaut mille mots, alors je vous laisse apprécier ce gif :

======> P2/P2C3_1.gif

La pyramide condamnée, c'est donc quand on a des conditions les unes dans les autres qui forment une pyramide immense et rendent le code assez peu agréable à lire, à cause de toutes les indentations.

Et comme vous le savez, **la lisibilité du code est tout sauf optionnelle** ! C'est ce qui fera de vous des bons ou des mauvais développeurs ! Donc on va prendre ce problème très au sérieux et le résoudre grâce au mot-clé `guard`.

#### Le mot-clé guard
Le mot clé `guard` est un cousin de la combinaison `if/else`. Il permet lui aussi de contrôler des conditions, mais avec une syntaxe un peu particulière.

Prenons un exemple : si vous voulez contrôler qu'il n'y a pas d'erreur, vous allez écrire :

```swift
if error == nil {
	print("Tout va bien !")
} else {
	print("Oups ! Il y a une erreur.")
}
```

Jusque là, rien de nouveau. Maintenant écrivons la même chose avec le mot-clé guard :

```swift
guard error == nil else {
	print("Oups ! Il y a une erreur.")
	return
}

print("Tout va bien !")
```

C'est un petit peu déroutant au début alors prenons le temps de détailler :
1. On écrit d'abord le mot-clé guard suivi d'une condition, jusque là ça ressemble au if.
2. Ensuite, on écrit tout de suite le `else` suivi du code correspondant au cas où la condition **n'est pas** respectée.
3. Ensuite, on écrit le mot-clé `return` qui empêche la suite du code de s'exécuter s’il y a une erreur.
4. Enfin, on sait que l'erreur a été traitée s'il y en avait une donc on peut exécuter le code correspondant au cas où **la condition est respectée**.

Ce mécanisme permet de traiter les erreurs d'abord et ensuite d'exécuter son code sereinement. On appelle ce mécanisme *early exit*. Car `guard` fournit une porte de sortie rapide du code si la condition est évaluée à `false`, sinon le code continue de s'exécuter.

Voici du coup la représentation schématique de guard :

```swift
guard condition else {
	// Code si false
	return
}
// Code si true
```

> **:warning:** En pratique, si vous vous trouvez dans une fonction qui renvoie une valeur. Vous écrirez `return` suivie d'une valeur. Par exemple `return nil`, ou `return 0`.

> **:information_source:** Sachez qu'il y a d'autres moyens pour sortir du `guard` que `return` comme `throw` ou `fatalError,` mais vous verrez ça plus tard.

#### Refactorisation de QuoteService avec guard
Voyons maintenant ce que ça donne sur notre classe `QuoteService` et commençons avec la fonction `getImage` :

```swift
private func getImage(completionHandler: @escaping ((Data?) -> Void)) {
	let session = URLSession(configuration: .default)

	task?.cancel()
	task = session.dataTask(with: QuoteService.pictureUrl) { (data, response, error) in
		DispatchQueue.main.async {
			guard let data = data, error == nil else {
				completionHandler(nil)
				return
			}

			guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
				completionHandler(nil)
				return
			}

			completionHandler(data)
		}
	}
	task?.resume()
}
```

La pyramide a disparu et c'est l'un des gros avantages de `guard` : vous permettre de gérer les erreurs au même niveau que les cas nominaux (les cas où tout se passe bien) !

À vous de jouer maintenant ! Essayez de factoriser la fonction getQuote avec guard ! Vous pourrez retrouver la correction [ici](https://s3-eu-west-1.amazonaws.com/static.oc-static.com/prod/courses/files/Parcours+DA+iOS/Cours+8+-+Appels+réseaux/getQuote.swift).

#### guard/else vs if/else  

> **:question:** OK, mais du coup quand doit-on utiliser guard plutôt que if ?

`guard` ou `if` que choisir ? Tel est la question ! La réponse est assez simple :

> **On utilise `if` pour faire de logique entre plusieurs cas et `guard` pour prévenir une erreur.**

Prenons un exemple, si je veux vérifier que l'utilisateur a bien rentré un email dans un champ de texte, il s'agit plutôt de prévenir une erreur donc je vais utiliser guard :

```swift
guard text.isEmail else {
	print("Vous n'avez pas rentré un email correct.")
	return
}

print("Merci pour votre email !")
```

Maintenant, imaginons que je lui demande son âge et que selon son âge, il va avoir le droit à des accès différents :

```swift
if age >= 18 {
	print("Vous avez accès au bar.")
} else {
	print("Vous avez accès à la salle de billard.")
}
```

Ici, il ne s'agit pas de renvoyer une erreur ou non, mais d'articuler une logique selon plusieurs cas donc j'utilise `if`.

> **:information_source:** En pratique, vous allez du coup assez souvent utiliser `guard`. Ne serait-ce que pour déballer des optionnels. Par ailleurs, je vous suggère d'utiliser le `switch` combiné à une énumération quand il y a plusieurs cas donc finalement vous devriez utiliser assez peu le `if`.

#### En résumé
- La pyramide condamnée apparaît lorsqu'on enchaîne les conditions les unes dans les autres en obtenant des indentations de plus en plus grandes.
- Le mot-clé `guard` permet de casser la pyramide condamnée en permettant la gestion d'erreur au même niveau que le cas nominal.
- Le mot-clé `guard` s'utilise avec la syntaxe suivante :  
```swift
guard condition else {
	// Code si false
	return
}
// Code si true
```
- On utilise `if` pour faire de logique entre plusieurs cas et `guard` pour prévenir une erreur.

Bravo ! Vos appels réseau sont désormais de grande qualité, vous pouvez être fier de vous ! Ce qui fera vraiment la différence néanmoins, ce sera votre capacité à faire du code stable. Et qui dit stable, dit testable ! Or, tester les appels réseau n'est pas toujours une tasse de thé... sauf si vous passez simplement à la partie suivante ! ;)

## Testez votre appel réseau  

### Appréhendez la difficulté de tester un appel réseau  
Comme tout développeur qui se respecte, vous devriez vous sentir mal à l'aise maintenant... Il y a quelque chose qui vous perturbe fondamentalement, qui secoue votre être tout entier. Et tout à coup, vous posez les mots sur votre inconfort transcendantal :

> **:question:** ON N’A PAS FAIT DE TESTS !

C'est excellent ! Je vois que vous êtes pétris de bonnes pratiques. Mais rassurez-vous, nous allons en parler pendant toute cette partie ! Alors, accrochez-vous, car, c'est sans doute la partie de ce cours la plus riche !

> **:warning:** Vous ne pourrez pas suivre cette partie du cours sans une vraiment bonne compréhension des tests en iOS. Si ce n'est pas le cas, allez voir ce [cours](https://openclassrooms.com/courses/debuggez-et-testez-vos-applications-ios) !

#### Le problème

Comme nous l'avons vu, en MVC on teste au moins le modèle. Donc en l'occurrence, pour nous cela se résume à la classe `QuoteService`.

> **:information_source:** En effet, la structure `Quote` ne contient pas de logique donc on ne va pas la tester.

Or, dans la classe `QuoteService`, on fait des appels réseau. Et donc, la réponse va tarder à arriver. Et on retombe dans le même problème. On doit attendre la réponse de l'appel dans le test.

Or les tests ne sont pas faits pour attendre. Il s'exécute instantanément.

Mais bien sûr, il existe des solutions à cela et nous allons en mentionner deux :
1. Les expectations
2. Les doubles

#### Les expectations
Les expectations sont une mécanique présente dans le framework `XCTest` qui permet justement d'attendre un certain délai avant de terminer l'exécution du test.

Voici comment elles fonctionnent :

```swift
func testDownloadWebData() {

	// On crée l'expectation en lui donnant une simple description.
	let expectation = XCTestExpectation(description: "Télécharge le site openclassrooms.com")

	// On prépare une requête
	let url = URL(string: "https://openclassrooms.com")!
	let dataTask = URLSession(configuration: .default).dataTask(with: url) { (data, _, _) in

		// On vérifie qu'il y a bien des données qui ont été chargées, c'est ici que le test a lieu.
		XCTAssertNotNil(data)

		// On déclare que l'expectation est terminée, on peut clore le test.
		expectation.fulfill()
	}

	// On lance la requête.
	dataTask.resume()

	// On attend que l'expectation soit terminée, avec une durée maximum de 10 secondes.
	wait(for: [expectation], timeout: 10.0)
}
```

L'expectation permet d'attendre le retour de la requête. Cette méthode est donc assez simple et a l'avantage de fonctionner tout de suite sans modification du code de notre application.

Mais elle a un très gros défaut : **chaque test va mettre entre 2 et 10 secondes selon la qualité du réseau à s'exécuter**. Ce qui est 50 fois plus long qu'un test classique. Et si vous multipliez ça par 3 ou 4 tests par appels réseau, vous finissez avec une suite de tests qui s'exécute en quelques minutes au lieu de quelques secondes, même pour une petite application.

> **:question:** OK, mais quel est le problème à ce que les tests soient longs ?

Le but des tests est de protéger votre code et d'éviter l'apparition de bugs. Donc à chaque fois que vous changez votre code, vous allez lancer vos tests pour vérifier que tout va bien. Et si vos tests durent à chaque fois quelques minutes, soit vous allez cesser de le faire, soit vous allez perdre un temps fou.

Donc, pour résumer, **des tests unitaires longs sont des tests unitaires inexistants.**

Par ailleurs, vos tests vont avoir un deuxième défaut, ils seront **instables**. En fonction de la qualité du réseau, vos tests vont passer ou non. Si la requête mets plus de 10 secondes, le test va échouer et vous aller perdre du temps à chercher une erreur qui est en fait simplement dû au réseau.

Bref, il faut une autre option.

#### Les doubles  
L'autre option, ce sont les doubles. **Un double, c'est une classe qui va se substituer à une autre pour simuler son comportement.**

Par exemple, on va créer un double de `URLSession` qui va simuler les appels réseau, mais ne pas les faire vraiment. On pourra quand même tester le comportement lié à la réponse : s'il manque des données, s'il y a une erreur, si tout va bien, etc. Mais **comme on simule l'appel, on n’a pas le délai d'attente de la réponse lié au réseau**.

Cette technique permet donc de s'affranchir du délai d'un appel réseau et donc tous les désavantages qui vont avec, comme la lenteur et l'instabilité des tests. C'est donc largement mieux de procéder ainsi !

Le seul défaut de cette méthode, c'est qu'elle est un peu plus longue à mettre en place. Mais une fois que vous aurez bien compris, ce sera facile !

Nous allons procéder en plusieurs étapes :
1. Création des réponses réseau pour simuler le résultat.
2. Préparation du code pour le rendre testable avec des doubles.
3. Création du double
4. Rédaction des tests

> **:information_source:** Vous avez peut-être déjà entendu parler des doubles sous d'autres terminologies comme mock ou fake. Ce ne sont pas exactement des synonymes et on va voir ensemble la différence entre ces termes.

> **:warning:** Je me permets d'insister sur le fait que **cette partie est vraiment la plus importante du cours,** car elle va vous permettre de vous distinguer en tant que développeur professionnel.

#### En résumé
Pour tester des appels réseau, on peut utiliser :

- les expectations : facile à mettre en place mais rendent les tests lents et instables. Mauvaise option.
- les doubles : plus compliqué à mettre en place mais gardent les tests propres et rapides.

Dans le prochain chapitre, nous allons créer des données de test qui vont nous permettre de simuler la réponse à un appel réseau.

### Créez votre jeu de données de test  
Pour éviter de faire de véritables appels réseau dans nos tests, nous allons créer un jeu de données de test. Ces données vont simuler les différentes réponses que l'on peut recevoir avec appels réseau.

Pour cela, nous allons créer de fausses données de réponse pour nos tests, soit à partir de véritables données récupérées sur l'API Forismatic, soit en créant nous-mêmes nos données.

#### Mettre en place les tests

Pour faire tout cela, il nous une target dans notre projet Xcode pour écrire nos tests unitaires. Nous allons la créer et créer ensuite un fichier de test unitaire : `QuoteServiceTestCase.swift`.

> **:information_source:** Toutes les instructions pour faire cela sont détaillées dans ce [cours](https://openclassrooms.com/courses/debuggez-et-testez-vos-applications-ios/creez-votre-premier-test).

Je vous laisse faire. Vous devriez obtenir ceci dans votre navigateur :

======> P3/P3C2_1.png

#### Récupérer des données de test

Nous allons récupérer nos données de test directement depuis l'API Forismatic pour qu'elles soient le plus proche possible de la réalité.

Pour cela, lancez simplement un appel sur Postman et copiez la réponse :

======> P3/P3C2_2.png

Ensuite, dans Xcode, créez un nouveau fichier (<kbd>cmd + n</kbd>) et choisissez *Empty* :

======> P3/P3C2_3.png

Puis nommez le `Quote.json` et sauvegardez-le du côté des tests.

======> P3/P3C2_4.png

Dedans, vous pouvez coller la réponse récupérée dans Postman.

======> P3/P3C2_5.png

Nous avons maintenant un joli fichier json dans notre projet que nous allons pouvoir utiliser dans nos tests à la place d'un véritable appel réseau.

#### Remplissage de notre classe

Pour pouvoir récupérer les données sur le fichier et les utiliser dans nos tests, nous allons créer une classe que nous allons appeler `FakeResponseData` dont le rôle va être de gérer les données de test.

> **:information_source:** Je vous invite à créer le fichier et la classe correspondante.

C'est fait ? Bien ! Réfléchissons maintenant aux données que nous allons essayer de simuler dans cette classe. Cette classe doit nous permettre de simuler la réponse d'un serveur lors de nos deux appels réseau.

Du coup, retournons voir un peu à quoi ressemble cette réponse :

```swift
task = session.dataTask(with: request) { (data, response, error) in
	// (...)
}
```

La réponse contient trois paramètres `data`, `response` et `error`. Pour simuler la réponse des deux APIs, nous allons avoir besoin de simuler ces trois paramètres pour chaque appel. Je vous propose de commencer par le plus simple : `response`.

##### Simuler response

Pour simuler `response`, nous allons créer deux instances de `HTTPURLResponse` :
- Une qui a pour code 200 : c'est le cas où tout va bien.
- Une avec le code 500 : quand ça ne fonctionne pas.

```swift
static let responseOK = HTTPURLResponse(
	url: URL(string: "https://openclassrooms.com")!,
	statusCode: 200, httpVersion: nil, headerFields: [:])!

static let responseKO = HTTPURLResponse(
	url: URL(string: "https://openclassrooms.com")!,
	statusCode: 500, httpVersion: nil, headerFields: [:])!
```

> **:information_source:** On met une URL au hasard, car ici on ne s'intéresse ici qu'au code HTTP, c'est la seule chose que l'on contrôle.

Ces deux réponses vont nous permettre de tester nos cas d'erreurs liés à un mauvais code HTTP.

##### Simuler error

Dans notre code, on ne s'intéresse pas à l'erreur en elle-même mais seulement à **la présence ou non** d'une erreur. Donc nous allons juste créer une erreur toute simple comme ceci :

```swift
class QuoteError: Error {}
static let error = QuoteError()
```

Ici, on doit créer une classe `QuoteError` qui implémente le protocole `Error`. En effet, `Error` étant un protocole, on ne peut pas en obtenir une instance. Donc je crée une classe pour y parvenir.

> **:information_source:** Si ce point n'est pas parfaitement clair, ce n'est pas trop grave pour le moment. On parlera plus des protocoles dans un autre cours. L'essentiel, c'est que vous compreniez ici qu'on simule une erreur, peu importe son contenu.

#### Simuler data

Nous allons maintenant, nous attaquer au plus gros morceau : simuler les véritables données renvoyées par les APIs et nous allons simuler trois données différentes :
- Le JSON renvoyé par Forismatic.
- Un JSON endommagé qui ne correspond pas au format que nous attendons.
- Les données renvoyées par Unsplash.

Toutes ces données doivent être de type `Data`.

##### Simuler le json renvoyé par Forismatic

Nous allons utiliser le fichier que nous avons créé en début de chapitre. Notre objectif va être ici de récupérer les données du fichier dans le code.

Pour cela, il faut d'abord récupérer le paquet dans lequel se trouve notre fichier. Ce paquet, on l'appelle `Bundle` en Swift. Et il nous faut commencer par récupérer le bon `bundle` : celui dans lequel se trouve notre fichier `Quote.json`.

Il y a deux `bundle` dans notre projet, un par *target*, donc un pour les tests et un pour l'application.

On va récupérer celui des tests comme ceci :

```swift
let bundle = Bundle(for: FakeResponseData.self)
```

Ici je demande le `bundle` qui contient le fichier de la classe dans laquelle je me trouve : `FakeResponseData`. Ce sera du coup le bundle des tests, celui qui contient aussi notre fichier `Quote.json`.

Une fois qu'on a le `bundle`, on récupère l'URL à laquelle se trouve notre fichier en indiquant le nom et l'extension du fichier que l'on cherche :

```swift
let url = bundle.url(forResource: "Quote", withExtension: "json")!
```

Enfin, je récupère les données contenues à cette url via l'initialiseur `init(contentsOf: URL)` de `Data` :

```swift
let data = try! Data(contentsOf: url)
```

> **:information_source:** Ne paniquez pas sur `try!`, je vous promets, on va en parler !

On va mettre tout ça dans une propriété calculée et ça donne ceci :
```swift
static var quoteCorrectData: Data? {
	let bundle = Bundle(for: FakeResponseData.self)
	let url = bundle.url(forResource: "Quote", withExtension: "json")!
	return try! Data(contentsOf: url)
}
```

Et voilà ! Nous avons les données de notre fichier dans une belle propriété qu'on va pouvoir utiliser dans nos tests.

##### Simuler un json endommagée

Pour simuler un JSON endommagé, il suffit d'avoir des données qui n'ont rien à voir avec un fichier JSON. Pour cela, on va créer une constante de type `Data` dans laquelle on va mettre la valeur de notre choix.

> **:information_source:** On peut du coup mettre n'importe quelle valeur ! Si je vous demande de me présenter un animal qui est tout sauf une vache, vous avez l'embarras du choix ;) !

Ma méthode préférée pour créer de fausses données, c'est l'encodage des `String` :

```swift
static let quoteIncorrectData = "erreur".data(using: .utf8)!
```

J'utilise la méthode `data(using:)` sur un string de mon choix et je précise l'encodage le plus classique. La méthode renvoie une valeur de type `Data`.

> **:information_source:** Vous pouvez écrire ce que vous voulez à la place de "erreur".

Les données générées par cet encodage n'auront rien à voir avec un JSON et cela va nous permettre de tester le cas où les données ne sont pas au format attendu.

##### Simuler les données de l'image

Enfin, pour simuler les données de l'image, je vais faire exactement la même chose :

```swift
static let imageData = "image".data(using: .utf8)!
```

> **:information_source:** Ces données ne permettront jamais de faire une image mais ce n'est pas le but. Ici, je veux juste pouvoir vérifier que les données que je reçois sont utilisées correctement **dans mon modèle** mais pas dans ma vue.

Et voilà ! Toutes nos données sont prêtes et elles vont nous permettre de simuler toutes les différentes réponses que nous pouvons recevoir de nos deux appels.

#### En résumé
En guise de résumé, je vous propose le code complet de la classe `FakeResponseData` :

```swift
class FakeResponseData {
	// MARK: - Data
	static var quoteCorrectData: Data? {
		let bundle = Bundle(for: FakeResponseData.self)
		let url = bundle.url(forResource: "Quote", withExtension: "json")!
		return try! Data(contentsOf: url)
	}

	static let quoteIncorrectData = "erreur".data(using: .utf8)!

	static let imageData = "image".data(using: .utf8)!

	// MARK: - Response
	static let responseOK = HTTPURLResponse(
		url: URL(string: "https://openclassrooms.com")!,
		statusCode: 200, httpVersion: nil, headerFields: [:])!

	static let responseKO = HTTPURLResponse(
		url: URL(string: "https://openclassrooms.com")!,
		statusCode: 500, httpVersion: nil, headerFields: [:])!


	// MARK: - Error
	class QuoteError: Error {}
	static let error = QuoteError()
}
```

> **:information_source:** Si vous souhaitez aller plus loin, je vous suggère ce [très bon post](https://www.swiftbysundell.com/posts/writing-end-to-end-json-mapping-tests-in-swift). Il explique comment automatiser la première partie de ce chapitre où l'on récupère et ajoute le fichier JSON dans notre projet. Sa méthode a l'avantage de s'assurer que l'on teste toujours vis-à-vis de la dernière version d'une API.

Dans le prochain chapitre, nous allons préparer notre classe `QuoteService` à être testée et vous allez découvrir un concept important en architecture logicielle : l'injection de dépendance.

Et rassurez-vous, ça n'est pas aussi impressionnant que ça en a l'air !

### Préparez votre classe à être testée  
Nous avons maintenant les données qui vont nous permettre de simuler les réponses à nos appels réseau.

Le but de tout ceci, ne l'oublions pas, est de tester la classe `QuoteService`. Or, lorsqu'on teste, on ne s'intéresse qu'à la partie publique d'une classe et pas à son implémentation interne.

Dans notre cas, voici à quoi ressemble la partie publique de notre classe :

```swift
class QuoteService {
	static let shared: QuoteService
	func getQuote(callback: @escaping (Bool, Quote?) -> Void)
}
```

Notre interface publique ne présente donc qu'une méthode : la méthode `getQuote`. **C'est donc exclusivement cette méthode que nous allons tester.**

Le problème, c'est que dans cette méthode, il y a un appel réseau. Or nous voulons justement éviter l'appel réseau dans les tests et récupérer plutôt les données via notre classe `FakeResponseData`.

À première vue, cela paraît compliqué. Parce que cela veut dire qu'il nous faut deux versions différentes d'une même méthode, une pour les tests et une pour l'application.

> **:question:** Mais c'est impossible !

Pas tout à fait, et nous allons voir comment faire ça dans ce chapitre !

> **:warning:** Ce chapitre est la clé de voute de cette partie ! Donc, accrochez-vous !

#### À la recherche des coupables

Regardons un peu notre fonction `getQuote` pour voir comment elle fonctionne :

```swift
func getQuote(callback: @escaping (Bool, Quote?) -> Void) {
	let request = createQuoteRequest()
	let session = URLSession(configuration: .default)

	task?.cancel()
	task = session.dataTask(with: request) { (data, response, error) in
		// (...)
	}
	task?.resume()
}
```

Ici l'appel est créé à la ligne 6 avec la méthode `dataTask` de `URLSession` et il est lancé à la ligne 9 avec la méthode `resume` de `URLSessionDataTask`. C'est précisément à ces deux endroits que l'on doit modifier les choses pour que l'appel n'ait pas lieu dans les tests.

Donc cela veut dire qu'en fait, on ne veut pas modifier l'implémentation de `getQuote` mais celles de `dataTask(with:, completionHandler:)` et de `resume()`.

> **:question:** Mais on ne peut pas modifier les méthodes de ces classes ! On ne les a pas écrites !

Oui, vous avez tout à fait raison.

Mais rien ne nous empêche de créer des sous-classes d'`URLSession` et de `URLSessionDataTask` dans lesquelles nous allons faire l'override des méthodes qui nous ennuie. Comme ceci par exemple :

```swift
class URLSessionFake: URLSession {
	override func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
		// Ici j'écris ce que je veux
	}
}
```

Et dans cette version *fake* de URLSession, on peut écrire ce qu'on veut.

> **:question:** OK, c'est très bien vu, mais ça nous avance à rien !

Pardon ?

> **:question:** Bah oui. Le code de `getQuote` utilise la classe `URLSession` et pas ta classe `URLSessionFake`.

C'est vrai mais on peut changer le code et utiliser la classe `URLSessionFake`, non ?

> **:question:** Oui mais si on fait ça, ce sera bien pour les tests mais l'application ne marchera plus !

Hmmm... Vous vous ne vous laissez pas avoir si facilement, c'est bien ! En effet, il faut qu'on trouve un moyen d'utiliser `URLSession` côté application et `URLSessionFake` côté test.

Et ce problème a une solution qui porte un nom repoussant : l'injection de dépendance.

#### L'injection de dépendance

L'**injection de dépendance**, dit comme ça, ça a l'air hyper technique mais en fait, c'est vraiment simple. Il s'agit de **sortir une variable de l'implémentation d'une méthode pour en faire une propriété.**

En tant que propriété de la classe, celle-ci peut-être librement modifiée et donc le code ne dépend plus de cette variable.

Prenons un exemple pour y voir plus clair. Pour l'instant, mon code ressemble à ceci :

```swift
func getQuote(callback: @escaping (Bool, Quote?) -> Void) {
	let request = createQuoteRequest()
	let session = URLSession(configuration: .default) // Le code dépends de URLSession

	task?.cancel()
	task = session.dataTask(with: request) { (data, response, error) in
		// (...)
	}
	task?.resume()
}
```

Donc mon code dépend de la classe `URLSession`.

> **:information_source:** En programmation *dépendre de* signifie que mon code ne peut plus fonctionner si la classe `URLSession` n'existe pas.

Nous allons maintenant extirper cette variable et en faire une propriété de la classe :

```swift
class QuoteService {
	var session = URLSession(configuration: .default)

	func getQuote(callback: @escaping (Bool, Quote?) -> Void) {
		let request = createQuoteRequest()

		task?.cancel()
		task = session.dataTask(with: request) { (data, response, error) in
			// (...)
		}
		task?.resume()
	}
}
```

La dépendance envers `URLSession` a disparu de l'implémentation de `getQuote`. Je n’avais pas dit que c'était simple ?

> **:question:** Attends un peu ! La méthode `getQuote` ne dépend peut-être plus de `URLSession` mais la classe `QuoteService` en dépend toujours.

Certes, mais comme `session` est devenue une propriété, cela signifie que je peux changer sa valeur. Et je peux donc écrire ceci :

```swift
var quoteService = QuoteService.shared
quoteService.session = URLSessionFake()
```

> **:information_source:** `URLSessionFake` étant une sous-classe de `URLSession`, toute instance de `URLSessionFake` est par héritage une instance de `URLSession`. C'est cette astuce qui rend possible la ligne 2.

Ainsi, lorsque j'utilise ma classe côté application, je garde la valeur de `session` par défaut mais lorsque je l'utilise pour les tests, j'utilise une autre valeur avec la classe `URLSessionFake` qui me permet d'éviter l'appel.

**Cette propriété est un point d'entrée pour injecter une dépendance**. Je peux choisir la dépendance que j'injecte : `URLSession` ou `URLSessionFake`, d'où le nom d'injection de dépendance.

Je vais créer deux sessions différentes, une par appel, donc je vais créer deux propriétés que je vais utiliser dans les deux méthodes `getQuote` et `getImage` :

```swift
var quoteSession = URLSession(configuration: .default)
var imageSession = URLSession(configuration: .default)

func getQuote(callback: @escaping (Bool, Quote?) -> Void) {
	let request = createQuoteRequest()
	task?.cancel()

	// On utilise quoteSession ici
	task = quoteSession.dataTask(with: request) { (data, response, error) in
		// (...)
	}
	task?.resume()
}

private func getImage(completionHandler: @escaping ((Data?) -> Void)) {
	task?.cancel()

	// On utilise imageSession ici
	task = imageSession.dataTask(with: QuoteService.pictureUrl) { (data, response, error) in
		// (...)
	}
	task?.resume()
}
```

Et voilà, vous avez fait vos deux premières injections de dépendance ! C'était pas si dur non ?

#### Juste pour faire propre
Je n'aime pas trop avoir des propriétés publiques qui ne devraient pas l'être. Pourtant les tests ont besoin d'accéder à ces propriétés. Mais je vous propose du coup de créer plutôt un initialiseur pour ces deux propriétés et de les laisser privées.

```swift
private var quoteSession = URLSession(configuration: .default)
private var imageSession = URLSession(configuration: .default)

init(quoteSession: URLSession, imageSession: URLSession) {
	self.quoteSession = quoteSession
	self.imageSession = imageSession
}
```

Cela limite la modification de ces propriétés à l'initialisation et non pendant toute la vie de l'objet.

#### En résumé
Lorsqu'on teste un appel réseau, on cherche à simuler l'appel plutôt qu'à le faire. Du coup, on cherche à remplacer l'objet responsable de l'appel, en l'occurrence `session`, par un autre objet du même type mais qui lui simulera l'appel.

Pour cela, on réalise une injection de dépendance en créant une propriété qui nous permettra de remplacer l'objet `session` par une fausse session de notre création.

Dans le prochain chapitre, nous allons créer notre fameuse classe `URLSessionFake` qui va faire office de fausse session !

### Préparez votre double  
En introduction de cette partie, je vous ai expliqué que pour tester des appels réseau, on peut utiliser les expectations ou les doubles et pourquoi nous allions préférer les doubles.

Dans les deux chapitres précédents, nous avons créé nos données de test et préparé notre classe `QuoteService` à être testée. Dans ce chapitre, nous allons créer nos doubles !

#### Vous avez dit double ?
Un double, c'est un peu **le jumeau maléfique d'une classe**. Pour notre code côté application, il est invisible, car il ressemble en tout point à la classe qu'il double. Mais en fait, son implémentation interne est complètement différente.

Il existe de nombreux types de doubles : les dummy, les stub, les spy, les mock et les fake.

> **:information_source:** Nous n'allons pas rentrer dans le détail de chacun d'eux mais je vous suggère ce [très bon article](https://clean-swift.com/swifty-little-mocker/) si vous souhaitez en savoir plus.

Sachez seulement que nous allons utiliser ici un *fake* qui est la version la plus sophistiquée du double, car elle simule complètement le comportement de la classe originale.

#### Qui doubler ?
On souhaite éviter l'appel réseau et on a vu au chapitre précédent qu'il était préparé avec la méthode `dataTask` de `URLSession` et lancé avec la méthode `resume` de `URLSessionDataTask`.

Nous allons donc doubler ces deux classes responsables conjointement de l'appel réseau. On va donc créer les classes :
- `URLSessionFake` qui hérite de `URLSession`
- `URLSessionDataTaskFake` qui hérite de `URLSessionDataTask`

#### Quoi doubler ?

Que va-t-on doubler dans nos deux classes ? Autrement dit, quelles méthodes va-t-on doubler ?

La réponse est simple : toutes les méthodes dont notre code a besoin pour fonctionner, donc si on regarde notre code, on va voir qu'il s'agit pour `URLSessionFake` de :

```swift
func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask
func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask
```

et pour `URLSessionDataTaskFake` de :

```swift
func resume()
func cancel()
```

Ce sont les seules méthodes de ces deux classes que l'on utilise dans notre code.

#### C'est parti !

On sait maintenant où on va, alors allons-y !

Côté test, créez un fichier `URLSessionFake.swift` et dedans créez vos deux classes `URLSessionFake` et `URLSessionDataTaskFake` :

```swift
class URLSessionFake: URLSession {
}

class URLSessionDataTaskFake: URLSessionDataTask {
}
```

> **:warning:** Je vais volontairement aller un peu plus vite pour la suite afin que vous puissiez rapidement avoir la vue d'ensemble du code. Ensuite, on s'appuiera là-dessus en fin de chapitre pour prendre le temps de bien détailler l'interaction des différentes briques. Donc pas de panique s’il y a quelques petites zones d'ombre dans les paragraphes qui viennent ;) !

##### URLSessionDataTaskFake
Nous allons commencer par l'implémentation de `URLSessionDataTaskFake`. Nous allons faire les override des deux méthodes cités plus haut :

```swift
class URLSessionDataTaskFake: URLSessionDataTask {
	override func resume() {}
	override func cancel() {}
}
```

La fonction `cancel` doit annuler l'appel réseau s'il y en a un en cours. Dans nos tests, comme on simule l'appel, cela aura lieu instantanément donc il n'y aura jamais d'appel en cours à annuler. Donc on peut laisser son implémentation vide.

La fonction `resume` doit lancer l'appel. Dans notre cas, comme c'est instantané, cette fonction ne va pas lancer l'appel mais appeler directement le bloc de retour avec des les données de la réponse.

Quand je parle du bloc de retour, je parle de ceci :

======> P3/P3C4_1.png

Ce bloc est une fermeture qui a pour type `(Data?, URLResponse?, Error?) -> Void`. Je vous propose qu'on crée une propriété de ce type.

```swift
var completionHandler: ((Data?, URLResponse?, Error?) -> Void)?
```

Nous allons mettre en propriété les trois paramètres de cette fermeture. Cela va nous permettre lorsque nous ferons nos tests de pouvoir configurer les réponses que nous simulerons avec les valeurs de notre choix.

```swift
var data: Data?
var urlResponse: URLResponse?
var responseError: Error?
```

Du coup, la fonction `resume` peut maintenant être rédigée. Il s'agit seulement d'exécuter le bloc de retour avec les paramètres que nous venons d'écrire :

```swift
override func resume() {
	completionHandler?(data, urlResponse, responseError)
}
```

Nous avons maintenant un beau double de `URLSessionDataTask`. Et nous allons pouvoir passer à `URLSessionFake`.

##### URLSessionFake
Comme on l'a dit en début de chapitre, nous allons faire l'override de deux méthodes ici :

```swift

class URLSessionFake: URLSession {
	override func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {}
	override func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {}
}
```
Le rôle de ces deux méthodes est de créer une instance de `URLSessionDataTask` qui va contenir toutes les données nécessaires pour faire la requête et ensuite faire la requête avec la méthode `resume`.

Nous allons ici ne pas créer une instance de `URLSessionDataTask` mais plutôt de `URLSessionDataTaskFake`.

```swift
class URLSessionFake: URLSession {
	override func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
		let task = URLSessionDataTaskFake()
		return task
	}

	override func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
		let task = URLSessionDataTaskFake()
		return task
	}
}
```

Maintenant, nous allons configurer notre fausse tâche `task`. Tout d'abord, nous allons lui passer le paramètre `completionHandler` :

```swift
class URLSessionFake: URLSession {
	override func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
		let task = URLSessionDataTaskFake()
		task.completionHandler = completionHandler
		return task
	}

	override func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
		let task = URLSessionDataTaskFake()
		task.completionHandler = completionHandler
		return task
	}
}
```

Ensuite, réfléchissons un peu. Dans nos tests, nous allons utiliser l'initialisation de `QuoteService` créé au chapitre précédent pour passer à notre objet `QuoteService` de fausses sessions :

```swift
init(quoteSession: URLSession, imageSession: URLSession) {
	self.quoteSession = quoteSession
	self.imageSession = imageSession
}
```

Ces fausses sessions sont donc notre moyen pour configurer les réponses de l'appel. Et comme vous le savez, une réponse contient trois données : data, response et error. Donc nous allons faire en sorte que nos `URLSessionFake` soient configurables avec ces trois données :

```swift
var data: Data?
var response: URLResponse?
var error: Error?

init(data: Data?, response: URLResponse?, error: Error?) {
	self.data = data
	self.response = response
	self.error = error
}
```

Maintenant, nous allons passer ces données à notre objet `task` :

```swift
override func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
	let task = URLSessionDataTaskFake()
	task.completionHandler = completionHandler
	task.data = data
	task.urlResponse = response
	task.responseError = error
	return task
}

override func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
	let task = URLSessionDataTaskFake()
	task.completionHandler = completionHandler
	task.data = data
	task.urlResponse = response
	task.responseError = error
	return task
}
```

Et voilà nos doubles sont tout prêt et nous allons pouvoir tester !

#### Par où passe le code ?

J'ai conscience que tout ceci n'est pas évident à digérer alors je vous propose qu'on prenne du recul pour comprendre par où passe le code.

Voici un schéma que je vous propose pour vous y retrouver dans un premier temps. Je vous invite à l'étudier avant de passer à la suite.

======> P3/P3C4_2.png

> **:information_source:** Vous pouvez en retrouvez une version HD [ici](https://s3-eu-west-1.amazonaws.com/static.oc-static.com/prod/courses/files/Parcours+DA+iOS/Cours+8+-+Appels+réseaux/P3C4_2-HD.png).

Dans nos tests, nous allons d'abord créer une instance de `QuoteService` avec l'initialiseur suivant :

```swift
let quoteService = QuoteService(quoteSession:URLSession, imageSession:URLSession)
```

Dans `quoteSession` et `imageSession`, nous allons injecter des instances de `URLSessionFake` que nous allons initialiser comme ceci :

```swift
URLSessionFake(data: Data?, response: URLResponse?, error: Error?)
```

A la place des paramètres `data`, `response` et `error`, nous allons mettre les données que nous avons préparées dans notre classe `FakeResponseData`.

Ensuite, nous allons appeler la méthode `getQuote` puisque c'est cette méthode que l'on cherche à tester :

```swift
quoteService.getQuote()
```

Cette méthode va s'exécuter et appeler la méthode `dataTask`. Seulement ce ne sera pas la version originale mais la version que nous venons d'écrire, celle d'`URLSessionFake`. Notre version construit une instance de `URLSessionDataTaskFake` et la remplit avec d'une part les données issues de notre classe `FakeResponseData` et d'autre part le `completionHandler` qui n'est autre que le bloc suivant :

======> P3/P3C4_1.png

Ensuite, dans `getQuote`, on appelle la méthode `resume` sur la tâche nouvellement créée :

```swift
task?.resume()
```

Seulement ici notre task est de type `URLSessionDataTaskFake` et donc la version de la méthode `resume` qui va être appelée est celle que l'on vient d'écrire. Et cette version exécute le bloc (celui de l'illustration ci-dessus) avec les paramètres de réponse que l'on a récupéré de la classe `FakeResponseData`.

Et voilà comment on simule un appel.

#### Par où passent les données ?

Parce que les choses vont toujours mieux si on les explique trois fois, je vous propose une dernière lecture de tout ceci.

1. On crée un jeu de données qui contient de fausses réponses de l'API dans la classe `FakeResponseData`.
2. Ce jeu de donnée est stocké dans une `URLSessionFake`.
3. Cet `URLSessionFake` est injecté dans `QuoteService` et il remplace l'implémentation de `URLSession`. C'est là que l'appel réseau est simulé.
4. `URLSessionFake` crée une instance de `URLSessionDataTaskFake` à qui il passe les données ainsi que le bloc de retour.
5. `URLSessionFake` dans sa fonction `resume` exécute le bloc de retour avec les données reçues.

#### En résumé

Si tout cela n'est pas encore parfaitement clair pour vous, prenez le temps de bien parcourir le code ou de relire les différents chapitres pour comprendre comment interagissent les différentes classes. Pour vous y aider, voici le code complet du fichier `URLSessionFake.swift` :

```swift
import Foundation

class URLSessionFake: URLSession {
	var data: Data?
	var response: URLResponse?
	var error: Error?

	init(data: Data?, response: URLResponse?, error: Error?) {
		self.data = data
		self.response = response
		self.error = error
	}

	override func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
		let task = URLSessionDataTaskFake()
		task.completionHandler = completionHandler
		task.data = data
		task.urlResponse = response
		task.responseError = error
		return task
	}

	override func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
		let task = URLSessionDataTaskFake()
		task.completionHandler = completionHandler
		task.data = data
		task.urlResponse = response
		task.responseError = error
		return task
	}
}

class URLSessionDataTaskFake: URLSessionDataTask {
	var completionHandler: ((Data?, URLResponse?, Error?) -> Void)?
	var data: Data?
	var urlResponse: URLResponse?
	var responseError: Error?

	override func resume() {
		completionHandler?(data, urlResponse, responseError)
	}

	override func cancel() {}
}
```

Il ne s'agit que de notions que vous connaissez : héritage, initialisations, propriétés, etc. Mais mises toutes ensemble, cela peut être légèrement déstabilisant.

Dans tous les cas, le prochain chapitre devrait vous aider, car nous allons enfin faire marcher toutes ces briques ensemble pour rédiger nos tests !

###  Rédigez vos tests  
Le moment que vous attendiez tous est arrivé ! Nous allons rédiger nos tests !

> **:information_source:** Pour cela, nous allons nous placer dans le fichier `QuoteServiceTestCase`. N'oubliez pas de rajouter la mention `@testable import ClassQuote` en haut du fichier pour avoir accès aux classes de notre application.

Nous allons faire ensemble 5 tests. Ils vont correspondre aux 4 cas d'erreur du premier appel et au cas où tout se passe bien sur les deux appels.

#### Premier test
Pour le premier test, nous allons choisir le cas où il y a une erreur. Dans ce cas, dans le bloc de retour, on envoie un callback d'erreur. Donc dans notre premier test, nous allons vérifier que si on reçoit une erreur, on a bien l'envoi de ce callback avec les bonnes valeurs.

Commençons à rédiger notre test :

```swift
func testGetQuoteShouldPostFailedCallbackIfError() {
	// Given

	// When

	// Then
}
```

> **:information_source:** Ici, je choisis de ne pas nommer mon test en suivant rigoureusement le Behavior Driven Development. En revanche, la structure de mon test va suivre cela avec rigueur. Besoin d'un rappel sur le BDD ? C'est par [là](https://openclassrooms.com/courses/debuggez-et-testez-vos-applications-ios/testez-la-classe-game#/id/r-4887662) !

On souhaite tester la classe `QuoteService` donc nous allons en créer une instance en utilisant l'initialiseur que nous avons créé à cet effet. Nous allons y mettre des instances de `URLSessionFake` qui correspondent à la situation que le l'on souhaite tester ici.

```swift
// Given
let quoteService = QuoteService(
	quoteSession: URLSessionFake(data: nil, response: nil, error: FakeResponseData.error),
	imageSession: URLSessionFake(data: nil, response: nil, error: nil))
```

Je remplis mon `URLSessionFake` avec les valeurs de retour que je souhaite tester. Ici, je cherche juste à tester le cas où il y a une erreur. Donc je remplis seulement le paramètre erreur avec l'erreur que nous avons créé dans `FakeResponseData`.

Par ailleurs, je ne mets aucun paramètre dans `imageSession,` car je sais que je ne ne teste pas ici le second appel puisque le premier va déjà échouer.

Ensuite, j'écris mon *When* :

```swift
// When
quoteService.getQuote { (success, quote) in
}
```

C'est la fonction que je souhaite tester.

Enfin, nous allons écrire le *Then*. Nous allons vérifier que `success` vaut bien `false` et que `quote` vaut bien `nil`. Notre *Then* a donc lieu dans nore fermeture.

```swift
// When
quoteService.getQuote { (success, quote) in
    // Then
    XCTAssertFalse(success)
    XCTAssertNil(quote)
}
```

Et voilà ! Vous pouvez tester... Ça marche ?

> **:question:** Euh... oui !

FAUX ! Vous n'êtes pas des testeurs vigilants ;) ! Essayez d'écrire `XCTAssertTrue` au lieu de `XCTAssertFalse`. Vous verrez qu'au mieux vos tests réussissent toujours et au pire que cela fait crasher vos tests. Dans les deux cas, cela veut dire que vos tests ne fonctionnent pas !

> **:question:** Hmmm... En effet... mais pourquoi ?

La raison se trouve dans notre fonction `getQuote` et plus précisément à cette ligne :

```swift
DispatchQueue.main.async { (...) }
```

Ici, on change de queue. Donc cela a lieu entre le *When* et le *Then* de notre test. Ce changement de queue nous fait perdre la notion d'exécution instantanée, car les instructions n'ont plus lieu les unes à la suite des autres mais dans des queues séparées. Du coup, on ce micro décalage nous empêche de récupérer notre callback correctement.

Pour résoudre ce problème, **nous allons créer un micro délai, qui va permettre d'analyser la réception du callback seulement à partir du moment où le changement de queue a eu lieu**. Et nous allons créer pour cela une `expectation` comme ceci :

```swift
// When
let expectation = XCTestExpectation(description: "Wait for queue change.")
quoteService.getQuote { (success, quote) in
    // Then
    XCTAssertFalse(success)
    XCTAssertNil(quote)
    expectation.fulfill()
}

wait(for: [expectation], timeout: 0.01)
```

Cela a lieu en trois temps :

1. On crée un objet `expectation` en lui donnant simplement une description.
2. Une fois le callback reçu, on appelle la méthode `fulfill` pour signifier que nous n'avons plus besoin d'attendre l'expectation a eu lieu.
3. On fait attendre notre code 1 centième de secondes maximum, pour permettre au changement de queue d'avoir lieu.

> **:information_source:** Je vous aie dit que les expectations servaient à attendre dans un test et que du coup cela rendait les tests lents. Mais ici, on attends au pire un centième de seconde donc ce micro délai ne va donc pas ralentir nos tests. Je vous avais dit que les changements de queue étaient très rapides !

Vous pouvez lancer votre test et vérifier que tout va bien !

Voici le code complet de notre test.

```swift
func testGetQuoteShouldPostFailedCallbackIfError() {
    // Given
    let quoteService = QuoteService(
        quoteSession: URLSessionFake(data: nil, response: nil, error: FakeResponseData.error),
        imageSession: URLSessionFake(data: nil, response: nil, error: nil))

    // When
    let expectation = XCTestExpectation(description: "Wait for queue change.")
    quoteService.getQuote { (success, quote) in
        // Then
        XCTAssertFalse(success)
        XCTAssertNil(quote)
        expectation.fulfill()
    }

    wait(for: [expectation], timeout: 0.01)
}
```

#### Les autres tests d'erreur
Nous allons maintenant tester les autres cas d'erreur. Dans tous les cas d'erreur, on doit vérifier que le callback d'erreur est bien envoyée. C'est donc la même chose que le test précédent. **Seule la situation initiale, le *Given*, va varier**.

##### Pas de données
Nous allons tester le cas où l'appel ne renvoie pas de données :

```swift
func testGetQuoteShouldPostFailedCallbackIfNoData() {
	// Given
	let quoteService = QuoteService(
		quoteSession: URLSessionFake(data: nil, response: nil, error: nil),
		imageSession: URLSessionFake(data: nil, response: nil, error: nil))

	// (...)
}
```

Ici, on ne met aucune donnée mais également pas d'erreur, le callback est censé être renvoyé.

> **:information_source:** La suite du test ne change pas, donc je ne vous la redonne pas.

##### Une réponse incorrecte

```swift
func testGetQuoteShouldPostFailedCallbackIfIncorrectResponse() {
	// Given
	let quoteService = QuoteService(
		quoteSession: URLSessionFake(
			data: FakeResponseData.quoteCorrectData,
			response: FakeResponseData.responseKO,
			error: nil),
		imageSession: URLSessionFake(data: nil, response: nil, error: nil))

	// (...)
}
```

Ici, je ne donne aucune erreur et de bonnes données pour ne pas tomber dans les premiers cas précédents. Mais je fournis un mauvais objet response. Il a notamment un code de 500 au lieu de 200.

##### Des données incorrectes

```swift
func testGetQuoteShouldPostFailedCallbackIfIncorrectData() {
	// Given
	let quoteService = QuoteService(
		quoteSession: URLSessionFake(
			data: FakeResponseData.quoteIncorrectData,
			response: FakeResponseData.responseOK,
			error: nil),
		imageSession: URLSessionFake(data: nil, response: nil, error: nil))

	// (...)
}
```

Ici aucune erreur et une réponse correcte pour éviter les cas d'erreur précédents. Mais je fournis de mauvaises données pour tester le cas où le décodage du JSON échoue.

#### Quand tout va bien
Nous allons maintenant tester le cas où tout va bien. Dans ce cas, la méthode doit envoyer un callback qui contient un booléen avc la valeur `true` et un objet `Quote` rempli avec les données reçues.

Démarrons par le *Given* :

```swift
func testGetQuoteShouldPostSuccessCallbackIfNoErrorAndCorrectData() {
	// Given
	let quoteService = QuoteService(
		quoteSession: URLSessionFake(
			data: FakeResponseData.quoteCorrectData,
			response: FakeResponseData.responseOK,
			error: nil),
		imageSession: URLSessionFake(
			data: FakeResponseData.imageData,
			response: FakeResponseData.responseOK,
			error: nil))
}
```

C'est le cas où tout va bien, donc nous remplissons le retour de la requête avec des données correctes, des réponses correctes et pas d'erreur.

Ensuite, le *When* ne change pas :

```swift
// When
let expectation = XCTestExpectation(description: "Wait for queue change.")
quoteService.getQuote { (success, quote) in
	// Then
}
```

On teste toujours la méthode `getQuote`.

Et ensuite, dans le *Then*, nous allons essayer tester cette fois-ci le contenu de notre callback de succès :

```swift
// Then
XCTAssertTrue(success)
XCTAssertNotNil(quote)
expectation.fulfill()
```

Bien ! Vous pouvez tester et ça marche !

C'est du bon travail mais on doit aller plus loin, on doit tester que le contenu de l'objet `quote` corresponds à ce que nous attendons.

Commençons par préparer les données que nous nous attendons à voir dans l'objet `Quote` renvoyée par le callback :

```swift
let text = "Face your deficiencies and acknowledge them; but do not let them master you. Let them teach you patience, sweetness, insight."
let author = "Helen Keller"
let imageData = "image".data(using: .utf8)!
```

Ici, je copie simplement les données du texte et de l'auteur contenu dans mon JSON de test et je prépare des données `imageData` qui correspondent à celles que nous avions préparées dans `FakeResponseData`.

Et nous allons maintenant vérifier que les données correspondent ce qui donne finalement :

```swift
quoteService.getQuote { (success, quote) in
    // Then
    XCTAssertTrue(success)
    XCTAssertNotNil(quote)

    let text = "Face your deficiencies and acknowledge them; but do not let them master you. Let them teach you patience, sweetness, insight."
    let author = "Helen Keller"
    let imageData = "image".data(using: .utf8)!

    XCTAssertEqual(text, quote!.text)
    XCTAssertEqual(author, quote!.author)
    XCTAssertEqual(imageData, quote!.imageData)

    expectation.fulfill()
}
```

Vous pouvez tester et ça marche !

#### Exercice

Vous aurez noté que nous n'avons pas du tout traité les cas d'erreur du deuxième appel. La raison ? Ils sont assez similaires à ceux du premier appel et donc je vous laisse le faire pour vous entraîner !

Vous devriez avoir 3 tests à ajouter.

> **:information_source:** Pour vérifier que vos tests couvrent bien votre code, pensez à activer la couverture des tests. Souvenez-vous de comment faire [ici](https://openclassrooms.com/courses/debuggez-et-testez-vos-applications-ios/evaluez-la-couverture-de-vos-tests) !

Vous pourrez trouver la correction [ici](https://s3-eu-west-1.amazonaws.com/static.oc-static.com/prod/courses/files/Parcours+DA+iOS/Cours+8+-+Appels+réseaux/QuoteServiceTestCase.swift). Bonne chance !

#### En résumé

- On utilise nos données de test pour simuler les retours des appels réseau.
- On passe ses données dans nos doubles et on injecte les doubles dans la classe à tester.
- On contrôle la valeur des paramètres du callback.
- Le multithreading empêche l'exécution instantanée de notre code et on introduit un micro délai pour attendre le changement de queue.

J'ai conscience que cette partie était relativement difficile. Mais je crois fondamentalement que les tests feront de vous des très bons développeurs et vous permettront d'évoluer sereinement dans votre code. Ils participent donc directement à votre bien-être au travail.

Et pour ne pas finir comme la grande majorité des développeurs qui procrastinent l'intégration des tests dans leurs habitudes, il vous faut apprendre avec les tests. Car **les tests et le code en production sont aussi importants l'un que l'autre.**

> **:warning:** Je vous recommande vivement de faire une pause : prenez un cookie, faites du sport, nettoyez votre salle de bain ou allez vous coucher !  
>
> Et en revenant, **relisez l'intégralité de cette partie**.  
>
> Cet exercice ne vous prendra pas beaucoup de temps. Mais maintenant que vous avez la vue d'ensemble, il permettra à votre cerveau de finaliser les connexions qui ne se sont pas encore faites et vous permettra d'assimiler en profondeur le contenu riche de cette partie !

Je vous donne ensuite rendez-vous dans la prochaine partie où nous allons parler de la gestion d'erreur en `Swift` et lever le voile sur ces mystérieux `try` que nous avons croisé ensemble !

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

> **:information_source:** Nous n'avons pas encore parlé en détail des protocoles. On les a seulement survolés. Un protocole définit **un ensemble de méthodes et de fonctions** qui vont pouvoir être adoptés par un type. En Swift, le protocole est un concept très puissant, et **peut être adopté par une classe, une structure ou même un enum**. Il permet ensuite de manipuler des types sans avoir à se soucier de ce qu'il y'a derrière. Je peux créer un protocol `Weapon` avec une méthode `shoot()` et une variable `ammunition`, et je pourrais manipuler différents objets sans savoir si j'utilise un lance-pierre ou une mitraillette.

#### Créer les erreurs
La façon la plus classique d'utiliser ce protocole, c'est de **définir une énumération** qui adopte le protocole `Error`. Nous allons donc définir une énumération `OrderError` dans notre classe `Order` comme ceci :

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

======> P4/P4C3_1.jpg
