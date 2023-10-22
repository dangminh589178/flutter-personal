import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MaterialApp(
      home: ShoppingList(
        products: [
          Product(name: "Iphone 12 promax"),
          Product(name: "Iphone 11 promax"),
          Product(name: "Iphone 7plus "),
        ],
      ),
    )
  ));
}

class Product {
  Product({required this.name});

  final String name;
}

typedef CartChangeCallBack = Function(Product product, bool inCart);

class ShoppingListItem extends StatelessWidget {
  final Product product;
  final bool inCart;
  final CartChangeCallBack onCartChanged;

  ShoppingListItem({required this.product,
    required this.inCart,
    required this.onCartChanged})
      : super(key: ObjectKey(product));

  Color _getColor(BuildContext context) {
    return inCart ? Colors.black54 : Theme
        .of(context)
        .primaryColor;
  }

  TextStyle? _getTextStyle(BuildContext context) {
    if (!inCart) return null;
    return TextStyle(
        color: Colors.black54, decoration: TextDecoration.overline);
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onCartChanged(product, inCart);
      },
      leading: CircleAvatar(
        backgroundColor: _getColor(context),
        child: Text(product.name[2]),
      ),
      title: Text(
        product.name,
        style: _getTextStyle(context),
      ),
    );
  }
}

class ShoppingList extends StatefulWidget {
  ShoppingList({required this.products});

  final List<Product> products;

  @override
  State<StatefulWidget> createState() {
    return _ShoppingListState();
  }
}

class _ShoppingListState extends State<ShoppingList> {
  final _shoppingCart = <Product>{};

  void _handleCartChanged(Product product, bool inCart) {
    setState(() {
      if (!inCart) {
        _shoppingCart.add(product);
      } else {
        _shoppingCart.remove(product);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shopping Cart"),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 8),
        children:
        widget.products.map((product) {
          return ShoppingListItem(
              product: product,
              inCart: _shoppingCart.contains(product),
              onCartChanged: _handleCartChanged);
        }).toList(),
      ),
    );
  }
}

class CounterDisplay extends StatelessWidget {
  CounterDisplay({required this.count, super.key});

  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Text("Count: $count");
  }
}

class CounterIncrementor extends StatelessWidget {
  CounterIncrementor({required this.onPress, super.key});

  late VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPress, child: Text("Increment"));
  }
}

class Counter extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CounterState();
  }
}

class _CounterState extends State<Counter> {
  int _counter = 0;

  void inCreateMent() {
    _counter++;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CounterIncrementor(onPress: inCreateMent),
        SizedBox(
          width: 21,
        ),
        CounterDisplay(
          count: _counter,
        )
      ],
    );
  }
}
