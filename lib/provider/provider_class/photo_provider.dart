

import 'package:flutter/material.dart';
import 'package:googlemapdemo/provider/model/photo_model.dart';

import '../api/photos_api.dart';

class PhotoProvider extends ChangeNotifier {
  int _page = 1;
  String _search = 'fire';

  String get search => _search;

  set search(String value) {
    _search = value;
    notifyListeners();
  }

  int get page => _page;

  set page(int value) {
    _page = value;
    notifyListeners();
  }

  List<Results> _photos = <Results>[];

  List<Results> get photos => _photos;

  set photos(List<Results> value) {
    _photos = value;
  }

  Future<void> callPhotoApi() async {
    await PhotosApi().getPhotos(_page, _search).then((response) {
      _page = _page + 1;

      addPhotosToList(PhotoModel.fromJson(response).results!);
    });
    notifyListeners();
  }

  void addPhotosToList(List<Results> photoData) {
    _photos.addAll(photoData);
    notifyListeners();
  }
}
