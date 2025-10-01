class CompanyAccountResponse {
  CompanyAccountResponse({
    required this.status,
    required this.data,
  });

  final String? status;
  final Data? data;

  CompanyAccountResponse copyWith({
    String? status,
    Data? data,
  }) {
    return CompanyAccountResponse(
      status: status ?? this.status,
      data: data ?? this.data,
    );
  }

  factory CompanyAccountResponse.fromJson(Map<String, dynamic> json){
    return CompanyAccountResponse(
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
    required this.account,
  });

  final Account? account;

  Data copyWith({
    Account? account,
  }) {
    return Data(
      account: account ?? this.account,
    );
  }

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      account: json["account"] == null ? null : Account.fromJson(json["account"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "account": account?.toJson(),
  };

  @override
  String toString(){
    return "$account, ";
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
