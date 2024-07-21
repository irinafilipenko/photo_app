import 'package:photo_app/models/photo_model.dart';

List<Map<String, dynamic>> groupPhotosByAlphabet(List<PhotoModel> photos) {
  photos.sort(
      (a, b) => a.photographer.compareTo(b.photographer)); // Sorting by name
  final Map<String, List<PhotoModel>> groupedMap = {};

  for (var photo in photos) {
    final letter = photo.photographer.isNotEmpty
        ? photo.photographer[0].toUpperCase()
        : '#';
    if (!groupedMap.containsKey(letter)) {
      groupedMap[letter] = [];
    }
    groupedMap[letter]!.add(photo);
  }

  final groupedBeers = groupedMap.entries
      .map((entry) => {'letter': entry.key, 'photos': entry.value})
      .toList();

  groupedBeers
      .sort((a, b) => (a['letter'] as String).compareTo(b['letter'] as String));

  return groupedBeers;
}
