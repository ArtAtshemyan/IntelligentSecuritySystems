class SignInReqParams {
  final String email;
  final String password;
  final String deviceOs;
  final String deviceToken;
  final String deviceId;
  final String deviceModel;

  SignInReqParams({
    required this.email,
    required this.password,
    required this.deviceId,
    required this.deviceModel,
    required this.deviceToken,
    required this.deviceOs,
  });

  Map<String,dynamic> toMap() {
    return <String,dynamic>{
      'email': email,
      'password': password,
      'device_id': deviceId,
      'device_name': deviceModel,
      'device_os': deviceOs,
      'device_token': deviceToken,
    };
  }
}
