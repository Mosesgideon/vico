part of 'dashboard_bloc.dart';

sealed class DashboardState extends Equatable {
  const DashboardState();
}

final class DashboardInitial extends DashboardState {
  @override
  List<Object> get props => [];
}

class DashboardloadingState extends DashboardState{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
class DashboardfaliureState extends DashboardState{
  String error;
  DashboardfaliureState(this.error);
  @override
  // TODO: implement props
  List<Object?> get props => [error];

}
class DashboardSuccessState extends DashboardState{
  DasboardSuccessResponse response;
  DashboardSuccessState(this.response);
  @override
  // TODO: implement props
  List<Object?> get props => [response];

}
