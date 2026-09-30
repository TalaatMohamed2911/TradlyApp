import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tradly/presentation/resourcses/colors_manager.dart';
import 'package:tradly/presentation/resourcses/values_manager.dart';

class StoreToFollowWidgets extends StatelessWidget {
  final Widget child;
  const StoreToFollowWidgets({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Stack(
        children: [
          Container(
            alignment: AlignmentGeometry.topStart,
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(color: ColorManager.primary),
            child: Padding(
              padding: const EdgeInsets.only(
                top: AppPadding.p16,
                left: AppPadding.p16,
                right: AppPadding.p12,
                bottom: AppPadding.p12,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Store to follow".tr(),
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: ColorManager.white,
                    ),
                  ),
                  SizedBox(
                    width: 95,
                    height: 25,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorManager.white,
                      ),
                      onPressed: () {},
                      child: Text(
                        "View all".tr(),
                        style: Theme.of(context).textTheme.headlineSmall
                            ?.copyWith(color: ColorManager.lightPrimary),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(top: 56, left: 0, right: 0, child: child),
        ],
      ),
    );
  }
}
