import 'package:bank/database/dao/contact.dart';
import 'package:bank/models/contact.dart';
import 'package:flutter/material.dart';

class ContactForm extends StatefulWidget {
  @override
  _ContactFormState createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _accountController = TextEditingController();
  final ContactDAO _dao = ContactDAO();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("New Contact")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              style: TextStyle(fontSize: 24.0),
              decoration: InputDecoration(
                labelText: "Full name",
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: TextField(
                controller: _accountController,
                decoration: InputDecoration(labelText: "Account number"),
                style: TextStyle(fontSize: 24.0),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 16.0),
              child: SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                  onPressed: () {
                    final String name = _nameController.value.text;
                    final int account = int.tryParse(_accountController.value.text) ?? 0;
                    final Contact contact =  Contact(0, name, account);
                    _dao.save(contact).then((id) => Navigator.pop(context));
                  },
                  child: Text("Create"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
