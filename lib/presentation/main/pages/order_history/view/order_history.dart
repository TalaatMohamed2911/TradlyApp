import 'package:flutter/material.dart';

import '../../../../resourcses/colors_manager.dart';
import '../../../../resourcses/strings_manager.dart';

class OrderHistory extends StatefulWidget {
  const OrderHistory({super.key});

  @override
  State<OrderHistory> createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        AppStrings.orderHistory,
        style: TextStyle(color: ColorManager.black),
      ),
    );
  }
}
