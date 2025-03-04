import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:realestate/Theme/theme.dart';
import 'package:realestate/generated/l10n.dart';
import 'package:realestate/provider/favorite_prvider.dart';

import 'package:realestate/screans/tap_screan.dart';
import 'package:realestate/screans/welcome.dart';
import 'package:theme_provider/theme_provider.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // @override
  // void dispose() {
  //   _themeManger.removeListener(themeListener);
  //   super.dispose();
  // }

  // @override
  // void initState() {
  //   _themeManger.addListener(themeListener);
  //   super.initState();
  // }

  // themeListener() {
  //   if (mounted) {
  //     setState(() {});
  //   }
  // }
  @override
  Widget build(BuildContext context) => MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => FavoritePrvider())],
      child: GetMaterialApp(
          theme: ThemeService().lightTheme,
          darkTheme: ThemeService().darkTheme,
          themeMode: ThemeService().getThemeMode(),
          debugShowCheckedModeBanner: false,
          locale: Locale('ar'),
          localizationsDelegates: [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          initialRoute: "/TapScrean",
          routes: {"/TapScrean": (context) => TapScrean()},
          home: Welcome()));
}
