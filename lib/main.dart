import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:it_bookstore_bloc/presentation/resources/language_manager.dart';

import 'presentation/router/app_router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: const [slovakLocal],
      path: assetsPathLocalisations,
      child: ItBookstoreApp(),
    ),
  );
}

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
