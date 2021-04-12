import 'package:flutter/material.dart';

class InventoryRow extends StatelessWidget {
  InventoryRow();

  @override
  Widget build(BuildContext context) {
    final inventoryCard = new Container(
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
          ],
        ),
      ),
    );
  }
}
