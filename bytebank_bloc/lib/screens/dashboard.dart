import 'package:bytebank/blocs/containers/contacts_list.dart';
import 'package:bytebank/blocs/containers/name.dart';
import 'package:bytebank/blocs/containers/transactions_list.dart';
import 'package:bytebank/blocs/cubits/name.dart';
import 'package:bytebank/components/container.dart';
import 'package:bytebank/components/item_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var name = context.watch<NameCubit>().state;

    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard $name'),
      ),
      body: Column(
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
                      ContactsListContainer(),
                    ),
                  ),
                  ItemDashboard(
                    "Transaction Feed",
                    Icons.monetization_on,
                    onClick: () => _showContent(
                      context,
                      TransactionsListContainer(),
                    ),
                  ),
                  ItemDashboard(
                    "Change name",
                    Icons.person_outline,
                    onClick: () => _showChangeName(context),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showContent(BuildContext context, BlocContainer component) {
    push(context, component);
  }

  void _showChangeName(BuildContext blocContext) {
    Navigator.of(blocContext).push(
      (MaterialPageRoute(
        builder: (context) => BlocProvider.value(
          value: BlocProvider.of<NameCubit>(blocContext),
          child: NameContainer(),
        ),
      )),
    );
  }
}
