import 'package:photo_app/models/photo_model.dart';
import 'package:dio/dio.dart';

class PhotoRepository {
  final Dio _dio = Dio();

  Future<List<PhotoModel>> fetchBeers() async {
    final response = await _dio.get(
        'https://api.pexels.com/v1/curated?per_page=50',
        options: Options(headers: {
          'Authorization':
              'dwzhuZSMsaIXZQHz9YV6Pziu9G78uLYbAoc2pSvrwF8H7yR6IcDm56FP'
        }));
    return (response.data['photos'] as List)
        .map((json) => PhotoModel.fromJson(json))
        .toList();
  }
}
