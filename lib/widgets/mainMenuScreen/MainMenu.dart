import 'package:flutter/material.dart ';
import 'package:pixelov/extras/moneyBar.dart';
import 'package:pixelov/main.dart';
import 'package:pixelov/widgets/hideoutScreen/hideoutScreen.dart';
import 'package:pixelov/widgets/inventoryScreen/inventoryScreen.dart';
import 'package:pixelov/widgets/mainMenuScreen/dailyRewardsPopup/dailyReward.dart';
import 'package:pixelov/widgets/marketScreen/marketScreen.dart';
import 'package:pixelov/widgets/raidScreen/RaidSelectorScreen.dart';
import 'package:pixelov/widgets/settingsScreen/settingsScreen.dart';

class MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width - 120;
    double height = MediaQuery.of(context).size.height / 3 + 20;

    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/title.png"),
              fit: BoxFit.fill,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, height, 0, 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Wrap(
                  runSpacing: 16,
                  children: [
                    dirButton(context, 'Raid', width, RaidSelectorScreen()),
                    dirButton(context, 'Inventory', width, InventorySCreen()),
                    dirButton(context, 'Market', width, MarketScreen()),
                    dirButton(context, 'Hideout', width, HideoutScreen())
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    FloatingActionButton(
                      heroTag: 'information',
                      child: Icon(Icons.info),
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      onPressed: () {
                        //Navigator.push(context, transitionRoute(InfoScreen()));
                        //MyAppState.dBhandler.currentUser.addRandomItem();
                      },
                    ),
                    rewardButton(context),
                    FloatingActionButton(
                      heroTag: 'settings',
                      child: Icon(Icons.settings),
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SettingsScreen()));
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            new MoneyBar(MyAppState.dBhandler.currentUser.wallet.roubles,
                MyAppState.dBhandler.currentUser.wallet.bitcoin),
          ],
        ),
      ],
    );
  }

  ElevatedButton dirButton(
      BuildContext context, String title, double width, Widget widget) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(context, transitionRoute(widget));
      },
      style: ElevatedButton.styleFrom(
        primary: Color(0x1AFFFFFF), // background
        onPrimary: Color(0xFFB6A26A),
        elevation: 8, // foreground
      ),
      child: Container(
        width: width,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  decoration: TextDecoration.none,
                  fontFamily: 'Minecraft',
                  color: Color(0xFFE9E8D3),
                  fontSize: 40,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Route transitionRoute(Widget widget) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => widget,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }

  FloatingActionButton rewardButton(BuildContext context) {
    //TODO: add Daily Gift Changes
    return FloatingActionButton(
      heroTag: "daily",
      child: Icon(Icons.redeem),
      backgroundColor: Colors.yellow,
      foregroundColor: Colors.black,
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) => DailyRewardWidget(),
        );
      },
    );
  }
}
