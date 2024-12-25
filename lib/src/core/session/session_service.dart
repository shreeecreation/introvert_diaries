import 'dart:async';

import 'package:introvertdiaries/src/core/core.dart';
import 'package:hive_flutter/hive_flutter.dart';

@singleton
class SessionService {
  final Box<SessionEntity> _box = Hive.box<SessionEntity>(
    StorageKeys.sessionBox,
  );

  Future<bool> get hasOnboarding async {
    final obj = _box.get(StorageKeys.hasOnboarding);
    return _box.isNotEmpty && (obj?.hasOnboarding ?? false);
  }

  Future<void> saveOnboarding() async {
    await _box.put(
      StorageKeys.hasOnboarding,
      SessionEntity()..setHasOnboarding = true,
    );
  }

  Future<void> saveSession(SessionEntity entity) async {
    await _box.clear();
    await _box.add(entity);
  }

  Future<void> saveToken(String token) async {
    await _box.put(
      StorageKeys.token,
      SessionEntity()..setAccessToken = token,
    );
  }

  Future<void> removeToken() async {
    await _box.delete(StorageKeys.token);
    await _box.delete(StorageKeys.refreshToken);
  }

  Future<void> saveRefreshToken(String token) async {
    await _box.put(
      StorageKeys.refreshToken,
      SessionEntity()..refreshToken = token,
    );
  }

  String? get accessToken => _box.get(StorageKeys.token)?.accessToken;

  String? get refreshToken => _box.get(StorageKeys.refreshToken)?.refreshToken;

  bool get hasSession {
    final obj = _box.get(StorageKeys.token);
    return _box.isNotEmpty && (obj != null && obj.accessToken!.isNotEmpty);
  }

  Future<void> saveNotificationState({required bool show}) async {
    final sessionEntity = _box.get(
          StorageKeys.showNotification,
        ) ??
        SessionEntity()
      ..setShowNotification = show;
    await _box.put(StorageKeys.showNotification, sessionEntity);
  }

  Future<bool> get notificationValue async {
    final sessionEntity = _box.get(StorageKeys.showNotification);
    return sessionEntity?.showNotification ?? false;
  }

  Future<void> cacheContacts(String cache) async {
    return _box.put(StorageKeys.emergencyContacts, SessionEntity());
  }

  /// Assessment Test Caching
  ///
  ///

  Future<void> saveHasOngoingTest({required bool value}) async {
    await _box.put(
      StorageKeys.hasOngoingTest,
      SessionEntity()..setHasOngoingTest = value,
    );
  }

  Future<bool> get hasOngoingTest async {
    final obj = _box.get(StorageKeys.hasOngoingTest);
    return _box.isNotEmpty && (obj?.hasOngoingTest ?? false);
  }


  Future<void> saveUnansweredQuestions(int questions) async {
    await _box.put(
      StorageKeys.unansweredQuestions,
      SessionEntity()..setUnansweredQuestions = questions,
    );
  }

  Future<int?> get unansweredQuestions async {
    final obj = _box.get(StorageKeys.unansweredQuestions);
    return obj?.unansweredQuestions;
  }

  Future<void> saveApiPageAssessment(int questions) async {
    await _box.put(
      StorageKeys.apiPageCountAssessment,
      SessionEntity()..apiPageCountAssessment = questions,
    );
  }

  Future<int?> get apiPageAssessment async {
    final obj = _box.get(StorageKeys.apiPageCountAssessment);
    return obj?.apiPageCountAssessment;
  }

  Future<void> clearTestCache() async {
    await _box.delete(StorageKeys.testCache);
    await _box.delete(StorageKeys.unansweredQuestions);
    await _box.delete(StorageKeys.hasOngoingTest);
    await _box.delete(StorageKeys.apiPageCountAssessment);
    // await _box.delete(StorageKeys.);
  }

  Future<void> removeUserDetailCache() async {
    return _box.delete(StorageKeys.userDetails);
  }

  Future<bool?> showLandingPage({bool? showLandingPage}) async {
    if (showLandingPage == null) {
      return _box.get(StorageKeys.showLandingPage)?.showLandingPage;
    }

    await _box.put(
      StorageKeys.showLandingPage,
      SessionEntity()..showLandingPage = showLandingPage,
    );
    return null;
  }
}
