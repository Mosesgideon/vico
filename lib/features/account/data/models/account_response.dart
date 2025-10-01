class GetUserAccontResponse {
  GetUserAccontResponse({
    required this.status,
    required this.results,
    required this.data,
  });

  final String? status;
  final num? results;
  final Data? data;

  GetUserAccontResponse copyWith({
    String? status,
    num? results,
    Data? data,
  }) {
    return GetUserAccontResponse(
      status: status ?? this.status,
      results: results ?? this.results,
      data: data ?? this.data,
    );
  }

  factory GetUserAccontResponse.fromJson(Map<String, dynamic> json){
    return GetUserAccontResponse(
      status: json["status"],
      results: json["results"],
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "status": status,
    "results": results,
    "data": data?.toJson(),
  };

  @override
  String toString(){
    return "$status, $results, $data, ";
  }
}

class Data {
  Data({
    required this.accounts,
  });

  final List<Account> accounts;

  Data copyWith({
    List<Account>? accounts,
  }) {
    return Data(
      accounts: accounts ?? this.accounts,
    );
  }

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      accounts: json["accounts"] == null ? [] : List<Account>.from(json["accounts"]!.map((x) => Account.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "accounts": accounts.map((x) => x?.toJson()).toList(),
  };

  @override
  String toString(){
    return "$accounts, ";
  }
}

class Account {
  Account({
    required this.id,
    required this.userId,
    required this.context,
    required this.bank,
    required this.number,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
  });

  final int? id;
  final num? userId;
  final String? context;
  final String? bank;
  final String? number;
  final String? name;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Account copyWith({
    int? id,
    num? userId,
    String? context,
    String? bank,
    String? number,
    String? name,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Account(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      context: context ?? this.context,
      bank: bank ?? this.bank,
      number: number ?? this.number,
      name: name ?? this.name,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  factory Account.fromJson(Map<String, dynamic> json){
    return Account(
      id: json["id"],
      userId: json["userId"],
      context: json["context"],
      bank: json["bank"],
      number: json["number"],
      name: json["name"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "userId": userId,
    "context": context,
    "bank": bank,
    "number": number,
    "name": name,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
  };

  @override
  String toString(){
    return "$id, $userId, $context, $bank, $number, $name, $createdAt, $updatedAt, ";
  }
}
