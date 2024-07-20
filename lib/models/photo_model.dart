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
