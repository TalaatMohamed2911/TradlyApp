import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tradly/features/products/domain/entity/product.dart';
import 'package:tradly/features/cart/presentation/provider/cart_provider.dart';
import 'package:tradly/features/wishlist/presentation/provider/wishlist_provider.dart';
import 'package:tradly/presentation/resourcses/assets_manager.dart';
import 'package:tradly/presentation/resourcses/colors_manager.dart';
import 'package:tradly/presentation/resourcses/values_manager.dart';

class ProductDetailsBody extends ConsumerWidget {
  final Product product;
  const ProductDetailsBody({super.key, required this.product});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isFavourite = ref.watch(
      wishListProvider.select(
        (products) => products.any((item) => item.id == product.id),
      ),
    );
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: ColorManager.primary),
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.share, color: ColorManager.primary),
          ),
          IconButton(
            onPressed: () {
              ref.read(wishListProvider.notifier).toogleFavourite(product);
            },
            icon: Icon(
              isFavourite ? Icons.favorite : Icons.favorite_border,
              color: ColorManager.primary,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.menu, color: ColorManager.primary),
          ),
        ],
      ),

      body: Container(
        constraints: BoxConstraints.expand(),
        color: ColorManager.white,
        child: Column(
          children: [
            SingleChildScrollView(child: _getItems(product, context)),
            Container(
              width: double.infinity,
              height: 50,
              margin: EdgeInsets.symmetric(
                horizontal: AppMargin.m28,
                vertical: AppMargin.m8,
              ),
              child: ElevatedButton(
                onPressed: () {
                  ref.read(cartProvider.notifier).addToCart(product);
                },
                child: Text(
                  "Add to Cart",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getItems(Product? productDetails, BuildContext context) {
    if (productDetails != null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Image.network(
              productDetails.thumbnail,
              fit: BoxFit.contain,
              width: double.infinity,
              height: 250,
            ),
          ),
          ListTile(
            title: Text(productDetails.title),
            subtitle: Row(
              children: [
                Text((productDetails.price * 0.5).toString()),
                SizedBox(width: 18),
                Text("\$ ${productDetails.price} 50% off "),
              ],
            ),
          ),
          Container(height: 4, color: const Color.fromARGB(255, 138, 176, 196)),
          Container(
            height: 50,
            alignment: AlignmentGeometry.center,
            child: ListTile(
              leading: SvgPicture.asset(ImageAssets.tAvatar),
              title: Text(productDetails.title),
              trailing: TextButton(onPressed: () {}, child: Text("follow")),
            ),
          ),
          Container(height: 4, color: const Color.fromARGB(255, 138, 176, 196)),

          _getSection("About"),
          _getInfoText(productDetails.description, context),
          _getSection("Details"),
          _getInfoText(productDetails.description, context),
        ],
      );
    }
    return Container();
  }

  Widget _getSection(String title) {
    return Padding(
      padding: EdgeInsets.only(
        top: AppPadding.p12,
        left: AppPadding.p12,
        right: AppPadding.p12,
        bottom: AppPadding.p4,
      ),
      child: Text(title, style: TextStyle(color: Colors.black)),
    );
  }

  Widget _getInfoText(String info, BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppPadding.p12),
      child: Text(info, style: Theme.of(context).textTheme.bodySmall),
    );
  }
}
