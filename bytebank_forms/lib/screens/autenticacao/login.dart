import 'package:brasil_fields/brasil_fields.dart';
import 'package:bytebank_forms/screens/autenticacao/register.dart';
import 'package:bytebank_forms/screens/dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Login extends StatelessWidget {
  final TextEditingController _cpfController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Image.asset(
                  "assets/images/bytebank_logo.png",
                  width: 200,
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: 300,
                height: 430,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(padding: const EdgeInsets.all(20), child: _buildForm(context)),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Theme.of(context).accentColor,
    );
  }

  Widget _buildForm(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Text(
            "Faça seu login",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          SizedBox(height: 15),
          TextFormField(
            controller: _cpfController,
            maxLength: 14,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              CpfInputFormatter(),
            ],
            validator: (value) {
              if (value.isEmpty) return "Informe um CPF!";
              return null;
            },
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'CPF', border: OutlineInputBorder()),
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: _passwordController,
            obscureText: true,
            maxLength: 15,
            validator: (value) {
              if (value.isEmpty) return "Informe uma Senha!";
              return null;
            },
            decoration: InputDecoration(labelText: 'Senha', border: OutlineInputBorder()),
          ),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              style: TextButton.styleFrom(
                side: BorderSide(width: 2, color: Theme.of(context).accentColor),
              ),
              child: Text(
                "CONTINUAR",
                style: TextStyle(color: Theme.of(context).accentColor),
              ),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Dashboard(),
                    ),
                    (route) => false);
              },
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "Esqueci minha senha >",
            style: TextStyle(
              color: Theme.of(context).accentColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 25,
          ),
          OutlinedButton(
            child: Text("Criar uma conta >",
                style: TextStyle(
                  color: Theme.of(context).accentColor,
                  fontWeight: FontWeight.bold,
                )),
            style: TextButton.styleFrom(
              side: BorderSide(width: 1, color: Theme.of(context).accentColor),
            ),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (contextRoute)=> Register()));
            },
          )
        ],
      ),
    );
  }


}
