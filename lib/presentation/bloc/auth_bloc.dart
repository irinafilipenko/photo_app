import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_app/data/models/user_model.dart';
import 'package:photo_app/data/repositories/user_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserRepository userRepository;

  AuthBloc({required this.userRepository}) : super(AuthInitial()) {
    on<LoginRequested>(_onLoginRequested);
  }

  void _onLoginRequested(LoginRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final user = await userRepository.login(event.email, event.password);
      emit(AuthAuthenticated(user: user));
      await userRepository.saveUserToCache(user);
    } catch (error) {
      emit(const AuthError("Login failed. Please try again."));
    }
  }
}
