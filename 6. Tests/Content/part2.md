## Renforcez votre application avec les tests

### Découvrez les tests  
Bienvenue dans cette partie sur les tests unitaires ! Oui cette partie nécessite que je vous souhaite à nouveau la bienvenue, car sans vouloir en faire des tonnes, nous allons nous attaquer au sujet le plus important de votre vie !

> **:question:** Heureusement que tu as dit que tu n'en ferais pas des tonnes...

Bon, le sujet le plus important de votre vie de programmeur en tout cas.

Et ce sujet, c'est évidemment **les tests**.

![Bon Tac, ton frère vient de faire la blague...](Images/P2/P2C1_1.jpg)

#### Qu'est-ce que les tests ?
Nous voilà déjà face à la grande question : **qu'est-ce que sont les tests ?**

C'est très simple et vous en faîtes déjà en fait ! Lorsque vous développez une application, votre premier réflexe est de lancer l'app dans le simulateur pour voir si ça marche. Vous cliquez sur les boutons ou faîtes les actions que vous souhaitez contrôler et vous constatez que cela fonctionne comme prévu ou non.

Et bien c'est exactement un test ! **Vous testez que votre programme se comporte comme prévu**.

Plus précisément, vous faîtes ce que l'on appelle un **test manuel**. Les tests manuels sont utiles mais on deux défauts principaux :
- Ils sont **lents**, il faut compiler le code, lancer le simulateur, charger l'application, parfois faire plusieurs actions avant de pouvoir tester ce qu'on souhaite tester.
- Ils ne sont pas **fiables**. Avec un test manuel, vous allez vérifier qu'une action fonctionne mais ce n'est pas suffisant. Il faudrait aussi vérifier que vous n'avez pas cassé les autres fonctionnalités de l'application. Et donc finalement, pour que les tests manuels soient fiables, il faudrait qu'à chaque fois que vous changez le code, vous retestiez tout le programme. Vous n'êtes pas prêt de créer le prochain facebook à cette vitesse :) !

Alors laissez moi vous parlez des autres formes de tests !

#### La pyramide des tests

On peut facilement se représenter la typologie des tests avec un pyramide. En haut de la pyramide, on a les tests les plus rarement utilisées qui sont effectués par des humains et en bas, ceux plus couramment utilisées effectués par des ordinateurs.

![](Images/P2/P2C1_2.png)

Comme vous pouvez le constater, la pyramide contient trois différents type de tests :
- Tout en haut, il y a les **tests manuels** conduits par des humains. Ils sont assez rares car assez long comme nous venons d'en parler.
- Tout en bas il ya les **tests unitaires**. Ce sont des tests automatisés rédigés par des humains mais effectués par l'ordinateur. Ils sont bien plus nombreux mais aussi bien plus fréquemment sollicités. On va en parler juste après.
- Enfin, nous avons entre les deux les **tests fonctionnels**. Selon les technologies et les méthodologies, ils sont réalisés par des humains ou par l'ordinateur. Dans notre cas en iOS, ce sera plutôt l'ordinateur et on les appelle UI Test. J'y reviens dans une minute.

Voilà la vision globale des tests. Rentrons un peu dans le détail maintenant.

#### Les tests unitaires
Les tests unitaires comme leur nom l'indique test des toutes petites unités de votre programme. C'est pour cela qu'ils sont si nombreux. Par exemple, un test unitaire va tester une seule méthode d'une seule classe au maximum. Si la méthode est grosse, il faudra même peut-être plusieurs tests pour la couvrir.

Prenons un exemple, avec la classe suivante :

```swift
class Personne {
	var age = 0

	func feterSonAnniversaire() {
		age += 1
	}
}
```

Je souhaite maintenant tester la méthode `feterSonAnniversaire` avec un test unitaire. Un test unitaire, c'est un petit morceau de code qui ferait la chose suivante :
1. Créer une instance de la classe `Personne` avec la propriété `age` qui vaux 12.
2. Appeler la méthode `feterSonAnniversaire` sur cette instance.
3. Vérifier que la propriété `age` vaux bien maintenant 13.

**Un test unitaire, c'est donc un morceau de code qui va tester une toute petite unité du programme**. Donc en général un test unitaire, c'est très simple !

La quasi totalité de la suite de ce cours est dédié aux tests unitaires.

#### Les tests fonctionnels
Nous avons parlé des tests unitaires et des tests manuels. Parlons maintenant des tests fonctionnels !

**Les tests fonctionnels permettent de tester une fonctionnalité complète de l'application**, comme la phase de login par exemple.

En iOS, on les appelle **UI tests** car ils ont lieu sur l'interface utilisateur. Le principe, c'est que nous allons indiquer au simulateur un certains nombre d'actions à réaliser (appui sur ce bouton, reviens à la page précédente, glisse vers le bas, etc) et ensuite, nous allons lui demander de vérifier que ce qui se trouve à l'écran corresponds à ce qu'on a prévu. Ce sont donc des tests automatisés : l'ordinateur suit le scénario qu'on lui a donné sur l'interface de l'application.

Nous ne verrons pas dans ce cours comment les créer car cela allongerait le cours inutilement.

#### Pourquoi tester ?
3 : Pourquoi tester ?  
Prevent bugs and regression  
Think about your classes interactions  
Write living documentation  
Create maintainable code (be a professional)  
4 : Mais les tests, c’est faire 2 fois le travail ? => Métaphore test et comptabilité  

### Décelez les éléments à tester  
1 : Tester uniquement les interfaces (Xcode > Navigator > Show generated interface)  
2 : Tests encouragent :  
SIngle responsibility class (dès qu’il y a un if/else, il y a deux tests)  
Loosely coupled class (mentionner l’injection de dépendances)  
3 : Tests utiles => Rouge / Vert / Refactorise  
4 : Tests et MVC (défauts du MVC, difficile à tester)  

### Créez votre premier test  
1 : Add test target + add test file  
2 : Présentation de XCTestCase  
Test class : sous-class de XCTestCase  
Test : toutes les méthodes qui démarrent par “test”  
3 : Ecriture du premier dummy test avec XCAssert. Montrer comment lancer un test (run, cmd+u, diamond)  

### Testez la classe game  
0 : @testable import  
1 : Ecriture du premier vrai test => introduction du BDD  
2 : Ecriture du deuxième test => introduction de setup  
3 : Ecriture du troisième test  => introduction des méthodes helper  
4 : Ecriture du quatrième test => introduction de XCTAssertEqual et mention des autres  
Exercice : créez les tests pour la classe Set  

### Evaluez la couverture de vos tests  
1 : Mettre en place le code coverage  
2 : Inspectez la couverture de code  
3 : Bouchez les trous  
Note : Faire une partie de la classe Match  
Exercice : finir de bouchez les trous  
