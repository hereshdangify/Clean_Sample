import 'package:gc/Features/Authentication/Data/Entity/auth_entity.dart';
import 'package:gc/Features/Authentication/Data/Remote/auth_with_facebook_service.dart';
import 'package:gc/Features/Authentication/Data/Remote/auth_with_google_sevice.dart';
import 'package:gc/Features/Authentication/Data/Remote/registeration_service.dart';
import 'package:gc/Features/Authentication/Domain/Repository/auth_repository.dart';

class AuthRepoImp extends AuthRepository {
  // این کلاسیه که تک تک متدهای ریپو رو داخلش ایمپلیمنت میکنم
  // Imp = Implementation OR useCases

  late AuthWithFacebookService facebookService;
  late AuthWithGoogleService googleService;
  late RegisterationService registerationService;

  AuthRepoImp({
    required this.facebookService,
    required this.googleService,
  });

  // این فانکشن ها باید با یه سروری ارتباط بگیرن
  // حالا سرویساشو داخل ئوشه ی دیتا مینویسم
  // که این ها از ریموت میان

  @override
  Future<Map<String, dynamic>> authWithFacebook() async {
    return await facebookService.login();
  }

  @override
  Future<Map<String, dynamic>> authWithGoogle() async {
    return await googleService.login();
  }

  @override
  Future<Map<String, dynamic>> register(AuthEntity entity) async {
    return await registerationService.register(entity);
  }
}
