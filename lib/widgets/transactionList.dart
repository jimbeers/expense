import 'package:flutter/material.dart';

import '../models/transaction.dart';
import 'transactionCard.dart';
import 'transaction_tile.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransaction;

  const TransactionList(this.transactions, this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        height: 600,
        child: transactions.isEmpty
            ? Column(children: [
                Text(
                  "No transactions yet",
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                    height: 300,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    )),
              ])
            : ListView.builder(
                itemBuilder: ((ctx, index) {
                  return TransTile(transactions[index], deleteTransaction);
                }),
                itemCount: transactions.length,
              ),
      ),
    ]);
  }
}
