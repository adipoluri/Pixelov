// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserAdapter extends TypeAdapter<User> {
  @override
  final int typeId = 1;

  @override
  User read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return User(
      lastOnlineTimestamp: fields[0] as DateTime,
      email: fields[1] as String,
      userID: fields[2] as String,
      active: fields[4] as bool,
      daily: fields[5] as DailyReward,
    );
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.lastOnlineTimestamp)
      ..writeByte(1)
      ..write(obj.email)
      ..writeByte(2)
      ..write(obj.userID)
      ..writeByte(4)
      ..write(obj.active)
      ..writeByte(5)
      ..write(obj.daily);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
