class SignInReqParams {
  final String email;
  final String password;
  final String deviceId;

  SignInReqParams({
    required this.email,
    required this.password,
    required this.deviceId,
  });

  Map<String,dynamic> toMap() {
    return <String,dynamic>{
      'email': email,
      'password': password,
      'deviceId': deviceId,
    };
  }
}
