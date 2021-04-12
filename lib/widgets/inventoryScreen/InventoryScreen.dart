import 'package:flutter/material.dart';
import 'package:pixelov/core/dbHandler.dart';
import 'package:pixelov/main.dart';
import 'package:pixelov/widgets/inventoryScreen/InventoryRow.dart';

class InventorySCreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 8,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF4E4E4E),
          title: Text(
            "Inventory",
            style: TextStyle(
              fontWeight: FontWeight.normal,
              decoration: TextDecoration.none,
              fontFamily: 'Minecraft',
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          bottom: TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(icon: Icon(Icons.person)),
              Tab(icon: Icon(Icons.gps_fixed)),
              Tab(icon: Icon(Icons.stream)),
              Tab(icon: Icon(Icons.lunch_dining)),
              Tab(icon: Icon(Icons.hardware)),
              Tab(icon: Icon(Icons.vpn_key)),
              Tab(icon: Icon(Icons.auto_awesome)),
              Tab(icon: Icon(Icons.api)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/raid.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: new ListView.builder(
                itemExtent: 160.0,
                itemCount:
                    MyAppState.dBhandler.currentUser.inventory.gear.length,
                itemBuilder: (_, index) => new InventoryRow(),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/raid.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/raid.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/raid.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/raid.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/raid.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/raid.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/raid.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
