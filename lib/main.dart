import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/home_screen.dart';

import './models/classes_and_subjects.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ClassesAndSubjects(),
      child: const MaterialApp(
        title: "Teacher Profile",
        debugShowCheckedModeBanner: false,
        home: TeacherProfile(),
      ),
    );
  }
}

class TeacherProfile extends StatelessWidget {
  const TeacherProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const HomeScreen();
  }
}

void main() {
  runApp(const MyApp());
}
