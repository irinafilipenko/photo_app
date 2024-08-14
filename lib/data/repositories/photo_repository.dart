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
    print(kUrlPhoto);
    try {
      final photoResponse = await _photoService.getPhotos(kApiKeyPhoto);

      return photoResponse.photos;
    } catch (e) {
      print(e);
      throw Exception("Failed to fetch photos: $e");
    }
  }
}

// class PhotoRepository {
//   final PhotoService _photoService = PhotoService();
//
//   Future<List<PhotoModel>> fetchPhoto() async {
//     final response = await _photoService.getPhotos(kUrlPhoto, kApiKeyPhoto);
//     return (response.data['photos'] as List)
//         .map((json) => PhotoModel.fromJson(json))
//         .toList();
//   }
// }
