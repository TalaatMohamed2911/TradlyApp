import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tradly/presentation/main/pages/store/store_view.dart';
import 'package:tradly/presentation/resourcses/values_manager.dart';

class StoreToFollowCard extends StatelessWidget {
  final String image;
  final String title;

  const StoreToFollowCard({
    super.key,
    required this.image,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160,
      height: 200,
      child: Card(
        elevation: 1,
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 85,
                  child: ClipRRect(
                    borderRadius: BorderRadiusGeometry.vertical(
                      top: Radius.circular(10),
                    ),
                    child: Image.network(image, fit: BoxFit.cover, width: 140),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: AppPadding.p40,
                    bottom: AppPadding.p14,
                  ),
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    log('Followed');
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => StoreView(title: title),
                      ),
                    );
                  },
                  child: Text(
                    "Follow",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
              ],
            ),
            Positioned(
              top: 48,
              left: 40,
              right: 40,
              child: CircleAvatar(
                foregroundImage: NetworkImage(image),
                radius: 35,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
