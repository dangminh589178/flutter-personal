import 'package:flutter/material.dart';
import 'package:myapp_flutter/categories_page.dart';
import 'package:myapp_flutter/food_page.dart';

import 'models/categories.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes:{
        '/FoodPageDetail': (context) => FoodPage(category: Category(id: 1, content: "Pizza", color: Colors.green)),
        '/CategoriesPage': (context) => CategoriesPage()
      },
      title: "Food app with navigation",
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Food\'s categories'),
        ),
        body: CategoriesPage(),
      ),
    );
  }
}
