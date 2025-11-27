// Importe la librairie qui génère des paires de mots aléatoires
import 'package:english_words/english_words.dart';

// Importe les widgets Flutter pour l'interface utilisateur
import 'package:flutter/material.dart';

// Importe Provider pour gérer l'état de l'application
import 'package:provider/provider.dart';

// Point d'entrée de l'application
void main() {
  // Lance l'application Flutter en appelant le widget MyApp
  runApp(MyApp());
}

// Widget principal de l'application
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Fournit un état global à toute l'application via Provider
    return ChangeNotifierProvider(
      // Création de l'objet d'état MyAppState
      create: (context) => MyAppState(),

      // Application Flutter avec interface Material Design
      child: MaterialApp(
        title: 'Namer App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepOrange,
          ),
        ),
        // Indique la page principale de l'application
        home: MyHomePage(),
      ),
    );
  }
}

// Classe contenant les données et la logique de l'application (État)
class MyAppState extends ChangeNotifier {
  // Variable contenant le mot aléatoire actuel
  var current = WordPair.random();

  // Liste des idées favorites
  var favorites = <WordPair>[];

  // Fonction pour changer de mot
  void getNext() {
    current = WordPair.random();
    notifyListeners(); // Rafraîchit l'écran
  }

  // Fonction pour ajouter ou retirer le mot actuel des favoris
  void toggleFavorite() {
    // Si le mot est déjà favori, on le retire
    if (favorites.contains(current)) {
      favorites.remove(current);
    } 
    // Sinon, on l'ajoute
    else {
      favorites.add(current);
    }
    notifyListeners(); // Rafraîchit l'écran pour mettre à jour l'icône
  }
}

// ====================================================================
// WIDGET DE STRUCTURE ET DE NAVIGATION (MyHomePage)
// ====================================================================

// Page principale affichée à l'écran (avec barre de navigation latérale)
class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// Gère l'état local de la navigation
class _MyHomePageState extends State<MyHomePage> {
  // 0 = Home (GeneratorPage), 1 = Favorites (FavoritesPage)
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget page;
    
    // Détermine quel widget de page afficher en fonction de l'index sélectionné
    switch (selectedIndex) {
      case 0:
        page = GeneratorPage();
        break;
      case 1:
        page = FavoritesPage();
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    // LayoutBuilder permet d'adapter l'interface à la taille de l'écran
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        body: Row(
          children: [
            // SafeArea garantit que le contenu n'est pas masqué par les barres du système
            SafeArea(
              child: NavigationRail(
                // Rend la barre étendue (texte + icône) si l'écran est large (>= 600px)
                extended: constraints.maxWidth >= 600,
                destinations: [
                  NavigationRailDestination(
                    icon: Icon(Icons.home),
                    label: Text('Home'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.favorite),
                    label: Text('Favorites'),
                  ),
                ],
                selectedIndex: selectedIndex,
                // Met à jour l'index sélectionné et reconstruit l'interface
                onDestinationSelected: (value) {
                  setState(() {
                    selectedIndex = value;
                  });
                },
              ),
            ),
            // Expanded prend tout l'espace restant pour afficher la page
            Expanded(
              child: Container(
                // Couleur de fond de la zone de contenu
                color: Theme.of(context).colorScheme.primaryContainer,
                child: page, // Affiche le widget de la page sélectionnée
              ),
            ),
          ],
        ),
      );
    });
  }
}

// ====================================================================
// WIDGET DE LA PAGE DE GÉNÉRATION (GeneratorPage)
// ====================================================================

class GeneratorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // S'abonne à l'état global
    var appState = context.watch<MyAppState>();
    var pair = appState.current;

    // Logique pour choisir l'icône du bouton "J'aime"
    IconData icon;
    if (appState.favorites.contains(pair)) {
      icon = Icons.favorite; // Cœur plein si favori
    } else {
      icon = Icons.favorite_border; // Cœur vide sinon
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BigCard(pair: pair), // Affiche l'idée actuelle
          SizedBox(height: 10),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Bouton "J'aime" qui bascule l'état
              ElevatedButton.icon(
                onPressed: () {
                  appState.toggleFavorite(); // Appel à la logique de favoris
                },
                icon: Icon(icon),
                label: Text('Like'),
              ),
              SizedBox(width: 10),
              // Bouton "Next" qui génère une nouvelle idée
              ElevatedButton(
                onPressed: () {
                  appState.getNext(); // Appel à la logique de génération
                },
                child: Text('Next'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ====================================================================
// WIDGET DE COMPOSANT (BigCard)
// ====================================================================

class BigCard extends StatelessWidget {
  const BigCard({
    super.key,
    required this.pair,
  });

  final WordPair pair;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // Style du texte de la carte (grande taille, couleur contrastée)
    final style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
      fontWeight: FontWeight.bold,
    );
    
    // La carte elle-même
    return Card(
      color: theme.colorScheme.primary, // Couleur principale du thème

      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Text(
          pair.asPascalCase, 
          style: style,
          // Texte lu par les outils d'accessibilité
          semanticsLabel: "${pair.first} ${pair.second}",
        ),
      ),
    );
  }
}

// ====================================================================
// WIDGET DE LA PAGE DES FAVORIS (FavoritesPage)
// ====================================================================

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // S'abonne à l'état pour obtenir la liste des favoris
    var appState = context.watch<MyAppState>();

    // Affiche un message si la liste est vide
    if (appState.favorites.isEmpty) {
      return Center(
        child: Text('No favorites yet.'),
      );
    }

    // Affiche la liste des favoris
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
              // Affiche le nombre d'éléments
              'You have ${appState.favorites.length} favorites:',
              style: Theme.of(context).textTheme.headlineSmall, // Style d'en-tête
          ),
        ),
        // Boucle pour créer un ListTile pour chaque favori
        for (var pair in appState.favorites)
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text(pair.asLowerCase),
          ),
      ],
    );
  }
}