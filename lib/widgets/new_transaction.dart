import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NewTransaction extends StatefulWidget {
  final Function addTransactionCallback;

  NewTransaction(this.addTransactionCallback);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = amountController.text;

    widget.addTransactionCallback(enteredTitle, enteredAmount);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              autocorrect: true,
              cursorWidth: 10,
              decoration: (InputDecoration(labelText: 'Title')),
              controller: titleController,
              maxLength: 20,
              maxLengthEnforcement: MaxLengthEnforcement.enforced,
              onSubmitted: (value) => submitData(),
            ),
            TextField(
              cursorWidth: 10,
              decoration: (InputDecoration(labelText: 'Amount')),
              controller: amountController,
              maxLength: 20,
              maxLengthEnforcement: MaxLengthEnforcement.enforced,
              keyboardType: TextInputType.number,
              onSubmitted: (value) => submitData(),
            ),
            TextButton(
              onPressed: () => submitData(),
              child: Text(
                'Add Transaction',
              ),
              style: TextButton.styleFrom(foregroundColor: Colors.purple),
            )
          ],
        ),
      ),
    );
  }
}
