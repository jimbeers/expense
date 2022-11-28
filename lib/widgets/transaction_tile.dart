import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransTile extends StatelessWidget {
  final Transaction t;
  final Function deleteTransaction;
  const TransTile(this.t, this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 5,
      ),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: FittedBox(
              child: Text(
                '\$${t.amt.toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        title: Text(
          t.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(
          DateFormat('yMMMd').format(t.date),
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
        trailing: IconButton(
          onPressed: () {
            deleteTransaction(t.id);
          },
          icon: Icon(Icons.delete),
          color: Theme.of(context).errorColor,
        ),
      ),
    );
  }
}
