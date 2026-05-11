import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:iycoffee/firebase_options.dart';
import 'package:iycoffee/services/shell_wrapper.dart';
import 'package:iycoffee/views/auth_views/login_view.dart';
import 'package:iycoffee/views/breakfast_views/breakfast_view.dart';
import 'package:iycoffee/views/breakfast_views/breakfasts_view.dart';
import 'package:iycoffee/views/cake_views/cake_view.dart';
import 'package:iycoffee/views/cake_views/cakes_view.dart';
import 'package:iycoffee/views/card_views/menu_view.dart';
import 'package:iycoffee/views/drink_views/drink_view.dart';
import 'package:iycoffee/views/drink_views/drinks_view.dart';
import 'package:iycoffee/views/main_view.dart';
import 'package:iycoffee/views/payment_views/wallet_view.dart';
import 'package:iycoffee/views/profile_views/profile_view.dart';
import 'package:iycoffee/views/shop_views/shop_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'constants/app_constants.dart';
import 'constants/providers.dart';
import 'views/card_views/cart_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
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

  final _router = GoRouter(
    initialLocation: "/home",
    routes: [
      ShellRoute(
        builder: (context, state, child) {

          final showBar = !(state.uri.toString() == "/login" ||
              state.uri.toString() == "/fillout" ||
              state.uri.toString().contains("imageInner"));

          return ShellWrapper(
            showBar: showBar,
            child: child,
          );
        },
        routes: [
          GoRoute(
            path: "/main",
            builder: (context, state) => const MainView(),
          ),
          GoRoute(
            path: "/home",
            builder: (context, state) => const ShopView(),
          ),
          GoRoute(
            path: "/login",
            builder: (context, state) => const LoginView(),
          ),
          GoRoute(
            path: "/settings",
            builder: (context, state) => const ProfileView(),
          ),
          GoRoute(
            path: "/menu",
            builder: (context, state) => MenuView(),
          ),
          GoRoute(
            path: "/wallet",
            builder: (context, state) => WalletView(),
          ),
          GoRoute(
            path: "/store",
            builder: (context, state) => MenuView(),
          ),
          GoRoute(
            path: "/drinks",
            builder: (context, state) => DrinksView(),
          ),
          GoRoute(
            path: "/drink",
            builder: (context, state) {
              final data = state.extra == null ? {} : state.extra as Map<String, dynamic>;
              final uid = data["uid"] as String;
              return DrinkView(uid: uid,);
            },
          ),
          GoRoute(
            path: "/cakes",
            builder: (context, state) => CakesView(),
          ),
          GoRoute(
            path: "/cake",
            builder: (context, state) {
              final data = state.extra == null ? {} : state.extra as Map<String, dynamic>;
              final uid = data["uid"] as String;
              return CakeView(uid: uid,);
            },
          ),
          GoRoute(
            path: "/breakfasts",
            builder: (context, state) => BreakfastsView(),
          ),
          GoRoute(
            path: "/breakfast",
            builder: (context, state) {
              final data = state.extra == null ? {} : state.extra as Map<String, dynamic>;
              final uid = data["uid"] as String;
              return BreakfastView(uid: uid,);
            },
          ), 
          GoRoute(
            path: "/card",
            builder: (context, state) => const CartView(),
          ),
        ],
      ),

    ]
  );

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize:  MediaQuery.of(context).size, //const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_ , child) {
        return MaterialApp.router(
          title: kAppName,
          routerConfig: _router,
          scrollBehavior: const MaterialScrollBehavior().copyWith(
            dragDevices: {PointerDeviceKind.mouse, PointerDeviceKind.touch, PointerDeviceKind.stylus, PointerDeviceKind.unknown},
          ),
          builder: (context, child) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1)),
              child: child ?? Container(),
            );
          },
          debugShowCheckedModeBanner: false,
          theme: kLightTheme,
          darkTheme: kDarkTheme,
          themeMode: ThemeMode.system,
        );
      },
      child: const LoginView(),
    );
  }
}

