import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:vico/features/buy_sel/data/models/by_crypto_payload.dart';
import 'package:vico/features/buy_sel/data/models/crypto_response.dart';
import 'package:vico/features/buy_sel/data/models/get_all_cards.dart';
import 'package:vico/features/buy_sel/data/models/sell_card_payload.dart';
import 'package:vico/features/buy_sel/data/models/sell_coin_payload.dart';
import 'package:vico/features/buy_sel/domain/buy_sell_repo.dart';

part 'buy_and_sell_event.dart';
part 'buy_and_sell_state.dart';

class BuyAndSellBloc extends Bloc<BuyAndSellEvent, BuyAndSellState> {
  BuyAndSellRepository repository;
  BuyAndSellBloc(this.repository) : super(BuyAndSellInitial()) {
    on<BuyAndSellEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<GetAllCardsEvent>(_mapGetAllCardsEventToState);
    on<GetAllCryptoEvent>(_mapGetAllCryptoEventToState);
    on<SellCardsEvent>(_mapSellCardsEventToState);
    on<BuyCryptoEvent>(_mapSBuyCryptoEventToState);
    on<SellCryptoEvent>(_mapSellCryptoEventToState);
  }

  Future<void> _mapGetAllCardsEventToState(GetAllCardsEvent event, Emitter<BuyAndSellState> emit) async {

    emit(BuyAnSellloadingState());
    try {
      var response=await repository.allCard();
      emit(GetAllCardsSuccessState(response));
    }  catch (e) {
      emit(BuyAnSellfailiureState(e.toString()));
      rethrow;
      // TODO
    }
  }

  Future<void> _mapSellCardsEventToState(SellCardsEvent event, Emitter<BuyAndSellState> emit) async {

    emit(BuyAnSellloadingState());
    try {
      var response=await repository.sellCard(event.payload);
      emit(SellCardsSuccessState());
    }  catch (e) {
      emit(BuyAnSellfailiureState(e.toString()));
      rethrow;
      // TODO
    }
  }

  Future<void> _mapGetAllCryptoEventToState(GetAllCryptoEvent event, Emitter<BuyAndSellState> emit) async {
    emit(BuyAnSellloadingCrptoState());
    try {
      var response=await repository.getCrypto();
      emit(GetAllCryptoSuccessState(response));
    }  catch (e) {
      emit(BuyAnSellfailiureState(e.toString()));
      rethrow;
      // TODO
    }
  }

  Future<void> _mapSBuyCryptoEventToState(BuyCryptoEvent event, Emitter<BuyAndSellState> emit) async {
    emit(BuyAnSellloadingCrptoState());
    try {
      var responnse=await repository.buyCrypto(event.payload);
      emit(BuyCryptoSuccessState());
    }  catch (e) {
      emit(BuyAnSellfailiureState(e.toString()));
      // TODO
    }
  }

  Future<void> _mapSellCryptoEventToState(SellCryptoEvent event, Emitter<BuyAndSellState> emit) async {
    emit(BuyAnSellloadingCrptoState());
    try {
      var responnse=await repository.sellCrypto(event.payload);
      emit(SellCryptoSuccessState());
    }  catch (e) {
      emit(BuyAnSellfailiureState(e.toString()));
      // TODO
    }
  }
}
