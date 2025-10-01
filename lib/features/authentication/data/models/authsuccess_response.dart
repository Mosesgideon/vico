class AuthSuccessResponse {
  AuthSuccessResponse({
    required this.status,
    required this.token,
    required this.data,
  });

  final String? status;
  final String? token;
  final Data? data;

  AuthSuccessResponse copyWith({
    String? status,
    String? token,
    Data? data,
  }) {
    return AuthSuccessResponse(
      status: status ?? this.status,
      token: token ?? this.token,
      data: data ?? this.data,
    );
  }

  factory AuthSuccessResponse.fromJson(Map<String, dynamic> json){
    return AuthSuccessResponse(
      status: json["status"],
      token: json["token"],
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "status": status,
    "token": token,
    "data": data?.toJson(),
  };

  @override
  String toString(){
    return "$status, $token, $data, ";
  }
}

class Data {
  Data({
    required this.user,
  });

  final VicoUser? user;

  Data copyWith({
    VicoUser? user,
  }) {
    return Data(
      user: user ?? this.user,
    );
  }

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      user: json["user"] == null ? null : VicoUser.fromJson(json["user"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "user": user?.toJson(),
  };

  @override
  String toString(){
    return "$user, ";
  }
}

class VicoUser {
  VicoUser({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.passwordResetToken,
    required this.passwordChangedAt,
    required this.accountId,
    required this.referralId,
    required this.role,
    required this.status,
    required this.photo,
    required this.passwordResetExpires,
    required this.createdAt,
    required this.updatedAt,
    required this.wallet,
  });

  final int? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phone;
  final dynamic passwordResetToken;
  final dynamic passwordChangedAt;
  final dynamic accountId;
  final dynamic referralId;
  final String? role;
  final String? status;
  final String? photo;
  final dynamic passwordResetExpires;
  final dynamic createdAt;
  final dynamic updatedAt;
  final dynamic wallet;

  VicoUser copyWith({
    int? id,
    String? firstName,
    String? lastName,
    String? email,
    String? phone,
    dynamic? passwordResetToken,
    dynamic? passwordChangedAt,
    dynamic? accountId,
    dynamic? referralId,
    String? role,
    String? status,
    String? photo,
    dynamic? passwordResetExpires,
    dynamic? createdAt,
    dynamic? updatedAt,
    dynamic? wallet,
  }) {
    return VicoUser(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      passwordResetToken: passwordResetToken ?? this.passwordResetToken,
      passwordChangedAt: passwordChangedAt ?? this.passwordChangedAt,
      accountId: accountId ?? this.accountId,
      referralId: referralId ?? this.referralId,
      role: role ?? this.role,
      status: status ?? this.status,
      photo: photo ?? this.photo,
      passwordResetExpires: passwordResetExpires ?? this.passwordResetExpires,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      wallet: wallet ?? this.wallet,
    );
  }

  factory VicoUser.fromJson(Map<String, dynamic> json){
    return VicoUser(
      id: json["id"],
      firstName: json["firstName"],
      lastName: json["lastName"],
      email: json["email"],
      phone: json["phone"],
      passwordResetToken: json["passwordResetToken"],
      passwordChangedAt: json["passwordChangedAt"],
      accountId: json["accountId"],
      referralId: json["referralId"],
      role: json["role"],
      status: json["status"],
      photo: json["photo"],
      passwordResetExpires: json["passwordResetExpires"],
      createdAt: json["createdAt"],
      updatedAt: json["updatedAt"],
      wallet: json["wallet"],
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "firstName": firstName,
    "lastName": lastName,
    "email": email,
    "phone": phone,
    "passwordResetToken": passwordResetToken,
    "passwordChangedAt": passwordChangedAt,
    "accountId": accountId,
    "referralId": referralId,
    "role": role,
    "status": status,
    "photo": photo,
    "passwordResetExpires": passwordResetExpires,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "wallet": wallet,
  };

  @override
  String toString(){
    return "$id, $firstName, $lastName, $email, $phone, $passwordResetToken, $passwordChangedAt, $accountId, $referralId, $role, $status, $photo, $passwordResetExpires, $createdAt, $updatedAt, $wallet, ";
  }
}
