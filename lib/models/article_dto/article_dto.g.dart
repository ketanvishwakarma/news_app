// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ArticleDtoAdapter extends TypeAdapter<ArticleDto> {
  @override
  final int typeId = 0;

  @override
  ArticleDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ArticleDto(
      sourceName: fields[0] as String,
      title: fields[1] as String,
      url: fields[2] as String,
      publishedAt: fields[3] as String,
      description: fields[4] as String?,
      author: fields[5] as String?,
      urlToImage: fields[6] as String?,
      content: fields[7] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ArticleDto obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.sourceName)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.url)
      ..writeByte(3)
      ..write(obj.publishedAt)
      ..writeByte(4)
      ..write(obj.description)
      ..writeByte(5)
      ..write(obj.author)
      ..writeByte(6)
      ..write(obj.urlToImage)
      ..writeByte(7)
      ..write(obj.content);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ArticleDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
