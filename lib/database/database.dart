import 'package:bank/database/dao/contact.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> createDatabase() async{
  final String path = join(await getDatabasesPath(), "bank.db");
  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(ContactDAO.sql);
    },
    version: 1,
  );
}




