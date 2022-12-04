import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'models/transaction.dart';
import 'widgets/chart.dart';
import 'widgets/new_transaction.dart';
import 'widgets/transactionList.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  //   DeviceOrientation.portraitDown,
  // ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        // accentColor: Colors.purple[900],
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
            headline6: TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
            button: TextStyle(
              color: Colors.white,
            )),
        appBarTheme: AppBarTheme(
          foregroundColor: Colors.white,
          titleTextStyle: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [
    Transaction(
      id: 't1',
      title: "New Shoes",
      amt: 69.99,
      date: DateTime(2022, 11, 26),
    ),
    Transaction(
      id: 't2',
      title: "Groceries",
      amt: 16.98,
      date: DateTime(2022, 11, 21),
    ),
    Transaction(
      id: 't3',
      title: "New Shoes",
      amt: 69.99,
      date: DateTime(2022, 11, 26),
    ),
    Transaction(
      id: 't4',
      title: "Groceries",
      amt: 16.98,
      date: DateTime(2022, 11, 21),
    ),
    Transaction(
      id: 't5',
      title: "New Shoes",
      amt: 69.99,
      date: DateTime(2022, 11, 26),
    ),
    Transaction(
      id: 't6',
      title: "Groceries",
      amt: 16.98,
      date: DateTime(2022, 11, 21),
    ),
    Transaction(
      id: 't7',
      title: "New Shoes",
      amt: 69.99,
      date: DateTime(2022, 11, 26),
    ),
    Transaction(
      id: 't8',
      title: "Groceries",
      amt: 16.98,
      date: DateTime(2022, 11, 21),
    ),
  ];

  bool _showChart = false;
  List<Transaction> get _recentTransactions {
    return _userTransactions.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  void _addTransaction(String txTitle, String amount, DateTime date) {
    if (amount.isEmpty) {
      return;
    }

    double txAmt = double.parse(amount);

    if (txTitle.isEmpty) {
      return;
    }

    if (date == null) {
      return;
    }

    Transaction tx = Transaction(
      title: txTitle,
      amt: txAmt,
      date: date,
      id: DateTime.now().toString(),
    );

    setState(() {
      _userTransactions.add(tx);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewTransaction(_addTransaction),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  void _deleteTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((tx) => tx.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    final isLandscape = mediaQuery.orientation == Orientation.landscape;
    PreferredSizeWidget myAppBar = AppBar(
      title: Text('Flutter App'),
      actions: [
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () => _startAddNewTransaction(context),
        )
      ],
    );
    var txListWidget = Container(
      height: (mediaQuery.size.height -
              myAppBar.preferredSize.height -
              mediaQuery.padding.top) *
          0.7,
      child: TransactionList(_userTransactions, _deleteTransaction),
    );
    return Scaffold(
      appBar: myAppBar,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (isLandscape)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Show Chart"),
                  Switch(
                    value: _showChart,
                    onChanged: (val) {
                      setState(() {
                        _showChart = val;
                      });
                    },
                  ),
                ],
              ),
            if (!isLandscape)
              Container(
                width: double.infinity,
                height: (mediaQuery.size.height -
                        myAppBar.preferredSize.height -
                        mediaQuery.padding.top) *
                    0.3,
                child: Card(
                  color: Theme.of(context).backgroundColor,
                  child: Chart(_recentTransactions),
                  elevation: 5,
                ),
              ),
            if (!isLandscape) txListWidget,
            if (isLandscape)
              _showChart
                  ? Container(
                      width: double.infinity,
                      height: (mediaQuery.size.height -
                              myAppBar.preferredSize.height -
                              mediaQuery.padding.top) *
                          0.7,
                      child: Card(
                        color: Theme.of(context).backgroundColor,
                        child: Chart(_recentTransactions),
                        elevation: 5,
                      ),
                    )
                  : txListWidget,
          ],
        ),
      ),
      floatingActionButton: Platform.isIOS
          ? Container()
          : FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () => _startAddNewTransaction(context),
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
