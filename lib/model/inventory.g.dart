// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inventory.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class InventoryAdapter extends TypeAdapter<Inventory> {
  @override
  final int typeId = 6;

  @override
  Inventory read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Inventory(
      key: (fields[0] as List)?.cast<InventorySlot>(),
      gear: (fields[1] as List)?.cast<InventorySlot>(),
      weapon: (fields[2] as List)?.cast<InventorySlot>(),
      food: (fields[4] as List)?.cast<InventorySlot>(),
      extra: (fields[5] as List)?.cast<InventorySlot>(),
      unlockable: (fields[6] as List)?.cast<InventorySlot>(),
      junk: (fields[7] as List)?.cast<InventorySlot>(),
      currency: (fields[8] as List)?.cast<InventorySlot>(),
      valuables: (fields[9] as List)?.cast<InventorySlot>(),
    );
  }

  @override
  void write(BinaryWriter writer, Inventory obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.key)
      ..writeByte(1)
      ..write(obj.gear)
      ..writeByte(2)
      ..write(obj.weapon)
      ..writeByte(4)
      ..write(obj.food)
      ..writeByte(5)
      ..write(obj.extra)
      ..writeByte(6)
      ..write(obj.unlockable)
      ..writeByte(7)
      ..write(obj.junk)
      ..writeByte(8)
      ..write(obj.currency)
      ..writeByte(9)
      ..write(obj.valuables);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InventoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
