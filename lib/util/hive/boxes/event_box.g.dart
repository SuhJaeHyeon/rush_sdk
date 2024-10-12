// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_box.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EventBoxMetaAdapter extends TypeAdapter<EventBoxMeta> {
  @override
  final int typeId = 0;

  @override
  EventBoxMeta read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EventBoxMeta(
      event: fields[0] as String,
      count: fields[1] as int,
      createdAt: fields[2] as DateTime,
      updatedAt: fields[3] as DateTime,
      history: (fields[4] as List).cast<EventBoxItem>(),
    );
  }

  @override
  void write(BinaryWriter writer, EventBoxMeta obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.event)
      ..writeByte(1)
      ..write(obj.count)
      ..writeByte(2)
      ..write(obj.createdAt)
      ..writeByte(3)
      ..write(obj.updatedAt)
      ..writeByte(4)
      ..write(obj.history);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EventBoxMetaAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class EventBoxItemAdapter extends TypeAdapter<EventBoxItem> {
  @override
  final int typeId = 1;

  @override
  EventBoxItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EventBoxItem(
      event: fields[0] as String,
      createdAt: fields[1] as DateTime,
      data: (fields[2] as Map?)?.cast<String, dynamic>(),
    );
  }

  @override
  void write(BinaryWriter writer, EventBoxItem obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.event)
      ..writeByte(1)
      ..write(obj.createdAt)
      ..writeByte(2)
      ..write(obj.data);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EventBoxItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
