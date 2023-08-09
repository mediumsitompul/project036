import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("Google Map\n(Marker Custom)")),
        ),
        body: MyMarker(),
      ),
    );
  }
}

class MyMarker extends StatefulWidget {
  const MyMarker({super.key});

  @override
  State<MyMarker> createState() => _MyMarkerState();
}

class _MyMarkerState extends State<MyMarker> {
  LatLng latLng1 = LatLng(3.5918785, 98.6773808);
  BitmapDescriptor markerIcon1 = BitmapDescriptor.defaultMarker;

  void addCustomeIcon() {
    BitmapDescriptor.fromAssetImage(
            ImageConfiguration(), "assets/images/bola02.png")
        .then((icon) {
      setState(() {
        markerIcon1 = icon;
      });
    });
  }

  @override
  void initState() {
    addCustomeIcon();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: CameraPosition(target: latLng1, zoom: 10),
        markers: {
          Marker(
            markerId: MarkerId("1"),
            position: latLng1,
            icon: markerIcon1,
          ),
        },
      ),
    );
  }
}
