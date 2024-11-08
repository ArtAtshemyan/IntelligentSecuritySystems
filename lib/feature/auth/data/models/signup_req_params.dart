class SignupReqParams {
  final String email;
  final String phoneNumber;
  final String password;
  final String deviceOs;
  final String deviceToken;
  final String deviceId;
  final String deviceModel;

  SignupReqParams({
    required this.email,
    required this.phoneNumber,
    required this.password,
    required this.deviceOs,
    required this.deviceToken,
    required this.deviceId,
    required this.deviceModel
  });

  Map<String,dynamic> toMap() {
    return <String,dynamic>{
      'email': email,
      'phone': phoneNumber,
      'password': password,
      'device_name': deviceModel,
      'device_id': deviceId,
      'device_os': deviceOs,
      'device_token': deviceToken
    };
  }
}
