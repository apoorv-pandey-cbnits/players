import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:untitled/model/filter.dart' as filter;
import 'package:untitled/model/player.dart';

import '../services/api.dart';

class PlayersProvider extends ChangeNotifier {
  List<Data>? _players = [];
  List<filter.Data>? _filterDates = [];
  String? start;
  String? end;

  List<Data>? get players => _players;

  List<filter.Data>? get filterDates => _filterDates;

  Future getPlayers([int? filterId]) async {
    final result = await getListOfPlayers(filterId);
    final decode = jsonDecode(result.body);
    Player player = Player.fromJson(decode);
    _players = player.data;
    end = player.end;
    start = player.start;
    notifyListeners();
  }

  Future getFilters() async {
    final result = await getListOfFilters();
    final decode = jsonDecode(result.body);
    filter.Filter filtersData = filter.Filter.fromJson(decode);
    _filterDates = filtersData.data;
    notifyListeners();
  }
}
