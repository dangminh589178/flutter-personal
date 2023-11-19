import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp_flutter/fake_data.dart';
import 'package:transparent_image/transparent_image.dart';

import 'detail_food_page.dart';
import 'models/categories.dart';
import 'models/food.dart';

class FoodPage extends StatelessWidget {
  Category category;

  FoodPage({required this.category});

  @override
  Widget build(BuildContext context) {
    Map<String, Category> argument =
        ModalRoute.of(context)?.settings.arguments as Map<String, Category>;
    this.category = argument['category']!;
    List<Food> foods = FAKE_FOODS
        .where((element) => element.categoryId == this.category.id)
        .toList();
    print(foods.length);
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("${category.content} food"),
          ),
          body: Center(
            child: Center(
              child: ListView.builder(
                  itemCount: foods.length,
                  itemBuilder: (context, index) {
                    Food food = foods[index];
                    return InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => DetailFoodPage(
                                    food: food,
                                  )));
                        },
                        child: Stack(
                          children: [
                            Container(
                                padding: EdgeInsets.all(20),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                  clipBehavior: Clip.hardEdge,
                                  child: Center(
                                      child: FadeInImage.assetNetwork(
                                          placeholder:
                                              'assets/images/loading.gif',
                                          image: food.urlImage)),
                                )),
                            Positioned(
                                top: 30,
                                left: 30,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.black45,
                                      borderRadius: BorderRadius.circular(30),
                                      border: Border.all(
                                          color: Colors.white, width: 2)),
                                  child: Row(
                                    children: [
                                      Icon(Icons.timer,
                                          color: Colors.black, size: 25),
                                      Text(
                                        '${food.duration.inMinutes} minutes ',
                                        style: TextStyle(
                                            fontSize: 22, color: Colors.white),
                                      )
                                    ],
                                  ),
                                )),
                            Positioned(
                                top: 30,
                                left: 280,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.deepOrangeAccent,
                                    borderRadius: BorderRadius.circular(30),
                                      border: Border.all(
                                          color: Colors.white, width: 2)
                                  ),
                                  child: Text(food.complexity.name,
                                  style:  TextStyle( fontWeight: FontWeight.bold,
                                  fontSize: 22),),
                                ))
                          ],
                        ));
                  }),
            ),
          )),
    );
  }
}
