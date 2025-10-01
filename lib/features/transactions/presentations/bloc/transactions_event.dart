part of 'transactions_bloc.dart';

sealed class TransactionsEvent extends Equatable {
  const TransactionsEvent();
}


class GetTransactionEvent extends TransactionsEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];

}