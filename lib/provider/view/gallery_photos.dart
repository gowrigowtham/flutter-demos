import 'package:flutter/material.dart';
import 'package:googlemapdemo/provider/model/photo_model.dart';
import 'package:googlemapdemo/provider/provider_class/gallery_provider.dart';
import 'package:googlemapdemo/provider/provider_class/photo_provider.dart';
import 'package:provider/provider.dart';

import '../../common/navbar.dart';
import 'full_screen.dart';

class GalleryPhotos extends StatefulWidget {
  const GalleryPhotos({Key? key}) : super(key: key);

  @override
  State<GalleryPhotos> createState() => _GalleryPhotosState();
}

class _GalleryPhotosState extends State<GalleryPhotos> {
  final TextEditingController _controller = TextEditingController();
  String searchQuery = "";
  final ScrollController _scrollController = ScrollController();
  // int page = 1;
  fetchData(String s) {
    if (s == "end") {
      Provider.of<GalleryProvider>(context, listen: false).page =
          Provider.of<GalleryProvider>(context, listen: false).page + 1;
    } else {
      Provider.of<GalleryProvider>(context, listen: false)
          .getServerData(searchQuery);
    }
  }

  @override
  void initState() {
    super.initState();
    /* _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        // Bottom poistion
        print("bottom page");
        // PhotoProvider photoProvider = context.watch<PhotoProvider>();

        page++;
        // Provider.of<PhotoProvider>(context, listen: false)
        //     .getServerData(searchQuery, page);
        // photoProvider.getServerData(searchQuery, page);
      }
    });*/
    // WidgetsBinding.instance!.addPostFrameCallback((_) {
    //   fetchData();
    // });
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      fetchData("end");
    }
  }

  void _clearTextField() {
    // Clear everything in the text field
    _controller.clear();
    searchQuery = "";
    // Call setState to update the UI
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey();
    GalleryProvider photoProvider = context.watch<GalleryProvider>();
    return Scaffold(
      // key: _scaffoldState,
      appBar: AppBar(
        title: const Text('Wallpaper App'),
        backgroundColor: const Color(0xffF5591F),
        //   leading: IconButton(
        //       icon: const Icon(Icons.menu),
        //       onPressed: () {
        //         _scaffoldState.currentState?.openDrawer();
        //       }),
      ),
      body: Container(
        margin: EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                controller: _controller,
                onChanged: (value) {
                  // Call setState to update the UI
                  setState(() {
                    searchQuery = value;
                  });
                },
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 10.0),
                  fillColor: Colors.white,
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide:
                        const BorderSide(width: 0.8, color: Color(0xffF5591F)),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: const BorderSide(
                          width: 0.8, color: Color(0xffF5591F))),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: const BorderSide(
                          width: 0.8, color: Color(0xffF5591F))),
                  labelText: 'Search',
                  prefixIcon:
                      const Icon(Icons.search, color: Color(0xffF5591F)),
                  suffixIcon: _controller.text.isEmpty
                      ? null // Show nothing if the text field is empty
                      : IconButton(
                          icon:
                              const Icon(Icons.clear, color: Color(0xffF5591F)),
                          onPressed: _clearTextField,
                        ),
                ),
              ),
            ),

            /* Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                controller: _controller,
                onChanged: (value) {
                  // Call setState to update the UI
                  setState(() {
                    searchQuery = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Search',
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 10.0),
                  fillColor: Colors.white,
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide:
                        const BorderSide(width: 0.5, color: Color(0xffF5591F)),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide:
                        const BorderSide(width: 0.5, color: Color(0xffF5591F)),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: const BorderSide(
                          width: 0.5, color: Color(0xffF5591F))),
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: _controller.text.isEmpty
                      ? null // Show nothing if the text field is empty
                      : IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: _clearTextField,
                        ), // Show the clear button if the text field has something
                ),
              ),
            ),*/

            Expanded(
                child: FutureBuilder<PhotoModel>(
              future: photoProvider.getServerData(searchQuery),
              builder: (context, snapshot) {
                print(snapshot.data);
                if (snapshot.data == null ||
                    snapshot.data!.results!.length == 0) {
                  return const Center(
                    child: Text(
                      "No Data Available",
                      style: TextStyle(fontSize: 20),
                    ),
                  );
                } else if (snapshot.hasData) {
                  return GridView.builder(
                      controller: _scrollController,
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 200,
                              childAspectRatio: 2 / 2,
                              crossAxisSpacing: 8,
                              mainAxisSpacing: 8),
                      itemCount: snapshot.data?.results?.length,
                      itemBuilder: (BuildContext ctx, index) {
                        if (index == snapshot.data!.results!.length - 1) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        return InkWell(
                          onTap: () {
                            print("image click");
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ImageFullScreen(snapshot
                                      .data!.results![index].urls!.thumb
                                      .toString()),
                                ));
                          },
                          child: Hero(
                            tag: snapshot.data!.results![index].urls!.thumb
                                .toString(),
                            child: Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(snapshot
                                            .data!.results![index].urls!.thumb
                                            .toString()),
                                        fit: BoxFit.cover),
                                    borderRadius: BorderRadius.circular(15),
                                    boxShadow: const [
                                  BoxShadow(
                                    color: Colors.transparent,
                                    offset: Offset(2.0, 2.0),
                                    blurRadius: 4.0,
                                    spreadRadius: 1.0,
                                  )
                                ])),
                          ),
                        );
                      });
                }
                return Center(child: CircularProgressIndicator());
              },
            )),
          ],
        ),
      ),
      drawer: NavBar(),
    );
  }
}
