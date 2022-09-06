import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:gharoghari/core/const/app_theme.dart';
import 'package:gharoghari/core/network/api_client.dart';
import 'package:gharoghari/core/network/dio/dio_api_client.dart';
import 'package:gharoghari/core/prefs/app_prefs.dart';
import 'package:gharoghari/core/utils/localization/lang.dart';
import 'package:gharoghari/route/route_binding.dart';
import 'package:gharoghari/route/route_generator.dart';
import 'package:gharoghari/route/route_observer.dart';
import 'package:gharoghari/ui/screen/authentication/login_screen.dart';
import 'package:gharoghari/ui/screen/dashboard/dashboard_screen.dart';
import 'package:gharoghari/ui/screen/onboarding/onboarding.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  GetIt.I.registerSingletonAsync(() => AppPrefs.getInstance());

  GetIt.I.registerSingletonAsync<ApiClient>(() => DioApiClient.getInstance());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: (context, child) => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: child as Widget,
      ),
      title: 'GharoGhari',
      theme: AppDefTheme.themeData,
      initialBinding: RouteBinding(),
      navigatorObservers: [AppRouteObserver()],
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      initialRoute: DashBoardScreen.routeName,
      translations: Lang(context),
      fallbackLocale: Lang.fallbackLocale,
      locale: Lang.locale,
      getPages: routes,
    );
  }
}
