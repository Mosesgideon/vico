class BuyCryptoPayload {
  BuyCryptoPayload({
    required this.assetType,
    required this.assetId,
    required this.transactionType,
    required this.usdAmount,
    required this.receivingWalletAddress,
    required this.paymentProof,
  });

  final String? assetType;
  final String? assetId;
  final String? transactionType;
  final String? usdAmount;
  final String? receivingWalletAddress;
  final String? paymentProof;

  BuyCryptoPayload copyWith({
    String? assetType,
    String? assetId,
    String? transactionType,
    String? usdAmount,
    String? receivingWalletAddress,
    String? paymentProof,
  }) {
    return BuyCryptoPayload(
      assetType: assetType ?? this.assetType,
      assetId: assetId ?? this.assetId,
      transactionType: transactionType ?? this.transactionType,
      usdAmount: usdAmount ?? this.usdAmount,
      receivingWalletAddress: receivingWalletAddress ?? this.receivingWalletAddress,
      paymentProof: paymentProof ?? this.paymentProof,
    );
  }

  factory BuyCryptoPayload.fromJson(Map<String, dynamic> json){
    return BuyCryptoPayload(
      assetType: json["assetType"],
      assetId: json["assetId"],
      transactionType: json["transactionType"],
      usdAmount: json["usdAmount"],
      receivingWalletAddress: json["receivingWalletAddress"],
      paymentProof: json["paymentProof"],
    );
  }

  Map<String, dynamic> toJson() => {
    "assetType": assetType,
    "assetId": assetId,
    "transactionType": transactionType,
    "usdAmount": usdAmount,
    "receivingWalletAddress": receivingWalletAddress,
    "paymentProof": paymentProof,
  };

  @override
  String toString(){
    return "$assetType, $assetId, $transactionType, $usdAmount, $receivingWalletAddress, $paymentProof, ";
  }
}
