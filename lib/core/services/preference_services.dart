import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/**
 * Created by karthi_rt on 09-01-2026.
 */

class PreferenceServices {

  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  /// ***** String *****///
  Future<void> setString(String key, String value) async {
    await _storage.write(key: key, value: value);
  }

  Future<String> getString(String key) async {
    try {
      final value = await _storage.read(key: key);
      return value ?? '';
    } catch (e) {
      // Decryption failed → clear corrupted data
      await _storage.delete(key: key);
      return '';
    }
  }

  /// ***** Int *****///
  Future<void> setInt(String key, int value) async {
    await _storage.write(key: key, value: value.toString());
  }

  Future<int> getInt(String key) async {
    try {
      String? stored = await _storage.read(key: key);
      if (stored != null && stored.isNotEmpty) {
        return int.tryParse(stored) ?? 0; // fallback to 0 if parsing fails
      }
      return 0;
    } catch (e) {
      // Decryption failed → clear corrupted data
      await _storage.delete(key: key);
      return 0;
    }
  }

  /// ***** Onboarding *****///
  Future<void> setOnboardingSeen() async {
    await setString('seenOnboarding', 'true');
  }

  Future<bool> getOnboardingSeen() async {
    final value = await getString('seenOnboarding'); return value == 'true';
  }

  Future cleanAllPreferences() async {
    _storage.deleteAll();
  }


}

