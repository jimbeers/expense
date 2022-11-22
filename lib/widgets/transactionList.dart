import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/new_transaction.dart';

import '../models/transaction.dart';
import 'transactionCard.dart';

class TransactionList extends StatefulWidget {
  const TransactionList();

  @override
  State<TransactionList> createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  final List<Transaction> _userTransactions = [
    Transaction(
      id: 't1',
      title: "New Shoes",
      amt: 169.99,
      date: DateTime(2022, 2, 2),
    ),
    Transaction(
      id: 't2',
      title: "Groceries",
      amt: 16.53,
      date: DateTime.now(),
    ),
  ];

  void _addTransaction(String txTitle, String amount) {
    double txAmt = double.parse(amount);
    Transaction tx = Transaction(
        title: txTitle,
        amt: txAmt,
        date: DateTime.now(),
        id: DateTime.now().toString());

    setState(() {
      _userTransactions.add(tx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      NewTransaction(_addTransaction),
      Container(
        height: 500,
        child: ListView.builder(
          itemBuilder: ((ctx, index) {
            return TransactionCard(_userTransactions[index]);
          }),
          itemCount: _userTransactions.length,
        ),
      ),
    ]);
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Column(children: [
  //     NewTransaction(_addTransaction),
  //     Container(
  //       height: 500,
  //       child: ListView(
  //           children: _userTransactions.map((tx) {
  //         return TransactionCard(
  //           tx,
  //         );
  //       }).toList()),
  //     ),
  //   ]);
  // }
}
