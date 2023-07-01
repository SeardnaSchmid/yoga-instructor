import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import 'dart:convert' show json;
import 'package:flutter/services.dart' show rootBundle;

import 'models/yoga_session.dart';

class SessionManager {
  static const String sessionsKey = 'sessions';
  static const String sessionsUrl = 'https://raw.githubusercontent.com/your-username/your-repo/main/defaultSessions.json';

  // Save sessions to local storage
  static Future<void> saveSessions(List<Session> sessions) async {
    final prefs = await SharedPreferences.getInstance();
    final sessionsJson = json.encode(sessions.map((session) => session.toJson()).toList());
    await prefs.setString(sessionsKey, sessionsJson);
  }

  // Retrieve sessions from local storage
  static Future<List<Session>> getSessions() async {
    final prefs = await SharedPreferences.getInstance();
    final sessionsJson = prefs.getString(sessionsKey);
    if (sessionsJson != null) {
      final sessionsData = json.decode(sessionsJson) as List<dynamic>;
      final sessions = sessionsData.map((session) => Session.fromJson(session)).toList();
      return sessions;
    } else {
      return [];
    }
  }

  // Load sessions from a static asset JSON file
  static Future<List<Session>> loadSessionsFromAsset() async {
    try {
      final String jsonData = await rootBundle.loadString('assets/defaultSessions.json');
      final List<dynamic> sessionsData = json.decode(jsonData) as List<dynamic>;
      final sessions = sessionsData.map((session) => Session.fromJson(session)).toList();
      return sessions;
    } catch (error) {
      print('Error loading sessions from asset: $error');
      return [];
    }
  }

  // // Fetch sessions from the internet and save to local storage
  // static Future<void> fetchSessions() async {
  //   try {
  //     final response = await http.get(Uri.parse(sessionsUrl));
  //     if (response.statusCode == 200) {
  //       final sessionsData = json.decode(response.body) as List<dynamic>;
  //       final sessions = sessionsData.map((session) => Session.fromJson(session)).toList();
  //       await saveSessions(sessions);
  //       print('Sessions fetched and saved successfully');
  //     } else {
  //       print('Failed to fetch sessions: ${response.statusCode}');
  //     }
  //   } catch (error) {
  //     print('Error fetching sessions: $error');
  //   }
  // }
  //
  // // Fetch sessions from the internet with fallback to local storage
  // static Future<List<Session>> fetchSessionsWithFallback() async {
  //   try {
  //     final response = await http.get(Uri.parse(sessionsUrl));
  //     if (response.statusCode == 200) {
  //       final sessionsData = json.decode(response.body) as List<dynamic>;
  //       final sessions = sessionsData.map((session) => Session.fromJson(session)).toList();
  //       await saveSessions(sessions);
  //       print('Sessions fetched and saved successfully');
  //       return sessions;
  //     } else {
  //       print('Failed to fetch sessions: ${response.statusCode}');
  //     }
  //   } catch (error) {
  //     print('Error fetching sessions: $error');
  //   }
  //
  //   // Fallback to local storage if fetching from the internet fails
  //   final sessions = await getSessions();
  //   if (sessions.isNotEmpty) {
  //     print('Using sessions from local storage as fallback');
  //   } else {
  //     print('No sessions available in local storage');
  //   }
  //   return sessions;
  // }
}
