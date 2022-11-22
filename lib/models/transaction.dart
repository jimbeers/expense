import 'package:flutter/foundation.dart';

class Transaction {
  final String id; // unique id
  final String title; // name of item
  final double amt; // the amount of spend
  final DateTime date; // date time of transaction

  Transaction({
    @required this.id,
    @required this.title,
    @required this.amt,
    @required this.date,
  });
}
