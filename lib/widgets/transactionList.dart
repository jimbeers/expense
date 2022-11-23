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
        child: ListView.builder(
          itemBuilder: ((ctx, index) {
            return TransactionCard(transactions[index]);
          }),
          itemCount: transactions.length,
        ),
      ),
    ]);
  }
}
