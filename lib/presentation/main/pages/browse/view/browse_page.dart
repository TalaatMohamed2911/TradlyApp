import 'package:flutter/material.dart';
import 'package:tradly/presentation/resourcses/values_manager.dart';
import '../../../../resourcses/colors_manager.dart';

class BrowsePage extends StatefulWidget {
  const BrowsePage({super.key});

  @override
  State<BrowsePage> createState() => _BrowsePageState();
}

class _BrowsePageState extends State<BrowsePage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          color: ColorManager.primary,
          padding: EdgeInsets.all(AppPadding.p18),
          child: TextFormField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search_rounded),
              hintText: "Search Product",
              hintStyle: Theme.of(context).textTheme.bodySmall,
              filled: true,
              fillColor: ColorManager.white,
            ),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 14),
            height: 70,
            color: ColorManager.primary,
            child: Row(
              spacing: 6,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton.icon(
                  onPressed: () {},
                  label: Text('Sort by'),
                  icon: Icon(Icons.sort),
                ),
                OutlinedButton.icon(
                  onPressed: () {},
                  label: Text('Location'),
                  icon: Icon(Icons.location_pin),
                ),
                OutlinedButton.icon(
                  onPressed: () {},
                  label: Text('Category'),
                  icon: Icon(Icons.category),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
