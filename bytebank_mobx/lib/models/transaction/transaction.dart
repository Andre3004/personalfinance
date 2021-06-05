import 'package:bytebank/models/contact/contact.dart';
import 'package:json_annotation/json_annotation.dart';
part 'transaction.g.dart';

@JsonSerializable()
class Transaction {
  final String id;
  final double value;
  final DateTime? dateTime;
  final Contact contact;

  Transaction(
    this.id,
    this.value,
    this.contact,
    this.dateTime,
  );

  static Transaction fromJson(Map<String, dynamic> json) {
    var obj = _$TransactionFromJson(json);

    return obj;
  }

  Map<String, dynamic> toJson() => _$TransactionToJson(this);

  @override
  String toString() {
    return 'Transaction{value: $value, contact: $contact}';
  }
}
