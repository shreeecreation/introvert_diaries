import 'package:introvertdiaries/src/core/core.dart';
import 'package:introvertdiaries/src/features/auth/auth.dart';

abstract class AuthenticationRemoteSource {
  EitherResponse<ApiResponse<LoginResponse>> login(Map<String, dynamic> values);

}


@LazySingleton(as: AuthenticationRemoteSource)
class AuthenticationRemoteSourceImpl extends BaseRemoteSource
    implements AuthenticationRemoteSource {
  AuthenticationRemoteSourceImpl(super._dio, super._networkInfo);

  @override
  EitherResponse<ApiResponse<LoginResponse>> login(
      Map<String,dynamic>requests) async {
        final response = await networkRequest(
      request: (dio) async {
        final responseData =
            await dio.post(ApiEndpoints.login, data: requests);
        return ApiResponse(
          success: responseData.data?['success'] as bool,
          data: LoginResponse.fromJson(responseData.data?['data'] as Map<String, dynamic>),
          message: responseData.data?['message'] as String);
    });
    return response;

  }}