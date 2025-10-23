import 'package:first_wtf_app/widgets/contact_item.dart';
import 'package:flutter/material.dart';

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
                  _buildListView(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListView() {
    return ListView(
      children: [
        ContactItem(),
        ContactItem(),
        ContactItem(),
        ContactItem(),
        ContactItem(),
        ContactItem(),
        ContactItem(),
        ContactItem(),
        ContactItem(),
        ContactItem(),
        ContactItem(),
        ContactItem(),
        ContactItem(),
        ContactItem(),
        ContactItem(),
        ContactItem(),
        ContactItem(),
        ContactItem(),
        ContactItem(),
        ContactItem(),
        ContactItem(),
        ContactItem(),
        ContactItem(),
        ContactItem(),
        ContactItem(),
      ],
    );
  }

  Widget _buildMapView() {
    return ListView(
      children: [
        Image.asset(
          "assets/map.png",
          width: MediaQuery.sizeOf(context).width * 0.8,
          height: MediaQuery.sizeOf(context).height * 1,
          fit: BoxFit.cover,
        ),
      ],
    );
  }
}
