class AllTransactionsResponse {
  AllTransactionsResponse({
    required this.status,
    required this.pagination,
    required this.result,
    required this.data,
  });

  final String? status;
  final Pagination? pagination;
  final num? result;
  final Data? data;

  AllTransactionsResponse copyWith({
    String? status,
    Pagination? pagination,
    num? result,
    Data? data,
  }) {
    return AllTransactionsResponse(
      status: status ?? this.status,
      pagination: pagination ?? this.pagination,
      result: result ?? this.result,
      data: data ?? this.data,
    );
  }

  factory AllTransactionsResponse.fromJson(Map<String, dynamic> json){
    return AllTransactionsResponse(
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
    required this.transactions,
  });

  final List<Transaction> transactions;

  Data copyWith({
    List<Transaction>? transactions,
  }) {
    return Data(
      transactions: transactions ?? this.transactions,
    );
  }

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      transactions: json["transactions"] == null ? [] : List<Transaction>.from(json["transactions"]!.map((x) => Transaction.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "transactions": transactions.map((x) => x?.toJson()).toList(),
  };

  @override
  String toString(){
    return "$transactions, ";
  }
}

class Transaction {
  Transaction({
    required this.flowType,
    required this.receivingAccount,
    required this.id,
    required this.userId,
    required this.assetType,
    required this.transactionType,
    required this.assetName,
    required this.usdAmount,
    required this.amount,
    required this.assetRate,
    required this.description,
    required this.paymentProof,
    required this.status,
    required this.ref,
    required this.createdAt,
    required this.updatedAt,
    required this.giftcardDetails,
    required this.coinDetails,
  });

  final String? flowType;
  final ReceivingAccount? receivingAccount;
  final int? id;
  final num? userId;
  final String? assetType;
  final String? transactionType;
  final String? assetName;
  final num? usdAmount;
  final num? amount;
  final num? assetRate;
  final String? description;
  final String? paymentProof;
  final String? status;
  final String? ref;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final GiftcardDetails? giftcardDetails;
  final CoinDetails? coinDetails;

  Transaction copyWith({
    String? flowType,
    ReceivingAccount? receivingAccount,
    int? id,
    num? userId,
    String? assetType,
    String? transactionType,
    String? assetName,
    num? usdAmount,
    num? amount,
    num? assetRate,
    String? description,
    String? paymentProof,
    String? status,
    String? ref,
    DateTime? createdAt,
    DateTime? updatedAt,
    GiftcardDetails? giftcardDetails,
    CoinDetails? coinDetails,
  }) {
    return Transaction(
      flowType: flowType ?? this.flowType,
      receivingAccount: receivingAccount ?? this.receivingAccount,
      id: id ?? this.id,
      userId: userId ?? this.userId,
      assetType: assetType ?? this.assetType,
      transactionType: transactionType ?? this.transactionType,
      assetName: assetName ?? this.assetName,
      usdAmount: usdAmount ?? this.usdAmount,
      amount: amount ?? this.amount,
      assetRate: assetRate ?? this.assetRate,
      description: description ?? this.description,
      paymentProof: paymentProof ?? this.paymentProof,
      status: status ?? this.status,
      ref: ref ?? this.ref,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      giftcardDetails: giftcardDetails ?? this.giftcardDetails,
      coinDetails: coinDetails ?? this.coinDetails,
    );
  }

