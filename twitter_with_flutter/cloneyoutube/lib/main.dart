import 'dart:async'; // Importe le package 'async' pour utiliser des outils asynchrones comme Timer.

import 'package:cloneyoutube/detail.dart'; // Importe le fichier 'detail.dart' (probablement une page de détails).
import 'package:cloneyoutube/library.dart'; // Importe le fichier 'library.dart' (pour la page de Bibliothèque).
import 'package:cloneyoutube/mail.dart'; // Importe le fichier 'mail.dart' (pour la page de Boîte de réception/Mail).
import 'package:cloneyoutube/slidclass.dart'; // Importe le fichier 'slidclass.dart' (contient probablement la classe Slidclass et la fonction types()).
import 'package:cloneyoutube/subscription.dart'; // Importe le fichier 'subscription.dart' (pour la page d'Abonnements).
import 'package:cloneyoutube/trending.dart'; // Importe le fichier 'trending.dart' (pour la page Tendances).
import 'package:flutter/material.dart'; // Importe le package essentiel de Flutter pour les widgets.
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // Importe le package Font Awesome pour les icônes supplémentaires.

void main() {
  runApp(const MyApp()); // Point d'entrée de l'application, exécute le widget MyApp.
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); // Constructeur pour le widget root.

  // Ce widget est le widget root de votre application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp( // Widget qui fournit les fonctionnalités de base de Material Design.
      debugShowCheckedModeBanner: false, // Supprime le bandeau "DEBUG" en haut à droite.
      title: 'youtube clone', // Titre de l'application (affiché dans le gestionnaire de tâches).
      theme: ThemeData( // Définit le thème général de l'application.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple), // Définit le jeu de couleurs de base à partir d'une couleur d'amorçage.
      ),
      home: const SplashScreen(), // Définit 'SplashScreen' comme la page d'accueil initiale.
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key}); // Constructeur.

  @override
  State<SplashScreen> createState() => _SplashScreenState(); // Crée l'état pour ce StatefulWidget.
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // Méthode appelée une seule fois lors de la création de l'état du widget.
    Timer(Duration(seconds: 1), () { // Démarre un minuteur d'une seconde.
      Navigator.pushReplacement( // Remplace la page actuelle (Splash Screen) par la nouvelle.
        context,
        MaterialPageRoute(builder: (context) => Home()), // Navigue vers le widget 'Home'.
      );
    });

    super.initState(); // Appelle l'implémentation de la classe parente.
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea( // S'assure que le contenu n'est pas masqué par les barres de statut/encoches.
      child: Container( // Un conteneur simple pour le Splash Screen.
        color: Colors.white, // Définit l'arrière-plan du conteneur en blanc.
        child: Image.asset('assets/logoyoutube.png', height: 100, width: 100), // Affiche l'image du logo.
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key}); // Constructeur.

  @override
  State<Home> createState() => _HomeState(); // Crée l'état pour le widget Home.
}

class _HomeState extends State<Home> {

