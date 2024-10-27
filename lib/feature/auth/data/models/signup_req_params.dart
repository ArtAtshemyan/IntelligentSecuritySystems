class SignupReqParams {
  final String email;
  final String phoneNumber;
  final String password;

  SignupReqParams({
    required this.email,
    required this.phoneNumber,
    required this.password,
  });

  Map<String,dynamic> toMap() {
    return <String,dynamic>{
      'email': email,
      'phone': phoneNumber,
      'password': password,
    };
  }
}
