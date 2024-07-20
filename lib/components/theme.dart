import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData darkTheme = ThemeData(
  fontFamily: 'Roboto',
  scaffoldBackgroundColor: const Color(0xFF1A1C1E),
  appBarTheme: const AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarBrightness: Brightness.dark, //<-- For iOS SEE HERE (dark icons)
    ),
  ),
  extensions: [
    CustomColors(
      primary: const Color(0xFFA0CAFF),
      onPrimary: const Color(0xFF003259),
      primaryContainer: const Color(0xFF00497E),
      onPrimaryContainer: const Color(0xFFD2E4FF),
      secondary: const Color(0xFFBBC7DB),
      onSecondary: const Color(0xFF253141),
      secondaryContainer: const Color(0xFF3C4858),
      onSecondaryContainer: const Color(0xFFD7E3F8),
      tertiary: const Color(0xFFD7BEE4),
      onTertiary: const Color(0xFF3B2947),
      tertiaryContainer: const Color(0xFF533F5F),
      onTertiaryContainer: const Color(0xFFF3DAFF),
      error: const Color(0xFFFFB4AB),
      onError: const Color(0xFF690005),
      errorContainer: const Color(0xFF93000A),
      onErrorContainer: const Color(0xFFFFDAD6),
      outline: const Color(0xFF8D9199),
      background: const Color(0xFF1A1C1E),
      onBackground: const Color(0xFFE3E2E6),
      surface: const Color(0xFF121316),
      onSurface: const Color(0xFFC6C6CA),
      surfaceVariant: const Color(0xFF43474E),
      onSurfaceVariant: const Color(0xFFC3C6CF),
      inverseSurface: const Color(0xFFE3E2E6),
      onInverseSurface: const Color(0xFF1A1C1E),
      inversePrimary: const Color(0xFF0061A6),
      shadow: const Color(0xFF000000),
      surfaceTint: const Color(0xFFA0CAFF),
      outlineVariant: const Color(0xFF43474E),
      scrim: const Color(0xFF000000),
    ),
  ],
);

ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor:
      const Color(0xFFFDFCFF), // Set the background color to white
  fontFamily: 'Roboto',
  appBarTheme: const AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light, //<-- For iOS SEE HERE (dark icons)
    ),
  ),
  extensions: [
    CustomColors(
      primary: const Color(0xFF0061A6),
      onPrimary: const Color(0xFFFFFFFF),
      primaryContainer: const Color(0xFFD2E4FF),
      onPrimaryContainer: const Color(0xFF001C37),
      secondary: const Color(0xFF535F70),
      onSecondary: const Color(0xFFFFFFFF),
      secondaryContainer: const Color(0xFFD7E3F8),
      onSecondaryContainer: const Color(0xFF101C2B),
      tertiary: const Color(0xFF6B5778),
      onTertiary: const Color(0xFFFFFFFF),
      tertiaryContainer: const Color(0xFFF3DAFF),
      onTertiaryContainer: const Color(0xFF251431),
      error: const Color(0xFFBA1A1A),
      onError: const Color(0xFFFFFFFF),
      errorContainer: const Color(0xFFFFDAD6),
      onErrorContainer: const Color(0xFF410002),
      outline: const Color(0xFF73777F),
      background: const Color(0xFFFDFCFF),
      onBackground: const Color(0xFF1A1C1E),
      surface: const Color(0xFFFAF9FC),
      onSurface: const Color(0xFF1A1C1E),
      surfaceVariant: const Color(0xFFDFE2EB),
      onSurfaceVariant: const Color(0xFF43474E),
      inverseSurface: const Color(0xFF2F3033),
      onInverseSurface: const Color(0xFFF1F0F4),
      inversePrimary: const Color(0xFFA0CAFF),
      shadow: const Color(0xFF000000),
      surfaceTint: const Color(0xFF0061A6),
      outlineVariant: const Color(0xFFC3C6CF),
      scrim: const Color(0xFF000000),
    )
  ],
);

