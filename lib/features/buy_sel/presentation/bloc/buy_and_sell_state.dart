part of 'buy_and_sell_bloc.dart';

sealed class BuyAndSellState extends Equatable {
  const BuyAndSellState();
}

final class BuyAndSellInitial extends BuyAndSellState {
  @override
  List<Object> get props => [];
}
class BuyAnSellloadingState extends BuyAndSellState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class BuyAnSellfailiureState extends BuyAndSellState {
  String error;
  BuyAnSellfailiureState(this.error);

  @override
  // TODO: implement props
  List<Object?> get props => [error];
}

class GetAllCardsSuccessState extends BuyAndSellState {
  GiftCardSuccessResponse response;
  GetAllCardsSuccessState(this.response);
  @override
  // TODO: implement props
  List<Object?> get props => [response];
}
class SellCardsSuccessState extends BuyAndSellState {

  SellCardsSuccessState();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
