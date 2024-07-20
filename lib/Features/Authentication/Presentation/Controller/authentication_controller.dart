import 'package:flutter/material.dart';
import 'package:gc/Core/Constants/routings.dart';
import 'package:gc/Features/Authentication/Data/Entity/auth_entity.dart';
import 'package:gc/Features/Authentication/Data/Enum/enum.dart';
import 'package:gc/Features/Authentication/Data/Remote/auth_with_facebook_service.dart';
import 'package:gc/Features/Authentication/Data/Remote/auth_with_google_sevice.dart';
import 'package:gc/Features/Authentication/Domain/Repository/auth_repository.dart';
import 'package:gc/Features/Authentication/Domain/UseCases/auth_usecases.dart';
import 'package:get/get.dart';

class AuthenticationController extends GetxController {
  late AuthRepository repo;

  // By default it is on emailpassword
  AuthenticationProviders authProvider = AuthenticationProviders.emailPassword;
  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();

  void register(AuthEntity entity) async {
    // Call API
    final result = await repo.register(entity);
    if (result['status'] == 'success') {
      Get.toNamed(Routings().home);
    } else {
      // هندل کردن خطا
    }
    repo.register(entity);
  }

  void authWithEmailPassword() {
    authProvider = AuthenticationProviders.emailPassword;
    final entity = AuthEntity(
      email: emailCtrl.text,
      password: passwordCtrl.text,
      authProvider: authProvider,
    );
    register(entity);
  }

  void authWithGoogle() async {
    authProvider = AuthenticationProviders.google;

    final credential = await repo.authWithGoogle();

    // Get data with Google
    final entity = AuthEntity(
      authProvider: authProvider,
      email: credential['email'],
      name: credential['name'],
      authProviderId: credential['authProviderId'],
      avatar: credential['avatar'],
    );
    register(entity);
  }

  void authWithFacebook() async {
    authProvider = AuthenticationProviders.facebook;

    final credential = await repo.authWithFacebook();

    //Get data with Facebook
    final entity = AuthEntity(
      authProvider: authProvider,
      email: credential['email'],
      name: credential['name'],
      authProviderId: credential['authProviderId'],
      avatar: credential['avatar'],
    );
    register(entity);
  }

  @override
  void onInit() {
    repo = AuthRepoImp(
        facebookService: AuthWithFacebookService(),
        googleService: AuthWithGoogleService());
    super.onInit();
  }
}
