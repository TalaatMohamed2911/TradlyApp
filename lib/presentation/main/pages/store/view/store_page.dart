import 'package:flutter/material.dart';
import 'package:tradly/presentation/resourcses/colors_manager.dart';
import 'package:tradly/presentation/resourcses/strings_manager.dart';

class StorePage extends StatefulWidget {
  const StorePage({super.key});

  @override
  State<StorePage> createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        AppStrings.store,
        style: TextStyle(color: ColorManager.black),
      ),
    );
  }
}
