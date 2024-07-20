import 'package:gc/Features/Authentication/Data/Entity/auth_entity.dart';

abstract class AuthRepository {
  // اینا میتونن مدل بشن
  // این مدتا قراره با دیتابیس ارتباط برقرار کنن که میشه بیزینس لاجیک
  Future<Map<String, dynamic>> authWithGoogle();
  Future<Map<String, dynamic>> authWithFacebook();
  // بهش یه ورودی میدم که بره داخل سرور این انتیتی مارو سیو بکنه
  Future<Map<String, dynamic>> register(AuthEntity entity);
}
