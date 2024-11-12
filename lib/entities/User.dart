class User {
  String _name;
  String _surname;
  int _age;
  List<String> _images;
  double _ratting;
  double _count;
  double _lat;
  double _lng;

  User(this._name, this._surname, this._age, this._images, this._ratting, this._count, this._lat, this._lng);

  String get name => _name;
  String get surname => _surname;
  int get age => _age;
  List<String> get images => _images;
  double get ratting => _ratting;
  double get count => _count;
  double get lat => _lat;
  double get lng => _lng;

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      map['name'],
      map['surname'],
      map['age'],
      List<String>.from(map['images']),
      (map['ratting'] ?? 0).toDouble(),
      (map['count'] ?? 0).toDouble(),
      (map['lat'] ?? 0).toDouble(),
      (map['long'] ?? 0).toDouble()
    );
  }
}