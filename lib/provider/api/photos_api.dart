import 'dart:convert';

import 'package:get/get_connect/http/src/response/response.dart';
import 'package:http/http.dart' as http;

class PhotosApi {
  // Response? response;
  // Dio dio = Dio();
  getPhotos(int page, String search) async {
    print("s" + search);
    print("page" + page.toString());
    var response = await http.get(Uri.parse(
        "https://api.unsplash.com/search/photos?query=$search&client_id=cKakzKM1cx44BUYBnEIrrgN_gnGqt81UcE7GstJEils&per_page=30&orientation=portrait&page=$page"));
    Map<String, dynamic> parsed = jsonDecode(response.body);
    // response = await dio.get(
    //     "https://api.unsplash.com/search/photos?query=$search&client_id=cKakzKM1cx44BUYBnEIrrgN_gnGqt81UcE7GstJEils&per_page=30&orientation=portrait&page=$page");
    print(parsed);
    return parsed;
  }
}
