import 'package:flutter/material.dart';
import 'package:pixelov/model/item.dart';

class InventoryRowItem extends StatelessWidget {
  final Item item;

  InventoryRowItem(this.item);

  @override
  Widget build(BuildContext context) {
    final inventoryThumbnail = new Container(
      alignment: new FractionalOffset(0.0, 0.5),
      margin: const EdgeInsets.only(left: 24.0),
      child: new Hero(
        tag: 'inventory-icon-${item.uid}',
        child: new Image(
          image:
              new AssetImage("assets/images/itemImages/" + item.uid + ".png"),
          height: 100,
          width: 100,
        ),
      ),
    );

    final inventoryCard = new Container(
      margin: const EdgeInsets.only(left: 72.0, right: 24.0),
      decoration: new BoxDecoration(
        color: Color(0xFF4E4E4E),
        shape: BoxShape.rectangle,
        borderRadius: new BorderRadius.circular(8.0),
        boxShadow: <BoxShadow>[
          new BoxShadow(
              color: Colors.black38,
              blurRadius: 10.0,
              offset: new Offset(0.0, 10.0))
        ],
      ),
      child: new Container(
        margin: const EdgeInsets.only(top: 16.0, left: 72.0),
        constraints: new BoxConstraints.expand(),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Container(
              color: const Color(0xFF878787),
              width: 24.0,
              height: 1.0,
              margin: const EdgeInsets.symmetric(vertical: 8.0),
            ),
          ],
        ),
      ),
    );

    return new Container(
      height: 120.0,
      margin: const EdgeInsets.only(top: 16.0, bottom: 8.0),
      child: new TextButton(
        onPressed: () {
          //Navigator.push(context, transitionRoute(widget));
        },
        child: new Stack(
          children: <Widget>[
            inventoryCard,
            inventoryThumbnail,
          ],
        ),
      ),
    );
  }
}
