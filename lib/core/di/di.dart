import 'package:dio/dio.dart';
import 'package:tradly/core/utils/app_prefs.dart';
import 'package:tradly/core/network/test_api.dart';
import 'package:tradly/data/data_source/local_data_source.dart';
import 'package:tradly/core/network/app_api.dart';
import 'package:tradly/core/network/dio_factory.dart';
import 'package:tradly/features/authentication/data/datasource/authentication_data_source.dart';
import 'package:tradly/features/authentication/data/repository/authentication_repository_impl.dart';
import 'package:tradly/features/authentication/domain/repository/authentication_repository.dart';
import 'package:tradly/features/cart/data/data_source/cart_local_data_source.dart';
import 'package:tradly/features/cart/data/repository/cart_repository_impl.dart';
import 'package:tradly/features/cart/domain/repository/cart_repository.dart';
import 'package:tradly/features/products/data/data_source/products_data_source.dart';
import 'package:tradly/features/products/data/repository/products_repository_impl.dart';
import 'package:tradly/features/products/domain/usecase/get_category_products_usecase.dart';
import 'package:tradly/features/products/domain/repository/products_repository.dart';
import 'package:tradly/features/products/domain/usecase/get_product_details_usecase.dart';
import 'package:tradly/features/products/domain/usecase/get_products_usecase.dart';
import 'package:tradly/features/authentication/domain/usecase/reset_password_usecase.dart';
import 'package:tradly/features/authentication/domain/usecase/login_usecase.dart';
import 'package:tradly/features/authentication/domain/usecase/register_usecase.dart';
import 'package:tradly/features/products/domain/usecase/search_product_usecase.dart';
import 'package:tradly/features/authentication/presentation/provider/login_viewmodel.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tradly/features/authentication/presentation/provider/register_viewmodel.dart';
import 'package:tradly/features/wishlist/data/data_source/wishlist_local_data_source.dart';
import 'package:tradly/features/wishlist/data/repository/wishlist_repository_impl.dart';
import 'package:tradly/features/wishlist/domain/repository/wishlist_repository.dart';
import '../../features/authentication/presentation/provider/resetpassword_view_model.dart';

final GetIt instance = GetIt.instance;

Future<void> initAppModule() async {
  // Registering the AppPreferences class as a singleton instance
  final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
  instance.registerLazySingleton<SharedPreferences>(() => sharedPrefs);
  instance.registerLazySingleton<AppPreferences>(
    () => AppPreferences(instance<SharedPreferences>()),
  );

  instance.registerLazySingleton<DioFactory>(() => DioFactory(instance()));

  Dio dio = await instance<DioFactory>().getDio();
  instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));

  instance.registerLazySingleton<AppApi>(() => AppApi(dio));

  instance.registerLazySingleton<AuthenticationDataSource>(
    () => AuthenticationDataSourceImpl(instance<AppServiceClient>()),
  );

  instance.registerLazySingleton<AuthenticationRepository>(
    () => AuthenticationRepositoryImpl(instance()),
  );

  instance.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImpl());

  instance.registerLazySingleton<ProductsDataSource>(
    () => ProductsDataSourceImpl(instance()),
  );

  instance.registerLazySingleton<ProductsRepository>(
    () => ProductsRepositoryImpl(instance()),
  );

  instance.registerLazySingleton(
    () => GetProductsUseCase(instance<ProductsRepository>()),
  );

  instance.registerLazySingleton(
    () => GetProductDetailsUsecase(instance<ProductsRepository>()),
  );
  instance.registerLazySingleton(
    () => SearchProductUsecase(instance<ProductsRepository>()),
  );

  instance.registerLazySingleton(
    () => GetCategoryProductsUsecase(instance<ProductsRepository>()),
  );
  instance.registerLazySingleton<CartLocalDataSource>(
    () => CartLocalDataSource(),
  );
  instance.registerLazySingleton<CartRepository>(
    () => CartRepositoryImpl(instance()),
  );
  instance.registerLazySingleton<WishlistLocalDataSource>(
    () => WishlistLocalDataSource(),
  );
  instance.registerLazySingleton<WishlistRepository>(
    () => WishlistRepositoryImpl(instance()),
  );
}

void initLoginModule() {
  if (!GetIt.I.isRegistered<LoginUsecase>()) {
    instance.registerFactory<LoginUsecase>(() => LoginUsecase(instance()));
    instance.registerFactory<LoginViewModel>(() => LoginViewModel(instance()));
  }
}

void initResetPasswordModule() {
  if (!GetIt.I.isRegistered<ResetPasswordUsecase>()) {
    instance.registerFactory(() => ResetPasswordUsecase(instance()));
    instance.registerFactory(() => ResetPasswordViewModel(instance()));
  }
}

void initRegisterModule() {
  if (!GetIt.I.isRegistered<RegisterUsecase>()) {
    instance.registerFactory(() => RegisterUsecase(instance()));
    instance.registerFactory(() => RegisterViewModel(instance()));
  }
}
