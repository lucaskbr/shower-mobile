import 'package:flutter/material.dart';
import 'package:mobile_shower/components/navigator_bar.dart';
import 'package:mobile_shower/components/text_input.dart';
import 'package:mobile_shower/models/login.dart';
import 'package:mobile_shower/services/login_service.dart';

const _titleAppBar = 'Configurar banho';

const _labelMaxTime = 'Tempo máximo de banho em minutos';
const _placeholderMaxTime = '5';

const _textoBotaoConfirmar = 'Salvar configuração';

class SettingsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SettingsScreenState();
  }
}

class SettingsScreenState extends State<SettingsScreen> {
  final _controllerMaxTime = TextEditingController();
  bool _isErrorRegister = false;
  String _errorMsg = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_titleAppBar),
        ),
        bottomNavigationBar: NavigatorBar(selectedIndex: 3,),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              TextInput(
                controller: _controllerMaxTime,
                label: _labelMaxTime,
                placeholder: _placeholderMaxTime,
                inputType: TextInputType.number,
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
    if (_controllerMaxTime.text.isEmpty) return;

    /*try {
      final service = new ConfigShowerTimeService();
      await service.execute(50);
    } catch (err) {
      print(err);
      setState(() {
        _isErrorRegister = true;
        _errorMsg = err.toString();
      });
      return;
    }*/
  }
}
