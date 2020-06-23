import 'package:flutter/material.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/loading.dart';
import 'package:mobile_shower/components/button.dart';
import 'package:mobile_shower/components/text_input.dart';
import 'package:mobile_shower/models/login.dart';
import 'package:mobile_shower/models/user.dart';
import 'package:mobile_shower/services/login_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _titleAppBar = 'Login';

const _labelUsername = 'Usuario';
const _placeholderUsername = '';

const _labelPassword = 'Senha';
const _placeholderPassword = '';

const _textBtnLogin = 'Logar';

const _textBtnRegister = 'Criar conta';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {
  final _controllerEmail = TextEditingController();
  final _controllerPassword = TextEditingController();
  bool _isLoading = false;
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
                  controller: _controllerEmail,
                  label: _labelUsername,
                  placeholder: _placeholderUsername,
                  inputType: TextInputType.emailAddress),
              TextInput(
                controller: _controllerPassword,
                label: _labelPassword,
                placeholder: _placeholderPassword,
                obscureText: true,
              ),
              Button(
                title: _textBtnLogin,
                backgroundColor: Colors.green,
                onPress: () => _login(context),
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
              Button(
                title: _textBtnRegister,
                onPress: () => Navigator.of(context).pushNamed('/register'),
              ),
              /*SizedBox(
                width: 200,
                height: 45,
                child: RaisedButton(
                  child: Text(_textBtnRegister),
                  onPressed: () => Navigator.of(context).pushNamed('/register'),
                ),
              ),*/
            ],
          ),
        ));
  }

  void _login(BuildContext context) async {
    if (_controllerEmail.text.isEmpty) return;
    if (_controllerPassword.text.isEmpty) return;

    setState(() {
      _isLoading = true;
    });

    final login = new Login(_controllerEmail.text, _controllerPassword.text);

    try {
      final service = new LoginService();
      User user = await service.execute(login);

      final shared = await SharedPreferences.getInstance();
      shared.setInt('id', user.id);

      Navigator.of(context).pushReplacementNamed('/shower');
    } catch (err) {
      setState(() {
        _isErrorRegister = true;
        _errorMsg = err.toString();
        _isLoading = false;
      });
      return;
    }
  }
}
