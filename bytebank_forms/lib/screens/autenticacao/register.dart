import 'dart:io';

import 'package:brasil_fields/brasil_fields.dart';
import 'package:bytebank_forms/components/validator/flux_validator_src.dart';
import 'package:bytebank_forms/models/cliente.dart';
import 'package:bytebank_forms/screens/dashboard/dashboard.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';


class Register extends StatelessWidget {
  // Step 1
  final GlobalKey<FormState> _formUserData = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _cpfController = TextEditingController();
  final TextEditingController _celularController = TextEditingController();
  final TextEditingController _nascimentoController = TextEditingController();

  // Step 2
  final GlobalKey<FormState> _formUserAddress = GlobalKey<FormState>();
  final TextEditingController _cepController = TextEditingController();
  final TextEditingController _estadoController = TextEditingController();
  final TextEditingController _cidadeController = TextEditingController();
  final TextEditingController _bairroController = TextEditingController();
  final TextEditingController _logradouroController = TextEditingController();
  final TextEditingController _numeroController = TextEditingController();

  // Setp 3
  final GlobalKey<FormState> _formUserAuth = GlobalKey<FormState>();
  final TextEditingController _senhaController = TextEditingController();
  final TextEditingController _confirmarSenhaController = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Criar uma conta"),
      ),
      body: Consumer<Cliente>(
        builder: (context, cliente, child) {
          return Stepper(
            currentStep: cliente.stepAtual,
            onStepContinue: () {
              final functions = [
                saveStep1,
                saveStep2,
                saveStep3,
              ];

              return functions[cliente.stepAtual](context);
            },
            onStepCancel: () {
              cliente.stepAtual = cliente.stepAtual > 0 ? cliente.stepAtual - 1 : 0;
            },
            steps: _buildSteps(context, cliente),
            controlsBuilder: (context, {onStepContinue, onStepCancel}) {
              return Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(
                  children: [
                    ElevatedButton(
                      onPressed: onStepContinue,
                      child: Text("Salvar"),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Theme.of(context).accentColor),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: ElevatedButton(
                        onPressed: onStepCancel,
                        child: Text("Voltar"),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.black54),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
      // Form(
      //     key: _formKey,
      //     child: SingleChildScrollView(
      //       child: Padding(
      //         padding: const EdgeInsets.all(20.0),
      //         child: Column(
      //           children: [
      //             SizedBox(
      //               height: 20,
      //             ),

      //           ],
      //         ),
      //       ),
      //     ),),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     //if (!_formKey.currentState.validate()) return;
      //
      //     Provider.of<Cliente>(context, listen: false).nome = _nameController.text;
      //
      //     Navigator.pushAndRemoveUntil(
      //         context, MaterialPageRoute(builder: (context) => Dashboard()), (route) => false);
      //   },
      //   child: Icon(Icons.save),
      // ),
    );
  }

  void saveStep1(context) {
    if (_formUserData.currentState.validate()) {
      var cliente = Provider.of<Cliente>(context, listen: false);

      cliente.nome = _nameController.text;

      _proximoStep(context);
    }
  }

  void saveStep2(context) {
    if (_formUserAddress.currentState.validate()) {
      _proximoStep(context);
    }
  }

  void saveStep3(context) {
    if (_formUserAuth.currentState.validate()) {
      FocusScope.of(context).unfocus();

      Navigator.pushAndRemoveUntil(
          context, MaterialPageRoute(builder: (context) => Dashboard()), (route) => false);
    }
  }

  List<Step> _buildSteps(BuildContext context, Cliente value) {
    return [_buildStep1(value), _buildStep2(value), _buildStep3(value, context) ];
  }

  Step _buildStep1(Cliente value) {
    return Step(
      title: Text("Seus dados"),
      isActive: value.stepAtual >= 0,
      content: Form(
        key: _formUserData,
        child: Column(
          children: [
            _inputText(
                controller: _nameController,
                label: "Nome",
                length: 255,
                validator: (String value) {
                  if (Validator.required(value)) return "O campo Nome é obrigatório!";
                  if (value.length < 3) return "O campo Nome é inválido!";
                  return null;
                }),
            _inputText(
                controller: _emailController,
                label: "E-mail",
                length: 255,
                keyboardType: TextInputType.emailAddress,
                validator: (String value) {
                  if (Validator.required(value)) return "O campo E-mail é obrigatório!";
                  if (Validator.email(value)) return "O campo E-mail é inválido!";
                  return null;
                }),
            _inputText(
                controller: _cpfController,
                label: "CPF",
                length: 14,
                keyboardType: TextInputType.number,
                formatters: [FilteringTextInputFormatter.digitsOnly, CpfInputFormatter()],
                validator: (String value) {
                  return Validator.cpf(value) ? 'O campo CPF é inválido!' : null;
                }),
            _inputText(
                controller: _celularController,
                keyboardType: TextInputType.number,
                label: "Celular",
                length: 16,
                formatters: [FilteringTextInputFormatter.digitsOnly, TelefoneInputFormatter()],
                validator: (String value) {
                  if (Validator.required(value)) return "O campo Celular é obrigatório!";
                  if (Validator.phone(value)) return "O campo Celular é inválido!";
                  return null;
                }),
            DateTimePicker(
              controller: _nascimentoController,
              type: DateTimePickerType.date,
              firstDate: DateTime(1900),
              lastDate: DateTime.now(),
              decoration: InputDecoration(labelText: "Nascimento", border: OutlineInputBorder()),
              dateMask: 'dd/MM/yyy',
              validator: (value) {
                if (value.isEmpty) return "O campo Nascimento é obrigatório!";
                return null;
              },
            ),
          ],
        ),
      ),
    );
  }

  Step _buildStep2(Cliente value) {
    return Step(
      title: Text("Endereço"),
      isActive: value.stepAtual >= 1,
      content: Form(
        key: _formUserAddress,
        child: Column(
          children: [
            _inputText(
                controller: _cepController,
                keyboardType: TextInputType.number,
                label: "CEP",
                formatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  CepInputFormatter(ponto: false)
                ],
                validator: (String value) {
                  if (Validator.required(value)) return "O campo CEP é obrigatório!";
                  if (Validator.cep(value)) return "O campo CEP é inválido!";
                  return null;
                }),
            DropdownButtonFormField(
              isExpanded: true,
              items: Estados.listaEstadosSigla
                  .map((String estado) => DropdownMenuItem(child: Text(estado), value: estado))
                  .toList(),
              onChanged: (String selecionado) => _estadoController.text = selecionado,
              decoration: InputDecoration(labelText: "Estado", border: OutlineInputBorder()),
              validator: (String value) {
                if (value == null) return "O campo Estado é obrigatório!";
                return null;
              },
            ),
            SizedBox(
              height: 20,
            ),
            _inputText(
                controller: _cidadeController,
                label: "Cidade",
                length: 244,
                validator: (String value) {
                  if (Validator.required(value)) return "O campo Cidade é obrigatório!";
                  return null;
                }),
            _inputText(
                controller: _bairroController,
                label: "Bairro",
                length: 244,
                validator: (String value) {
                  if (Validator.required(value)) return "O campo Bairro é obrigatório!";
                  return null;
                }),
            _inputText(
                controller: _logradouroController,
                label: "Logradouro",
                length: 244,
                validator: (String value) {
                  if (Validator.required(value)) return "O campo Logradouro é obrigatório!";
                  return null;
                }),
            _inputText(controller: _numeroController, label: "Número", length: 10)
          ],
        ),
      ),
    );
  }

  Step _buildStep3(Cliente cliente, BuildContext context) {
    return Step(
      title: Text("Autenticação"),
      isActive: cliente.stepAtual >= 2,
      content: Form(
        key: _formUserAuth,
        child: Column(
          children: [
            _inputText(
              controller: _senhaController,
              label: "Senha",
              length: 255,
              obscure: true,
              validator: (String value) {
                if (Validator.required(value)) return "O campo Senha é obrigatório!";
                if (value.length < 8) return "O campo Senha é muito curto!";
                return null;
              },
            ),
            _inputText(
              controller: _confirmarSenhaController,
              label: "Confirmar Senha",
              length: 255,
              obscure: true,
              validator: (String value) {
                if (Validator.required(_senhaController.value.text.isEmpty))
                  return "O campo Senha é obrigatório!";
                if (Validator.required(value.isEmpty)) return "O campo Confirmação é obrigatório!";

                if (value.length < 8) return "O campo Confirmação é muito curto!";
                if (value != _senhaController.value.text)
                  return "O campo Senha e Confirmação devem ser iguais!";
                return null;
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 0),
              child: Column(
                children: [
                  Text(
                    "Para prosseguir com o seu cadastro é necessário que tenhamos uma foto do seu RG!",
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    child: ElevatedButton(
                        onPressed: () => _getPicCamera(context),
                        child: Text("Tirar foto do meu RG!")),
                    width: double.infinity,
                  ),
                  Consumer<Cliente>(builder: (context, cliente, child) {
                    return cliente.imagemRg != null
                        ? _showContent(cliente.imagemRg)
                        : Text(
                            "É necessário inserir uma foto do RG",
                            style: TextStyle(color: Colors.red),
                          );
                  })
                  //Provider.of<Cliente>(context).,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _inputText(
      {TextEditingController controller,
      String label,
      TextInputType keyboardType = TextInputType.text,
      int length,
      Function validator,
      bool obscure = false,
      List<TextInputFormatter> formatters}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(labelText: label, border: OutlineInputBorder()),
        keyboardType: keyboardType,
        maxLength: length,
        obscureText: obscure,
        inputFormatters: formatters,
        validator: validator,
      ),
    );
  }

  _proximoStep(context) {
    var cliente = Provider.of<Cliente>(context, listen: false);
    irPara(cliente.stepAtual + 1, cliente);
  }

  void irPara(int i, Cliente cliente) {
    cliente.stepAtual = i;
  }

  Widget _showContent(File imagemRg) {
    return Image.file(imagemRg);
  }

  void _getPicCamera(BuildContext context) async {
    PickedFile pickedFile = await _picker.getImage(source: ImageSource.camera);
    Provider.of<Cliente>(context, listen: false).imagemRg =
        File(pickedFile.path);
  }
}
