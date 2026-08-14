import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/constants/app_constants.dart';
import 'core/constants/app_theme/app_theme.dart';
import 'core/data/services/navigation_service.dart';
import 'core/data/view_models/theme_selection_view_model.dart' show themeSelectionViewModel;
import 'router.dart' as router;

import 'core/constants/app_config.dart';
import 'core/data/enum/environment.dart';
import 'core/utilities/secure_storage/secure_storage_init.dart';
import 'locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  AppConfig.setEnvironment(Environment.staging);

  SecureStorageInit.initSecureStorage();
  setupLocator();

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxWidth = constraints.maxWidth;
        final maxHeight = constraints.maxHeight;

        const figmaDesignSize = Size(draftWidth, draftHeight);
        final isFoldOrTablet = maxWidth > phoneWidth;
        final designSize = isFoldOrTablet
            ? Size(maxWidth - 16, maxHeight - 32)
            : figmaDesignSize;
        return ScreenUtilInit(
          splitScreenMode: false,
          minTextAdapt: true,
          designSize: designSize,
          builder: (context, child) => Consumer(
            builder: (context, ref, child) {
              final themeVm = ref.watch(themeSelectionViewModel);
              final themeMode = themeVm.themeMode;
              return MaterialApp(
                  title: 'CardinalStone Pension',
                  debugShowCheckedModeBanner: false,
                  theme: AppTheme.lightTheme,
                  darkTheme: AppTheme.darkTheme,
                  themeMode: themeMode,
                  navigatorKey: locator<NavigationService>().navigationKey,
                  onGenerateRoute: router.generateRoute,
                  home: Container(),// update this
                  builder: (context, child) {
                    final mq = MediaQuery.of(context);
                    return MediaQuery(
                      data: mq.copyWith(textScaler: TextScaler.noScaling),
                      child: child!,
                    );
                  },
                );
            },
          ),
        );
      },
    );
  }
}

