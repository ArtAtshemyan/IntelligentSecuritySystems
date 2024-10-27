class SignInReqParams {
  final String email;
  final String password;
  final String deviceId;
  final String deviceName;

  SignInReqParams({
    required this.email,
    required this.password,
    required this.deviceId,
    required this.deviceName,
  });

  Map<String,dynamic> toMap() {
    return <String,dynamic>{
      'email': email,
      'password': password,
      'device_id': deviceId,
      'device_name': deviceName,
    };
  }
}
