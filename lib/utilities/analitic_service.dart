// analytics_service.dart

import 'package:firebase_analytics/firebase_analytics.dart';

class AnalyticsService {
  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  static Future<void> logPageEvent(String pageName) async {
    await FirebaseAnalytics.instance.logEvent(
      name: pageName,
      parameters: {'origin': pageName},
    );
  }

  static Future<void> logButtonEvent(String name) async {
    await FirebaseAnalytics.instance.logEvent(
      name: 'button_click',
      parameters: {'button_name': name},
    );
  }

  static Future<void> logShare(String name) async {
    await FirebaseAnalytics.instance.logEvent(
      name: 'share_$name',
    );
  }

  static Future<void> logOpenLink(String name) async {
    await FirebaseAnalytics.instance.logEvent(
      name: 'open_link__$name',
    );
  }
}
