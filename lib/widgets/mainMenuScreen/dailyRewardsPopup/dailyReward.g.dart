// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dailyReward.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DailyAdapter extends TypeAdapter<DailyReward> {
  @override
  final int typeId = 2;

  @override
  DailyReward read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DailyReward(
      collectedToday: fields[1] as bool,
      lastRewardTimestamp: fields[0] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, DailyReward obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.lastRewardTimestamp)
      ..writeByte(1)
      ..write(obj.collectedToday);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DailyAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
