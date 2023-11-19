import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'models/food.dart';

class DetailFoodPage extends StatelessWidget {
  Food food;

  DetailFoodPage({required this.food});

  @override
  Widget build(BuildContext context) {
    print('sasfsssssss ${food.ingredients}');
    return Scaffold(
        appBar: AppBar(
          title: Text('Detail food'),
        ),
        body: Column(
          children: [
            Center(
              child: FadeInImage.assetNetwork(
                  placeholder: 'assets/images/loading.gif',
                  image: food.urlImage),
            ),
            Text('Ingredients',
            style: TextStyle(fontWeight: FontWeight.bold ),),
            Expanded(
                child: ListView.builder(
              itemCount: food.ingredients.length,
              itemBuilder: (context, index) {
                String ingredient = food.ingredients[index];
                return ListTile(
                  leading: CircleAvatar(child: Text('${index + 1}')),
                  title: Text('$ingredient'),
                );
              },
            ))
          ],
        ));
  }
}
