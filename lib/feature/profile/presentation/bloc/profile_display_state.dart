abstract class ProfileDisplayState {}

class ProfileLoading extends ProfileDisplayState {}

class ProfileLoaded extends ProfileDisplayState {}

class ProfileLoadFailure extends ProfileDisplayState {
  final String errorMessage;
  ProfileLoadFailure({required this.errorMessage});
}
