import 'package:flutter/material.dart';
import 'package:myapp_flutter/Transaction.dart';
import 'package:intl/intl.dart';
import 'TransactionList.dart';

//You can define your own Widget
class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

//This is a "very basic" statefulwidget
class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  final _scaffoldKey = new GlobalKey<ScaffoldMessengerState>();
  final _contentController = TextEditingController();
  final _amountController = TextEditingController();

  Transaction _transaction =
      Transaction(content: '', amount: 0.0, createDate: DateTime.now());

  List<Transaction>? _transactions = [
    // Transaction(content: "Click weather", amount: 2.3, createDate: DateTime.now()),
    // Transaction(content: "Laptop", amount: 2.3),
    // Transaction(content: "Iphone", amount: 2.3),
    // Transaction(content: "Mouse", amount: 2.3),
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
    _transaction.createDate = DateTime.now();
    _transactions?.add(_transaction);
    _transaction =
        Transaction(content: '', amount: 0.0, createDate: DateTime.now());
    _contentController.text = '';
    _amountController.text = '';
  }

  void _onButtonShowModel() {
    showModalBottomSheet(
        context: this.context,
        builder: (context) {
          return Column(
            children: [
              Container(
                padding:  EdgeInsets.all(10),
                child: TextField(
                  decoration: InputDecoration(labelText: 'Content'),
                  controller: _contentController,
                  onChanged: (text) {
                    setState(() {
                      _transaction.content = text;
                    });
                  },
                ),
              ),
              Container(
          padding:  EdgeInsets.all(10),
                child: TextField(
                  decoration: InputDecoration(labelText: 'Amount(money)'),
                  controller: _amountController,
                  onChanged: (text) {
                    setState(() {
                      _transaction.amount =
                          double.tryParse(text) ?? 0; //if error, value = 0
                    });
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                      ),
                      onPressed: () {
                        setState(() {
                          this._insertTransaction();
                          Navigator.of(context).pop();
                        });

                      },
                      child: Text("Ok")),
                  Padding(padding: EdgeInsets.all(10)),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("Cancel"))
                ],
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    print("xxxxrrrr inBuild");
    return Scaffold(
        appBar: AppBar(
          title: Text("Appbar project"),
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {
                    _insertTransaction();
                  });
                },
                icon: Icon(Icons.add)),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          tooltip: "Add transantion",
          onPressed: () {
            setState(() {
              this._insertTransaction();
            });
          },
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: SafeArea(
            minimum: const EdgeInsets.only(left: 20, right: 20),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  ElevatedButton(
                      onPressed: () {
                        this._onButtonShowModel();
                        // setState(() {
                        //   this._insertTransaction();
                        // });
                        _scaffoldKey.currentState?.showSnackBar(SnackBar(
                            content: Text(
                                'List transaction: ${_transactions.toString()}')));
                      },
                      child: Text("Insert Transaction")),
                  TransactionList(transactions: _transactions)
                ],
              ),
            )));
  }
}
