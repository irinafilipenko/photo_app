import 'package:photo_app/models/photo_model.dart';
import 'package:photo_app/repositories/photo_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'photo_event.dart';
part 'photo_state.dart';

class PhotoBloc extends Bloc<PhotoEvent, PhotoState> {
  final PhotoRepository photoRepository;

  PhotoBloc({required this.photoRepository}) : super(PhotoInitial()) {
    on<FetchPhoto>(_onFetchPhoto);
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
}
