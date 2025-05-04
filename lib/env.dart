import 'package:flutter/foundation.dart';

enum Environment { dev, relase }

class EnvConfig {
  static Environment get current =>
      kReleaseMode ? Environment.relase : Environment.dev;

  static String get baseUrl {
    switch (current) {
      case Environment.dev:
        return 'https://camlica-pts.riteknoloji.com/api';
      case Environment.relase:
        return 'https://camlica-pts.riteknoloji.com/api';
    }
  }
}
