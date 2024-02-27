import 'dart:async';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:kotonosyky/ui/main_page.dart';
import 'package:kotonosyky/utilities/analitic_service.dart';
import 'package:kotonosyky/utilities/language_provider.dart';
import 'package:provider/provider.dart';

import 'bloc/cat_page_bloc.dart';
import 'db_manager.dart';
import 'firebase_options.dart';

Future<void> main() async {
  // initialize firebase
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } on Exception catch (e) {
    if (kDebugMode) {
      print('Error initializing Firebase: $e');
    }
  }
  runApp(
    ChangeNotifierProvider(
      create: (context) => LanguageProvider(),
      child: const KotonosykyRoot(),
    ),
  );
}

class KotonosykyRoot extends StatefulWidget {
  const KotonosykyRoot({super.key});

  @override
  State<KotonosykyRoot> createState() => _KotonosykyRootState();
}

class _KotonosykyRootState extends State<KotonosykyRoot> {
  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  static FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: analytics);
  late final GoRouter _router;
  late final StreamSubscription authState;
  final DBManager dbManager = DBManager();
  // final String _redirectionRoute = '/cat';

  @override
  void initState() {
    AnalyticsService.analytics.setAnalyticsCollectionEnabled(true);
    _router = GoRouter(
      initialLocation: '/',
      observers: [observer],
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const LoadingPage(),
        ),
        GoRoute(
          path: '/cat',
          pageBuilder: (context, state) {
            return NoTransitionPage<void>(
              child: WillPopScope(
                onWillPop: () async => false,
                child: BlocProvider(
                  create: (ctx) => CatsBloc(DBManager()),
                  child: const CatPage(),
                ),
              ),
            );
          },
        ),
        GoRoute(
          path: '/cat/:catID',
          pageBuilder: (context, state) {
            final catID = state.uri.toString().substring(5);
            return NoTransitionPage<void>(
              child: WillPopScope(
                onWillPop: () async => false,
                child: BlocProvider(
                  create: (ctx) => CatsBloc(DBManager()),
                  child: CatPage(catID: catID),
                ),
              ),
            );
          },
        ),
      ],
    );
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final languageProvider = context.watch<LanguageProvider>();
    return WillPopScope(
      onWillPop: () async => false,
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: languageProvider.currentLocale.languageCode == 'uk'
            ? 'Котоносики'
            : 'Kotonosyky',
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: languageProvider.currentLocale,
        theme: ThemeData(
          textTheme: const TextTheme(
            headlineSmall: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            titleMedium: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          primarySwatch: Colors.amber,
          primaryColor: Colors.amber,
        ),
        routerConfig: _router,
        builder: (context, widget) => SafeArea(child: widget!),
      ),
    );
  }
}

class LoadingPage extends StatefulWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 50), () {
      context.go('/cat');
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
