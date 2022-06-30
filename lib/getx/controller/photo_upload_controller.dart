import 'package:get/get.dart';

class PhotoUploadController extends GetxController {
  var isphotoPathset = false.obs;
  var photoPicPath = "".obs;

  void setPhotoPicPath(String path) {
    photoPicPath.value = path;
    isphotoPathset.value = true;
  }
}
