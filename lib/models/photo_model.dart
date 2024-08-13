class PhotoResponse {
  final List<PhotoModel> photos;

  PhotoResponse({required this.photos});

  factory PhotoResponse.fromJson(Map<String, dynamic> json) {
    var photosList = json['photos'] as List;
    List<PhotoModel> photos =
        photosList.map((i) => PhotoModel.fromJson(i)).toList();

    return PhotoResponse(photos: photos);
  }
}

class PhotoModel {
  final String name;
  final String imageUrl;
  final String photographer;

  PhotoModel(
      {required this.name, required this.imageUrl, required this.photographer});

  factory PhotoModel.fromJson(Map<String, dynamic> json) {
    return PhotoModel(
      name: json['alt'],
      imageUrl: json['src']['large'],
      photographer: json['photographer'],
    );
  }
}
