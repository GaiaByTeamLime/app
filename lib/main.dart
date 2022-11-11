import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:typed_data';
import 'dart:math';
import 'dart:io';
import 'bluetooth.dart' as Bluetooth;
import 'pages/home.dart';
import 'pages/settings.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/services.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(FlexColorScheme.themedSystemNavigationBar(context, opacity: 0.0));

    return MaterialApp(
      title: 'Gaia',
      theme: FlexThemeData.light(
        colors: const FlexSchemeColor(
          primary: Color(0xff0a5251),
          primaryContainer: Color(0xff9ed0b3),
          secondary: Color(0xfff49954),
          secondaryContainer: Color(0xffe9456d),
          tertiary: Color(0xffe9456d),
          tertiaryContainer: Color(0xfff49954),
          appBarColor: Color(0xffe9456d),
          error: Color(0xffb00020),
        ),
        surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
        blendLevel: 20,
        appBarOpacity: 0.95,
        subThemesData: const FlexSubThemesData(
          blendOnLevel: 20,
          blendOnColors: false,
          switchSchemeColor: SchemeColor.tertiaryContainer,
          navigationRailBackgroundSchemeColor: SchemeColor.primaryContainer,
          bottomNavigationBarOpacity: 0.95,
        ),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      darkTheme: FlexThemeData.dark(
        colors: const FlexSchemeColor(
          primary: Color(0xff9ed0b3),
          primaryContainer: Color(0xff006875),
          secondary: Color(0xfff49954),
          secondaryContainer: Color(0xffe9456d),
          tertiary: Color(0xffe9456d),
          tertiaryContainer: Color(0xfff49954),
          appBarColor: Color(0xffe9456d),
          error: Color(0xffcf6679),
        ),
        surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
        blendLevel: 15,
        appBarOpacity: 0.90,
        subThemesData: const FlexSubThemesData(
          blendOnLevel: 30,
          switchSchemeColor: SchemeColor.tertiaryContainer,
          navigationRailBackgroundSchemeColor: SchemeColor.primaryContainer,
          bottomNavigationBarOpacity: 0.95,
        ),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      themeMode: ThemeMode.system,
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/settings': (context) => SettingsPage(),
      },
    );
  }
}
