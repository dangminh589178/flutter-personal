import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'Transaction.dart';

class TransactionList extends StatelessWidget {
  TransactionList({super.key, this.transactions});

  List<Transaction>? transactions;
  int index = 0;

  ListView? _buildListView() {
    return ListView.builder(
        itemCount: transactions?.length,
        itemBuilder: (context, index) {
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            color: index % 2 == 0 ? Colors.red : Colors.greenAccent,
            elevation: 10,

            child: Row(
              children: [
                Padding(padding: EdgeInsets.only(right: 20)),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(padding: EdgeInsets.all(10)),
                    Text(
                      transactions![index].content,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Padding(padding: EdgeInsets.only(bottom: 20)),
                    Text('${transactions![index].amount}\$'),
                    Padding(padding: EdgeInsets.only(bottom: 10))
                  ],
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(DateFormat.yMd().format(transactions![index].createDate))
                    ],
                  ) ,
                ),
                Padding(padding: EdgeInsets.only(right: 20))
              ],
            ),
            // ListTile(
            //   title: Text(
            //     transactions![index].content,
            //     style: TextStyle(fontWeight: FontWeight.bold),
            //   ),
            //   subtitle: Text(transactions![index].content),
            //   leading: Icon(Icons.alarm),
            // ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(height: 200, child: _buildListView());
  }
}
