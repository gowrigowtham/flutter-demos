import 'dart:convert';

import 'package:flutter/material.dart';

import '../model/photo_model.dart';
import 'package:http/http.dart' as http;

class GalleryProvider extends ChangeNotifier {
  PhotoModel _photoModel = PhotoModel();
  List<Results> list = [];
  bool isLoading = true;
  final TextEditingController _controller = TextEditingController();
  String searchQuery = "";
  final ScrollController _scrollController = ScrollController();
  int page = 1;
  PhotoProvider() {
    _photoModel.results = list;
  }

  setPhotoData(PhotoModel data) {
    _photoModel = data;
    isLoading = false;
    notifyListeners();
  }

  PhotoModel getPhotoData() {
    return _photoModel;
  }

  void paginationTask() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        print("reached end");
        page++;
        getServerData(searchQuery, page);
      } else {
        print("not reached end");
      }
    });
  }

  Future<PhotoModel> getServerData(String query, int page) async {
    print("query:" + query);
    print("page" + page.toString());
    var response = await http.get(Uri.parse(
        "https://api.unsplash.com/search/photos?query=$query&client_id=cKakzKM1cx44BUYBnEIrrgN_gnGqt81UcE7GstJEils&per_page=30&orientation=portrait&page=1"));
    Map<String, dynamic> parsed = jsonDecode(response.body);
    print(parsed);
    PhotoModel photoModel = PhotoModel.fromJson(parsed);
    return photoModel;
  }
}
