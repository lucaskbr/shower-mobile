import 'package:flutter/material.dart';
import 'package:mobile_shower/components/button.dart';
import 'package:mobile_shower/components/text_input.dart';
import 'package:mobile_shower/models/user.dart';
import 'package:mobile_shower/services/register_user_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _titleAppBar = 'Registrar';

const _labelFirstName = 'Nome';
const _placeholderFirstName = 'Fulano';

const _labelLastName = 'Sobrenome';
const _placeholderLastName = 'Ciclano';

const _labelUsername = 'Usuario';
const _placeholderUsername = 'fulano_ciclano';

const _labelPassword = 'Senha';
const _placeholderPassword = '';

const _textoBotaoConfirmar = 'Registrar';

class RegisterScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RegisterScreenState();
  }
}

class RegisterScreenState extends State<RegisterScreen> {
  final _controllerFirstName = TextEditingController();
  final _controllerLastName = TextEditingController();
  final _controllerUsername = TextEditingController();
  final _controllerPassword = TextEditingController();
  bool _isErrorRegister = false;
  String _errorMsg = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_titleAppBar),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              TextInput(
                controller: _controllerFirstName,
                label: _labelFirstName,
                placeholder: _placeholderFirstName,
              ),
              TextInput(
                controller: _controllerLastName,
                label: _labelLastName,
                placeholder: _placeholderLastName,
              ),
              TextInput(
                controller: _controllerUsername,
                label: _labelUsername,
                placeholder: _placeholderUsername,
                inputType: TextInputType.emailAddress,
              ),
              TextInput(
                controller: _controllerPassword,
                label: _labelPassword,
                placeholder: _placeholderPassword,
                obscureText: true,
              ),
              Button(
                title: _textoBotaoConfirmar,
                backgroundColor: Colors.green,
                onPress: () => _register(context),
              ),
              Visibility(
                child: Text(
                  _errorMsg,
                  style: TextStyle(color: Colors.red),
                ),
                maintainSize: true,
                maintainAnimation: true,
                maintainState: true,
                visible: _isErrorRegister,
              ),
            ],
          ),
        ));
  }

  void _register(BuildContext context) async {
    if (_controllerFirstName.text.isEmpty) return;
    if (_controllerLastName.text.isEmpty) return;
    if (_controllerUsername.text.isEmpty) return;
    if (_controllerPassword.text.isEmpty) return;

    final newUser = new User(
        firstName: _controllerFirstName.text,
        lastName: _controllerLastName.text,
        username: _controllerUsername.text,
        password: _controllerPassword.text
    );

    try {
      final service = new RegisterUserService();
      final user = await service.execute(newUser);

      final shared = await SharedPreferences.getInstance();
      shared.setInt('id', user.id);

      Navigator.of(context).pop();
      Navigator.of(context).pushReplacementNamed('/shower');

    } catch (err) {
      setState(() {
        _isErrorRegister = true;
        _errorMsg = err.toString();
      });
      return;
    }
  }
}
