import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:bytebank/database/dao/contact_dao.dart';

Future<Database> getDatabase() async {
  var path = join(await getDatabasesPath(), 'bytebank.db');

  return openDatabase(path, onCreate: (db, version) {
    db.execute(ContactDao.tableSql);
  }, version: 1);
}

