class User {
  int id;
  String name;
  String lastname;
  int age;
  String sexe;
  User(this.id, this.name, this.lastname, this.age, this.sexe);
  void afficher() {
    print('ID: $id, name: $name, lastname: $lastname, Âge: $age, Sexe: $sexe');
  }
}

void main() {
  List<User> users = [
    User(1, 'name', 'lastname', 20, 'f'),
    User(2, 'name', 'moi', 27, ' m'),
    User(3, 'name', 'lastname', 52, 'm'),
    User(4, 'name', 'lastname', 27, 'm'),
  ];
  //supression de l'user avec l'id 30
  for (var user in users) {
    if (user.id == 30) {
      users.remove(user);
    }
  }
  //recherche de l'user avec l'id 2
  // var user2 = users.firstWhere((u) => u.id == 2);
  // user2.afficher();
  for (var user in users) {
    if (user.id == 2) {
      user.afficher();
    }
  }
  print('---------------------------');
  //creation d'un nouvel user
  var newUser = User(340, 'voko', 'william', 50, 'm');
  users.insert(2, newUser);

  //affichage de tous les users

  for (var user in users) {
    user.afficher();
  }
}
