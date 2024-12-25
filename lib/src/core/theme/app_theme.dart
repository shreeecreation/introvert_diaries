import 'package:introvertdiaries/src/core/extensions/extension.dart';
import 'package:introvertdiaries/src/core/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

enum ThemeEnum {
  dark,
  light,
  ;

  ThemeData get generateTheme {
    return switch (this) {
      ThemeEnum.light => AppTheme().lightTheme,
      ThemeEnum.dark => AppTheme().darkTheme
    };
  }
}

class AppTheme {
  factory AppTheme() {
    _instance ??= AppTheme._init();
    return _instance!;
  }

  AppTheme._init();

  static AppTheme? _instance;

  ThemeData get lightTheme => ThemeData(
        primaryColor: AppColors.primaryColor,
        dividerColor: AppColors.white,
        scaffoldBackgroundColor: AppColors.tileColor,
        cardColor: AppColors.tileColor,
        textTheme: GoogleFonts.rubikTextTheme(),
        primarySwatch: Colors.blue,
        useMaterial3: true,
        fontFamily: GoogleFonts.rubik().fontFamily,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primaryColor,
          primary: AppColors.primaryColor,
        ),
        bottomSheetTheme: const BottomSheetThemeData(
          surfaceTintColor: AppColors.white,
          dragHandleColor: AppColors.white,
          backgroundColor: AppColors.scaffoldBackground,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.tileColor,
          elevation: 0,
          centerTitle: false,
          iconTheme: IconThemeData(color: AppColors.black),
          surfaceTintColor: AppColors.tileColor,
        ),
        dividerTheme: DividerThemeData(
          color: AppColors.dividerColor.withOpacity(.2),
          thickness: 1,
          space: 0,
        ),
        tabBarTheme: TabBarTheme(
          indicator: BoxDecoration(
            color: AppColors.white,
            borderRadius: 24.rounded,
          ),
          labelPadding: EdgeInsets.symmetric(horizontal: 20.w),
          labelStyle: AppTextStyles.text14PxBold,
          labelColor: AppColors.textDark,
          unselectedLabelColor: AppColors.textLight,
          overlayColor: WidgetStateProperty.all(AppColors.transparent),
          unselectedLabelStyle: AppTextStyles.text14PxBold,
        ),
        splashColor: AppColors.white,
        checkboxTheme: CheckboxThemeData(
          side: const BorderSide(color: Color(0xffe2e4e9), width: 2),
          fillColor: WidgetStateProperty.resolveWith<Color>(
            (state) {
              if (state.contains(WidgetState.selected)) return AppColors.secondaryColor;
              return AppColors.white;
            },
          ),
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4))),
        ),
        inputDecorationTheme: InputDecorationTheme(
          isDense: true,
          contentPadding:
              EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w).copyWith(bottom: 20.h),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide.none,
          ),
          filled: true,
          hintStyle: AppTextStyles.text16Px.textGrey,
          fillColor: AppColors.white,
          constraints: BoxConstraints(
            minHeight: 48.h,
            minWidth: double.infinity,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide.none,
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide.none,
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide.none,
          ),
        ),
      );

  ThemeData get darkTheme => ThemeData(
        primaryColor: AppColors.primaryColor,
        scaffoldBackgroundColor: AppColors.darkBlue,
        textTheme: GoogleFonts.rubikTextTheme(
          ThemeData.dark().textTheme,
        ),
        dividerColor: AppColors.black,
        cardColor: AppColors.darkBlue,
        primarySwatch: Colors.blue,
        useMaterial3: true,
        fontFamily: GoogleFonts.rubik().fontFamily,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primaryColor,
          brightness: Brightness.dark,
          primary: AppColors.primaryColor,
        ),
        bottomSheetTheme: const BottomSheetThemeData(
          surfaceTintColor: AppColors.tileColorDark,
          dragHandleColor: AppColors.tileColorDark,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.darkBlue,
          elevation: 0,
          centerTitle: false,
          iconTheme: IconThemeData(color: AppColors.white),
          surfaceTintColor: AppColors.tileColorDark,
        ),
        dividerTheme: DividerThemeData(
          color: AppColors.dividerColorDark.withOpacity(.2),
          thickness: 1,
          space: 0,
        ),
        tabBarTheme: TabBarTheme(
          indicator: BoxDecoration(
            color: AppColors.tileColorDark,
            borderRadius: 24.rounded,
          ),
          labelPadding: EdgeInsets.symmetric(horizontal: 20.w),
          labelStyle: AppTextStyles.text14PxBold,
          labelColor: AppColors.textLight,
          unselectedLabelColor: AppColors.textDark,
          overlayColor: WidgetStateProperty.all(AppColors.transparent),
          unselectedLabelStyle: AppTextStyles.text14PxBold,
        ),
        splashColor: AppColors.tileColorDark,
        inputDecorationTheme: InputDecorationTheme(
          isDense: true,
          contentPadding:
              EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w).copyWith(bottom: 20.h),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide.none,
          ),
          filled: true,
          hintStyle: AppTextStyles.text16Px.textGrey,
          fillColor: AppColors.tileColorDark,
          constraints: BoxConstraints(
            minHeight: 48.h,
            minWidth: double.infinity,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide.none,
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide.none,
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide.none,
          ),
        ),
      );
}

SystemUiOverlayStyle systemUiOverlayStyle(Color color, Brightness brightness) {
  return SystemUiOverlayStyle(
    statusBarColor: color,

    statusBarIconBrightness: brightness,
    statusBarBrightness: Brightness.light, // Needed for iOS
  );
}
