// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'raidTimer.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RaidTimerAdapter extends TypeAdapter<RaidTimer> {
  @override
  final int typeId = 4;

  @override
  RaidTimer read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RaidTimer(
      scavTimer: fields[0] as DateTime,
      scavRaid: fields[1] as bool,
      pmcTimer: fields[2] as DateTime,
      pmcRaid: fields[3] as bool,
      raidDuration: fields[4] as Time,
    );
  }

  @override
  void write(BinaryWriter writer, RaidTimer obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.scavTimer)
      ..writeByte(1)
      ..write(obj.scavRaid)
      ..writeByte(2)
      ..write(obj.pmcTimer)
      ..writeByte(3)
      ..write(obj.pmcRaid)
      ..writeByte(4)
      ..write(obj.raidDuration);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RaidTimerAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
