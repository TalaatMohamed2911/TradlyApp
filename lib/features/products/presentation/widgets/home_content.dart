import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tradly/features/products/domain/entity/product.dart';
import 'package:tradly/presentation/common/widgets/card_view.dart';
import 'package:tradly/presentation/common/widgets/categories_widget.dart';
import 'package:tradly/presentation/common/widgets/store_to_follow.dart';
import 'package:tradly/presentation/common/widgets/store_to_follow_card.dart';
import 'package:tradly/presentation/common/widgets/title_with_seeall_btn.dart';
import 'package:tradly/presentation/main/pages/browse/view/search.dart';
import 'package:tradly/features/products/presentation/screen/product_details_screen.dart';
import 'package:tradly/presentation/main/pages/product/view/product_view.dart';
import 'package:tradly/presentation/resourcses/colors_manager.dart';
import 'package:tradly/presentation/resourcses/strings_manager.dart';
import 'package:tradly/presentation/resourcses/values_manager.dart';

class HomeContent extends StatelessWidget {
  final List<Product> homeData;
  const HomeContent({super.key, required this.homeData});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: ColorManager.primary,
            padding: EdgeInsets.all(AppPadding.p18),
            child: TextFormField(
              readOnly: true,
              onTap: () => Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (context) => SearchScreen())),

              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search_rounded),
                hintText: "Search Product",
                filled: true,
                fillColor: ColorManager.white,
                hintStyle: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ),
          _getBannerWidget(homeData),
          _getCategoryWidget(homeData),
          TitleWithSeeAllBtn(
            title: AppStrings.newProduct.tr(),
            btnTitle: AppStrings.seeAll.tr(),
            btnPress: () {},
          ),
          _getNewProductWidget(homeData),
          TitleWithSeeAllBtn(
            title: AppStrings.popularProduct.tr(),
            btnTitle: AppStrings.seeAll.tr(),
            btnPress: () {},
          ),
          _getPopularProductWidget(homeData),
          SizedBox(height: 20),
          StoreToFollowWidgets(child: _getStoreToFollowCard(homeData)),
        ],
      ),
    );
  }

  Widget _getBannerWidget(List<Product>? banners) {
    if (banners != null) {
      return Padding(
        padding: const EdgeInsets.only(
          top: AppPadding.p4,
          bottom: AppPadding.p8,
        ),
        child: CarouselSlider(
          items: banners.map((banner) {
            return SizedBox(
              width: double.infinity,
              child: Card(
                elevation: AppSize.s1,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSize.s12),
                  side: BorderSide(
                    color: ColorManager.lightPrimary,
                    width: AppSize.s1,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(AppSize.s12),
                  child: Image.network(banner.images[0], fit: BoxFit.fill),
                ),
              ),
            );
          }).toList(),
          options: CarouselOptions(
            autoPlay: true,
            enableInfiniteScroll: true,
            height: AppSize.s200,
            enlargeCenterPage: true,
          ),
        ),
      );
    } else {
      return Container();
    }
  }

  Widget _getCategoryWidget(List<Product>? categories) {
    if (categories != null) {
      return SizedBox(
        width: double.infinity,
        height: 196,
        child: GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          primary: false,
          itemCount: categories.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 1.5,
            mainAxisSpacing: 1.5,
          ),
          itemBuilder: (context, index) => CategoriesWidget(
            category: categories[index].category,
            image: categories[index].thumbnail,
          ),
        ),
      );
    } else {
      return Container();
    }
  }

  Widget _getNewProductWidget(List<Product>? newProduct) {
    if (newProduct != null) {
      return SizedBox(
        width: double.infinity,
        height: 200,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: AppPadding.p12),
          itemCount: newProduct.length,
          itemBuilder: (context, index) => CardView(
            image: newProduct[index].thumbnail,
            name: newProduct[index].title,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) =>
                      ProductDetailsScreen(productId: homeData[index].id),
                ),
              );
            },
          ),
        ),
      );
    } else {
      return Container();
    }
  }

  Widget _getPopularProductWidget(List<Product>? popularProduct) {
    if (popularProduct != null) {
      return SizedBox(
        width: double.infinity,
        height: 200,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: AppPadding.p12),
          itemCount: popularProduct.length,
          itemBuilder: (context, index) => CardView(
            image: popularProduct[index].thumbnail,
            name: popularProduct[index].title,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) =>
                      ProductView(title: popularProduct[index].title),
                ),
              );
            },
          ),
        ),
      );
    } else {
      return Container();
    }
  }

  Widget _getStoreToFollowCard(List<Product>? storeToFollow) {
    if (storeToFollow != null) {
      return SizedBox(
        height: 240,
        child: ListView.builder(
          itemCount: storeToFollow.length,
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: AppPadding.p12),
          itemBuilder: (context, index) => StoreToFollowCard(
            image: storeToFollow[index].thumbnail,
            title: storeToFollow[index].title,
          ),
        ),
      );
    } else {
      return Container();
    }
  }
}
