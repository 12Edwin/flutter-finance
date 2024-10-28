class User {
  String _name;
  String _surname;
  int _age;
  List<String> _images;
  int _ratting;
  int _count;

  User(this._name, this._surname, this._age, this._images, this._ratting, this._count);

  String get name => _name;
  String get surname => _surname;
  int get age => _age;
  List<String> get images => _images;
  int get ratting => _ratting;
  int get count => _count;
}