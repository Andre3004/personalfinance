import 'package:bytebank/database/app_database.dart';
import 'package:bytebank/models/contact/contact.dart';

class ContactDao {
  static const String tableSql = 'CREATE TABLE $_tableName('
      '$_id INTEGER PRIMARY KEY, '
      '$_name TEXT, '
      '$_accountNumber INTEGER)';

  static const String _tableName = 'contacts';
  static const String _id = 'id';
  static const String _name = 'name';
  static const String _accountNumber = 'account_number';

  Future<int> save(Contact contact) async {
    var db = await getDatabase();
    return db.insert(_tableName, _toMap(contact));
  }

  Future<List<Contact>> findAll() async {
    var db = await getDatabase();
    var result = await db.query(_tableName);
    return _toList(result);
  }

  Future<int> update(Contact contact) async {
    var db = await getDatabase();
    final Map<String, dynamic> contactMap = _toMap(contact);
    return db.update(
      _tableName,
      contactMap,
      where: '$_id = ?',
      whereArgs: [contact.id],
    );
  }

  Future<int> delete(int id) async {
    var db = await getDatabase();
    return db.delete(
      _tableName,
      where: '$_id = ?',
      whereArgs: [id],
    );
  }

  Map<String, dynamic> _toMap(Contact contact) {
    final Map<String, dynamic> contactMap = Map();
    contactMap[_name] = contact.name;
    contactMap[_accountNumber] = contact.accountNumber;
    return contactMap;
  }

  List<Contact> _toList(List<Map<String, dynamic>> result) {
    final List<Contact> contacts = [];
    for (Map<String, dynamic> row in result) {
      final Contact contact = Contact(
        row[_id],
        row[_name],
        row[_accountNumber],
      );
      contacts.add(contact);
    }
    return contacts;
  }
}
