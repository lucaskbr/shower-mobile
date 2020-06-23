import 'package:flutter/material.dart';
import 'package:mobile_shower/screens/history.dart';
import 'package:mobile_shower/screens/login.dart';
import 'package:mobile_shower/screens/ranking.dart';
import 'package:mobile_shower/screens/register.dart';
import 'package:mobile_shower/screens/settings.dart';
import 'package:mobile_shower/screens/shower.dart';

void main () => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Roboto',
        brightness:     Brightness.light,
        primaryColor:   Colors.cyan[800],
        accentColor:    Colors.cyan[800],
      ),
      //home: ShowerTimeScreen(),
      routes: {
        '/': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/shower': (context) =>  ShowerScreen(),
        '/history': (context) => HistoryScreen(),
        '/settings': (context) => SettingsScreen(),
        '/ranking': (context) => RankingScreen(),
      },
    );
  }
}
