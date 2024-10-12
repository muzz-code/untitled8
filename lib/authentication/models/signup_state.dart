class SignupState {
  String firstName;
  String lastName;
  String phoneNumber;
  String email;
  String password;
  String? referralCode;

  SignupState(
      {this.email = "",
      this.firstName = "",
      this.lastName = "",
      this.phoneNumber = "",
      this.password = "",
      this.referralCode});

  SignupState copyWith({
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? email,
    String? password,
    String? referralCode,
  }) {
    return SignupState(
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        email: email ?? this.email,
        password: password ?? this.password,
        referralCode: referralCode ?? this.referralCode);
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'firstName': firstName,
      'lastName': lastName,
      'phoneNumber': phoneNumber,
      'referralCode': referralCode,
    };
  }

  factory SignupState.fromJson(Map<String, dynamic> json) {
    return SignupState(
      email: json['email'] ?? "",
      password: json['password'] ?? "",
      firstName: json['firstName'] ?? "",
      lastName: json['lastName'] ?? "",
      phoneNumber: json['phoneNumber'] ?? "",
      referralCode: json['referralCode'] ?? "",
    );
  }
}
