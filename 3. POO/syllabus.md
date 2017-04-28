# La Programmation Orientée Objet avec Swift

## Découvrez la programmation orientée Objet

### Tirez le meilleur de ce cours
Section 1 : Brève introduction du programme  
Section 2 : On ne va pas coder une application ? => Explication de l’intérêt de la POO : Concept central en développement (présentation des langages qui l’utilisent) + utilisation omniprésente dans iOS exemple avec UIButton, UIView etc.
### Retracez les origines de la POO
Toute la partie doit être accès sur un but : comprendre pourquoi ce concept s’est imposé en programmation.

### Découvrez la POO
Section 1 : Opposition avec la programmation procédurale  
Section 2 : Qu’est-ce qu’un objet ?
- Un objet permet de cacher une implémentation cf cours C++
- Un objet permet de représenter une réalité exemple sur une personne

### Designez vos premiers objets

Section 1 : Schéma de nos objets (Bus, Route, Section de route)  
Section 2 : Découvrir le projet (télécharger le lien + render documentation + run playground manually + découvrir les fonctions du Canva)

## Développez en orienté objet

### Créez votre première classe
Section 1 : Présentation de la syntaxe d'une classe, création de plusieurs instance (faire le lien avec String(), Int())  
Exercice : Créer une classe Personne (ce sera un exercice filé dans tout le cours)  
Section 2 : Différence claire entre instance et classe avec la métaphore du gaufrier

### Ajoutez des propriétés
Section 1 : Création d’une propriété (une propriété, c’est une variable) et mutabilité des propriétés et des instances  
Exercice : Ajouter des attributs à la classe personne  
Section 2 : Accéder à sa valeur, modifier une propriété

### Initialisez les classes
Section 1 : Propriété non initialisée  
Section 2 : Le mot clé init  
Section 3 : Le mot clé self et l’intialisation avec paramètres  
Exercice : Ajouter une initialisation à la classe Personne avec le nom et prénom comme paramètre

### Définissez des méthodes
Section 1 : Les méthodes sont des fonctions  
Section 2 : Appeler une méthode  
Exercice : Créer une méthode à la classe personne

### Découvrez les propriétés et méthodes de classe
Section 1 : Les propriétés de classe ou statique  
Section 2 : Les méthodes de classe (mention du mot-clé class qui permet aux sous-classes d’override)

## Enrichissez vos objets avec l'héritage

### Héritez de nouvelles connaissances
Section 1 : Présentation générale de l'héritage (mise en scène avec peluches d’animaux)  
Section 2 : Nouveau schéma de l'héritage  
Exercice : Héritage par métier pour la classe Personne  
Section 3 : Application à SchoolBus et création de HomeRoadSection et SchoolRoadSection

### Énumérez des cas
Section 1 : Présentation des enums (use cases et syntaxe) et les enums avec types  
Section 2 : Application avec RoadSectionType, réécriture de l’init de RoadSection

### Surchargez les méthodes

Section 1 : Découverte du mot clé super avec l’écriture des init des sous-classe de road section  
Exercice : Créez une fonction statique de Road : createRoadToSchool  
Section 2 : Découverte du mot clé override avec l’override de la fonction drive dans SchoolBus et découverte du type check avec “as”  
Exercice : écrire l’override de la fonction drive

## Allez plus loin

### Enrichissez vos propriétés
Section 1 : Computed properties VS stored properties (ex: description de schoolbus)  
Section 2 : Getter and setter  
Section 3 : Property observance (didSet, willSet)

### Plongez dans les coulisses de l'initialisation
Section 1 : Convenience, Inherited and Designated initializer (application  avec RoadSection)  
Section 2 : Required Initializer

### Protégez vos classes
Section 1 : Présentation de l’access control (rappel de l’intérêt d’une classe)  
Section 2 : Mise en pratique sur nos classes
