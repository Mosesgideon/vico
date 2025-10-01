import 'package:vico/core/services/network/network_service.dart';
import 'package:vico/core/services/network/url_config.dart';
import 'package:vico/features/buy_sel/data/models/crypto_response.dart';
import 'package:vico/features/buy_sel/data/models/get_all_cards.dart';
import 'package:vico/features/buy_sel/data/models/sell_card_payload.dart';

import '../../domain/buy_sell_repo.dart';

class BuyAndSellRepositoryImpl extends BuyAndSellRepository {
  NetworkService networkService;
  BuyAndSellRepositoryImpl(this.networkService);
  @override
  Future<GiftCardSuccessResponse> allCard() async {
    var response = await networkService.call(
      UrlConfig.giftcards,
      RequestMethod.get,
    );
    return GiftCardSuccessResponse.fromJson(response.data);
  }

  @override
  Future<void> sellCard(SellCardPayload payload) async {
    var response = await networkService.call(
      UrlConfig.sellcards,
      RequestMethod.post,
      data: payload.toJson(),
    );
    return response.data;
  }

  @override
  Future<GetAllCryptoResponse> getCrypto() async {
  var resp=await networkService.call(UrlConfig.getcrypto, RequestMethod.get);
    return GetAllCryptoResponse.fromJson(resp.data);
  }
}
