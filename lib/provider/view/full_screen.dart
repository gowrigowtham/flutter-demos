import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';

class ImageFullScreen extends StatefulWidget {
  final String imgUrl;
  ImageFullScreen(this.imgUrl);
  @override
  State<ImageFullScreen> createState() => _ImageFullScreenState();
}

class _ImageFullScreenState extends State<ImageFullScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Hero(
            tag: widget.imgUrl,
            child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Image.network(
                  widget.imgUrl,
                  fit: BoxFit.cover,
                )),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      enableDrag: true,
                      isDismissible: true,
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      )),
                      context: context,
                      builder: ((context) =>
                          bottomSheet(context, widget.imgUrl)),
                    );
                  },
                  child: Stack(
                    children: [
                      Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width / 2,
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                        decoration: BoxDecoration(
                          color: Color(0xff1C1B1B).withOpacity(0.8),
                          border:
                              Border.all(color: Color(0xff1C1B1B), width: 0),
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width / 2,
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white54, width: 1),
                            borderRadius: BorderRadius.circular(30),
                            gradient: LinearGradient(colors: [
                              (Color(0x36FFFFFF)),
                              (Color(0x0FFFFFFF))
                            ])),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              'Set Wallpaper',
                              style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                // const Text(
                //   'Cancel',
                //   style: TextStyle(
                //       color: Colors.white,
                //       fontSize: 16,
                //       fontWeight: FontWeight.w700),
                // ),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      "Cancel",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white70),
                    )),
                SizedBox(
                  height: 40,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> setWallpaperHomeScreen(String value) async {
    int loc = WallpaperManager.HOME_SCREEN;
    var file = await DefaultCacheManager().getSingleFile(value);
    String result =
        (await WallpaperManager.setWallpaperFromFile(file.path, loc)) as String;
  }

  Future<void> setWallpaperLockScreen(String value) async {
    int loc = WallpaperManager.LOCK_SCREEN;
    var file = await DefaultCacheManager().getSingleFile(value);
    String result =
        (await WallpaperManager.setWallpaperFromFile(file.path, loc)) as String;
  }

  Future<void> setWallpaperBoth(String value) async {
    int loc = WallpaperManager.BOTH_SCREEN;
    var file = await DefaultCacheManager().getSingleFile(value);
    String result =
        (await WallpaperManager.setWallpaperFromFile(file.path, loc)) as String;
  }

  Widget bottomSheet(BuildContext context, String? value) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "Set as Wallpaper",
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          const SizedBox(
            height: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    // Icon(
                    //   Icons.image,
                    //   color: Colors.deepOrange,
                    // ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Home Screen",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black45),
                    )
                  ],
                ),
                onTap: () {
                  print("Home Screen");
                  String msg = "Home Screen";
                  setWallpaperHomeScreen(value!);
                  Navigator.of(context).pop();
                },
              ),
              const SizedBox(
                height: 15,
              ),
              InkWell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    // Icon(
                    //   Icons.camera,
                    //   color: Colors.deepOrange,
                    // ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Lock Screen",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black45),
                    )
                  ],
                ),
                onTap: () {
                  print("Lock Screen");
                  String msg = "Lock Screen";
                  // setWallpaperHomeScreen(value!, msg);
                  setWallpaperLockScreen(value!);
                  Navigator.of(context).pop();
                },
              ),
              const SizedBox(
                height: 15,
              ),
              InkWell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    // Icon(
                    //   Icons.camera,
                    //   color: Colors.deepOrange,
                    // ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Home Screen & Lock Screen",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black45),
                    )
                  ],
                ),
                onTap: () {
                  print("Both");
                  String msg = "Both";
                  // setWallpaperHomeScreen(value!, msg);
                  setWallpaperBoth(value!);
                  Navigator.of(context).pop();
                },
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Icon(
                  //   Icons.camera,
                  //   color: Colors.deepOrange,
                  // ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        "CANCEL",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.red),
                      ))
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
