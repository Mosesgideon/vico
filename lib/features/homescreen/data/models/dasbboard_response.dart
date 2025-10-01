class DasboardSuccessResponse {
  DasboardSuccessResponse({
    required this.status,
    required this.data,
  });

  final String? status;
  final Data? data;

  DasboardSuccessResponse copyWith({
    String? status,
    Data? data,
  }) {
    return DasboardSuccessResponse(
      status: status ?? this.status,
      data: data ?? this.data,
    );
  }

  factory DasboardSuccessResponse.fromJson(Map<String, dynamic> json){
    return DasboardSuccessResponse(
      status: json["status"],
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data?.toJson(),
  };

  @override
  String toString(){
    return "$status, $data, ";
  }
}

class Data {
  Data({
    required this.stats,
  });

  final List<Stat> stats;

  Data copyWith({
    List<Stat>? stats,
  }) {
    return Data(
      stats: stats ?? this.stats,
    );
  }

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      stats: json["stats"] == null ? [] : List<Stat>.from(json["stats"]!.map((x) => Stat.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "stats": stats.map((x) => x?.toJson()).toList(),
  };

  @override
  String toString(){
    return "$stats, ";
  }
}

class Stat {
  Stat({
    required this.title,
    required this.value,
    required this.change,
  });

  final String? title;
  final String? value;
  final String? change;

  Stat copyWith({
    String? title,
    String? value,
    String? change,
  }) {
    return Stat(
      title: title ?? this.title,
      value: value ?? this.value,
      change: change ?? this.change,
    );
  }

  factory Stat.fromJson(Map<String, dynamic> json){
    return Stat(
      title: json["title"],
      value: json["value"],
      change: json["change"],
    );
  }

  Map<String, dynamic> toJson() => {
    "title": title,
    "value": value,
    "change": change,
  };

  @override
  String toString(){
    return "$title, $value, $change, ";
  }
}
