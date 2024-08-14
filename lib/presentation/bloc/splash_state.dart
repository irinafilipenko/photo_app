import 'package:equatable/equatable.dart';
import 'package:photo_app/data/models/user_model.dart';

abstract class SplashState extends Equatable {
  const SplashState();

  @override
  List<Object?> get props => [];
}

class SplashInitial extends SplashState {}

class SplashLoading extends SplashState {}

class SplashAuthenticated extends SplashState {
  final UserModel user;

  const SplashAuthenticated({required this.user});

  @override
  List<Object?> get props => [user];
}

class SplashError extends SplashState {
  final String message;

  const SplashError(this.message);

  @override
  List<Object?> get props => [message];
}