class CustomColors extends ThemeExtension<CustomColors> {
  late Color primary;
  late Color onPrimary;
  late Color primaryContainer;
  late Color onPrimaryContainer;
  late Color secondary;
  late Color onSecondary;
  late Color secondaryContainer;
  late Color onSecondaryContainer;
  late Color tertiary;
  late Color onTertiary;
  late Color tertiaryContainer;
  late Color onTertiaryContainer;
  late Color error;
  late Color onError;
  late Color errorContainer;
  late Color onErrorContainer;
  late Color outline;
  late Color background;
  late Color onBackground;
  late Color surface;
  late Color onSurface;
  late Color surfaceVariant;
  late Color onSurfaceVariant;
  late Color inverseSurface;
  late Color onInverseSurface;
  late Color inversePrimary;
  late Color shadow;
  late Color surfaceTint;
  late Color outlineVariant;
  late Color scrim;

  CustomColors({
    required this.primary,
    required this.onPrimary,
    required this.primaryContainer,
    required this.onPrimaryContainer,
    required this.secondary,
    required this.onSecondary,
    required this.secondaryContainer,
    required this.onSecondaryContainer,
    required this.tertiary,
    required this.onTertiary,
    required this.tertiaryContainer,
    required this.onTertiaryContainer,
    required this.error,
    required this.onError,
    required this.errorContainer,
    required this.onErrorContainer,
    required this.outline,
    required this.background,
    required this.onBackground,
    required this.surface,
    required this.onSurface,
    required this.surfaceVariant,
    required this.onSurfaceVariant,
    required this.inverseSurface,
    required this.onInverseSurface,
    required this.inversePrimary,
    required this.shadow,
    required this.surfaceTint,
    required this.outlineVariant,
    required this.scrim,
  });

  @override
  ThemeExtension<CustomColors> copyWith() {
    return CustomColors(
      primary: primary,
      onPrimary: onPrimary,
      primaryContainer: primaryContainer,
      onPrimaryContainer: onPrimaryContainer,
      secondary: secondary,
      onSecondary: onSecondary,
      secondaryContainer: secondaryContainer,
      onSecondaryContainer: onSecondaryContainer,
      tertiary: tertiary,
      onTertiary: onTertiary,
      tertiaryContainer: tertiaryContainer,
      onTertiaryContainer: onTertiaryContainer,
      error: error,
      onError: onError,
      errorContainer: errorContainer,
      onErrorContainer: onErrorContainer,
      outline: outline,
      background: background,
      onBackground: onBackground,
      surface: surface,
      onSurface: onSurface,
      surfaceVariant: surfaceVariant,
      onSurfaceVariant: onSurfaceVariant,
      inverseSurface: inverseSurface,
      onInverseSurface: onInverseSurface,
      inversePrimary: inversePrimary,
      shadow: shadow,
      surfaceTint: surfaceTint,
      outlineVariant: outlineVariant,
      scrim: scrim,
    );
  }

