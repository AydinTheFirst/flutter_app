import 'package:flutter/foundation.dart';

enum Environment { dev, release }

class EnvConfig {
  static Environment get current =>
      kReleaseMode ? Environment.release : Environment.dev;

  static String get baseUrl {
    switch (current) {
      case Environment.dev:
        return 'https://jsonplaceholder.typicode.com';
      case Environment.release:
        return 'https://jsonplaceholder.typicode.com';
    }
  }
}
