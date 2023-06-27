import 'package:abersoft_test/app/data/datasources/index.dart';
import 'package:equatable/equatable.dart';

class UserCredentials extends Equatable {
  final bool isLoggedIn;
  final String token;

  const UserCredentials({
    required this.isLoggedIn,
    required this.token,
  });

  @override
  List<Object?> get props => [isLoggedIn, token];
}

extension UserCredentialsPreferenceExt on UserCredentialsPreference {
  UserCredentials toEntity() {
    return UserCredentials(isLoggedIn: isLoggedIn, token: token ?? "N/A");
  }
}

extension UserCredentialsExt on UserCredentials {
  UserCredentialsPreference toPreference() {
    return UserCredentialsPreference(isLoggedIn: isLoggedIn, token: token);
  }
}
