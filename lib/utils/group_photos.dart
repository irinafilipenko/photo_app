import 'package:photo_app/models/photo_model.dart';

List<Map<String, dynamic>> groupPhotosByFirstLetter(List<PhotoModel> photos) {
  photos.sort(
      (a, b) => a.photographer.compareTo(b.photographer)); // Sorting by name
  final Map<String, List<PhotoModel>> groupedMap = {};

  for (var beer in photos) {
    final letter =
        beer.photographer.isNotEmpty ? beer.photographer[0].toUpperCase() : '#';
    if (!groupedMap.containsKey(letter)) {
      groupedMap[letter] = [];
    }
    groupedMap[letter]!.add(beer);
  }

  final groupedBeers = groupedMap.entries
      .map((entry) => {'letter': entry.key, 'beers': entry.value})
      .toList();

  groupedBeers
      .sort((a, b) => (a['letter'] as String).compareTo(b['letter'] as String));

  return groupedBeers;
}
