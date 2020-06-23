import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_shower/models/ranking.dart';

// ignore: must_be_immutable
class RankingTile extends StatelessWidget {
  Ranking ranking;

  RankingTile(this.ranking);

  @override
  Widget build(BuildContext context) {
    final _user = 'ID do usuário: ' + this.ranking.userId.toString();
    final _score = 'Pontuação: ' + this.ranking.score.toString();

    return Container(
      decoration: new BoxDecoration(color: Colors.grey[200]),
      child: ListTile(
          leading: Icon(Icons.star),
          title: Text(
            _user,
            style: TextStyle(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          contentPadding: EdgeInsets.all(10),
          subtitle: Text(
            _score,
            textAlign: TextAlign.center,
          )),
    );
  }
}
