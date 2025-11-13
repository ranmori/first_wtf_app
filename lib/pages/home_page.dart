import 'package:first_wtf_app/model/hospital.dart';
import 'package:first_wtf_app/provider/hospital_notifier.dart';
import 'package:first_wtf_app/widgets/contact_item.dart';
import 'package:first_wtf_app/widgets/hospital_list.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MediCall"),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Icon(Icons.search),
          ),
        ],
        leading: Icon(Icons.menu),
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            TabBar(
              tabs: [
                Tab(text: "Map"),
                Tab(text: "List"),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  // Widget for showing map image
                  _buildMapView(),
                  //Widget for list view
                  HospitalList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMapView() {
    return ListView(
      children: [
        SizedBox(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height * 0.7,
          child: Container()
          // GoogleMap(
          //   // onMapCreated: _onMapCreated,
          //   initialCameraPosition: const CameraPosition(
          //     target: LatLng(4, 4),
          //     zoom: 2,
          //   ),
          //   markers: {
          //     Marker(
          //       markerId: MarkerId("my_house"),
          //       position: LatLng(4, 9),
          //       infoWindow: InfoWindow(
          //         title: "Anoni house",
          //         snippet: "come help me",
          //       ),
          //     ),
          //   },
          // ),
        ),
      ],
    );
  }
}
