import 'package:flutter/material.dart';

class TransactionAuthDialog extends StatefulWidget {
  final Function(String password) onConfirm;

  TransactionAuthDialog({required this.onConfirm});

  @override
  _TransactionAuthDialogState createState() => _TransactionAuthDialogState();
}

class _TransactionAuthDialogState extends State<TransactionAuthDialog> {
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Authenticate"),
      content: TextField(
        controller: _passwordController,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
        ),
        obscureText: true,
        maxLength: 4,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 64,
          letterSpacing: 24,
        ),
        keyboardType: TextInputType.number,
      ),
      actions: [
        MaterialButton(child: Text("Cancel"), onPressed: (){
          Navigator.pop(context);
        }),
        MaterialButton(child: Text('Confirm'), onPressed: () {
          widget.onConfirm(_passwordController.text);
          Navigator.pop(context);
        })
      ],
    );
  }
}
