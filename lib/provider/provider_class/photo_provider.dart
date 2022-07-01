import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:googlemapdemo/provider/model/photo_model.dart';

import '../api/photos_api.dart';
import 'package:http/http.dart' as http;

class PhotoProvider extends ChangeNotifier {
  int _page = 1;
  String _search = '';

  String get search => _search;

  set search(String value) {
    print('search value:' + value);
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

  /* List<Results>? searchQuery(String searchText) {
    List _searchList = _photos
        .where((element) => element.description
            .toLowerCase()
            .contains(searchText.toLowerCase()))
        .toList();

    return _searchList;
  }*/

  Future<void> callPhotoApi() async {
    final debouncer = Debouncer(milliseconds: 1000);
    debouncer.run(() async {
      await PhotosApi().getPhotos(_page, _search).then((response) {
        _page = _page + 1;

        addPhotosToList(PhotoModel.fromJson(response).results!);
      });
      notifyListeners();
    });
  }

  void addPhotosToList(List<Results> photoData) {
    _photos.addAll(photoData);
    notifyListeners();
  }
}

class Debouncer {
  Debouncer({required this.milliseconds});
  final int milliseconds;
  Timer? _timer;
  void run(VoidCallback action) {
    if (_timer?.isActive ?? false) {
      _timer?.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}
