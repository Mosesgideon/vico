part of 'transactions_bloc.dart';

sealed class TransactionsState extends Equatable {
  const TransactionsState();
}

final class TransactionsInitial extends TransactionsState {
  @override
  List<Object> get props => [];
}


 class TransactionsLoading extends TransactionsState {
  @override
  List<Object> get props => [];
}



class TransactionsSuccess extends TransactionsState {
  AllTransactionsResponse response;
  TransactionsSuccess(this.response);
  @override
  List<Object> get props => [];
}



class TransactionsFailiure extends TransactionsState {
  String error;
  TransactionsFailiure(this.error);
  @override
  List<Object> get props => [];
}