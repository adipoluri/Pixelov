import 'package:hive/hive.dart';
import 'package:pixelov/model/inventorySlot.dart';

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
}
