import 'package:tradly/core/utils/constants.dart';
import 'package:tradly/core/utils/extenstions.dart';
import 'package:tradly/features/authentication/domain/entity/user.dart';
import '../model/responses.dart';

extension CustomerResponseMapper on CustomerResponse? {
  Customer toDomain() {
    return Customer(
      this?.id.orEmpty() ?? AppConstants.empty,
      this?.name.orEmpty() ?? AppConstants.empty,
      this?.age.orZero() ?? AppConstants.zero,
      this?.phone.orEmpty() ?? AppConstants.empty,
    );
  }
}

extension AuthenticationResponseMapper on AuthenticationResponse? {
  Authentication toDomain() {
    return Authentication(this?.customer.toDomain());
  }
}

extension ResetPasswordResponseMapper on ResetPasswordResponse? {
  ResetPassword toDomain() {
    return ResetPassword(
      this?.support.orEmpty() ?? AppConstants.empty,
      this?.contactUs.orEmpty() ?? AppConstants.empty,
    );
  }
}
