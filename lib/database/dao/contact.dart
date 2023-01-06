import 'package:bank/database/database.dart';
import 'package:bank/models/contact.dart';
import 'package:sqflite/sqflite.dart';

class ContactDAO{
  static const String sql = "CREATE TABLE $_table ($_id INTEGER PRIMARY KEY, $_name VARCHAR(255), $_account INTEGER)";
  static const String _table = "contact";
  static const String _id = "id";
  static const String _name = "name";
  static const String _account = "account";

  Future<int> save(Contact contact) async{
    final Database db = await createDatabase();
    Map<String, dynamic> list = _toMap(contact);

    return db.insert(_table, list);
  }

  Map<String, dynamic> _toMap(Contact contact) {
    Map<String, dynamic> list = Map();
    list[_name] = contact.name;
    list[_account] = contact.account;
    return list;
  }

  Future<List<Contact>> all() async{
    final Database db = await createDatabase();
    final List<Map<String, dynamic>> results = await db.query(_table);
    List<Contact> contacts = _toList(results);

    return contacts;
  }

  List<Contact> _toList(List<Map<String, dynamic>> results) {
    final List<Contact> contacts = [];

    for(Map<String, dynamic> row in results){
      Contact contact = Contact(row[_id], row[_name], row[_account]);
      contacts.add(contact);
    }
    return contacts;
  }
}
