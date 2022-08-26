// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_save_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WordsLocalSaveModelAdapter extends TypeAdapter<WordsLocalSaveModel> {
  @override
  final int typeId = 1;

  @override
  WordsLocalSaveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WordsLocalSaveModel(
      englishWord: fields[2] as String,
      turkishWord: fields[3] as String,
      selected: fields[6] as bool?,
      lvl: fields[5] as String,
      pronunciation: fields[4] as String,
      id: fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, WordsLocalSaveModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.englishWord)
      ..writeByte(3)
      ..write(obj.turkishWord)
      ..writeByte(4)
      ..write(obj.pronunciation)
      ..writeByte(5)
      ..write(obj.lvl)
      ..writeByte(6)
      ..write(obj.selected);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WordsLocalSaveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class StudyWordsSaveModelAdapter extends TypeAdapter<StudyWordsSaveModel> {
  @override
  final int typeId = 2;

  @override
  StudyWordsSaveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StudyWordsSaveModel(
      englishWord: fields[2] as String,
      turkishWord: fields[3] as String,
      lvl: fields[5] as String,
      pronunciation: fields[4] as String,
      selected: fields[6] as bool?,
      id: fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, StudyWordsSaveModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.englishWord)
      ..writeByte(3)
      ..write(obj.turkishWord)
      ..writeByte(4)
      ..write(obj.pronunciation)
      ..writeByte(5)
      ..write(obj.lvl)
      ..writeByte(6)
      ..write(obj.selected);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StudyWordsSaveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CounterModelAdapter extends TypeAdapter<CounterModel> {
  @override
  final int typeId = 3;

  @override
  CounterModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CounterModel(
      name: fields[2] as String,
      num: fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, CounterModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(1)
      ..write(obj.num)
      ..writeByte(2)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CounterModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
