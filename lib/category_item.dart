import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp_flutter/food_page.dart';
import 'package:myapp_flutter/models/categories.dart';

class CategoryItem extends StatelessWidget {
  Category category;

  CategoryItem({required this.category});

  @override
  Widget build(BuildContext context) {
    Color _color = this.category.color;
    return InkWell(
      onTap: () {
        // Navigator.push(context,
        // MaterialPageRoute(builder: (context) =>  FoodPageDetail(titleFood: category.content,))
        // );
        Navigator.pushNamed(context, '/FoodPageDetail',
            arguments: {'category': category});
      },
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [_color.withOpacity(0.5), _color],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft),
            color: _color,
            borderRadius: BorderRadius.circular(12)),
        child: Center(
          child: Text(this.category.content,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
