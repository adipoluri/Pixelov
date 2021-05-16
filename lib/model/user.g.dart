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
      inventory: fields[6] as Inventory,
      wallet: fields[7] as Wallet,
      raid: fields[8] as Raid,
      experience: fields[9] as Experience,
    );
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.lastOnlineTimestamp)
      ..writeByte(1)
      ..write(obj.email)
      ..writeByte(2)
      ..write(obj.userID)
      ..writeByte(4)
      ..write(obj.active)
      ..writeByte(5)
      ..write(obj.daily)
      ..writeByte(6)
      ..write(obj.inventory)
      ..writeByte(7)
      ..write(obj.wallet)
      ..writeByte(8)
      ..write(obj.raid)
      ..writeByte(9)
      ..write(obj.experience);
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
