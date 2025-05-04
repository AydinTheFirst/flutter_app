import 'package:flutter/material.dart';
import 'package:flutter_app/pages/bottom_navigation_widget.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Page'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 8.0,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            MaterialButton(
              onPressed: () => Get.toNamed('/auth/login'),
              textColor: Colors.white,
              color: Colors.blue,
              child: Text('Giriş Yap'),
            ),
            MaterialButton(
              onPressed: () => Get.toNamed('/auth/register'),
              textColor: Colors.white,
              color: Colors.blue,
              child: Text('Kayıt Ol'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationWidget(),
    );
  }
}
