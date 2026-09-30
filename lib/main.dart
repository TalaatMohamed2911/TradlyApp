import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tradly/core/storage/hive_config.dart';
import 'package:tradly/features/cart/data/data_source/cart_local_data_source.dart';
import 'package:tradly/presentation/resourcses/language_manager.dart';
import 'core/utils/app.dart';
import 'core/di/di.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await initAppModule();
  await HiveConfig.initHive();
  await instance<CartLocalDataSource>().init();
  runApp(
    ProviderScope(
      child: EasyLocalization(
        supportedLocales: [arabicLocale, englishLocale],
        path: localizationsPath,
        child: Phoenix(child: TradlyApp()),
      ),
    ),
  );
}
