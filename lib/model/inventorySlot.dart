import 'package:hive/hive.dart';

part 'inventorySlot.g.dart';

@HiveType(typeId: 7, adapterName: "InventorySlotAdapter")
class InventorySlot extends HiveObject {
  @HiveField(0)
  String uid;
  @HiveField(1)
  int total;

  InventorySlot({
    this.uid,
    this.total,
  });
}
