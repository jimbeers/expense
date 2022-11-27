import 'package:flutter/material.dart';

import '../models/transaction.dart';
import 'transactionCard.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  const TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        height: 500,
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
                  return TransactionCard(transactions[index]);
                }),
                itemCount: transactions.length,
              ),
      ),
    ]);
  }
}
