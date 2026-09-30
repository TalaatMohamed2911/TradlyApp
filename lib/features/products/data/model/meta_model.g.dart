// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meta_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MetaModel _$MetaModelFromJson(Map<String, dynamic> json) => MetaModel(
  createdAt: json['createdAt'] as String,
  updatedAt: json['updatedAt'] as String,
  barcode: json['barcode'] as String,
  qrCode: json['qrCode'] as String,
);

Map<String, dynamic> _$MetaModelToJson(MetaModel instance) => <String, dynamic>{
  'createdAt': instance.createdAt,
  'updatedAt': instance.updatedAt,
  'barcode': instance.barcode,
  'qrCode': instance.qrCode,
};
