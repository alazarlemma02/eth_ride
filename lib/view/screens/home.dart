import 'dart:async';

import 'package:eth_ride/concern/common.dart';
import 'package:eth_ride/services/google_map_services.dart';
import 'package:eth_ride/view/widgets/drawer.dart';
import 'package:eth_ride/view/widgets/location_search_engine.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Completer<GoogleMapController> _googleMapController =
      Completer<GoogleMapController>();
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
  final GoogleMapServices _googleMapServices = GoogleMapServices();
  double mapBottomPadding = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CommonMethods.primaryColor,
        title: const Text("ETH RIDES"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.person),
          ),
        ],
      ),
      drawer: const DrawerScreen(),
      body: Stack(
        children: [
          GoogleMap(
            padding: EdgeInsets.only(bottom: mapBottomPadding),
            myLocationButtonEnabled: true,
            myLocationEnabled: true,
            zoomGesturesEnabled: true,
            zoomControlsEnabled: true,
            mapType: MapType.normal,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _googleMapController.complete(controller);
              setState(() {
                mapBottomPadding = MediaQuery.of(context).size.height * 0.4;
              });
              _googleMapServices.locateUserPostion();
            },
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 20,
                    color: Colors.black,
                    spreadRadius: 1,
                    offset: Offset(0.8, 0.8),
                  ),
                ],
              ),
              child: Padding(
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Nice to see you again, 👋",
                      style: TextStyle(
                          fontSize: 24,
                          color: Colors.black,
                          fontFamily: "Signatra"),
                    ),
                    const Text(
                      "Where to?",
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    const LocationSearch(),
                    Container(
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.width * 0.05),
                      height: MediaQuery.of(context).size.height * 0.15,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.home,
                                  color: Colors.black54,
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.02,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.width *
                                          0.02),
                                  child: const Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Add Home",
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.black54),
                                      ),
                                      Text(
                                        "Your living home address",
                                        style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.black54),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.001,
                              child: Container(
                                color: Colors.black54,
                              ),
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.work,
                                  color: Colors.black54,
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.02,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.width *
                                          0.02),
                                  child: const Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Add Work",
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.black54),
                                      ),
                                      Text(
                                        "Your work address",
                                        style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.black54),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
