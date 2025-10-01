class SellCryptoPayload {
  SellCryptoPayload({
    required this.assetType,
    required this.assetId,
    required this.transactionType,
    required this.usdAmount,
    required this.receivingAccount,
    required this.paymentProof,
  });

  final String? assetType;
  final String? assetId;
  final String? transactionType;
  final String? usdAmount;
  final ReceivingAccount? receivingAccount;
  final String? paymentProof;

  SellCryptoPayload copyWith({
    String? assetType,
    String? assetId,
    String? transactionType,
    String? usdAmount,
    ReceivingAccount? receivingAccount,
    String? paymentProof,
  }) {
    return SellCryptoPayload(
      assetType: assetType ?? this.assetType,
      assetId: assetId ?? this.assetId,
      transactionType: transactionType ?? this.transactionType,
      usdAmount: usdAmount ?? this.usdAmount,
      receivingAccount: receivingAccount ?? this.receivingAccount,
      paymentProof: paymentProof ?? this.paymentProof,
    );
  }

  factory SellCryptoPayload.fromJson(Map<String, dynamic> json){
    return SellCryptoPayload(
      assetType: json["assetType"],
      assetId: json["assetId"],
      transactionType: json["transactionType"],
      usdAmount: json["usdAmount"],
      receivingAccount: json["receivingAccount"] == null ? null : ReceivingAccount.fromJson(json["receivingAccount"]),
      paymentProof: json["paymentProof"],
    );
  }

  Map<String, dynamic> toJson() => {
    "assetType": assetType,
    "assetId": assetId,
    "transactionType": transactionType,
    "usdAmount": usdAmount,
    "receivingAccount": receivingAccount?.toJson(),
    "paymentProof": paymentProof,
  };

  @override
  String toString(){
    return "$assetType, $assetId, $transactionType, $usdAmount, $receivingAccount, $paymentProof, ";
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
