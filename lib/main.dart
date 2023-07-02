import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yoga_instructor/session.provider.dart';

import 'screens/sessions_list.screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => SessionProvider(),
      child: const YogaWorkoutApp(),
    ),
  );
}

class YogaWorkoutApp extends StatelessWidget {
  const YogaWorkoutApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yoga Workout Helper',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Consumer<SessionProvider>(
        builder: (context, sessionProvider, _) {
          if (sessionProvider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (sessionProvider.hasError) {
            return const Center(child: Text('Error loading sessions'));
          } else {
            return const SessionsListScreen();
          }
        },
      ),
    );
  }
}
