// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inventorySlot.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class InventorySlotAdapter extends TypeAdapter<InventorySlot> {
  @override
  final int typeId = 7;

  @override
  InventorySlot read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return InventorySlot(
      uid: fields[0] as String,
      total: fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, InventorySlot obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.uid)
      ..writeByte(1)
      ..write(obj.total);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InventorySlotAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
