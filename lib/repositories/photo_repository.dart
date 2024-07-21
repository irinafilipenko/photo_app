import 'package:photo_app/components/constants.dart';
import 'package:photo_app/models/photo_model.dart';

import 'package:photo_app/service/photo_service.dart';

class PhotoRepository {
  final PhotoService _photoService = PhotoService();

  Future<List<PhotoModel>> fetchPhoto() async {
    final response = await _photoService.getPhotos(kUrlPhoto, kApiKeyPhoto);
    return (response.data['photos'] as List)
        .map((json) => PhotoModel.fromJson(json))
        .toList();
  }
}
