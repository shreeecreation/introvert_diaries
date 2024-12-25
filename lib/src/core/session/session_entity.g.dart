// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SessionAdapter extends TypeAdapter<SessionEntity> {
  @override
  final int typeId = 0;

  @override
  SessionEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SessionEntity(
      accessToken: fields[0] as String?,
      refreshToken: fields[1] as String?,
      expiresIn: fields[2] as int?,
      hasOnboarding: fields[3] as bool?,
      hasOngoingTest: fields[8] as bool?,
      hasEmailVerified: fields[13] as bool?,
    )
      ..showNotification = fields[7] as bool?
      ..unansweredQuestions = fields[10] as int?
      ..apiPageCountAssessment = fields[11] as int?
      ..showLandingPage = fields[12] as bool?;
  }

  @override
  void write(BinaryWriter writer, SessionEntity obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.accessToken)
      ..writeByte(1)
      ..write(obj.refreshToken)
      ..writeByte(2)
      ..write(obj.expiresIn)
      ..writeByte(3)
      ..write(obj.hasOnboarding)
      ..writeByte(7)
      ..write(obj.showNotification)
      ..writeByte(8)
      ..write(obj.hasOngoingTest)
      ..writeByte(10)
      ..write(obj.unansweredQuestions)
      ..writeByte(11)
      ..write(obj.apiPageCountAssessment)
      ..writeByte(12)
      ..write(obj.showLandingPage)
      ..writeByte(13)
      ..write(obj.hasEmailVerified);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SessionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
