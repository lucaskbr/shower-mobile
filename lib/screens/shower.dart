import 'package:flutter/material.dart';
import 'package:mobile_shower/components/button.dart';
import 'package:mobile_shower/components/navigator_bar.dart';
import 'package:mobile_shower/models/shower_register.dart';
import 'package:mobile_shower/services/register_shower_service.dart';
import 'package:flutter_timer/flutter_timer.dart';

const _titleAppBar = 'Registrar banho';

class ShowerScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ShowerScreenState();
  }
}

class ShowerScreenState extends State<ShowerScreen> {
  bool _isRunning = false;
  String _timer = '';
  DateTime _beginDate;
  DateTime _endDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_titleAppBar),
        ),
        bottomNavigationBar: NavigatorBar(
          selectedIndex: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Image.asset(
                'assets/shower.png',
                width: 200,
              ),
              TikTikTimer(
                initialDate: DateTime.now(),
                running: _isRunning,
                height: 120,
                width: 120,
                backgroundColor:  Colors.cyan[800],
                timerTextStyle: TextStyle(color: Colors.white, fontSize: 20),
                borderRadius: 100,
                isRaised: true,
                tracetime: (time) {
                  print(time);
                },
              ),
              SizedBox(height: 5),
              _showerButton(),
              _saveRecordButton(),
              SizedBox(height: 5),
              _deleteRecordButton(),
            ],
          ),
        ));
  }

  Widget _showerButton() {
    if (_beginDate != null && _endDate != null) {
      return Container();
    }
    return Button(
      title: _isRunning ? 'TERMINAR' : 'TOMAR BANHO',
      onPress: () => setState(() {
        _isRunning = !_isRunning;

        !_isRunning
            ? _beginDate = new DateTime.now()
            : _endDate = new DateTime.now();
      }),
    );
  }

  Widget _saveRecordButton() {
    if (_beginDate != null && _endDate != null) {
      return Button(
          title: 'SALVAR REGISTRO',
          backgroundColor: Colors.green,
          onPress: () => _saveRecord());
    }
    return Container();
  }

  void _saveRecord() async {
    final showerRegister =
        new ShowerRegister(beginDate: _beginDate, endDate: _endDate);

    final service = new RegisterShowerService();
    await service.execute(showerRegister);

    setState(() {
      _beginDate = null;
      _endDate = null;
    });

    Navigator.of(context).pushReplacementNamed('/history');
  }

  Widget _deleteRecordButton() {
    if (_beginDate != null && _endDate != null) {
      return Button(
          title: 'DELETAR REGISTRO',
          backgroundColor: Colors.red,
          onPress: () => _deleteRecord());
    }
    return Container();
  }

  void _deleteRecord() async {
    setState(() {
      _beginDate = null;
      _endDate = null;
    });
  }
}
