part of 'buy_and_sell_bloc.dart';

sealed class BuyAndSellEvent extends Equatable {
  const BuyAndSellEvent();
}

class GetAllCardsEvent extends BuyAndSellEvent {
  @override
  // TODO: implement props
  List<Object?> get props =>[];
}
class GetAllCryptoEvent extends BuyAndSellEvent {
  @override
  // TODO: implement props
  List<Object?> get props =>[];
}

class SellCardsEvent extends BuyAndSellEvent {
  SellCardPayload payload;
  SellCardsEvent(this.payload);
  @override
  // TODO: implement props
  List<Object?> get props =>[];
}
class BuyCryptoEvent extends BuyAndSellEvent {
  BuyCryptoPayload payload;
  BuyCryptoEvent(this.payload);
  @override
  // TODO: implement props
  List<Object?> get props =>[];
}class SellCryptoEvent extends BuyAndSellEvent {
  SellCryptoPayload payload;
  SellCryptoEvent(this.payload);
  @override
  // TODO: implement props
  List<Object?> get props =>[];
}
