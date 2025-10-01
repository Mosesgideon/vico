import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:vico/features/transactions/data/models/all_transactions.dart';
import 'package:vico/features/transactions/domain/tansactions_repo/tansactions_repo.dart';

part 'transactions_event.dart';
part 'transactions_state.dart';

class TransactionsBloc extends Bloc<TransactionsEvent, TransactionsState> {
  TransactionRepository repository;
  TransactionsBloc(this.repository) : super(TransactionsInitial()) {
    on<TransactionsEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<GetTransactionEvent>(_mapGetTransactionEventToSate);
  }

  Future<void> _mapGetTransactionEventToSate(GetTransactionEvent event, Emitter<TransactionsState> emit) async {
    emit(TransactionsLoading());
    try {
      var response=await repository.transactions();
      emit(TransactionsSuccess(response));
    }  catch (e) {
      emit(TransactionsFailiure(e.toString()));
      rethrow;
      // TODO
    }
  }
}
