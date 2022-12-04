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
    var column = Column(children: [
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
    ]);

    return transactions.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(children: [
              Text(
                "No transactions yet",
                style: Theme.of(context).textTheme.headline6,
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                  height: constraints.maxHeight * 0.6,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  )),
            ]);
          })
        : ListView.builder(
            itemBuilder: ((ctx, index) {
              return TransTile(transactions[index], deleteTransaction);
            }),
            itemCount: transactions.length,
          );
  }
}
