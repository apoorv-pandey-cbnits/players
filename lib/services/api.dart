import 'package:http/http.dart' as http;

String url = "api.fanex.in";
// get list of players
Future<http.Response> getListOfPlayers([int? filterId]) async {
  final response = await http.get(Uri.https(url, "weburls/chakra/$filterId"));
  return response;
}
// get list of filters
Future<http.Response> getListOfFilters() async {
  final response = await http.get(Uri.https(url, "weburls/chakra"));
  return response;
}
