import 'package:flutter/material.dart';

class MyFlatButton extends StatelessWidget {
  final String text;
  final Function callBack;

  const MyFlatButton(this.text, this.callBack);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => callBack(),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      style: TextButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(9)),
        ),
      ),
    );
  }
}
