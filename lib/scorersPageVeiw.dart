
import 'package:flutter/material.dart';
import 'Player.dart';
import 'api.dart';
import 'dart:async';

class scorersPageVeiw extends StatefulWidget {
  @override
  _scorersPageVeiwState createState() => _scorersPageVeiwState();
}

class _scorersPageVeiwState extends State<scorersPageVeiw>
    with SingleTickerProviderStateMixin {
  Api api = Api();
  List<Player> players = <Player>[];
  TabController _tabController;
  PageController _pageController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
    _pageController = PageController(keepPage: false);
    getdata(0);
  }

  void getdata(int x) async {
    var data = await api.fetchBestScorers(x);
    setState(() {
      players = data;
    });
  }

  void onchange(int x) {
    _tabController.index = x;
    getdata(x);
  }

  List<Widget> tapsOfLeagues = [
    Tab(
      text: "premier League",
    ),
    Tab(text: "Seria A"),
    Tab(text: "league A"),
    Tab(text: "Spanish League"),
    Tab(text: "Bundesliga"),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tapsOfLeagues.length,
      child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              controller: _tabController,
              tabs: tapsOfLeagues,
              isScrollable: true,
              onTap: (index) {
                _pageController.animateToPage(index,
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeInOut);

                onchange(index);

              },
            ),
            title: Text(' bestScorers'),
          ),
          body: PageView.builder(
            controller: _pageController,
            itemBuilder: (context, index) {
              return drawList(
                players: players,
              );
            },
            itemCount: tapsOfLeagues.length,
            onPageChanged: (index) {
              onchange(index);
            },
            scrollDirection: Axis.horizontal,
          )),
    );
  }
}



class drawList extends StatelessWidget {
  List<Player> players;
  drawList({this.players});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, position) {
        var cuurentIndex = position + 1;
        return ListTile(
          title: Text(players[position].name),
          leading: Text("$cuurentIndex"),
          trailing: Text(players[position].numberOfGoals),
          onTap: (){

          },
        );
      },
      itemCount: players.length,
    );
  }
}
