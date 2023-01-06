import 'dart:convert';

import 'package:bank/http/webclient.dart';
import 'package:bank/models/contact.dart';
import 'package:bank/models/transation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class TransactionWebClient {
  Future<List<Transaction>> all() async {
    final Response response =
        await client.get(Uri.parse(URL)).timeout(Duration(seconds: 5));
    print(response.body);
    List<dynamic> jsonTransactions = JsonDecoder().convert(response.body);
    return jsonTransactions
        .map((dynamic json) => Transaction.fromJson(json))
        .toList();
  }

  Future<Transaction> save(Transaction transaction, String password) async {
    await Future.delayed(const Duration(seconds: 2));
    Map<String, dynamic> jsonTransaction = transaction.toJson();
    final String json = jsonEncode(jsonTransaction);
    Response response = await client
        .post(Uri.parse(URL),
            headers: {
              'Content-type': 'application/json',
              'password': password,
            },
            body: json);

    _throwHttpException(response.statusCode);

    return Transaction.fromJson(jsonDecode(response.body));
  }

  void _throwHttpException(int statusCode){
      if(_statuCodeResponse.containsKey(statusCode)){
        throw HttpException(_statuCodeResponse[statusCode]);
      }else if(statusCode >= 300 || statusCode < 200){
        throw HttpException("Unknow Error");
      }
  }

  static final Map<int, String> _statuCodeResponse = {
    400: 'There was an submitting the transference',
    401: 'Authentication failed',
    409: 'Transaction already exist'
  };
}

class HttpException implements Exception{
  final String? message;

  HttpException(this.message);
}
