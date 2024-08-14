import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:photo_app/data/service/local_data_storage.dart';
import 'package:photo_app/presentation/bloc/splash_state.dart';

part 'splash_event.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final LocalDataStorage localDataStorage;

  SplashBloc({required this.localDataStorage}) : super(SplashInitial()) {
    on<CheckUserStatusEvent>(_onCheckUserStatus);
    // on<CheckUserStatusEvent>(
    //   _onCheckUserStatus,
    //   transformer: debounce(Duration(seconds: 3)),
    // );
  }

  Future<void> _onCheckUserStatus(
      CheckUserStatusEvent event, Emitter<SplashState> emit) async {
    // Переводим BLoC в состояние загрузки
    emit(SplashLoading());

    try {
      final user = await localDataStorage.getUserFromCache();
      if (user != null) {
        // Если пользователь найден, отправляем состояние аутентификации
        emit(SplashAuthenticated(user: user!));
      }
    } catch (error) {
      // В случае ошибки отправляем состояние ошибки
      emit(SplashError("Error"));
    }
  }
}
