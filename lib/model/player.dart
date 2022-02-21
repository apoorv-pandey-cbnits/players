class Player {
  Player({
    this.ack,
    this.details,
    this.count,
    this.data,
    this.start,
    this.end,
  });

  Player.fromJson(dynamic json) {
    ack = json['ack'];
    details = json['details'];
    count = json['count'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
    start = json['start'];
    end = json['end'];
  }

  String? ack;
  String? details;
  int? count;
  List<Data>? data;
  String? start;
  String? end;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ack'] = ack;
    map['details'] = details;
    map['count'] = count;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    map['start'] = start;
    map['end'] = end;
    return map;
  }
}

class Data {
  Data({
    this.userUsername,
    this.userId,
    this.cash,
    this.coins,
    this.percentFinish,
    this.promotionCoins,
    this.followers,
    this.ranking,
    this.imageUrl,
  });

  Data.fromJson(dynamic json) {
    userUsername = json['user__username'];
    userId = json['user__id'];
    cash = json['cash'];
    coins = json['coins'];
    percentFinish = json['percentFinish'];
    promotionCoins = json['promotionCoins'];
    followers = json['followers'];
    ranking = json['ranking'];
    imageUrl = json['imageUrl'];
  }

  String? userUsername;
  int? userId;
  double? cash;
  int? coins;
  int? percentFinish;
  int? promotionCoins;
  int? followers;
  int? ranking;
  String? imageUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user__username'] = userUsername;
    map['user__id'] = userId;
    map['cash'] = cash;
    map['coins'] = coins;
    map['percentFinish'] = percentFinish;
    map['promotionCoins'] = promotionCoins;
    map['followers'] = followers;
    map['ranking'] = ranking;
    map['imageUrl'] = imageUrl;
    return map;
  }
}
