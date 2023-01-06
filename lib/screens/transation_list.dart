import 'package:bank/components/centered_message.dart';
import 'package:bank/http/webclients/transaction_webclient.dart';
import 'package:bank/models/contact.dart';
import 'package:bank/models/transation.dart';
import 'package:flutter/material.dart';
import 'package:bank/http/webclient.dart';
import 'package:bank/components/progress.dart';

class TransactionsList extends StatelessWidget {
  final TransactionWebClient _webClient = TransactionWebClient();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transactions'),
      ),
      body: FutureBuilder<List<Transaction>>(
        future: _webClient.all(),
        builder: (context, snapshot) {
          switch(snapshot.connectionState){
            case ConnectionState.none:
              // TODO: Handle this case.
              break;
            case ConnectionState.waiting:
              // TODO: Handle this case.
              return Progress();
              break;
            case ConnectionState.active:
              // TODO: Handle this case.
              break;
            case ConnectionState.done:
              print(snapshot);
              if(snapshot.hasData){
                final List<Transaction> transactions = snapshot.data ?? [];
                if(transactions.isNotEmpty){
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      final Transaction transaction = transactions[index];
                      return Card(
                        child: ListTile(
                          leading: Icon(Icons.monetization_on),
                          title: Text(
                            transaction.value.toString(),
                            style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            transaction.contact.account.toString(),
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: transactions.length,
                  );break;
                }
              }

              return CenteredMessage('No transactions found', icon: Icons.warning);
          }
          return CenteredMessage('Unknow Error');
        }
      ),

    );
  }
}

