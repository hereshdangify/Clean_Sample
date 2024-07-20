class AuthWithGoogleService {
  // Call login api from Google
  // Use in use cases
  // میتونه از یه اندپوینت اکستندز کنه یا یه دایو
  Future<Map<String, dynamic>> login() async {
    await Future.delayed(const Duration(seconds: 2));

    // فرض میکنم چیزی که برمیگردونه...
    return {
      'emal': '',
      'username': '',
      'avatar': '',
      'authProviderId': '',
    };
  }
}
