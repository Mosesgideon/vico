part of 'dashboard_bloc.dart';

sealed class DashboardEvent extends Equatable {
  const DashboardEvent();
}

class GetDashboardEvent extends DashboardEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
