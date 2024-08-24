import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../presentation/router/app_router.dart';

class ItBookstoreApp extends StatelessWidget {
  final AppRouter _appRouter = AppRouter();

  ItBookstoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      onGenerateRoute: _appRouter.onGenerateRoute,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
    );
  }
}
