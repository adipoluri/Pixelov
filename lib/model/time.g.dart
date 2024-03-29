// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TimeAdapter extends TypeAdapter<Time> {
  @override
  final int typeId = 5;

  @override
  Time read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Time(
      mins: fields[0] as int,
      hours: fields[1] as int,
      days: fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Time obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.mins)
      ..writeByte(1)
      ..write(obj.hours)
      ..writeByte(2)
      ..write(obj.days);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TimeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
