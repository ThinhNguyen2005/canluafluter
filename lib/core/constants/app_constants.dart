class AppConstants {
  // App Info
  static const String appName = 'Cân Lúa';
  static const String appVersion = '1.0.0';

  // Firestore Collection Names
  static const String colRicePrices = 'rice_prices';
  
  // Storage keys or local settings defaults
  static const String keyPrefVoiceTtsEnabled = 'pref_voice_tts_enabled';
  static const String keyPrefSmallModeEnabled = 'pref_small_mode_enabled';
  static const String keyPrefAutoConfirmEnabled = 'pref_auto_confirm_enabled';
  static const String keyPrefFontSize = 'pref_font_size';

  // Rice prices cache TTL (30 minutes)
  static const Duration priceCacheDuration = Duration(minutes: 30);
  
  // RSS news sources
  static const List<String> rssSources = [
    'https://nongnghiep.vn/rss/trong-trot-12.rss',
    'https://vnexpress.net/rss/tin-noi-bat.rss',
  ];
}
