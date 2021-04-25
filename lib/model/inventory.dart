import 'dart:math';

import 'package:hive/hive.dart';
import 'package:pixelov/core/dbHandler.dart';
import 'package:pixelov/extras/constants.dart';
import 'package:pixelov/model/inventorySlot.dart';

import 'item.dart';

part 'inventory.g.dart';

@HiveType(typeId: 6, adapterName: "InventoryAdapter")
class Inventory extends HiveObject {
  @HiveField(0)
  List<InventorySlot> key;
  @HiveField(1)
  List<InventorySlot> gear;
  @HiveField(2)
  List<InventorySlot> weapon;
  @HiveField(4)
  List<InventorySlot> food;
  @HiveField(5)
  List<InventorySlot> extra;
  @HiveField(6)
  List<InventorySlot> unlockable;
  @HiveField(7)
  List<InventorySlot> junk;
  @HiveField(8)
  List<InventorySlot> currency;
  @HiveField(9)
  List<InventorySlot> valuables;

  Inventory({
    this.key,
    this.gear,
    this.weapon,
    this.food,
    this.extra,
    this.unlockable,
    this.junk,
    this.currency,
    this.valuables,
  });

  void addItem(String uid, int category) {
    switch (category) {
      case CategoryTypes.KEY:
        for (int i = 0; i < this.key.length; i++) {
          if (this.key[i].uid == uid) {
            this.key[i].total++;
            return;
          }
        }
        this.key.add(new InventorySlot(uid: uid, total: 1));
        break;
      case CategoryTypes.GEAR:
        for (int i = 0; i < this.gear.length; i++) {
          if (this.gear[i].uid == uid) {
            this.gear[i].total++;
            return;
          }
        }
        this.gear.add(new InventorySlot(uid: uid, total: 1));
        break;
      case CategoryTypes.WEAPON:
        for (int i = 0; i < this.weapon.length; i++) {
          if (this.weapon[i].uid == uid) {
            this.weapon[i].total++;
            return;
          }
        }
        this.weapon.add(new InventorySlot(uid: uid, total: 1));
        break;
      case CategoryTypes.FOOD:
        for (int i = 0; i < this.food.length; i++) {
          if (this.food[i].uid == uid) {
            this.food[i].total++;
            return;
          }
        }
        this.food.add(new InventorySlot(uid: uid, total: 1));
        break;
      case CategoryTypes.EXTRA:
        for (int i = 0; i < this.extra.length; i++) {
          if (this.extra[i].uid == uid) {
            this.extra[i].total++;
            return;
          }
        }
        this.extra.add(new InventorySlot(uid: uid, total: 1));
        break;
      case CategoryTypes.UNLOCKABLE:
        for (int i = 0; i < this.unlockable.length; i++) {
          if (this.unlockable[i].uid == uid) {
            this.unlockable[i].total++;
            return;
          }
        }
        this.unlockable.add(new InventorySlot(uid: uid, total: 1));
        break;
      case CategoryTypes.JUNK:
        for (int i = 0; i < this.junk.length; i++) {
          if (this.junk[i].uid == uid) {
            this.junk[i].total++;
            return;
          }
        }
        this.junk.add(new InventorySlot(uid: uid, total: 1));
        break;
      case CategoryTypes.CURRENCY:
        for (int i = 0; i < this.currency.length; i++) {
          if (this.currency[i].uid == uid) {
            this.currency[i].total++;
            return;
          }
        }
        this.currency.add(new InventorySlot(uid: uid, total: 1));
        break;
      case CategoryTypes.VALUABLES:
        for (int i = 0; i < this.valuables.length; i++) {
          if (this.valuables[i].uid == uid) {
            this.valuables[i].total++;
            return;
          }
        }
        this.valuables.add(new InventorySlot(uid: uid, total: 1));
        break;
    }
  }

  void removeItem(String uid, int category) {
    switch (category) {
      case CategoryTypes.KEY:
        for (int i = 0; i < this.key.length; i++) {
          if (this.key[i].uid == uid) {
            this.key[i].total--;
            if (this.key[i].total <= 0) {
              this.key.removeAt(i);
            }
            break;
          }
        }
        break;
      case CategoryTypes.GEAR:
        for (int i = 0; i < this.gear.length; i++) {
          if (this.gear[i].uid == uid) {
            this.gear[i].total--;
            if (this.gear[i].total <= 0) {
              this.gear.removeAt(i);
            }
            break;
          }
        }
        break;
      case CategoryTypes.WEAPON:
        for (int i = 0; i < this.weapon.length; i++) {
          if (this.weapon[i].uid == uid) {
            this.weapon[i].total--;
            if (this.weapon[i].total <= 0) {
              this.weapon.removeAt(i);
            }
            break;
          }
        }
        break;
      case CategoryTypes.FOOD:
        for (int i = 0; i < this.food.length; i++) {
          if (this.food[i].uid == uid) {
            this.food[i].total--;
            if (this.food[i].total <= 0) {
              this.food.removeAt(i);
            }
            break;
          }
        }
        break;
      case CategoryTypes.EXTRA:
        for (int i = 0; i < this.extra.length; i++) {
          if (this.extra[i].uid == uid) {
            this.extra[i].total--;
            if (this.extra[i].total <= 0) {
              this.extra.removeAt(i);
            }
            break;
          }
        }
        break;
      case CategoryTypes.UNLOCKABLE:
        for (int i = 0; i < this.unlockable.length; i++) {
          if (this.unlockable[i].uid == uid) {
            this.unlockable[i].total--;
            if (this.unlockable[i].total <= 0) {
              this.unlockable.removeAt(i);
            }
            break;
          }
        }
        break;
      case CategoryTypes.JUNK:
        for (int i = 0; i < this.junk.length; i++) {
          if (this.junk[i].uid == uid) {
            this.junk[i].total--;
            if (this.junk[i].total <= 0) {
              this.junk.removeAt(i);
            }
            break;
          }
        }
        break;
      case CategoryTypes.CURRENCY:
        for (int i = 0; i < this.currency.length; i++) {
          if (this.currency[i].uid == uid) {
            this.currency[i].total--;
            if (this.currency[i].total <= 0) {
              this.currency.removeAt(i);
            }
            break;
          }
        }
        break;
      case CategoryTypes.VALUABLES:
        for (int i = 0; i < this.valuables.length; i++) {
          if (this.valuables[i].uid == uid) {
            this.valuables[i].total--;
            if (this.valuables[i].total <= 0) {
              this.valuables.removeAt(i);
            }
            break;
          }
        }
        break;
    }
  }

  String getRandomItem() {
    Random random = new Random();
    int randomNumber = random.nextInt(8) + 1;
    int randomItemIndex =
        random.nextInt(DBHandler.items[randomNumber].items.length - 1);
    int counter = 0;
    for (Item item in DBHandler.items[randomNumber].items.values) {
      if (counter == randomItemIndex) {
        this.addItem(item.uid, item.category);
        return item.uid;
      }
      counter++;
    }
    return null;
  }
}