  //ignore:descripted nember user // Le commentaire d'ignorance semble être mal orthographié/incomplet.
  List<Slidclass> parts = []; // Liste pour stocker les objets 'Slidclass' (contenu de la page d'accueil).
  int _selectedIndex = 0; // Index de l'élément sélectionné dans la barre de navigation inférieure.
  void _onItemTapped(int index) { // Fonction appelée lorsqu'un élément de la barre de navigation est tapé.
    setState(() { // Reconstruit le widget pour mettre à jour l'état de l'interface utilisateur.
      _selectedIndex = index; // Met à jour l'index sélectionné.
    });
  }
  void initState(){
    parts=types(); // Initialise la liste 'parts' en appelant la fonction 'types()' (qui n'est pas définie ici).
    super.initState(); // Appelle l'implémentation de la classe parente.
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea( // S'assure que le contenu n'est pas masqué par les barres de statut/encoches.
      child: Scaffold( // Implémente la structure de base du Material Design (AppBar, Body, etc.).
        appBar: AppBar( // La barre d'application en haut de l'écran.
          backgroundColor: Color(0xffEBF2F2), // Définit la couleur d'arrière-plan de l'AppBar.
          elevation: 0.0, // Supprime l'ombre sous l'AppBar.
          title: Row( // Contenu principal de l'AppBar, organisé horizontalement.
            children: [
              Image.asset('assets/logoyoutube.png', height: 50, width: 50), // Affiche le logo de YouTube.
              SizedBox(width: 5), // Ajoute un petit espace horizontal.
              Text( // Affiche le texte 'YouTube'.
                'YouTube',
                style: TextStyle( // Style du texte.
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 29,
                ),
              ),
            ],
          ),
          actions: [ // Widgets affichés à droite de l'AppBar.
            Row(
              children: [
                Icon(FontAwesomeIcons.video, size: 20, color: Colors.black45), // Icône pour télécharger une vidéo.
                SizedBox(width: 25), // Ajoute de l'espace.
                Icon( // Icône de recherche (issue du package Font Awesome).
                  FontAwesomeIcons.searchengin,
                  size: 20,
                  color: Colors.black45,
                ),
                SizedBox(width: 25), // Ajoute de l'espace.
                Icon(FontAwesomeIcons.user, size: 20, color: Colors.black45), // Icône de profil utilisateur.
                SizedBox(width: 25), // Ajoute de l'espace à la fin.
              ],
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar( // La barre de navigation inférieure.
          selectedItemColor: Colors.deepOrange, // Couleur de l'élément sélectionné.
          unselectedItemColor: Colors.black, // Couleur des éléments non sélectionnés.
          selectedLabelStyle: TextStyle(color: Colors.red), // Style du libellé sélectionné (la couleur ici est red, mais selectedItemColor est deepOrange).
          unselectedLabelStyle: TextStyle(color: Colors.black), // Style du libellé non sélectionné.
          currentIndex: _selectedIndex, // Index de l'élément actuellement sélectionné.
          onTap: _onItemTapped, // Fonction appelée lors du tapotement d'un élément.
          type: BottomNavigationBarType.shifting, // Type d'animation de la barre de navigation.
          items: [ // Liste des éléments de la barre de navigation.
            BottomNavigationBarItem( // Premier élément : Home.
              icon: InkWell( // Permet de détecter les tapotements sur l'icône.
                onTap: () { // Action au tapotement.
                  Navigator.pushReplacement( // Navigue vers la page Home et remplace la vue actuelle.
                    context,
                    MaterialPageRoute(builder: (context) => Home()),
                  );
                },

                child: Padding( // Ajoute un espacement autour de l'icône.
                  padding: EdgeInsets.all(8.0),
                  child: Icon(FontAwesomeIcons.house), // Icône de maison.
                ),
              ),
              label: 'Home', // Libellé de l'élément.
            ),
            BottomNavigationBarItem( // Deuxième élément : Trending (Tendances).
              icon: InkWell(
                onTap: () {
                  Navigator.pushReplacement( // Navigue vers la page Trending.
                    context,
                    MaterialPageRoute(builder: (context) => Trending()),
                  );
                },

                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(FontAwesomeIcons.fire), // Icône de feu/tendance.
                ),
              ),
              label: 'Trending',
            ),
            BottomNavigationBarItem( // Troisième élément : Subscription (Abonnements).
              icon: InkWell(
                onTap: () {
                  Navigator.pushReplacement( // Navigue vers la page Subscription.
                    context,
                    MaterialPageRoute(builder: (context) => Subscription()),
                  );
                },

                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.video_call_rounded), // Icône d'appel vidéo (pour les abonnements).
                ),
              ),
              label: 'Subscription',
            ),
            BottomNavigationBarItem( // Quatrième élément : Inbox (Boîte de réception).
              icon: InkWell(
                onTap: () {
                  Navigator.pushReplacement( // Navigue vers la page Mail.
                    context,
                    MaterialPageRoute(builder: (context) => Mail()),
                  );
                },

                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.mail), // Icône de courrier.
                ),
              ),
              label: 'Inbox',
            ),
            BottomNavigationBarItem( // Cinquième élément : Library (Bibliothèque).
              icon: InkWell(
                onTap: () {
                  Navigator.pushReplacement( // Navigue vers la page Folder/Library.
                    context,
                    MaterialPageRoute(builder: (context) => Folder()),
                  );
                },

                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(FontAwesomeIcons.folder), // Icône de dossier/bibliothèque.
                ),
              ),
              label: 'Library',
            ),
          ],
        ),
        body: Slids(), // Affiche le contenu principal de la page, ici le widget 'Slids'.
      ),
    );
  }
}

