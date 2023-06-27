import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import '../index.dart';

@immutable
class LoginResponse {

  const LoginResponse({
    this.token,
  });

  final String? token;

  factory LoginResponse.fromJson(Map<String,dynamic> json) => LoginResponse(
    token: json['token']?.toString()
  );
  
  Map<String, dynamic> toJson() => {
    'token': token
  };

  LoginResponse clone() => LoginResponse(
    token: token
  );


  LoginResponse copyWith({
    Optional<String?>? token
  }) => LoginResponse(
    token: checkOptional(token, () => this.token),
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is LoginResponse && token == other.token;

  @override
  int get hashCode => token.hashCode;
}
