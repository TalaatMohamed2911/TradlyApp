import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:tradly/core/di/di.dart';
import 'package:tradly/features/cart/data/data_source/cart_local_data_source.dart';

class HiveConfig {
  static final cartLocalDataSource = instance<CartLocalDataSource>();

  static Future<void> initHive() async {
    await Hive.initFlutter();
    await cartLocalDataSource.init();
  }
}
