import 'package:flutter/material.dart';
import './transaction.dart';

class TransactionCard extends StatelessWidget {
  final Transaction t;

  const TransactionCard(this.t);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 20,
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 15,
            ),
            decoration: BoxDecoration(
                border: Border.all(
              color: Colors.purple,
              width: 2,
            )),
            padding: EdgeInsets.all(10),
            child: Text(
              t.amt.toString(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.purple,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                t.title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                t.date.toString(),
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
