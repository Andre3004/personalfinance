

import 'package:json_annotation/json_annotation.dart';
part 'contact.g.dart';

@JsonSerializable()
class Contact{
  final int? id;
  final String name;
  final int accountNumber;

  Contact(this.id, this.name, this.accountNumber);

  static Contact fromJson(Map<String, dynamic> json) {
    var contact = _$ContactFromJson(json);

    return contact;
  }

  Map<String, dynamic> toJson() => _$ContactToJson(this);

  @override
  String toString() {
    return 'Contact{id: $id, name: $name, accountNumber: $accountNumber}';
  }

}