import 'package:gc/Features/Authentication/Data/Enum/enum.dart';

class AuthEntity {
  final AuthenticationProviders authProvider; // facebook, google,...
  final String email;
  final String? password;
  final String? name;
  final String? avatar;
  final String? authProviderId;

// همون مدله که قراره چند جا استفاده بشه برای همین میبرم توی لایه دیتای مربوط به ماژول قرارش میدم
// منظور همون آتث
  AuthEntity({
    required this.email,
    required this.authProvider,
    this.password,
    this.authProviderId,
    this.avatar,
    this.name,
  });
}
