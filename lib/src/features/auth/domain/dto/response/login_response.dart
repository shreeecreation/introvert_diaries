class LoginResponse {
  final String phoneNumber;
  final String? email;
  final String country;

  LoginResponse({
    required this.phoneNumber,
    this.email,
    required this.country,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      phoneNumber: json['phoneNumber'] as String,
      email: json['email'] as String?,
      country: json['country'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'phoneNumber': phoneNumber,
      'email': email,
      'country': country,
    };
  }
}
