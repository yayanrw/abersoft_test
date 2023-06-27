import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import '../../index.dart';

@immutable
class UserCredentialsPreference {

  const UserCredentialsPreference({
    required this.isLoggedIn,
    this.token,
  });

  final bool isLoggedIn;
  final String? token;

  factory UserCredentialsPreference.fromJson(Map<String,dynamic> json) => UserCredentialsPreference(
    isLoggedIn: json['is_logged_in'] as bool,
    token: json['token']?.toString()
  );
  
  Map<String, dynamic> toJson() => {
    'is_logged_in': isLoggedIn,
    'token': token
  };

  UserCredentialsPreference clone() => UserCredentialsPreference(
    isLoggedIn: isLoggedIn,
    token: token
  );


  UserCredentialsPreference copyWith({
    bool? isLoggedIn,
    Optional<String?>? token
  }) => UserCredentialsPreference(
    isLoggedIn: isLoggedIn ?? this.isLoggedIn,
    token: checkOptional(token, () => this.token),
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is UserCredentialsPreference && isLoggedIn == other.isLoggedIn && token == other.token;

  @override
  int get hashCode => isLoggedIn.hashCode ^ token.hashCode;
}
