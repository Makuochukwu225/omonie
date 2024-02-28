import 'package:omonie/src/src.dart';



class MyAppThemeConfig {
  MyAppThemeConfig.dark();

  ThemeData getTheme() {
    return ThemeData.dark().copyWith(
      scaffoldBackgroundColor: bgColorDark,
      bottomSheetTheme: const BottomSheetThemeData(
          elevation: 0, backgroundColor: bgColorDark),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(buttonColor),
          foregroundColor: MaterialStateProperty.all(buttonTextColor),
          textStyle: MaterialStateProperty.all(
            TextStyle(
              color: buttonTextColor,
              fontSize: 16,
              fontFamily: GoogleFonts.inter().fontFamily,
            ),
          ),
        ),
      ),
    );
  }
}
