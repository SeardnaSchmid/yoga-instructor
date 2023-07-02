import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert' show json;
import 'package:flutter/services.dart' show rootBundle;

import 'models/yoga_session.dart';

class SessionProvider with ChangeNotifier {
  final String sessionsKey = 'sessions';
  List<Session> _sessions = [];
  bool _isLoading = false;
  bool _hasError = false;

  List<Session> get sessions => _sessions;
  bool get isLoading => _isLoading;
  bool get hasError => _hasError;

  SessionProvider() {
    initializeDefaultSessions();
  }

  Future<void> initializeDefaultSessions() async {
    _isLoading = true;
    notifyListeners();

    final List<Session> defaultSessions = await loadSessionsFromAsset();
    _sessions = defaultSessions;

    _isLoading = false;
    notifyListeners();
  }

  Future<void> saveSessions() async {
    final prefs = await SharedPreferences.getInstance();
    final sessionsJson =
    json.encode(_sessions.map((session) => session.toJson()).toList());
    await prefs.setString(sessionsKey, sessionsJson);
  }

  Future<void> loadSessions() async {
    _isLoading = true;
    _hasError = false;
    notifyListeners();

    try {
      final prefs = await SharedPreferences.getInstance();
      final sessionsJson = prefs.getString(sessionsKey);
      if (sessionsJson != null) {
        final sessionsData = json.decode(sessionsJson) as List<dynamic>;
        _sessions =
            sessionsData.map((session) => Session.fromJson(session)).toList();
      } else {
        _sessions = [];
      }
    } catch (error, stackTrace) {
      print('Error loading sessions: $error');
      print('Stack trace: $stackTrace');
      _hasError = true;
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> resetToDefaultSessions() async {
    _isLoading = true;
    _hasError = false;
    notifyListeners();

    final defaultSessions = await loadSessionsFromAsset();
    _sessions = defaultSessions;

    await saveSessions();

    _isLoading = false;
    notifyListeners();
  }

  Future<List<Session>> loadSessionsFromAsset() async {
    try {
      final jsonData =
      await rootBundle.loadString('assets/defaultSessions.json');
      final sessionsData = json.decode(jsonData) as List<dynamic>;
      final sessions =
      sessionsData.map((session) => Session.fromJson(session)).toList();
      return sessions;
    } catch (error, stackTrace) {
      print('Error loading sessions from asset: $error');
      print('Stack trace: $stackTrace');
      return [];
    }
  }

  Future<void> saveSession(Session session) async {
    final index = _sessions.indexWhere((s) => s.id == session.id);

    if (index != -1) {
      _sessions[index] = session;
    } else {
      _sessions.add(session);
    }

    await saveSessions();
    notifyListeners();
  }

  Future<Session> getSession(String sessionId) async {
    final session = _sessions.firstWhere(
          (session) => session.id == sessionId,
      orElse: () => throw Exception('Session not found'),
    );
    return session;
  }

  Session? getSessionById(String sessionId) {
    return _sessions.firstWhere(
          (session) => session.id == sessionId,
      orElse: () => throw Error(),
    );
  }
}
