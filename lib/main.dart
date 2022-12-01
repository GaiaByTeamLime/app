import 'package:flutter/material.dart';
import 'pages/index.dart';
import 'pages/login.dart';
import 'bluetooth.dart';
import 'pages/calibrate.dart';
import 'pages/edit.dart';
import 'pages/home.dart';
import 'pages/settings.dart';
import 'pages/connect.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const Gaia());
}

class Gaia extends StatelessWidget {
  const Gaia({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        FlexColorScheme.themedSystemNavigationBar(context, opacity: 0.0));

    return MultiProvider(
        providers: [ChangeNotifierProvider.value(value: Bluetooth())],
        child: MaterialApp(
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
            fontFamily: 'Poppins',
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
            fontFamily: 'Poppins',
          ),
          themeMode: ThemeMode.system,
          initialRoute: '/',
          routes: {
            '/': (context) => const IndexPage(),
            '/home': (context) => const HomePage(),
            '/settings': (context) => const SettingsPage(),
            '/connect': (context) => const ConnectPage(),
            '/calibrate': (context) => const CalibratePage(),
            '/edit': (context) => const EditPage(),
            '/login': (context) => const LoginPage(),
          },
        ));
  }
}
