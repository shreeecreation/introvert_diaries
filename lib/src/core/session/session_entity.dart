import 'package:hive_flutter/hive_flutter.dart';

part 'session_entity.g.dart';

@HiveType(typeId: 0, adapterName: 'SessionAdapter')
class SessionEntity extends HiveObject {
  SessionEntity({
    this.accessToken,
    this.refreshToken,
    this.expiresIn,
    this.hasOnboarding,
    this.hasOngoingTest,
    this.hasEmailVerified,
  });

  @HiveField(0)
  String? accessToken;

  @HiveField(1)
  String? refreshToken;

  @HiveField(2)
  int? expiresIn;

  @HiveField(3)
  bool? hasOnboarding;

  @HiveField(7)
  bool? showNotification;

  @HiveField(8)
  bool? hasOngoingTest;

  @HiveField(10)
  int? unansweredQuestions;

  @HiveField(11)
  int? apiPageCountAssessment;

  @HiveField(12)
  bool? showLandingPage;

  @HiveField(13)
  bool? hasEmailVerified;

  set setAccessToken(String? token) => accessToken = token;
  set setRefreshToken(String? token) => refreshToken = token;
  set setHasOnboarding(bool? onboarding) => hasOnboarding = onboarding;
  set setShowNotification(bool? show) => showNotification = show;
  set setHasOngoingTest(bool? test) => hasOngoingTest = test;
  set setUnansweredQuestions(int? questions) => unansweredQuestions = questions;
  set setApiPageCountAssessment(int? count) => apiPageCountAssessment = count;
  set setShowLandingPage(bool? showLanding) => showLandingPage = showLanding;
  set setHasEmailVerified(bool? verified) => hasEmailVerified = verified;
}
