class SignupReqParams {
  final String email;
  final String phoneNumber;
  final String password;
  String? deviceId;

  SignupReqParams({
    required this.email,
    required this.phoneNumber,
    required this.password,
    this.deviceId,
  });

  Map<String,dynamic> toMap() {
    return <String,dynamic>{
      'email': email,
      'phoneNumber': phoneNumber,
      'password': password,
      'deviceId': deviceId??"",
    };
  }
}
