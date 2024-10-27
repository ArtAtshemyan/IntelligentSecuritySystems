class VerificationReqParams {
  final String email;
  final String phoneNumber;
  final String password;
  final String verificationConde;
  final String deviceId;
  final String deviceModel;

  VerificationReqParams({
    required this.email,
    required this.phoneNumber,
    required this.password,
    required this.deviceId,
    required this.verificationConde,
    required this.deviceModel
  });

  Map<String,dynamic> toMap() {
    return <String,dynamic>{
      'phone': phoneNumber,
      'email': email,
      'password': password,
      'code': verificationConde,
      'device_id': deviceId,
      'device_name': deviceId,
    };
  }

}