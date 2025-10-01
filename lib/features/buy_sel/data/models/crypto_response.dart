class GetAllCryptoResponse {
  GetAllCryptoResponse({
    required this.status,
    required this.pagination,
    required this.result,
    required this.data,
  });

  final String? status;
  final Pagination? pagination;
  final num? result;
  final Data? data;

  GetAllCryptoResponse copyWith({
    String? status,
    Pagination? pagination,
    num? result,
    Data? data,
  }) {
    return GetAllCryptoResponse(
      status: status ?? this.status,
      pagination: pagination ?? this.pagination,
      result: result ?? this.result,
      data: data ?? this.data,
    );
  }

  factory GetAllCryptoResponse.fromJson(Map<String, dynamic> json){
    return GetAllCryptoResponse(
      status: json["status"],
      pagination: json["pagination"] == null ? null : Pagination.fromJson(json["pagination"]),
      result: json["result"],
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "status": status,
    "pagination": pagination?.toJson(),
    "result": result,
    "data": data?.toJson(),
  };

  @override
  String toString(){
    return "$status, $pagination, $result, $data, ";
  }
}

class Data {
  Data({
    required this.coins,
  });

  final List<Coin> coins;

  Data copyWith({
    List<Coin>? coins,
  }) {
    return Data(
      coins: coins ?? this.coins,
    );
  }

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      coins: json["coins"] == null ? [] : List<Coin>.from(json["coins"]!.map((x) => Coin.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "coins": coins.map((x) => x?.toJson()).toList(),
  };

  @override
  String toString(){
    return "$coins, ";
  }
}

class Coin {
  Coin({
    required this.id,
    required this.coinName,
    required this.coinAddress,
    required this.coinRate,
    required this.coinImage,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  final dynamic? id;
  final String? coinName;
  final String? coinAddress;
  final dynamic? coinRate;
  final String? coinImage;
  final String? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Coin copyWith({
    dynamic? id,
    String? coinName,
    String? coinAddress,
    dynamic? coinRate,
    String? coinImage,
    String? status,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Coin(
      id: id ?? this.id,
      coinName: coinName ?? this.coinName,
      coinAddress: coinAddress ?? this.coinAddress,
      coinRate: coinRate ?? this.coinRate,
      coinImage: coinImage ?? this.coinImage,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  factory Coin.fromJson(Map<String, dynamic> json){
    return Coin(
      id: json["id"],
      coinName: json["coinName"],
      coinAddress: json["coinAddress"],
      coinRate: json["coinRate"],
      coinImage: json["coinImage"],
      status: json["status"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "coinName": coinName,
    "coinAddress": coinAddress,
    "coinRate": coinRate,
    "coinImage": coinImage,
    "status": status,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
  };

  @override
  String toString(){
    return "$id, $coinName, $coinAddress, $coinRate, $coinImage, $status, $createdAt, $updatedAt, ";
  }
}

class Pagination {
  Pagination({
    required this.totalItems,
    required this.currentPage,
    required this.totalPages,
    required this.perPage,
    required this.nextPage,
    required this.prevPage,
  });

  final dynamic? totalItems;
  final dynamic? currentPage;
  final dynamic? totalPages;
  final dynamic? perPage;
  final dynamic nextPage;
  final dynamic prevPage;

  Pagination copyWith({
    dynamic? totalItems,
    dynamic? currentPage,
    dynamic? totalPages,
    dynamic? perPage,
    dynamic? nextPage,
    dynamic? prevPage,
  }) {
    return Pagination(
      totalItems: totalItems ?? this.totalItems,
      currentPage: currentPage ?? this.currentPage,
      totalPages: totalPages ?? this.totalPages,
      perPage: perPage ?? this.perPage,
      nextPage: nextPage ?? this.nextPage,
      prevPage: prevPage ?? this.prevPage,
    );
  }

  factory Pagination.fromJson(Map<String, dynamic> json){
    return Pagination(
      totalItems: json["totalItems"],
      currentPage: json["currentPage"],
      totalPages: json["totalPages"],
      perPage: json["perPage"],
      nextPage: json["nextPage"],
      prevPage: json["prevPage"],
    );
  }

  Map<String, dynamic> toJson() => {
    "totalItems": totalItems,
    "currentPage": currentPage,
    "totalPages": totalPages,
    "perPage": perPage,
    "nextPage": nextPage,
    "prevPage": prevPage,
  };

  @override
  String toString(){
    return "$totalItems, $currentPage, $totalPages, $perPage, $nextPage, $prevPage, ";
  }
}
