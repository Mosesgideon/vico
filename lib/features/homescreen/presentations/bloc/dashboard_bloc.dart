import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:vico/features/homescreen/data/models/dasbboard_response.dart';
import 'package:vico/features/homescreen/domain/dasboard_repo/dsahboard_repo.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardRepository repository;
  DashboardBloc(this.repository) : super(DashboardInitial()) {
    on<DashboardEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<GetDashboardEvent>(_mapGetDashboardEventToState);
  }

  Future<void> _mapGetDashboardEventToState(
    GetDashboardEvent event,
    Emitter<DashboardState> emit,
  ) async {
    emit(DashboardloadingState());
    try {
      var response = await repository.getUserdashh();
      emit(DashboardSuccessState(response));
    } catch (e) {
      emit(DashboardfaliureState(e.toString()));
      rethrow;
      // TODO
    }
  }
}
