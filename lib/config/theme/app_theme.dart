import 'package:flutter/material.dart';
import 'package:liverpool/config/theme/colors_app.dart';

class AppTheme {
  ThemeData getTheme() => ThemeData(
        appBarTheme: const AppBarTheme(backgroundColor: ColorsApp.primaryColor),
      );
}
