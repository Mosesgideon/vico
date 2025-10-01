class GiftCardSuccessResponse {
  GiftCardSuccessResponse({
    required this.status,
    required this.pagination,
    required this.result,
    required this.data,
  });

  final String? status;
  final Pagination? pagination;
  final num? result;
  final Data? data;

  GiftCardSuccessResponse copyWith({
    String? status,
    Pagination? pagination,
    num? result,
    Data? data,
  }) {
    return GiftCardSuccessResponse(
      status: status ?? this.status,
      pagination: pagination ?? this.pagination,
      result: result ?? this.result,
      data: data ?? this.data,
    );
  }

  factory GiftCardSuccessResponse.fromJson(Map<String, dynamic> json){
    return GiftCardSuccessResponse(
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
    required this.cards,
  });

  final List<Card> cards;

  Data copyWith({
    List<Card>? cards,
  }) {
    return Data(
      cards: cards ?? this.cards,
    );
  }

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      cards: json["cards"] == null ? [] : List<Card>.from(json["cards"]!.map((x) => Card.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "cards": cards.map((x) => x?.toJson()).toList(),
  };

  @override
  String toString(){
    return "$cards, ";
  }
}

class Card {
  Card({
    required this.id,
    required this.cardName,
    required this.cardLogo,
    required this.cardType,
    required this.cardRate,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  final dynamic? id;
  final String? cardName;
  final String? cardLogo;
  final String? cardType;
  final dynamic? cardRate;
  final String? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Card copyWith({
    dynamic? id,
    String? cardName,
    String? cardLogo,
    String? cardType,
    dynamic? cardRate,
    String? status,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Card(
      id: id ?? this.id,
      cardName: cardName ?? this.cardName,
      cardLogo: cardLogo ?? this.cardLogo,
      cardType: cardType ?? this.cardType,
      cardRate: cardRate ?? this.cardRate,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  factory Card.fromJson(Map<String, dynamic> json){
    return Card(
      id: json["id"],
      cardName: json["cardName"],
      cardLogo: json["cardLogo"],
      cardType: json["cardType"],
      cardRate: json["cardRate"],
      status: json["status"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "cardName": cardName,
    "cardLogo": cardLogo,
    "cardType": cardType,
    "cardRate": cardRate,
    "status": status,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
  };

  @override
  String toString(){
    return "$id, $cardName, $cardLogo, $cardType, $cardRate, $status, $createdAt, $updatedAt, ";
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
