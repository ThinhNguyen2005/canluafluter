import 'package:flutter_tts/flutter_tts.dart';

class TtsService {
  final FlutterTts _flutterTts = FlutterTts();
  bool _enabled = true;

  TtsService() {
    _initTts();
  }

  void _initTts() async {
    try {
      await _flutterTts.setLanguage('vi-VN');
      await _flutterTts.setSpeechRate(0.6); // Slightly slower for clear pronunciation
      await _flutterTts.setVolume(1.0);
      await _flutterTts.setPitch(1.0);
    } catch (e) {
      // Graceful degradation if TTS fails to initialize (e.g. emulator)
      _enabled = false;
    }
  }

  bool get isEnabled => _enabled;

  void setEnabled(bool enabled) {
    _enabled = enabled;
  }

  /// Speak a Vietnamese sentence or number
  Future<void> speak(String text) async {
    if (!_enabled) return;
    try {
      await _flutterTts.speak(text);
    } catch (e) {
      // Silently catch exceptions (e.g. platform not supporting TTS or missing voice pack)
    }
  }

  /// Convert weight value to a readable Vietnamese phrase, e.g., 50.3 -> "Năm mươi phẩy ba"
  Future<void> speakWeight(double weight) async {
    final weightStr = weight.toStringAsFixed(1);
    final parts = weightStr.split('.');
    final integerPart = int.tryParse(parts[0]) ?? 0;
    final decimalPart = parts.length > 1 ? (int.tryParse(parts[1]) ?? 0) : 0;

    String speakText = '$integerPart';
    if (decimalPart > 0) {
      speakText += ' phẩy $decimalPart';
    }
    speakText += ' ký';

    await speak(speakText);
  }

  Future<void> stop() async {
    await _flutterTts.stop();
  }
}
