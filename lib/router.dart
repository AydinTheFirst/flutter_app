import 'package:get/get.dart';

import 'pages/about_page.dart';
import 'pages/home_page.dart';
import 'pages/profile_page.dart';

import 'pages/auth/login_page.dart';
import 'pages/auth/register_page.dart';

List<GetPage> appRoutes = [
  GetPage(name: '/', page: () => const HomePage()),
  GetPage(name: '/about', page: () => const AboutPage()),
  GetPage(name: '/profile', page: () => const ProfilePage()),

  GetPage(name: '/auth/login', page: () => LoginPage()),
  GetPage(name: '/auth/register', page: () => RegisterPage()),
];
