import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/shared_perfereces_keys.dart';

class TokenInterceptor extends Interceptor {
  final Dio dio;
  final Logger logger = Logger(printer: PrettyPrinter(methodCount: 0, colors: true, printEmojis: true));

  TokenInterceptor(this.dio);

  @override
  Future onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    SharedPreferences sharedPreferences =
    await SharedPreferences.getInstance();
    String? accessToken = sharedPreferences.getString(SharedPreferencesKeys.accessToken,);
    options.headers["Authorization"] = "Bearer $accessToken";
    logger.i('${options.method} request ==> ${options.uri}\nAuthorization: Bearer $accessToken');
    return handler.next(options);
  }

  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      logger.e('Unauthorized (401) error: Attempting token refresh.');
      try {
        String refreshToken = 'current_refresh_token';
        Response refreshResponse = await dio.post(
          'https://api.example.com/refresh',
          data: {'refresh_token': refreshToken},
        );

        if (refreshResponse.statusCode == 200) {
          String newAccessToken = refreshResponse.data['data']['token'];
          dio.options.headers["Authorization"] = "Bearer $newAccessToken";

          final retryOptions = err.requestOptions;
          retryOptions.headers["Authorization"] = "Bearer $newAccessToken";
          final retryResponse = await dio.request(
            retryOptions.path,
            options: Options(
              method: retryOptions.method,
              headers: retryOptions.headers,
            ),
          );

          logger.i('Token refreshed successfully and request retried.');
          return handler.resolve(retryResponse);
        } else {
          logger.e('Token refresh failed.');
          return handler.reject(DioException(
              requestOptions: err.requestOptions,
              error: 'Failed to refresh token'));
        }
      } catch (e) {
        logger.e('Token refresh failed with error: $e');
        return handler.reject(DioException(
            requestOptions: err.requestOptions,
            error: 'Failed to refresh token'));
      }
    } else {
      logger.e('Request failed with error: ${err.message}');
      return handler.next(err);
    }
  }
}
