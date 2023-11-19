import 'package:flutter/material.dart';
import 'package:myapp_flutter/models/categories.dart';
import 'package:myapp_flutter/models/food.dart';

const FAKE_CATEGORIES = [
  Category(id: 1, content: "Pizza", color: Colors.green),
  Category(id: 2, content: "Hamburger", color: Colors.red),
  Category(id: 3, content: "Hot dog", color: Colors.amber),
  Category(id: 4, content: "Fries", color: Colors.teal),
  Category(id: 5, content: "Steak ", color: Colors.brown),
  Category(id: 6, content: "Spaghetti", color: Colors.blueGrey)
];

var FAKE_FOODS = [
  //array of food's objects
  Food(
      name: "sushi - 寿司",
      urlImage:
          "https://upload.wikimedia.org/wikipedia/commons/c/cf/Salmon_Sushi.jpg",
      duration: Duration(minutes: 25),
      complexity: Complexity.Medium,
      ingredients: ['Sushi-meshi', 'Nori', 'Condiments'],
      categoryId: 1),
  Food(
      name: "Pizza tonda",
      urlImage: "https://www.angelopo.com/filestore/images/pizza-tonda.jpg",
      duration: Duration(minutes: 15),
      complexity: Complexity.Hard,
      ingredients: [
        'Tomato sauce',
        'Fontina cheese',
        'Pepperoni',
        'Onions',
        'Mushrooms',
        'pepperoncini'
      ],
      categoryId: 2),
  Food(
      name: "Makizushi",
      urlImage:
          "https://upload.wikimedia.org/wikipedia/commons/0/0b/KansaiSushi.jpg",
      complexity: Complexity.Simple,
      ingredients: ['Tomato sauce', 'Fontina cheese'],
      duration: Duration(minutes: 20),
      categoryId: 1),
  Food(
      name: "Tempura",
      ingredients: ['Tomato sauce', 'Fontina cheese'],
      urlImage:
          "https://upload.wikimedia.org/wikipedia/commons/a/ac/Peixinhos_da_horta.jpg",
      duration: Duration(minutes: 15),
      complexity: Complexity.Simple,
      categoryId: 1),
  Food(
      name: "Neapolitan pizza",
      urlImage:
          "https://img-global.cpcdn.com/recipes/7f1a5380090f6300/1280x1280sq70/photo.jpg",
      duration: Duration(minutes: 20),
      complexity: Complexity.Medium,
      ingredients: ['Fontina cheese', 'Tomato sauce', 'Onions', 'Mushrooms'],
      categoryId: 2),
  Food(
      name: "Sashimi",
      urlImage:
          "https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Sashimi_-_Tokyo_-_Japan.jpg/2880px-Sashimi_-_Tokyo_-_Japan.jpg",
      duration: Duration(hours: 1, minutes: 5),
      ingredients: ['Tomato sauce', 'Fontina cheese'],
      complexity: Complexity.Medium,
      categoryId: 1),
  Food(
      name: "Homemade Humburger",
      urlImage:
          "https://upload.wikimedia.org/wikipedia/commons/5/58/Homemade_hamburger.jpg",
      duration: Duration(minutes: 20),
      ingredients: ['Tomato sauce', 'Fontina cheese'],
      complexity: Complexity.Hard,
      categoryId: 3),
];
