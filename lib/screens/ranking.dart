import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_shower/components/navigator_bar.dart';
import 'package:mobile_shower/components/ranking_tile.dart';
import 'package:mobile_shower/components/shower_register_tile.dart';
import 'package:mobile_shower/models/ranking.dart';
import 'package:mobile_shower/models/shower_register.dart';
import 'package:mobile_shower/services/get_ranking_service.dart';
import 'package:mobile_shower/services/get_shower_registers_service.dart';

const _titleAppBar = 'Ranking de usuarios';

class RankingScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RankingScreenState();
  }
}

class RankingScreenState extends State<RankingScreen> {

  @override
  Widget build(BuildContext context) {
    //final ScreenArgs args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(_titleAppBar),
      ),
      bottomNavigationBar: NavigatorBar(selectedIndex: 2,),
      body: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Center(
                child: ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return RankingTile(snapshot.data[index],
                      );
                    }),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }

  Future<List<Ranking>> getData() async =>
      await Future.delayed(Duration(seconds: 3), () {
        return GetRankingService().execute();
      });
}