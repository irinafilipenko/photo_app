abstract base class ExampleAction {}

final class ShowSnackbarAction extends ExampleAction {
  final String content;

  ShowSnackbarAction({required this.content});
}
