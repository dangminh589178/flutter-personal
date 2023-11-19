import 'dart:math';

class Food {
  int id = 0;
  String name;
  String urlImage;
  Duration duration;
  Complexity complexity;
  List<String> ingredients = <String>[];
  int categoryId;

  Food(
      {required this.name,
      required this.urlImage,
      required this.duration,
      required this.complexity,
      required this.ingredients,
      required this.categoryId}) {
    id = Random().nextInt(100);
  }
}

enum Complexity { Simple, Medium, Hard }
