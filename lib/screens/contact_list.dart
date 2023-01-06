import 'package:bank/database/dao/contact.dart';
import 'package:bank/models/contact.dart';
import 'package:bank/screens/contact_form.dart';
import 'package:bank/screens/transaction_form.dart';
import 'package:flutter/material.dart';

class ContactList extends StatefulWidget {
  @override
  _ContactListState createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  final ContactDAO _dao = ContactDAO();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Transfers"),
      ),
      body: FutureBuilder<List<Contact>>(
          initialData: [],
          future: _dao.all(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                // TODO: Handle this case.
                break;
              case ConnectionState.waiting:
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(),
                      Text("Loading..."),
                    ],
                  ),
                );
              case ConnectionState.active:
                // TODO: Handle this case.
                break;
              case ConnectionState.done:
                final List<Contact> contacts = snapshot.data as List<Contact>;

                return ListView.builder(
                  itemBuilder: (context, index) {
                    return CardItem(contacts[index], onClick: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context){
                        return TransactionForm(contacts[index]);
                      }));
                    });
                  },
                  itemCount: contacts.length,
                );
            }

            return Text("Unknow Error");
          }),
      /**/
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {
          Navigator.of(context)
              .push(
            MaterialPageRoute(
              builder: (context) => ContactForm(),
            ),
          ).then((id) => setState(() => {}));

        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  final Contact contact;
  final Function onClick;

  const CardItem(this.contact, {required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () => onClick(),
        title: Text(
          this.contact.name,
          style: TextStyle(
            fontSize: 24.0,
          ),
        ),
        subtitle: Text(
          this.contact.account.toString(),
          style: TextStyle(
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }
}
