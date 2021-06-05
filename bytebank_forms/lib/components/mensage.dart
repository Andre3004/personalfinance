import 'package:flutter/material.dart';

void showAlert({context, titulo, content}) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(titulo),
          content: Text(content),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context), child: Text("Fechar")),
          ],
        );
      });
}
