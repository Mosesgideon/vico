class SignUpPayload {
  SignUpPayload({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.password,
    required this.passwordConfirm,
  });

  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phone;
  final String? password;
  final String? passwordConfirm;

  SignUpPayload copyWith({
    String? firstName,
    String? lastName,
    String? email,
    String? phone,
    String? password,
    String? passwordConfirm,
  }) {
    return SignUpPayload(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      password: password ?? this.password,
      passwordConfirm: passwordConfirm ?? this.passwordConfirm,
    );
  }

  factory SignUpPayload.fromJson(Map<String, dynamic> json){
    return SignUpPayload(
      firstName: json["firstName"],
      lastName: json["lastName"],
      email: json["email"],
      phone: json["phone"],
      password: json["password"],
      passwordConfirm: json["passwordConfirm"],
    );
  }

  Map<String, dynamic> toJson() => {
    "firstName": firstName,
    "lastName": lastName,
    "email": email,
    "phone": phone,
    "password": password,
    "passwordConfirm": passwordConfirm,
  };

  @override
  String toString(){
    return "$firstName, $lastName, $email, $phone, $password, $passwordConfirm, ";
  }
}
