import 'package:flutter/material.dart';
import 'package:gc/Features/Authentication/Presentation/Binding/authentication_binding.dart';
import 'package:get/get.dart';

import '../../Features/Authentication/Presentation/authentication_screen.dart';

class Routings {
  static final Routings _singleton = Routings._internal();
  factory Routings() => _singleton;
  Routings._internal();

  //  These are routing strings--------------------------------
  final authentication = '/auth';
  final home = '/home';
  final settings = '/settings';

  List<GetPage> pages() => [
        // وقتی با این روتینگ یه پیجی رو لود میکنم خودش اون کلاس کنترلر رو تزریق میکنه
        // بخاطر هیمن داخل این پیج به کنترلری که داخل بایدینگ هست دسترسی دارم
        GetPage(
          name: 'authentication',
          page: () => const AuthenticationScreen(),
          binding: AuthenticationBinding(),
        ),
        GetPage(
          // چون براش پیجی ندارم یه کانتینر میذارم
          name: 'home',
          page: () => Container(),
          //binding: AuthenticationBinding(),
        ),
        GetPage(
          name: 'settings',
          page: () => Container(),
          //binding: AuthenticationBinding(),
        ),
      ];
}
