import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:photo_app/presentation/components/constants.dart';
import 'package:photo_app/data/models/photo_model.dart';
import 'package:photo_app/data/service/photo_service.dart';

@lazySingleton
class PhotoRepository {
  final PhotoService _photoService;

  PhotoRepository(Dio dio) : _photoService = PhotoService(dio);

  Future<List<PhotoModel>> fetchPhoto() async {
    try {
      final photoResponse = await _photoService.getPhotos(kApiKeyPhoto);

      return photoResponse.photos;
    } catch (e) {
      throw Exception("Failed to fetch photos: $e");
    }
  }
}
