import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Transaction.dart';

class TransactionList extends StatelessWidget {
  TransactionList({super.key, this.transactions});

  List<Transaction>? transactions;

  List<Widget>? widgetBuildList() {
    return transactions?.map((e) {
      int index = 0;
      return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(90),
        ),
        color: index % 2 == 0 ? Colors.red : Colors.greenAccent,
        elevation: 10,
        child: ListTile(
          title: Text(
            e.content,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          leading: Icon(Icons.alarm),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: widgetBuildList()!);
  }
}
