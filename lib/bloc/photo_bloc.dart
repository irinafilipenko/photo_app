import 'package:photo_app/models/photo_model.dart';
import 'package:photo_app/repositories/photo_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'photo_event.dart';
part 'photo_state.dart';

class PhotoBloc extends Bloc<PhotoEvent, PhotoState> {
  final PhotoRepository beerRepository;

  PhotoBloc({required this.beerRepository}) : super(PhotoInitial()) {
    on<FetchBeers>(_onFetchBeers);
  }

  void _onFetchBeers(FetchBeers event, Emitter<PhotoState> emit) async {
    emit(PhotoLoading());
    try {
      final beers = await beerRepository.fetchBeers();
      emit(PhotoLoaded(beers: beers));
    } catch (error) {
      emit(PhotoError("Failed to fetch beers."));
    }
  }
}
