part of 'photo_bloc.dart';

// abstract class PhotoEvent extends Equatable {
//   const PhotoEvent();
//
//   @override
//   List<Object> get props => [];
// }
//
// class FetchPhoto extends PhotoEvent {}
abstract class PhotoEvent extends Equatable {
  const PhotoEvent();

  @override
  List<Object> get props => [];
}

class FetchPhoto extends PhotoEvent {}

class ShowDialogEvent extends PhotoEvent {}

abstract base class PhotoAction {}

final class ShowDialogAction extends PhotoAction {
  final String title;
  final String content;

  ShowDialogAction({
    required this.title,
    required this.content,
  });
}

final class ShowSnackbarAction extends PhotoAction {
  final String message;

  ShowSnackbarAction({
    required this.message,
  });
}
