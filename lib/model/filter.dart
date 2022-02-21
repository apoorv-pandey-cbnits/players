class Filter {
  Filter({
    this.ack,
    this.details,
    this.data,
  });

  Filter.fromJson(dynamic json) {
    ack = json['ack'];
    details = json['details'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }

  String? ack;
  String? details;
  List<Data>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ack'] = ack;
    map['details'] = details;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Data {
  Data({
    this.id,
    this.date,
  });

  Data.fromJson(dynamic json) {
    id = json['id'];
    date = json['date'];
  }

  int? id;
  String? date;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['date'] = date;
    return map;
  }
}