class Slids extends StatelessWidget {


  final 	String?imgurl; // URL/chemin d'accès à l'image miniature de la vidéo.
  final String? name1; // Première partie du titre de la vidéo.
  final String? name2; // Deuxième partie du titre de la vidéo.
  final String? views; // Nombre de vues.
  final String? dur; // Durée de la vidéo.
  final String? userimg; // URL/chemin d'accès à l'image de profil de l'utilisateur.
  final String? tuber; // Nom de la chaîne/du créateur.

    Slids({this.imgurl, this.name1, this.name2, this.views, this.dur, this.userimg, this.tuber}); // Constructeur pour initialiser les propriétés.

  @override
  Widget build(BuildContext context) {
    return Container( // Conteneur pour l'élément de la liste de vidéos.
      color: Color.fromARGB(255, 239, 239, 239), // Couleur d'arrière-plan du conteneur.
      child: Column( // Organise les widgets verticalement.
        children: [
          SizedBox(height: 10), // Ajoute un espace vertical.
          Container( // Conteneur principal pour la carte vidéo.
            margin: EdgeInsets.all(10), // Marge extérieure.
            height: 300, // Hauteur fixe du conteneur.
            width: MediaQuery.of(context).size.width, // Largeur égale à la largeur de l'écran.
            decoration: BoxDecoration( // Décoration du conteneur.
              color: const Color.fromARGB(255, 255, 255, 255), // Couleur blanche.
              boxShadow: [ // Ajoute une ombre.
                BoxShadow(
                  offset: Offset(0, 3), // Déplace l'ombre verticalement.
                ),
              ],
            ),
            child: Column( // Organise le contenu de la carte verticalement.
              children: [
                Container( // Conteneur pour l'image miniature de la vidéo.
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15), // Coins légèrement arrondis (mais l'Image.asset pourrait cacher cet effet).
                  ),
                  height: 220, // Hauteur de la miniature.
                  width: MediaQuery.of(context).size.width, // Largeur maximale.
                  child: Image.asset('$imgurl', fit: BoxFit.fill), // Affiche la miniature de la vidéo.
                ),
                Row( // Ligne pour les détails de la vidéo (avatar, titre, infos).
                  mainAxisAlignment: MainAxisAlignment.start, // Alignement à gauche.
                  // Les lignes commentées sont des tentatives d'alignement.
                  children: [
                    SizedBox(height: 10), // Ajoute un espace vertical (utile si on utilisait Column).

                    Container( // Conteneur pour l'avatar du créateur.
                      height: 50,
                      child: CircleAvatar( // Affiche l'image de l'utilisateur sous forme de cercle.
                        radius: 30,
                        backgroundImage: NetworkImage( // Image de profil depuis une URL.
                         ' $userimg',
                        ),
                      ),
                    ),
                    SizedBox(width: 10), // Ajoute de l'espace horizontal.
                    Column( // Colonne pour le titre et les informations secondaires.
                      crossAxisAlignment: CrossAxisAlignment.start, // Alignement à gauche.
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text( // Première ligne du titre de la vidéo.
                         ' $name1',
                          style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.w900,
                            fontSize: 16,
                          ),
                        ),
                        Text( // Deuxième ligne du titre (ou sous-titre).
                         ' $name2',
                          style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),

                    Row( // Ligne pour afficher les informations (créateur, vues, durée).
                      children: [
                        Text( // Nom du créateur/chaîne.
                          '$tuber',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 15,
                            height: 15, // Une hauteur de ligne élevée pour le texte.
                          ),
                        ),
                        Text('$views.', // Nombre de vues.
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 15,
                            height: 15,
                          ),
                        ),
                        Text( // Durée de la vidéo.
                         ' $dur',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 15,
                            height: 15,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}