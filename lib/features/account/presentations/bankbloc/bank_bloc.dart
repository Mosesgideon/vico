import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:vico/features/account/data/models/account_response.dart';
import 'package:vico/features/account/data/models/company_accont.dart';
import 'package:vico/features/account/data/repo_impl/profile_repo_impl.dart';
import 'package:vico/features/account/presentations/profile/profile_bloc.dart';

import '../../domain/repo/profile_repo.dart';

part 'bank_event.dart';
part 'bank_state.dart';

class BankBloc extends Bloc<BankEvent, BankState> {
  ProfileRepository repository;
  BankBloc(this.repository) : super(BankInitial()) {
    on<BankEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<GetBankAccontEvent>(_mapGetBankAccontEventToState);
    on<GetCompanyAccontEvent>(_mapGetCompanyAccontEventToState);
  }

  Future<void> _mapGetBankAccontEventToState(
    GetBankAccontEvent event,
    Emitter<BankState> emit,
  ) async {
    emit(BankAccountLoaingState());
    try {
      var response = await repository.getBanks();
      emit(BankAccountSuccessState(response));
    } catch (e) {
      emit(BankAccountfailiureState(e.toString()));
      rethrow;
      // TODO
    }
  }

  FutureOr<void> _mapGetCompanyAccontEventToState(GetCompanyAccontEvent event, Emitter<BankState> emit) async {
    emit(BankAccountLoaingState());
    try {
      var response = await repository.companyAccount();
      emit(CompanyAccountSuccessState(response));
    } catch (e) {
      emit(BankAccountfailiureState(e.toString()));
      rethrow;
      // TODO
    }
  }
}
