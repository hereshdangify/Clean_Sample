import 'package:gc/Features/Authentication/Data/Entity/auth_entity.dart';

class RegisterationService {
  Future<Map<String, dynamic>> register(AuthEntity entity) async {
    // Call API for registration the user
    return {
      'emal': entity.email,
      'username': entity.email,
      'name': entity.name,
      'avater': entity.avatar,
      'authProviderId': entity.authProviderId,
    };
  }
}
