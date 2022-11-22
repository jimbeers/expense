import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NewTransaction extends StatelessWidget {
  final Function addTransactionCallback;

  NewTransaction(this.addTransactionCallback);

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void submitData() {
    addTransactionCallback(titleController.text, amountController.text);
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
              onPressed: () {
                addTransactionCallback(
                    titleController.text, amountController.text);
              },
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
