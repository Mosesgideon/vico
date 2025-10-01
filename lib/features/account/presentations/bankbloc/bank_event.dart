part of 'bank_bloc.dart';

sealed class BankEvent extends Equatable {
  const BankEvent();
}

class GetBankAccontEvent  extends BankEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];

}