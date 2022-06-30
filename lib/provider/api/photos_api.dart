import 'package:dio/dio.dart';

class PhotosApi {
  Response? response;
  Dio dio = Dio();
  getPhotos(int page, String search) async {
    response = await dio.get(
        "https://api.unsplash.com/search/photos?query=$search&client_id=cKakzKM1cx44BUYBnEIrrgN_gnGqt81UcE7GstJEils&per_page=30&orientation=portrait&page=$page");
    print(response!.data);
    return response!.data;
  }
}
