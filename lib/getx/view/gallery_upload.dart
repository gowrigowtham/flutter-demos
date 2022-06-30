import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../controller/photo_upload_controller.dart';

class GalleryUpload extends StatelessWidget {
  File? pickedFile;
  final ImagePicker imagePicker = ImagePicker();
  PhotoUploadController photoUploadController =
      Get.put(PhotoUploadController());
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        appBar: _myAppBar(context),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: profileView(
                  context) // This trailing comma makes auto-formatting nicer for build methods.
              ),
        ),
      ),
      onWillPop: () async {
        // return false;
        final shouldPop = await showDialog<bool>(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Do you want to go back?'),
              actionsAlignment: MainAxisAlignment.spaceBetween,
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                  child: const Text('Yes'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                  child: const Text('No'),
                ),
              ],
            );
          },
        );
        return shouldPop!;
      },
    );
  }

  Widget profileView(context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        // Padding(
        //   padding: EdgeInsets.fromLTRB(30, 50, 30, 30),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: <Widget>[
        //       Container(
        //         height: 32,
        //         width: 32,
        //         child: Icon(
        //           Icons.arrow_back_ios,
        //           size: 16,
        //           color: Colors.black54,
        //         ),
        //         decoration: BoxDecoration(
        //             border: Border.all(color: Colors.black54),
        //             borderRadius: BorderRadius.all(Radius.circular(10))),
        //       ),
        //       Text(
        //         'Profiles details',
        //         style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        //       ),
        //       Container(height: 24, width: 24)
        //     ],
        //   ),
        // ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 50),
          child: Stack(
            children: <Widget>[
              // Obx(() => CircleAvatar(
              //    radius: 70,
              //    child: ClipOval(
              //      child: photoUploadController.isphotoPathset.value == true
              //          ? FileImage(File(photoUploadController.photoPicPath.value)) as ImageProvider
              //          : Image.asset(
              //        'assets/play.png',
              //        height: 150,
              //        width: 150,
              //        fit: BoxFit.cover,
              //      ),
              //    ),
              //  ),),
              Obx(() => CircleAvatar(
                    radius: 70,
                    backgroundImage: photoUploadController
                                .isphotoPathset.value ==
                            true
                        ? FileImage(
                                File(photoUploadController.photoPicPath.value))
                            as ImageProvider
                        : AssetImage('assets/yoga.png'),
                  )),
              Positioned(
                  bottom: 1,
                  right: 1,
                  child: Container(
                    height: 40,
                    width: 40,
                    child: InkWell(
                      child: Icon(
                        Icons.add_a_photo,
                        color: Colors.white,
                      ),
                      onTap: () {
                        print("image clicked");
                        showModalBottomSheet(
                          context: context,
                          builder: ((context) => bottomSheet(context)),
                        );
                      },
                    ),
                    decoration: BoxDecoration(
                        color: Colors.deepOrange,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                  ))
            ],
          ),
        ),
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [Colors.black54, Color.fromRGBO(0, 41, 102, 1)])),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 25, 20, 4),
                  child: Container(
                    height: 60,
                    child: const Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Name',
                          style: TextStyle(color: Colors.white70),
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        border: Border.all(width: 1.0, color: Colors.white70)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 5, 20, 4),
                  child: Container(
                    height: 60,
                    child: const Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Email',
                          style: TextStyle(color: Colors.white70),
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        border: Border.all(width: 1.0, color: Colors.white70)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 4),
                  child: Container(
                    height: 60,
                    child: const Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Type something about yourself',
                          style: TextStyle(color: Colors.white70),
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        border: Border.all(width: 1.0, color: Colors.white70)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 5, 20, 4),
                  child: Container(
                    height: 60,
                    child: const Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Phone number',
                          style: TextStyle(color: Colors.white70),
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        border: Border.all(width: 1.0, color: Colors.white70)),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      height: 60,
                      width: 200,
                      child: const Align(
                        child: Text(
                          'Save',
                          style: TextStyle(color: Colors.white70, fontSize: 20),
                        ),
                      ),
                      decoration: const BoxDecoration(
                          color: Colors.deepOrange,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                          )),
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  _myAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(60),
      child: AppBar(
        title: const Center(
          child: Text(
            'Profile',
            style: TextStyle(color: Colors.black),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        // leading: IconButton(
        //     onPressed: () {
        //       Navigator.of(context).pop();
        //       // Navigator.of(context).maybePop();
        //       // Navigator.of(context, rootNavigator: true).pop(context);
        //     },
        //     icon: const Icon(
        //       Icons.arrow_back,
        //       color: Colors.black,
        //       size: 24,
        //     )),
        // actions: [
        //   Padding(
        //     padding: const EdgeInsets.only(top: 10, right: 10),
        //     child: IconButton(
        //       onPressed: () {},
        //       icon: Icon(
        //         Icons.search,
        //         color: myColors[PRIMARY],
        //         size: 32,
        //       ),
        //     ),
        //   )
        // ],
      ),
    );
  }

  Widget bottomSheet(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Column(
        children: [
          const Text(
            "Choose Profile Photo",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.image,
                      color: Colors.deepOrange,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Gallery",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange),
                    )
                  ],
                ),
                onTap: () {
                  print("Gallery");
                  takePhoto(ImageSource.gallery);
                },
              ),
              const SizedBox(
                width: 60,
              ),
              InkWell(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.camera,
                      color: Colors.deepOrange,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Camera",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange),
                    )
                  ],
                ),
                onTap: () {
                  print("Camera");
                  takePhoto(ImageSource.camera);
                },
              ),
            ],
          )
        ],
      ),
    );
  }

  Future<void> takePhoto(ImageSource source) async {
    final pickedImage =
        await imagePicker.pickImage(source: source, imageQuality: 100);
    pickedFile = File(pickedImage!.path);
    print(pickedFile);
    photoUploadController.setPhotoPicPath(pickedFile!.path);
    Get.back();
  }
}
