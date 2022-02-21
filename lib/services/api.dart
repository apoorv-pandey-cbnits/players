import 'package:http/http.dart' as http;

String url = "api.fanex.in";

Future<http.Response> getListOfPlayers([int? filterId]) async {
  final response = await http.get(Uri.https(url, "weburls/chakra/$filterId"));
  return response;
}

Future<http.Response> getListOfFilters() async {
  final response = await http.get(Uri.https(url, "weburls/chakra"));
  return response;
}
