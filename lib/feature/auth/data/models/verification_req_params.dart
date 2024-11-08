class VerificationReqParams {
  final String email;
  final String phoneNumber;
  final String password;
  final String verificationConde;
  final String deviceId;
  final String deviceModel;
  final String deviceOs;
  final String deviceToken;


  VerificationReqParams({
    required this.email,
    required this.phoneNumber,
    required this.password,
    required this.verificationConde,
    required this.deviceId,
    required this.deviceModel,
    required this.deviceToken,
    required this.deviceOs
  });

  Map<String,dynamic> toMap() {
    return <String,dynamic>{
      'phone': phoneNumber,
      'email': email,
      'password': password,
      'code': verificationConde,
      'device_name': deviceModel,
      'device_id': deviceId,
      'device_os': deviceOs,
      'device_token': deviceToken
    };
  }

}