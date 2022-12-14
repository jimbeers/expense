import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_complete_guide/widgets/my_flat_button.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTransactionCallback;

  NewTransaction(this.addTransactionCallback);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate;

  void _submitData() {
    final enteredTitle = _titleController.text;
    final enteredAmount = _amountController.text;
    final enteredDate = _selectedDate;

    widget.addTransactionCallback(enteredTitle, enteredAmount, enteredDate);

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) return;
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 10,
        child: Container(
          padding: EdgeInsets.only(
            top: 10,
            right: 10,
            left: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 40,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                autocorrect: true,
                cursorWidth: 10,
                decoration: (InputDecoration(labelText: 'Title')),
                controller: _titleController,
                maxLength: 20,
                maxLengthEnforcement: MaxLengthEnforcement.enforced,
                onSubmitted: (value) => _submitData(),
              ),
              TextField(
                cursorWidth: 10,
                decoration: (InputDecoration(labelText: 'Amount')),
                controller: _amountController,
                maxLength: 20,
                maxLengthEnforcement: MaxLengthEnforcement.enforced,
                keyboardType: TextInputType.number,
                onSubmitted: (value) => _submitData(),
              ),
              Container(
                height: 70,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        _selectedDate == null
                            ? 'No Date Chosen!'
                            : 'Date: ${DateFormat.yMd().format(_selectedDate)}',
                      ),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: Theme.of(context).primaryColor,
                      ),
                      onPressed: _presentDatePicker,
                      child: Text(
                        'Choose Date',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              MyFlatButton('Add Transaction', _submitData),
            ],
          ),
        ),
      ),
    );
  }
}
