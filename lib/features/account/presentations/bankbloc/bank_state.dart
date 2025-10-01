part of 'bank_bloc.dart';

sealed class BankState extends Equatable {
  const BankState();
}

final class BankInitial extends BankState {
  @override
  List<Object> get props => [];
}
class BankAccountLoaingState extends BankState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class BankAccountSuccessState extends BankState {
  GetUserAccontResponse response;
  BankAccountSuccessState(this.response);
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class BankAccountfailiureState extends BankState {
  String error;
  BankAccountfailiureState(this.error);
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
