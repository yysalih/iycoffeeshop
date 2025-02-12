import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iycoffee/views/auth_views/login_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'constants/app_constants.dart';
import 'constants/providers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    //options: DefaultFirebaseOptions.currentPlatform
  );

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {

  @override
  void initState() {
    init();

    super.initState();

  }

  init() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String language = prefs.getString("language")!;
      bool theme = prefs.getBool("theme")!;
      ref.read(languageStateProvider.notifier).state = language;
      ref.read(themeStateProvider.notifier).state = theme;
    }
    catch(E) {
      ref.read(languageStateProvider.notifier).state = "tr";
      ref.read(themeStateProvider.notifier).state = true;
    }
  }


  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize:  MediaQuery.of(context).size, //const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_ , child) {
        return MaterialApp(
          title: kAppName,
          builder: (context, child) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1)),
              child: child ?? Container(),
            );
          },
          debugShowCheckedModeBanner: false,
          theme: kLightTheme, // Use the light theme
          darkTheme: kDarkTheme, // Use the dark theme
          themeMode: ThemeMode.system,
          home: child,
        );
      },
      child: const LoginView(),
    );
  }
}

