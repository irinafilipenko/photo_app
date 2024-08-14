import 'package:bloc_action_listener/bloc_actions_mixin.dart';

import 'package:photo_app/data/models/photo_model.dart';
import 'package:photo_app/data/repositories/photo_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'photo_event.dart';
part 'photo_state.dart';

// class PhotoBloc extends Bloc<PhotoEvent, PhotoState> {
//   final PhotoRepository photoRepository;
//
//   PhotoBloc({required this.photoRepository}) : super(PhotoInitial()) {
//     on<FetchPhoto>(_onFetchPhoto);
//   }
//
//   void _onFetchPhoto(FetchPhoto event, Emitter<PhotoState> emit) async {
//     print("show");
//     emit(PhotoLoading());
//     try {
//       final photos = await photoRepository.fetchPhoto();
//       emit(PhotoLoaded(photos: photos));
//     } catch (error) {
//       emit(const PhotoError("Failed to fetch photo."));
//     }
//   }
// }
class PhotoBloc extends Bloc<PhotoEvent, PhotoState>
    with BlocActionsMixin<PhotoState, PhotoAction> {
  final PhotoRepository photoRepository;

  PhotoBloc({required this.photoRepository}) : super(PhotoInitial()) {
    on<FetchPhoto>(_onFetchPhoto);
    on<ShowDialogEvent>(_onShowDialog);
  }

  void _onFetchPhoto(FetchPhoto event, Emitter<PhotoState> emit) async {
    emit(PhotoLoading());
    try {
      final photos = await photoRepository.fetchPhoto();
      emit(PhotoLoaded(photos: photos));
    } catch (error) {
      emit(const PhotoError("Failed to fetch photo."));
    }
  }

  void _onShowDialog(ShowDialogEvent event, Emitter<PhotoState> emit) {
    addAction(
      ShowDialogAction(
        title: 'Test Dialog',
        content: 'This is a test dialog triggered by a button',
      ),
    );
  }

  void onDialogButtonPressed(String buttonLabel) {
    addAction(
      ShowSnackbarAction(message: '$buttonLabel button pressed'),
    );
  }
}
