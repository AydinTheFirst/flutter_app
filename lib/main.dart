import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'router.dart';

final storage = GetStorage();
final Logger logger = Logger();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String lastRoute = '/';

  _setLastRoute(String route) {
    setState(() {
      lastRoute = route;
    });
  }

  @override
  void initState() {
    super.initState();

    if (!kDebugMode) return;

    final savedRoute = storage.read('lastRoute');
    if (savedRoute != null) {
      _setLastRoute(savedRoute);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      initialRoute: lastRoute,
      getPages: appRoutes,
      routingCallback: (value) {
        storage.write('lastRoute', value?.current);
      },
    );
  }
}
