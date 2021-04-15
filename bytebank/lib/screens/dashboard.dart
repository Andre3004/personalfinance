import 'package:bytebank/components/item_dashboard.dart';
import 'package:bytebank/screens/contacts_list.dart';
import 'package:bytebank/screens/transactions_list.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('images/bytebank_logo.png'),
        ),
        Container(
          height: 120,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ItemDashboard(
                  "Transfer",
                  Icons.monetization_on,
                  onClick: () => _showContent(
                    context,
                    ContactsList(),
                  ),
                ),
                ItemDashboard(
                  "Transaction Feed",
                  Icons.monetization_on,
                  onClick: () => _showContent(
                    context,
                    TransactionsList(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _showContent(BuildContext context, Widget component) {
    Navigator.of(context).push(
      (MaterialPageRoute(
        builder: (context) => component,
      )),
    );
  }
}
