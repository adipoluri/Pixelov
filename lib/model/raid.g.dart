// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'raid.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RaidAdapter extends TypeAdapter<Raid> {
  @override
  final int typeId = 4;

  @override
  Raid read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Raid(
      scavRaid: fields[0] as bool,
      pmcRaid: fields[1] as bool,
      raidDuration: fields[2] as DateTime,
      raidCat: fields[3] as String,
    )..raidScore = fields[4] as int;
  }

  @override
  void write(BinaryWriter writer, Raid obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.scavRaid)
      ..writeByte(1)
      ..write(obj.pmcRaid)
      ..writeByte(2)
      ..write(obj.raidDuration)
      ..writeByte(3)
      ..write(obj.raidCat)
      ..writeByte(4)
      ..write(obj.raidScore);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RaidAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
