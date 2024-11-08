import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppUrls {
  static final String baseUrl = dotenv.get('BASE_URL');
  static final signupEndpoint = '${baseUrl}auth/register';
  static final signInEndpoint = '${baseUrl}auth/login';
  static final verificationEndpoint = '${baseUrl}auth/register/finalize';
  static final buildingsEndpoint = '${baseUrl}user/buildings';
  static final logOutEndpoint = '${baseUrl}auth/logout';
}