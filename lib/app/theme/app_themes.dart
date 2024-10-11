import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app_colors.dart';

class AppThemes {
  static get light => ThemeData(
        useMaterial3: false,
        brightness: Brightness.light,
        fontFamily: 'Pretendard',
        scaffoldBackgroundColor: AppColors.white,
        appBarTheme: AppBarTheme(
          elevation: 0,
          titleSpacing: 0,
          centerTitle: true,
          backgroundColor: Colors.white,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),
        dividerTheme: DividerThemeData(
          color: AppColors.grey05,
          thickness: 1,
        ),
        bottomAppBarTheme: BottomAppBarTheme(color: AppColors.white),
      );
}
