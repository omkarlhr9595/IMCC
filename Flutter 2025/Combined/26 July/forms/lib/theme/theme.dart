import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff4f6628),
      surfaceTint: Color(0xff4f6628),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffd1eca0),
      onPrimaryContainer: Color(0xff384d12),
      secondary: Color(0xff596248),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffdde6c6),
      onSecondaryContainer: Color(0xff414a32),
      tertiary: Color(0xff396661),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffbcece5),
      onTertiaryContainer: Color(0xff1f4e49),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff93000a),
      surface: Color(0xfffafaee),
      onSurface: Color(0xff1a1c15),
      onSurfaceVariant: Color(0xff45483d),
      outline: Color(0xff75786c),
      outlineVariant: Color(0xffc5c8b9),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2f312a),
      inversePrimary: Color(0xffb5d086),
      primaryFixed: Color(0xffd1eca0),
      onPrimaryFixed: Color(0xff131f00),
      primaryFixedDim: Color(0xffb5d086),
      onPrimaryFixedVariant: Color(0xff384d12),
      secondaryFixed: Color(0xffdde6c6),
      onSecondaryFixed: Color(0xff171e0a),
      secondaryFixedDim: Color(0xffc1caab),
      onSecondaryFixedVariant: Color(0xff414a32),
      tertiaryFixed: Color(0xffbcece5),
      onTertiaryFixed: Color(0xff00201d),
      tertiaryFixedDim: Color(0xffa0d0c9),
      onTertiaryFixedVariant: Color(0xff1f4e49),
      surfaceDim: Color(0xffdadbcf),
      surfaceBright: Color(0xfffafaee),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff4f4e9),
      surfaceContainer: Color(0xffeeefe3),
      surfaceContainerHigh: Color(0xffe8e9dd),
      surfaceContainerHighest: Color(0xffe3e3d8),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff283c02),
      surfaceTint: Color(0xff4f6628),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff5e7535),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff313923),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff687056),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff093d39),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff487570),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff740006),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffcf2c27),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffafaee),
      onSurface: Color(0xff10120b),
      onSurfaceVariant: Color(0xff34372d),
      outline: Color(0xff515448),
      outlineVariant: Color(0xff6b6e62),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2f312a),
      inversePrimary: Color(0xffb5d086),
      primaryFixed: Color(0xff5e7535),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff465c1f),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff687056),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff4f583f),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff487570),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff2f5c57),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffc6c7bc),
      surfaceBright: Color(0xfffafaee),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff4f4e9),
      surfaceContainer: Color(0xffe8e9dd),
      surfaceContainerHigh: Color(0xffddded2),
      surfaceContainerHighest: Color(0xffd2d2c7),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff203100),
      surfaceTint: Color(0xff4f6628),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff3b5014),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff272f19),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff444c34),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff00322f),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff22504c),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff600004),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff98000a),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffafaee),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff000000),
      outline: Color(0xff2a2d23),
      outlineVariant: Color(0xff474a3f),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2f312a),
      inversePrimary: Color(0xffb5d086),
      primaryFixed: Color(0xff3b5014),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff253800),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff444c34),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff2e351f),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff22504c),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff043935),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffb9baaf),
      surfaceBright: Color(0xfffafaee),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff1f2e6),
      surfaceContainer: Color(0xffe3e3d8),
      surfaceContainerHigh: Color(0xffd4d5ca),
      surfaceContainerHighest: Color(0xffc6c7bc),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffb5d086),
      surfaceTint: Color(0xffb5d086),
      onPrimary: Color(0xff233600),
      primaryContainer: Color(0xff384d12),
      onPrimaryContainer: Color(0xffd1eca0),
      secondary: Color(0xffc1caab),
      onSecondary: Color(0xff2b331d),
      secondaryContainer: Color(0xff414a32),
      onSecondaryContainer: Color(0xffdde6c6),
      tertiary: Color(0xffa0d0c9),
      onTertiary: Color(0xff013733),
      tertiaryContainer: Color(0xff1f4e49),
      onTertiaryContainer: Color(0xffbcece5),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff12140e),
      onSurface: Color(0xffe3e3d8),
      onSurfaceVariant: Color(0xffc5c8b9),
      outline: Color(0xff8f9284),
      outlineVariant: Color(0xff45483d),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe3e3d8),
      inversePrimary: Color(0xff4f6628),
      primaryFixed: Color(0xffd1eca0),
      onPrimaryFixed: Color(0xff131f00),
      primaryFixedDim: Color(0xffb5d086),
      onPrimaryFixedVariant: Color(0xff384d12),
      secondaryFixed: Color(0xffdde6c6),
      onSecondaryFixed: Color(0xff171e0a),
      secondaryFixedDim: Color(0xffc1caab),
      onSecondaryFixedVariant: Color(0xff414a32),
      tertiaryFixed: Color(0xffbcece5),
      onTertiaryFixed: Color(0xff00201d),
      tertiaryFixedDim: Color(0xffa0d0c9),
      onTertiaryFixedVariant: Color(0xff1f4e49),
      surfaceDim: Color(0xff12140e),
      surfaceBright: Color(0xff383a32),
      surfaceContainerLowest: Color(0xff0d0f09),
      surfaceContainerLow: Color(0xff1a1c15),
      surfaceContainer: Color(0xff1e2019),
      surfaceContainerHigh: Color(0xff292b23),
      surfaceContainerHighest: Color(0xff34362e),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffcbe69a),
      surfaceTint: Color(0xffb5d086),
      onPrimary: Color(0xff1b2a00),
      primaryContainer: Color(0xff819955),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffd7e0c0),
      onSecondary: Color(0xff212813),
      secondaryContainer: Color(0xff8b9478),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffb6e6df),
      onTertiary: Color(0xff002b28),
      tertiaryContainer: Color(0xff6b9993),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffd2cc),
      onError: Color(0xff540003),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff12140e),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffdbdece),
      outline: Color(0xffb1b3a5),
      outlineVariant: Color(0xff8f9284),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe3e3d8),
      inversePrimary: Color(0xff3a4e13),
      primaryFixed: Color(0xffd1eca0),
      onPrimaryFixed: Color(0xff0b1400),
      primaryFixedDim: Color(0xffb5d086),
      onPrimaryFixedVariant: Color(0xff283c02),
      secondaryFixed: Color(0xffdde6c6),
      onSecondaryFixed: Color(0xff0c1303),
      secondaryFixedDim: Color(0xffc1caab),
      onSecondaryFixedVariant: Color(0xff313923),
      tertiaryFixed: Color(0xffbcece5),
      onTertiaryFixed: Color(0xff001512),
      tertiaryFixedDim: Color(0xffa0d0c9),
      onTertiaryFixedVariant: Color(0xff093d39),
      surfaceDim: Color(0xff12140e),
      surfaceBright: Color(0xff43453d),
      surfaceContainerLowest: Color(0xff060804),
      surfaceContainerLow: Color(0xff1c1e17),
      surfaceContainer: Color(0xff272921),
      surfaceContainerHigh: Color(0xff31332c),
      surfaceContainerHighest: Color(0xff3c3f36),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffdefaac),
      surfaceTint: Color(0xffb5d086),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffb2cc83),
      onPrimaryContainer: Color(0xff060d00),
      secondary: Color(0xffebf4d3),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffbdc6a7),
      onSecondaryContainer: Color(0xff070d01),
      tertiary: Color(0xffc9faf3),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xff9cccc5),
      onTertiaryContainer: Color(0xff000e0c),
      error: Color(0xffffece9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffaea4),
      onErrorContainer: Color(0xff220001),
      surface: Color(0xff12140e),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffffffff),
      outline: Color(0xffeff1e2),
      outlineVariant: Color(0xffc1c4b5),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe3e3d8),
      inversePrimary: Color(0xff3a4e13),
      primaryFixed: Color(0xffd1eca0),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffb5d086),
      onPrimaryFixedVariant: Color(0xff0b1400),
      secondaryFixed: Color(0xffdde6c6),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffc1caab),
      onSecondaryFixedVariant: Color(0xff0c1303),
      tertiaryFixed: Color(0xffbcece5),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffa0d0c9),
      onTertiaryFixedVariant: Color(0xff001512),
      surfaceDim: Color(0xff12140e),
      surfaceBright: Color(0xff4f5148),
      surfaceContainerLowest: Color(0xff000000),
      surfaceContainerLow: Color(0xff1e2019),
      surfaceContainer: Color(0xff2f312a),
      surfaceContainerHigh: Color(0xff3a3c34),
      surfaceContainerHighest: Color(0xff46483f),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }


  ThemeData theme(ColorScheme colorScheme) => ThemeData(
     useMaterial3: true,
     brightness: colorScheme.brightness,
     colorScheme: colorScheme,
     textTheme: textTheme.apply(
       bodyColor: colorScheme.onSurface,
       displayColor: colorScheme.onSurface,
     ),
     scaffoldBackgroundColor: colorScheme.background,
     canvasColor: colorScheme.surface,
  );


  List<ExtendedColor> get extendedColors => [
  ];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
