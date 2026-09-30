import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tradly/presentation/resourcses/assets_manager.dart';
import 'package:tradly/presentation/resourcses/values_manager.dart';

class CardView extends StatelessWidget {
  const CardView({
    super.key,
    required this.image,
    required this.name,
    required this.onTap,
  });
  final String image;
  final String name;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 160,
        height: 200,
        child: Card(
          elevation: AppSize.s1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                ),
                height: 127,
                width: double.infinity,
                child: Image.network(image, fit: BoxFit.contain),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: AppPadding.p12,
                  top: AppPadding.p12,
                ),
                child: Text(name, style: Theme.of(context).textTheme.bodySmall),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: AppPadding.p12),
                  child: Row(
                    children: [
                      SvgPicture.asset(ImageAssets.tAvatar),
                      Text(
                        " Tradly \t \t \t \t \t",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Text(
                        "26\$",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
