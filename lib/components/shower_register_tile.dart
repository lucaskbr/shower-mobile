import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_shower/models/shower_register.dart';
import 'package:mobile_shower/services/delete_shower_service.dart';

// ignore: must_be_immutable
class ShowerRegisterTile extends StatelessWidget {
  ShowerRegister showerRegister;

  ShowerRegisterTile(this.showerRegister);

  @override
  Widget build(BuildContext context) {
    final _title =
        'Minutos de banho: ' + this.showerRegister.difference.toString();
    final _begin = 'Início: ' + this.showerRegister.beginDate.toString();
    final _end = 'Fim: ' + this.showerRegister.endDate.toString();

    return Container(
        decoration: new BoxDecoration(color: Colors.grey[200]),
        child: Dismissible(
          key: Key(this.showerRegister.id.toString()),
          direction: DismissDirection.endToStart,
          background: Container(
            alignment: AlignmentDirectional.centerEnd,
            color: Colors.red,
            child: Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ),
          confirmDismiss: (DismissDirection dismissDirection) async =>
              await _showConfirmationDialog(context, 'deletar'),
          onDismissed: (DismissDirection dismissDirection) async =>
              _deleteItem(this.showerRegister.id),
          child: ListTile(
            leading: Icon(Icons.access_time),
            title: Text(
              _title,
              style: TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            contentPadding: EdgeInsets.all(10),
            subtitle: Column(
              children: <Widget>[
                Text(
                  _begin,
                ),
                Text(_end),
              ],
            ),
          ),
        ));
  }

  Future<bool> _showConfirmationDialog(BuildContext context, String action) {
    return showDialog<bool>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Você deseja $action este item?'),
          actions: <Widget>[
            FlatButton(
                child: const Text('Sim'),
                onPressed: () =>
                    Navigator.pop(context, true) // showDialog() returns true
                ),
            FlatButton(
                child: const Text('Não'),
                onPressed: () =>
                    Navigator.pop(context, false) // showDialog() returns false
                ),
          ],
        );
      },
    );
  }

  bool _deleteItem(int showerRegisterId) {
    return DeleteShowerRegisterService().execute(showerRegisterId);
  }
}
