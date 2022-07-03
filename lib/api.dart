import 'Player.dart';
import 'apiUtilities.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Api {

  Future<List<Player>> fetchBestScorers(int l) async {
    String url = base_api + leaguesList[l]+"?season=2021";
    List<Player> players = <Player>[];
    var response = await http.get(url, headers: headers,);
    if (response.statusCode == 200) {
      var jsondata = jsonDecode(response.body);
      print(jsondata);
      var scorers_List = jsondata['scorers'];

      for (var scorer in scorers_List) {

        Player player = Player(name: scorer['player']['name'].toString(),
            numberOfGoals: scorer['goals'].toString(),
            position: scorer['player']['position'].toString(),
            team: scorer['team']['name'].toString(),
            nationality: scorer['player'] ['nationality'].toString());
        players.add(player);
      }

      


      return players;
    }
  }
}
/*Player player = Player(name: scorer['name'].toString(),
  numberOfGoals: scorer['numberOfGoals'].toString(),
  position: scorer['position'].toString(),
  team: scorer['team'].toString(),
  nationality: scorer['nationality'].toString(),
   for (var item in scorers_List) {

      print(item["name"].toString());
      print(scorers_List[0]['position']);
     // print(scorer['name'].toString());
     // players.add(player);

    }
  // return players;
   // print(scorers_List);
);*/