  @override
  ThemeExtension<CustomColors> lerp(
      covariant ThemeExtension<CustomColors>? other, double t) {
    if (other is! CustomColors) {
      return this;
    }
    return CustomColors(
      primary: Color.lerp(primary, other.primary, t)!,
      onPrimary: Color.lerp(onPrimary, other.onPrimary, t)!,
      primaryContainer:
          Color.lerp(primaryContainer, other.primaryContainer, t)!,
      onPrimaryContainer:
          Color.lerp(onPrimaryContainer, other.onPrimaryContainer, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      onSecondary: Color.lerp(onSecondary, other.onSecondary, t)!,
      secondaryContainer:
          Color.lerp(secondaryContainer, other.secondaryContainer, t)!,
      onSecondaryContainer:
          Color.lerp(onSecondaryContainer, other.onSecondaryContainer, t)!,
      tertiary: Color.lerp(tertiary, other.tertiary, t)!,
      onTertiary: Color.lerp(onTertiary, other.onTertiary, t)!,
      tertiaryContainer:
          Color.lerp(tertiaryContainer, other.tertiaryContainer, t)!,
      onTertiaryContainer:
          Color.lerp(onTertiaryContainer, other.onTertiaryContainer, t)!,
      error: Color.lerp(error, other.error, t)!,
      onError: Color.lerp(onError, other.onError, t)!,
      errorContainer: Color.lerp(errorContainer, other.errorContainer, t)!,
      onErrorContainer:
          Color.lerp(onErrorContainer, other.onErrorContainer, t)!,
      outline: Color.lerp(outline, other.outline, t)!,
      background: Color.lerp(background, other.background, t)!,
      onBackground: Color.lerp(onBackground, other.onBackground, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      onSurface: Color.lerp(onSurface, other.onSurface, t)!,
      surfaceVariant: Color.lerp(surfaceVariant, other.surfaceVariant, t)!,
      onSurfaceVariant:
          Color.lerp(onSurfaceVariant, other.onSurfaceVariant, t)!,
      inverseSurface: Color.lerp(inverseSurface, other.inverseSurface, t)!,
      onInverseSurface:
          Color.lerp(onInverseSurface, other.onInverseSurface, t)!,
      inversePrimary: Color.lerp(inversePrimary, other.inversePrimary, t)!,
      shadow: Color.lerp(shadow, other.shadow, t)!,
      surfaceTint: Color.lerp(surfaceTint, other.surfaceTint, t)!,
      outlineVariant: Color.lerp(outlineVariant, other.outlineVariant, t)!,
      scrim: Color.lerp(scrim, other.scrim, t)!,
    );
  }
}

// const lightColorScheme = ColorScheme(
//   brightness: Brightness.light,
//   primary: Color(0xFF0061A6),
//   onPrimary: Color(0xFFFFFFFF),
//   primaryContainer: Color(0xFFD2E4FF),
//   onPrimaryContainer: Color(0xFF001C37),
//   secondary: Color(0xFF535F70),
//   onSecondary: Color(0xFFFFFFFF),
//   secondaryContainer: Color(0xFFD7E3F8),
//   onSecondaryContainer: Color(0xFF101C2B),
//   tertiary: Color(0xFF6B5778),
//   onTertiary: Color(0xFFFFFFFF),
//   tertiaryContainer: Color(0xFFF3DAFF),
//   onTertiaryContainer: Color(0xFF251431),
//   error: Color(0xFFBA1A1A),
//   onError: Color(0xFFFFFFFF),
//   errorContainer: Color(0xFFFFDAD6),
//   onErrorContainer: Color(0xFF410002),
//   outline: Color(0xFF73777F),
//   background: Color(0xFFFDFCFF),
//   onBackground: Color(0xFF1A1C1E),
//   surface: Color(0xFFFAF9FC),
//   onSurface: Color(0xFF1A1C1E),
//   surfaceVariant: Color(0xFFDFE2EB),
//   onSurfaceVariant: Color(0xFF43474E),
//   inverseSurface: Color(0xFF2F3033),
//   onInverseSurface: Color(0xFFF1F0F4),
//   inversePrimary: Color(0xFFA0CAFF),
//   shadow: Color(0xFF000000),
//   surfaceTint: Color(0xFF0061A6),
//   outlineVariant: Color(0xFFC3C6CF),
//   scrim: Color(0xFF000000),
// );
//
// const darkColorScheme = ColorScheme(
//   brightness: Brightness.dark,
//   primary: Color(0xFFA0CAFF),
//   onPrimary: Color(0xFF003259),
//   primaryContainer: Color(0xFF00497E),
//   onPrimaryContainer: Color(0xFFD2E4FF),
//   secondary: Color(0xFFBBC7DB),
//   onSecondary: Color(0xFF253141),
//   secondaryContainer: Color(0xFF3C4858),
//   onSecondaryContainer: Color(0xFFD7E3F8),
//   tertiary: Color(0xFFD7BEE4),
//   onTertiary: Color(0xFF3B2947),
//   tertiaryContainer: Color(0xFF533F5F),
//   onTertiaryContainer: Color(0xFFF3DAFF),
//   error: Color(0xFFFFB4AB),
//   onError: Color(0xFF690005),
//   errorContainer: Color(0xFF93000A),
//   onErrorContainer: Color(0xFFFFDAD6),
//   outline: Color(0xFF8D9199),
//   background: Color(0xFF1A1C1E),
//   onBackground: Color(0xFFE3E2E6),
//   surface: Color(0xFF121316),
//   onSurface: Color(0xFFC6C6CA),
//   surfaceVariant: Color(0xFF43474E),
//   onSurfaceVariant: Color(0xFFC3C6CF),
//   inverseSurface: Color(0xFFE3E2E6),
//   onInverseSurface: Color(0xFF1A1C1E),
//   inversePrimary: Color(0xFF0061A6),
//   shadow: Color(0xFF000000),
//   surfaceTint: Color(0xFFA0CAFF),
//   outlineVariant: Color(0xFF43474E),
//   scrim: Color(0xFF000000),
// );
