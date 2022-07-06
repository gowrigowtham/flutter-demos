import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:googlemapdemo/common/dashboard_page.dart';
import 'package:googlemapdemo/database/room/floor/dao/note_dao.dart';
import 'package:googlemapdemo/database/room/floor/db/note_db.dart';
import 'package:googlemapdemo/database/room/floor/screen/floor_database_screen.dart';
import 'package:googlemapdemo/onboading/splash_screen.dart';
import 'package:googlemapdemo/provider/model/photo_model.dart';
import 'package:googlemapdemo/provider/provider_class/gallery_provider.dart';
import 'package:googlemapdemo/provider/provider_class/photo_provider.dart';
import 'package:googlemapdemo/provider/view/photo_grid_list.dart';
import 'package:googlemapdemo/screen/flutter_widgets.dart';
import 'package:googlemapdemo/screen/google_map_screen.dart';
import 'package:googlemapdemo/screen/gps_location.dart';
import 'package:googlemapdemo/screen/home_page.dart';
import 'package:googlemapdemo/provider/view/gallery_photos.dart';
import 'package:googlemapdemo/screen/widgets.dart';
import 'package:provider/provider.dart';

import 'odoo/odoo_demo.dart';

void main() {
  // SystemChrome.setSystemUIOverlayStyle(
  //     SystemUiOverlayStyle(statusBarColor: Color(0xfffa8f5d)));
  // runApp(const MyApp());
  // runApp(MultiProvider(providers: [
  //   ChangeNotifierProvider<PhotoProvider>.value(value: PhotoProvider())
  // ], child: MyApp()));
  /* runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => PhotoProvider())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: PhotoGridView(),
      )));*/
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => GalleryProvider())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
        // home: OdooDemo(),
      )));
}

/*class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    apiCall() async {
      PhotoModel photoModel =
          await Provider.of<PhotoProvider>(context).getPhotoData();
      Provider.of<PhotoProvider>(context).setPhotoData(photoModel);
    }

    apiCall();

    /* return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: FlutterWidgets(),
      /*home: FutureBuilder<NoteDatabase>(
        future: $FloorNoteDatabase.databaseBuilder('note.db').build(),
        builder: (context, data) {
          if (data.hasData) {
            Get.put(data.data!.noteDao);
            return FloorDatabase();
          } else if (data.hasError) {
            return Text('Error');
          } else {
            return Text('Loading');
          }
        },
      ),*/
    );*/

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SearchWidget(),
    );
  }
}*/
