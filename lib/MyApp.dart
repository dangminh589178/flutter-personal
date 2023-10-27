import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:myapp_flutter/Transaction.dart';

import 'TransactionList.dart';

//You can define your own Widget
class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

void _showActionDilog(){}


//This is a "very basic" statefulwidget
class _MyAppState extends State<MyApp> with WidgetsBindingObserver {

  final _scaffoldKey = new GlobalKey<ScaffoldMessengerState>();
  final _contentController = TextEditingController();
  final _amountController = TextEditingController();

  //define states
  String _content = '';
  double _amount = 0.0;
  Transaction _transaction = Transaction(content: '', amount: 0.0);

  List<Transaction>? _transactions = [
    Transaction(content: "Click weather", amount: 2.3),
    Transaction(content: "Laptop", amount: 2.3),
    Transaction(content: "Iphone", amount: 2.3),
    Transaction(content: "Mouse", amount: 2.3),
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  void _insertTransaction() {
    if (_transaction.content == '' ||
        _transaction.amount == 0.0 ||
        _transaction.amount.isNaN) {
      return;
    }
    _transactions?.add(_transaction);
    _transaction = Transaction(content: '', amount: 0.0);
    _contentController.text = '';
    _amountController.text = '';
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        scaffoldMessengerKey: _scaffoldKey,
        title: "This is a StatefulWidget",
        home: Scaffold(
            appBar: AppBar(
              title: Text("Appbar project"),
              actions: [
                IconButton(
                    onPressed: () {
                      // showDialog(
                      //     context: context,
                      //     builder: (BuildContext context ){
                      //       return new AlertDialog(
                      //         title: Text("Insert transaciton"),
                      //         content: Text("Click me"),
                      //       )
                      //     }
                      // );
                    },
                    icon: Icon(Icons.add))
              ],
            ),
            body: SafeArea(
                minimum: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(labelText: 'Content'),
                      controller: _contentController,
                      onChanged: (text) {
                        setState(() {
                          _transaction.content = text;
                          _content = text;
                        });
                      },
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: 'Amount(money)'),
                      controller: _amountController,
                      onChanged: (text) {
                        setState(() {
                          _transaction.amount =
                              double.tryParse(text) ?? 0; //if error, value = 0
                        });
                      },
                    ),
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            this._insertTransaction();
                          });
                          _scaffoldKey.currentState?.showSnackBar(SnackBar(
                              content: Text(
                                  'List transaction: ${_transactions.toString()}')));
                        },
                        child: Text("Insert Transaction")),
                    TransactionList(transactions: _transactions)
                  ],
                ))));
  }
}
