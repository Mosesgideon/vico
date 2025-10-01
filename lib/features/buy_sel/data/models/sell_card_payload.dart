class SellCardPayload {
  SellCardPayload({
    required this.assetType,
    required this.assetId,
    required this.transactionType,
    required this.usdAmount,
    required this.cardNum,
    required this.receivingAccount,
    required this.cardImage,
  });

  final String? assetType;
  final String? assetId;
  final String? transactionType;
  final String? usdAmount;
  final String? cardNum;
  final ReceivingAccount? receivingAccount;
  final String? cardImage;

  SellCardPayload copyWith({
    String? assetType,
    String? assetId,
    String? transactionType,
    String? usdAmount,
    String? cardNum,
    ReceivingAccount? receivingAccount,
    String? cardImage,
  }) {
    return SellCardPayload(
      assetType: assetType ?? this.assetType,
      assetId: assetId ?? this.assetId,
      transactionType: transactionType ?? this.transactionType,
      usdAmount: usdAmount ?? this.usdAmount,
      cardNum: cardNum ?? this.cardNum,
      receivingAccount: receivingAccount ?? this.receivingAccount,
      cardImage: cardImage ?? this.cardImage,
    );
  }

  factory SellCardPayload.fromJson(Map<String, dynamic> json){
    return SellCardPayload(
      assetType: json["assetType"],
      assetId: json["assetId"],
      transactionType: json["transactionType"],
      usdAmount: json["usdAmount"],
      cardNum: json["cardNum"],
      receivingAccount: json["receivingAccount"] == null ? null : ReceivingAccount.fromJson(json["receivingAccount"]),
      cardImage: json["cardImage"],
    );
  }

  Map<String, dynamic> toJson() => {
    "assetType": assetType,
    "assetId": assetId,
    "transactionType": transactionType,
    "usdAmount": usdAmount,
    "cardNum": cardNum,
    "receivingAccount": receivingAccount?.toJson(),
    "cardImage": cardImage,
  };

  @override
  String toString(){
    return "$assetType, $assetId, $transactionType, $usdAmount, $cardNum, $receivingAccount, $cardImage, ";
  }
}

class ReceivingAccount {
  ReceivingAccount({
    required this.bank,
    required this.number,
    required this.name,
  });

  final String? bank;
  final String? number;
  final String? name;

  ReceivingAccount copyWith({
    String? bank,
    String? number,
    String? name,
  }) {
    return ReceivingAccount(
      bank: bank ?? this.bank,
      number: number ?? this.number,
      name: name ?? this.name,
    );
  }

  factory ReceivingAccount.fromJson(Map<String, dynamic> json){
    return ReceivingAccount(
      bank: json["bank"],
      number: json["number"],
      name: json["name"],
    );
  }

  Map<String, dynamic> toJson() => {
    "bank": bank,
    "number": number,
    "name": name,
  };

  @override
  String toString(){
    return "$bank, $number, $name, ";
  }
}
