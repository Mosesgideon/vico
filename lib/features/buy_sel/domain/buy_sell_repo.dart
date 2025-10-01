import 'package:vico/features/buy_sel/data/models/get_all_cards.dart';

import '../data/models/sell_card_payload.dart';

abstract class BuyAndSellRepository{

  Future<GiftCardSuccessResponse>allCard();
  Future<void>sellCard(SellCardPayload payload);

}