  factory Transaction.fromJson(Map<String, dynamic> json){
    return Transaction(
      flowType: json["flowType"],
      receivingAccount: json["receivingAccount"] == null ? null : ReceivingAccount.fromJson(json["receivingAccount"]),
      id: json["id"],
      userId: json["userId"],
      assetType: json["assetType"],
      transactionType: json["transactionType"],
      assetName: json["assetName"],
      usdAmount: json["usdAmount"],
      amount: json["amount"],
      assetRate: json["assetRate"],
      description: json["description"],
      paymentProof: json["paymentProof"],
      status: json["status"],
      ref: json["ref"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      giftcardDetails: json["giftcardDetails"] == null ? null : GiftcardDetails.fromJson(json["giftcardDetails"]),
      coinDetails: json["coinDetails"] == null ? null : CoinDetails.fromJson(json["coinDetails"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "flowType": flowType,
    "receivingAccount": receivingAccount?.toJson(),
    "id": id,
    "userId": userId,
    "assetType": assetType,
    "transactionType": transactionType,
    "assetName": assetName,
    "usdAmount": usdAmount,
    "amount": amount,
    "assetRate": assetRate,
    "description": description,
    "paymentProof": paymentProof,
    "status": status,
    "ref": ref,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "giftcardDetails": giftcardDetails?.toJson(),
    "coinDetails": coinDetails?.toJson(),
  };

  @override
  String toString(){
    return "$flowType, $receivingAccount, $id, $userId, $assetType, $transactionType, $assetName, $usdAmount, $amount, $assetRate, $description, $paymentProof, $status, $ref, $createdAt, $updatedAt, $giftcardDetails, $coinDetails, ";
  }
}

class CoinDetails {
  CoinDetails({
    required this.receivingWalletAddress,
    required this.id,
    required this.transactionId,
    required this.transactionType,
    required this.coinAmount,
    required this.createdAt,
    required this.updatedAt,
  });

  final ReceivingWalletAddress? receivingWalletAddress;
  final int? id;
  final num? transactionId;
  final String? transactionType;
  final num? coinAmount;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  CoinDetails copyWith({
    ReceivingWalletAddress? receivingWalletAddress,
    int? id,
    num? transactionId,
    String? transactionType,
    num? coinAmount,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return CoinDetails(
      receivingWalletAddress: receivingWalletAddress ?? this.receivingWalletAddress,
      id: id ?? this.id,
      transactionId: transactionId ?? this.transactionId,
      transactionType: transactionType ?? this.transactionType,
      coinAmount: coinAmount ?? this.coinAmount,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  factory CoinDetails.fromJson(Map<String, dynamic> json){
    return CoinDetails(
      receivingWalletAddress: json["receivingWalletAddress"] == null ? null : ReceivingWalletAddress.fromJson(json["receivingWalletAddress"]),
      id: json["id"],
      transactionId: json["transactionId"],
      transactionType: json["transactionType"],
      coinAmount: json["coinAmount"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
    );
  }

  Map<String, dynamic> toJson() => {
    "receivingWalletAddress": receivingWalletAddress?.toJson(),
    "id": id,
    "transactionId": transactionId,
    "transactionType": transactionType,
    "coinAmount": coinAmount,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
  };

  @override
  String toString(){
    return "$receivingWalletAddress, $id, $transactionId, $transactionType, $coinAmount, $createdAt, $updatedAt, ";
  }
}

class ReceivingWalletAddress {
  ReceivingWalletAddress({
    required this.network,
    required this.address,
  });

  final String? network;
  final String? address;

  ReceivingWalletAddress copyWith({
    String? network,
    String? address,
  }) {
    return ReceivingWalletAddress(
      network: network ?? this.network,
      address: address ?? this.address,
    );
  }

  factory ReceivingWalletAddress.fromJson(Map<String, dynamic> json){
    return ReceivingWalletAddress(
      network: json["network"],
      address: json["address"],
    );
  }

  Map<String, dynamic> toJson() => {
    "network": network,
    "address": address,
  };

  @override
  String toString(){
    return "$network, $address, ";
  }
}

class GiftcardDetails {
  GiftcardDetails({
    required this.id,
    required this.transactionId,
    required this.transactionType,
    required this.cardNum,
    required this.cardImage,
    required this.createdAt,
    required this.updatedAt,
  });

  final int? id;
  final num? transactionId;
  final String? transactionType;
  final String? cardNum;
  final String? cardImage;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  GiftcardDetails copyWith({
    int? id,
    num? transactionId,
    String? transactionType,
    String? cardNum,
    String? cardImage,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return GiftcardDetails(
      id: id ?? this.id,
      transactionId: transactionId ?? this.transactionId,
      transactionType: transactionType ?? this.transactionType,
      cardNum: cardNum ?? this.cardNum,
      cardImage: cardImage ?? this.cardImage,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  factory GiftcardDetails.fromJson(Map<String, dynamic> json){
    return GiftcardDetails(
      id: json["id"],
      transactionId: json["transactionId"],
      transactionType: json["transactionType"],
      cardNum: json["cardNum"],
      cardImage: json["cardImage"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "transactionId": transactionId,
    "transactionType": transactionType,
    "cardNum": cardNum,
    "cardImage": cardImage,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
  };

  @override
  String toString(){
    return "$id, $transactionId, $transactionType, $cardNum, $cardImage, $createdAt, $updatedAt, ";
  }
}

class ReceivingAccount {
  ReceivingAccount({
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

  ReceivingAccount copyWith({
    int? id,
    num? userId,
    String? context,
    String? bank,
    String? number,
    String? name,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return ReceivingAccount(
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

  factory ReceivingAccount.fromJson(Map<String, dynamic> json){
    return ReceivingAccount(
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

class Pagination {
  Pagination({
    required this.totalItems,
    required this.currentPage,
    required this.totalPages,
    required this.perPage,
    required this.nextPage,
    required this.prevPage,
  });

  final num? totalItems;
  final num? currentPage;
  final num? totalPages;
  final num? perPage;
  final dynamic nextPage;
  final dynamic prevPage;

  Pagination copyWith({
    num? totalItems,
    num? currentPage,
    num? totalPages,
    num? perPage,
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
