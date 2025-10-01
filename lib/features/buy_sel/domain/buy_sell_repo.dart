import 'package:vico/features/buy_sel/data/models/by_crypto_payload.dart';
import 'package:vico/features/buy_sel/data/models/crypto_response.dart';
import 'package:vico/features/buy_sel/data/models/get_all_cards.dart';

import '../data/models/sell_card_payload.dart';
import '../data/models/sell_coin_payload.dart';

abstract class BuyAndSellRepository{

  Future<GiftCardSuccessResponse>allCard();
  Future<void>sellCard(SellCardPayload payload);
  Future<GetAllCryptoResponse>getCrypto();
  Future<void>buyCrypto(BuyCryptoPayload payload);
  Future<void>sellCrypto(SellCryptoPayload payload);

}