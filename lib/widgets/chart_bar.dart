import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPerOfTotal;

  const ChartBar(this.label, this.spendingAmount, this.spendingPerOfTotal);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 26,
          margin: EdgeInsets.all(5.0),
          child:
              FittedBox(child: Text("\$${spendingAmount.toStringAsFixed(0)}")),
        ),
        SizedBox(height: 4),
        Expanded(
          child: Container(
            // height: 80,
            width: 10,
            child: Stack(children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                  color: Color.fromRGBO(220, 220, 220, 1),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              FractionallySizedBox(
                heightFactor: spendingPerOfTotal,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              )
            ]),
          ),
        ),
        SizedBox(height: 4),
        Text(label),
      ],
    );
  }
}
