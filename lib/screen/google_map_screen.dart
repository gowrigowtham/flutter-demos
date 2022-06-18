import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({Key? key}) : super(key: key);

  @override
  State<GoogleMapScreen> createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  String stAddr = "";
  String stAdd = "";
  final Completer<GoogleMapController> _controller = Completer();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14,
  );
  List<Marker> marker = [];
  List<Marker> list = const [
    // Marker(
    //     markerId: MarkerId('1'),
    //     position: LatLng(37.42796133580664, -122.085749655962),
    //     infoWindow: InfoWindow(title: 'My Location'))
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    marker.addAll(list);
    loadData();
  }

  String location = 'Null, Press Button';
  String Address = 'search';
  Future<Position> _getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  loadData() {
    getUserCurrentLocation().then((value) async {
      Position position = await _getGeoLocationPosition();
      location = 'Lat: ${position.latitude} , Long: ${position.longitude}';
      GetAddressFromLatLong(position);

      print(value.latitude.toString() + "" + value.longitude.toString());
      marker.add(Marker(
          markerId: MarkerId('2'),
          position: LatLng(value.latitude, value.longitude),
          infoWindow: InfoWindow(title: Address)));
      CameraPosition cameraPosition = CameraPosition(
          zoom: 14, target: LatLng(value.latitude, value.longitude));
      final GoogleMapController mapController = await _controller.future;
      mapController
          .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
      setState(() {});
    });
  }

  Future<void> GetAddressFromLatLong(Position position) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    print(placemarks);
    Placemark place = placemarks[0];
    Address =
        '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: _kGooglePlex,
          markers: Set<Marker>.of(marker),
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            /* GoogleMapController mapController = await _controller.future;
            mapController.animateCamera(CameraUpdate.newCameraPosition(
                CameraPosition(
                    target: LatLng(37.42796133580664, -122.085749655962),
                    zoom: 14)));
            setState(() {});*/
            loadData();
          },
          child: Icon(Icons.local_activity),
        ),
      ),
    );
    /*  return Scaffold(
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.purple,
        centerTitle: true,
        // leading: const Icon(Icons.arrow_back),
        leading: const Icon(
          Icons.arrow_back,
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.logout)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
        ],
        title: const Text('Google Map',
            style: TextStyle(
                fontFamily: 'Open Sans', fontWeight: FontWeight.bold)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
                child: Text(
              stAdd,
              style: TextStyle(fontSize: 18),
            )),
          ),
          GestureDetector(
            onTap: () async {
              // From a query
              // const query = "1600 Amphiteatre Parkway, Mountain View";
              // var addresses =
              //     await Geocoder.local.findAddressesFromQuery(query);
              // var second = addresses.first;
              // print("${second.featureName} : ${second.coordinates}");
              //
              // final coordinate =
              //     Coordinates(37.42796133580664, -122.085749655962);
              // var address =
              //     await Geocoder.local.findAddressesFromCoordinates(coordinate);
              // var first = address.first;
              // print('Address: ${first.featureName}${first.addressLine}');
              List<Location> locations =
                  await locationFromAddress("Gronausestraat 710, Enschede");
              List<Placemark> placemarks =
                  await placemarkFromCoordinates(52.2165157, 6.9437819);
              setState(() {
                // stAddr = first.featureName.toString() +
                //     "" +
                //     first.addressLine.toString();
                stAddr = locations.last.latitude.toString() +
                    " " +
                    locations.last.longitude.toString();
              });
              stAdd = placemarks.reversed.last.street.toString() +
                  "" +
                  placemarks.reversed.last.locality.toString() +
                  "" +
                  placemarks.reversed.last.country.toString();
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 50,
                decoration: BoxDecoration(color: Colors.green),
                child: const Center(
                  child: Text(
                    "Convert",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Open Sans',
                        fontStyle: FontStyle.italic),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );*/
    /*return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Coordinates Points',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              location,
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'ADDRESS',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text('${Address}'),
            ElevatedButton(
                onPressed: () async {
                  Position position = await _getGeoLocationPosition();
                  location =
                      'Lat: ${position.latitude} , Long: ${position.longitude}';
                  GetAddressFromLatLong(position);
                },
                child: Text('Get Location'))
          ],
        ),
      ),
    );*/
  }

  Future<Position> getUserCurrentLocation() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) {
      print("error:" + error.toString());
    });
    return await Geolocator.getCurrentPosition();
  }
}
