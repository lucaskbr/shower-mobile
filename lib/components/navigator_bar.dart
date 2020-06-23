import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_shower/screens/register.dart';

class NavigatorBar extends StatefulWidget {

  final int selectedIndex;


  NavigatorBar({Key key, this.selectedIndex});

  @override
  State<StatefulWidget> createState() {
    return NavigatorBarState();
  }
}

class NavigatorBarState extends State<NavigatorBar> {

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.timer),
          title: Text('Banho'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.poll),
          title: Text('Historico'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.public),
          title: Text('Rank'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          title: Text('Configurar'),
        ),
      ],
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.cyan[800],
      currentIndex: widget.selectedIndex,
      onTap: _onTap,
    );
  }

  _onTap(int tabIndex) {

    switch (tabIndex) {
      case 0:
        Navigator.of(context).pushReplacementNamed('/shower');
        break;
      case 1:
        Navigator.of(context).pushReplacementNamed('/history');
        break;
      case 2:
        Navigator.of(context).pushReplacementNamed('/ranking');
        break;
      case 3:
        Navigator.of(context).pushReplacementNamed('/settings');
        break;
    }
  }
}
