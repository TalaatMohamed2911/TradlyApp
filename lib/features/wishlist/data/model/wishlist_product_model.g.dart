// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wishlist_product_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WishlistProductModelAdapter extends TypeAdapter<WishlistProductModel> {
  @override
  final typeId = 3;

  @override
  WishlistProductModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WishlistProductModel(
      id: (fields[0] as num).toInt(),
      title: fields[1] as String,
      price: (fields[2] as num).toDouble(),
      thumbnail: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, WishlistProductModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.price)
      ..writeByte(3)
      ..write(obj.thumbnail);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WishlistProductModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
