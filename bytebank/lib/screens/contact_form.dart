import 'package:bytebank/models/contact/contact.dart';
import 'package:flutter/material.dart';
import 'package:bytebank/database/dao/contact_dao.dart';

class ContactForm extends StatefulWidget {
  @override
  _ContactFormState createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _accountNumberController =
      TextEditingController();

  final ContactDao _dao = ContactDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Contact'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              style: TextStyle(
                fontSize: 24.0,
              ),
              decoration: InputDecoration(
                labelText: 'Full name',
              ),
            ),
            TextField(
              controller: _accountNumberController,
              style: TextStyle(
                fontSize: 24.0,
              ),
              decoration: InputDecoration(
                labelText: 'Account number',
              ),
              keyboardType: TextInputType.number,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                  child: Text('Create'),
                  onPressed: () {
                    var name = _nameController.text;
                    var accountNumber =
                        int.tryParse(_accountNumberController.text);


                    var contact = Contact(1, name, accountNumber != null ? accountNumber: 0);

                    _dao.save(contact).then(
                      (id) => Navigator.pop(context),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),

    );
  }
}
