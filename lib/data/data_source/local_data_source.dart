import 'package:tradly/core/error/error_handler.dart';
import 'package:tradly/features/products/data/model/product_model.dart';
import 'package:tradly/features/products/data/model/products_response_model.dart';

const cacheHomeKey = "cacheHomeKey";
const cacheHomeInterval = 60 * 1000;

const cacheProductDetailsKey = "cacheProductDetailsKey";
const cacheProductDetailsInterval = 60 * 1000;

abstract class LocalDataSource {
  Future<ProductsResponseModel> getHomeData();

  Future<void> saveHomeToCache(ProductsResponseModel homeResponse);

  Future<ProductModel> getProductDetails();

  Future<void> saveProductDetailsToCache(ProductModel productDetails);

  void clearCache();

  void removeFromCache(String key);
}

class LocalDataSourceImpl implements LocalDataSource {
  Map<String, CachedItems> cacheMap = {};

  @override
  Future<ProductsResponseModel> getHomeData() async {
    CachedItems? cachedItems = cacheMap[cacheHomeKey];
    if (cachedItems != null && cachedItems.isValid(cacheHomeInterval)) {
      // return the response from cache
      return cachedItems.data;
    } else {
      // return an error that cache is not there or its not valid
      throw ErrorHandler.handle(DataSource.cacheError);
    }
  }

  @override
  Future<void> saveHomeToCache(ProductsResponseModel homeResponse) async {
    cacheMap[cacheHomeKey] = CachedItems(homeResponse);
  }

  @override
  void clearCache() {
    cacheMap.clear();
  }

  @override
  void removeFromCache(String key) {
    cacheMap.remove(key);
  }

  @override
  Future<ProductModel> getProductDetails() async {
    CachedItems? cachedItems = cacheMap[cacheProductDetailsKey];
    if (cachedItems != null &&
        cachedItems.isValid(cacheProductDetailsInterval)) {
      return cachedItems.data;
    } else {
      throw ErrorHandler.handle(DataSource.cacheError);
    }
  }

  @override
  Future<void> saveProductDetailsToCache(
    ProductModel productDetailsResponse,
  ) async {
    cacheMap[cacheProductDetailsKey] = CachedItems(productDetailsResponse);
  }
}

class CachedItems {
  dynamic data;
  int cacheTime = DateTime.now().millisecondsSinceEpoch;

  CachedItems(this.data);
}

extension CachedItemsExtension on CachedItems {
  bool isValid(int expirationTimeInMillis) {
    int currentTimeInMillis = DateTime.now().millisecondsSinceEpoch;
    bool isValid = currentTimeInMillis - cacheTime <= expirationTimeInMillis;
    // expirationTimeInMillis -> 60 sec
    // currentTimeInMillis -> 1:00:00
    // cacheTime -> 12:59:30
    // valid -> until 1:00:30
    return isValid;
  }
}
