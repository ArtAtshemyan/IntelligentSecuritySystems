class VerificationReqParams {
  final String email;
  final String phoneNumber;
  final String password;
  final String verificationConde;
  final String deviceId;

  VerificationReqParams({
    required this.email,
    required this.phoneNumber,
    required this.password,
    required this.deviceId,
    required this.verificationConde
  });

  Map<String,dynamic> toMap() {
    return <String,dynamic>{
      'email': email,
      'phoneNumber': phoneNumber,
      'password': password,
      'deviceId': deviceId,
      'verificationCode': verificationConde
    };
  }

}