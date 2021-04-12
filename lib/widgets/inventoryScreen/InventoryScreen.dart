import 'package:flutter/material.dart';
import 'package:pixelov/extras/constants.dart';
import 'package:pixelov/main.dart';
import 'package:pixelov/model/item.dart';
import 'package:pixelov/widgets/inventoryScreen/inventoryRowItem.dart';

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
                itemBuilder: (_, index) => new InventoryRowItem(
                  getItem(index, CategoryTypes.GEAR),
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
              child: new ListView.builder(
                itemExtent: 160.0,
                itemCount:
                    MyAppState.dBhandler.currentUser.inventory.weapon.length,
                itemBuilder: (_, index) => new InventoryRowItem(
                  getItem(index, CategoryTypes.WEAPON),
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
              child: new ListView.builder(
                itemExtent: 160.0,
                itemCount:
                    MyAppState.dBhandler.currentUser.inventory.extra.length,
                itemBuilder: (_, index) => new InventoryRowItem(
                  getItem(index, CategoryTypes.EXTRA),
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
              child: new ListView.builder(
                itemExtent: 160.0,
                itemCount:
                    MyAppState.dBhandler.currentUser.inventory.food.length,
                itemBuilder: (_, index) => new InventoryRowItem(
                  getItem(index, CategoryTypes.FOOD),
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
              child: new ListView.builder(
                itemExtent: 160.0,
                itemCount:
                    MyAppState.dBhandler.currentUser.inventory.junk.length,
                itemBuilder: (_, index) => new InventoryRowItem(
                  getItem(index, CategoryTypes.JUNK),
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
              child: new ListView.builder(
                itemExtent: 160.0,
                itemCount:
                    MyAppState.dBhandler.currentUser.inventory.key.length,
                itemBuilder: (_, index) => new InventoryRowItem(
                  getItem(index, CategoryTypes.KEY),
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
              child: new ListView.builder(
                itemExtent: 160.0,
                itemCount:
                    MyAppState.dBhandler.currentUser.inventory.valuables.length,
                itemBuilder: (_, index) => new InventoryRowItem(
                  getItem(index, CategoryTypes.VALUABLES),
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
              child: new ListView.builder(
                itemExtent: 160.0,
                itemCount: MyAppState
                    .dBhandler.currentUser.inventory.unlockable.length,
                itemBuilder: (_, index) => new InventoryRowItem(
                  getItem(index, CategoryTypes.UNLOCKABLE),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Item getItem(int index, int category) {
    switch (category) {
      case CategoryTypes.KEY:
        return MyAppState.dBhandler.getItemObjectWithUid(
            MyAppState.dBhandler.currentUser.inventory.key[index].uid,
            CategoryTypes.GEAR);
        break;
      case CategoryTypes.GEAR:
        return MyAppState.dBhandler.getItemObjectWithUid(
            MyAppState.dBhandler.currentUser.inventory.gear[index].uid,
            CategoryTypes.GEAR);
        break;
      case CategoryTypes.WEAPON:
        return MyAppState.dBhandler.getItemObjectWithUid(
            MyAppState.dBhandler.currentUser.inventory.weapon[index].uid,
            CategoryTypes.GEAR);
        break;
      case CategoryTypes.FOOD:
        return MyAppState.dBhandler.getItemObjectWithUid(
            MyAppState.dBhandler.currentUser.inventory.food[index].uid,
            CategoryTypes.GEAR);
        break;
      case CategoryTypes.EXTRA:
        return MyAppState.dBhandler.getItemObjectWithUid(
            MyAppState.dBhandler.currentUser.inventory.extra[index].uid,
            CategoryTypes.GEAR);
        break;
      case CategoryTypes.UNLOCKABLE:
        return MyAppState.dBhandler.getItemObjectWithUid(
            MyAppState.dBhandler.currentUser.inventory.unlockable[index].uid,
            CategoryTypes.GEAR);
        break;
      case CategoryTypes.JUNK:
        return MyAppState.dBhandler.getItemObjectWithUid(
            MyAppState.dBhandler.currentUser.inventory.junk[index].uid,
            CategoryTypes.GEAR);
        break;
      case CategoryTypes.CURRENCY:
        return MyAppState.dBhandler.getItemObjectWithUid(
            MyAppState.dBhandler.currentUser.inventory.currency[index].uid,
            CategoryTypes.GEAR);
        break;
      case CategoryTypes.VALUABLES:
        return MyAppState.dBhandler.getItemObjectWithUid(
            MyAppState.dBhandler.currentUser.inventory.valuables[index].uid,
            CategoryTypes.GEAR);
        break;
    }
    return null;
  }
}
