import 'package:flutter/foundation.dart';


@immutable
class LoginRequest {

  const LoginRequest({
    required this.username,
    required this.password,
  });

  final String username;
  final String password;

  factory LoginRequest.fromJson(Map<String,dynamic> json) => LoginRequest(
    username: json['username'].toString(),
    password: json['password'].toString()
  );
  
  Map<String, dynamic> toJson() => {
    'username': username,
    'password': password
  };

  LoginRequest clone() => LoginRequest(
    username: username,
    password: password
  );


  LoginRequest copyWith({
    String? username,
    String? password
  }) => LoginRequest(
    username: username ?? this.username,
    password: password ?? this.password,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is LoginRequest && username == other.username && password == other.password;

  @override
  int get hashCode => username.hashCode ^ password.hashCode;
}
