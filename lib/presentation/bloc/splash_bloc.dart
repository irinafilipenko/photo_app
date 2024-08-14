import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:photo_app/data/models/user_model.dart';
import 'package:photo_app/data/service/local_data_storage.dart';
import 'package:photo_app/presentation/bloc/splash_state.dart';
part 'splash_event.dart';

@lazySingleton
class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final LocalDataStorage localDataStorage;

  SplashBloc({required this.localDataStorage}) : super(SplashInitial()) {
    on<CheckUserStatusEvent>(_onCheckUserStatus);
  }

  Future<void> _onCheckUserStatus(
      CheckUserStatusEvent event, Emitter<SplashState> emit) async {
    emit(SplashLoading());

    try {
      final loginModel = await localDataStorage.getUserFromCache();
      if (loginModel != null) {
        print("User found: ${loginModel.email}");

        final user = UserModel.fromLoginModel(loginModel);

        emit(SplashAuthenticated(user: user));
      } else {
        print("User not found, emitting SplashError");
        emit(SplashError("User not found"));
      }
    } catch (error) {
      print("Error occurred: $error");
      emit(SplashError("Error: $error"));
    }
  }
}
