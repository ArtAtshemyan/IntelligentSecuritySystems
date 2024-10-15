import 'package:dio/dio.dart';

class TokenInterceptor extends Interceptor {
  final Dio dio;

  TokenInterceptor(this.dio);

  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    // Todo: add access token to the header before sending each request
    String accessToken = 'current_access_token';
    options.headers["Authorization"] = "Bearer $accessToken";
    return handler.next(options);
  }

  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    //Todo: if the response error is 401 (no authorized)
    if (err.response?.statusCode == 401) {
      //Todo: using refresh token ask for new access token
      try {
        String refreshToken = 'current_refresh_token';
        Response refreshResponse =
        await dio.post('https://api.example.com/refresh', data: {
          'refresh_token': refreshToken,
        });

        if (refreshResponse.statusCode == 200) {
          //Todo: getting new access token
          String newAccessToken = refreshResponse.data['access_token'];

          //Todo: update access token from the header for all coming requests
          dio.options.headers["Authorization"] = "Bearer $newAccessToken";

          //Todo: resend the failed request due to the token expiration
          final retryOptions = err.requestOptions;
          retryOptions.headers["Authorization"] = "Bearer $newAccessToken";
          final retryResponse = await dio.request(
            retryOptions.path,
            options: Options(
              method: retryOptions.method,
              headers: retryOptions.headers,
            ),
          );
          //Todo: return the new response
          return handler.resolve(retryResponse);
        } else {
          return handler.reject(DioException(
              requestOptions: err.requestOptions,
              error: 'Failed to refresh token'));
        }
      } catch (e) {
        return handler.reject(DioException(
            requestOptions: err.requestOptions,
            error: 'Failed to refresh token'));
      }
    }
    //Todo: Complete error handling if you do not have a 401
    return handler.next(err);
  }
}