import 'package:get_it/get_it.dart';

import 'core/data/services/navigation_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  //register api classes
  // locator.registerLazySingleton<OtpDataProvider>(() => OtpDataProvider());
  // locator.registerLazySingleton<AuthDataProvider>(() => AuthDataProvider());
  // locator.registerLazySingleton<UserDataProvider>(() => UserDataProvider());
  // locator.registerLazySingleton<DashboardDataProvider>(() => DashboardDataProvider());
  // locator.registerLazySingleton<DonationDataProvider>(() => DonationDataProvider());


  ///services
  locator.registerLazySingleton(() => NavigationService());
  // locator.registerLazySingleton<GeoLocatorService>(() => GeoLocatorService());
  // locator.registerLazySingleton<SecurityService>(() => SecurityService());
  // locator.registerLazySingleton(() => PusherService());
}
