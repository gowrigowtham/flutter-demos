import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../common/navbar.dart';
import '../model/photo_model.dart';
import '../provider_class/photo_provider.dart';
import 'full_screen.dart';

class PhotoGridView extends StatefulWidget {
  const PhotoGridView({Key? key}) : super(key: key);

  @override
  State<PhotoGridView> createState() => _PhotoGridViewState();
}

class _PhotoGridViewState extends State<PhotoGridView> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _controller = TextEditingController();
  List<Results> searchList = [];
  fetchData() {
    Provider.of<PhotoProvider>(context, listen: false).callPhotoApi();
  }

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      fetchData();
    });
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      fetchData();
    }
  }

  void _clearTextField() {
    _controller.clear();
    // searchQuery = "";
    // Call setState to update the UI
    final productsData = Provider.of<PhotoProvider>(context, listen: false);

    productsData.search = '';
    productsData.page = 1;
    fetchData();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    final productData = Provider.of<PhotoProvider>(context);
    final List<Results> productList = productData.photos;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wallpaper App'),
        backgroundColor: const Color(0xffF5591F),
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
                    // searchQuery = value;
                    final productsData =
                        Provider.of<PhotoProvider>(context, listen: false);

                    productsData.search = value;
                    fetchData();
                    // searchList =
                    //     productList.where((element) => element.contains(value)).toList();
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
            Expanded(
              child: OrientationBuilder(
                builder: (context, orientation) {
                  return Consumer<PhotoProvider>(
                    builder: (context, data, __) {
                      if (data == null || data.photos.length == 0) {
                        return const Center(
                          child: Text(
                            "No Data Available",
                            style: TextStyle(fontSize: 20),
                          ),
                        );
                      } else if (data != null ||
                          data.photos != null ||
                          data.photos.length != 0) {
                        if (orientation == Orientation.portrait) {
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
                              itemCount: data.photos.length,
                              itemBuilder: (BuildContext ctx, index) {
                                if (index == data.photos.length - 1) {
                                  return Center(
                                      child: CircularProgressIndicator());
                                }
                                return InkWell(
                                  onTap: () {
                                    print("image click");
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => ImageFullScreen(
                                              data.photos[index].urls!.thumb
                                                  .toString()),
                                        ));
                                  },
                                  child: Hero(
                                    tag: data.photos[index].urls!.thumb
                                        .toString(),
                                    child: Container(
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: NetworkImage(data
                                                    .photos[index].urls!.thumb
                                                    .toString()),
                                                fit: BoxFit.cover),
                                            borderRadius:
                                                BorderRadius.circular(15),
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
                        } else {
                          return Row(
                            children: [
                              Expanded(
                                  flex: 5,
                                  child: GridView.builder(
                                      controller: _scrollController,
                                      shrinkWrap: true,
                                      gridDelegate:
                                          const SliverGridDelegateWithMaxCrossAxisExtent(
                                              maxCrossAxisExtent: 200,
                                              childAspectRatio: 2 / 2,
                                              crossAxisSpacing: 8,
                                              mainAxisSpacing: 8),
                                      itemCount: data.photos.length,
                                      itemBuilder: (BuildContext ctx, index) {
                                        if (index == data.photos.length - 1) {
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
                                                  builder: (context) =>
                                                      ImageFullScreen(data
                                                          .photos[index]
                                                          .urls!
                                                          .thumb
                                                          .toString()
                                                          .toString()),
                                                ));
                                          },
                                          child: Hero(
                                            tag: data.photos[index].urls!.thumb
                                                .toString(),
                                            child: Container(
                                                decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: NetworkImage(data
                                                            .photos[index]
                                                            .urls!
                                                            .thumb
                                                            .toString()),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
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
                                      })),
                            ],
                          );
                        }
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  );
                },
              ),
            ),
            /*Expanded(
                child: FutureBuilder<PhotoModel>(
              future: photoProvider.getServerData(searchQuery, page),
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
            )),*/
          ],
        ),
      ),
      drawer: NavBar(),
    );
    /* return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          fit: StackFit.expand,
          children: [
            Container(
                height: h,
                color: Colors.transparent,
                child: Image.asset(
                  'assets/bg.jpg',
                  fit: BoxFit.cover,
                )),
            Container(
              height: MediaQuery.of(context).size.height,
              child: BackdropFilter(
                child: Container(
                  height: h,
                  color: Colors.grey.shade200.withOpacity(0.5),
                ),
                filter: ui.ImageFilter.blur(sigmaX: 18.0, sigmaY: 18.0),
              ),
            ),
            OrientationBuilder(
              builder: (context, orientation) {
                return Consumer<PhotoProvider>(
                  builder: (context, data, __) {
                    if (data != null ||
                        data.photos != null ||
                        data.photos.length != 0) {
                      if (orientation == Orientation.portrait) {
                        return GridView.builder(
                            controller: _scrollController,
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent: 200,
                                    childAspectRatio: 2 / 2,
                                    crossAxisSpacing: 20,
                                    mainAxisSpacing: 20),
                            itemCount: data.photos.length,
                            itemBuilder: (BuildContext ctx, index) {
                              if (index == data.photos.length - 1) {
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
                                        builder: (context) => ImageFullScreen(
                                            data.photos[index].urls!.thumb
                                                .toString()
                                                .toString()),
                                      ));
                                },
                                child: Hero(
                                  tag:
                                      data.photos[index].urls!.thumb.toString(),
                                  child: Container(
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: NetworkImage(data
                                                  .photos[index].urls!.thumb
                                                  .toString()),
                                              fit: BoxFit.cover),
                                          borderRadius:
                                              BorderRadius.circular(15),
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
                      } else {
                        return Row(
                          children: [
                            Expanded(
                                flex: 5,
                                child: GridView.builder(
                                    controller: _scrollController,
                                    shrinkWrap: true,
                                    gridDelegate:
                                        const SliverGridDelegateWithMaxCrossAxisExtent(
                                            maxCrossAxisExtent: 200,
                                            childAspectRatio: 2 / 2,
                                            crossAxisSpacing: 20,
                                            mainAxisSpacing: 20),
                                    itemCount: data.photos.length,
                                    itemBuilder: (BuildContext ctx, index) {
                                      if (index == data.photos.length - 1) {
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
                                                builder: (context) =>
                                                    ImageFullScreen(data
                                                        .photos[index]
                                                        .urls!
                                                        .thumb
                                                        .toString()
                                                        .toString()),
                                              ));
                                        },
                                        child: Hero(
                                          tag: data.photos[index].urls!.thumb
                                              .toString(),
                                          child: Container(
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: NetworkImage(data
                                                          .photos[index]
                                                          .urls!
                                                          .thumb
                                                          .toString()),
                                                      fit: BoxFit.cover),
                                                  borderRadius:
                                                      BorderRadius.circular(15),
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
                                    })),
                            Expanded(
                                flex: 5,
                                child: Center(
                                  child: Container(
                                    child: Column(
                                      children: [
                                        Text('Photos provided by Pexels'),
                                        Text(
                                          'Developed by Rishabh Sharma',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ),
                                      ],
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                    ),
                                  ),
                                ))
                          ],
                        );
                      }
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                );
              },
            ),
          ],
        ));*/
  }

// Widget body(data) {
//   double h = MediaQuery.of(context).size.height;
//
//   return Container(
//     color: Colors.transparent,
//     child: ListView.builder(
//         controller: _scrollController,
//         itemCount: data.photos.length,
//         itemBuilder: (context, index) {
//           if (index == data.photos.length - 1) {
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//           return InkWell(
//             onTap: () {
//               // Navigator.push(
//               //     context,
//               //     new MaterialPageRoute(
//               //         builder: (context) =>
//               //             PhotoDetails(tag: data.photos[index].id.toString(), url: data.photos[index].src.large2x.toString())));
//             },
//             child: Container(
//               height: h / 2,
//               margin: EdgeInsets.all(h / 18),
//               child: Hero(
//                 transitionOnUserGestures: true,
//                 tag: data.photos[index].id.toString(),
//                 child: Image.network(
//                   data.photos[index].medium.toString(),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//           );
//         }),
//   );
// }
}
