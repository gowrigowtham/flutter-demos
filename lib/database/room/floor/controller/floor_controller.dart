import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:googlemapdemo/database/room/floor/model/floor_model.dart';

class FloorDBController extends GetxController {
  List<FloorModel> list = [];
  ScrollController scrollController = ScrollController();
  int listLength = 6;

  @override
  void onInit() {
    generateList();
    addItems();
    super.onInit();
  }

  addItems() async {
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.position.pixels) {
        for (int i = 0; i < 2; i++) {
          listLength++;
          list.add(FloorModel(title: (listLength).toString()));
          update();
        }
      }
    });
  }

  generateList() {
    list = List.generate(
      listLength,
      (index) => FloorModel(title: (index + 1).toString()),
    );
  }
}
