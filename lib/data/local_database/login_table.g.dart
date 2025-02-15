// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_table.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LoginTableAdapter extends TypeAdapter<LoginTable> {
  @override
  final int typeId = 0;

  @override
  LoginTable read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LoginTable(
      fields[0] as String?,
      fields[1] as String?,
      fields[2] as String?,
      fields[3] as String?,
      fields[4] as String?,
      fields[5] as String?,
      fields[6] as String?,
      fields[7] as String?,
      fields[8] as String?,
      fields[9] as int?,
      fields[10] as bool?,
      fields[11] as int?,
      fields[12] as String?,
      fields[13] as String?,
      fields[14] as double?,
      fields[15] as double?,
      fields[16] as String?,
      fields[17] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, LoginTable obj) {
    writer
      ..writeByte(18)
      ..writeByte(0)
      ..write(obj.accountID)
      ..writeByte(1)
      ..write(obj.email)
      ..writeByte(2)
      ..write(obj.mobileNumber)
      ..writeByte(3)
      ..write(obj.accountType)
      ..writeByte(4)
      ..write(obj.fistName)
      ..writeByte(5)
      ..write(obj.lastName)
      ..writeByte(6)
      ..write(obj.token)
      ..writeByte(7)
      ..write(obj.userID)
      ..writeByte(8)
      ..write(obj.verificationStatus)
      ..writeByte(9)
      ..write(obj.verificationStatusID)
      ..writeByte(10)
      ..write(obj.isverifiedContacts)
      ..writeByte(11)
      ..write(obj.profileId)
      ..writeByte(12)
      ..write(obj.referralCode)
      ..writeByte(13)
      ..write(obj.usedReferralCode)
      ..writeByte(14)
      ..write(obj.totalReferralAmount)
      ..writeByte(15)
      ..write(obj.usedReferralAmount)
      ..writeByte(16)
      ..write(obj.profilePic)
      ..writeByte(17)
      ..write(obj.companyName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LoginTableAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
