const String base_api="http://api.football-data.org/v4/competitions";

Map<String,String>headers = { 'X-Auth-Token': '2f1e935aef9c4c679a8a551b1c0a058f' };
const List<String> leaguesList = [
  "/PL/scorers",
  "/SA/scorers",
  "/FL1/scorers",
  "/PD/scorers",
  "/BL1/scorers",
  "/CL/scorers"
];