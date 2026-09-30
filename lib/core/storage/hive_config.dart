import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:tradly/core/di/di.dart';
import 'package:tradly/features/cart/data/data_source/cart_local_data_source.dart';
import 'package:tradly/features/cart/data/model/cart_item_model.dart';
import 'package:tradly/features/cart/data/model/cart_product_model.dart';

class HiveConfig {
  static final cartLocalDataSource = instance<CartLocalDataSource>();

  static Future<void> initHive() async {
    await Hive.initFlutter();

    Hive.registerAdapter(CartProductModelAdapter());
    Hive.registerAdapter(CartItemModelAdapter());
  }
}
