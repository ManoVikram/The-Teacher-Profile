import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart' show rootBundle;

import './Class.dart';
import './Subject.dart';

class ClassesAndSubjects extends ChangeNotifier {
  List<Class> classes = [];

  // List<Class> get classes => [..._classes];

  Future<void> fetchClasses() async {
    final String data = await rootBundle.loadString("assets/assets.json");
    final Map<String, dynamic> extractedData =
        jsonDecode(data) as Map<String, dynamic>;

    final List<Class> loadedClasses = [];

    for (var classData in extractedData["classess"]) {
      List<Subject> subjects = [];

      for (var subjectData in classData["subjects"]) {
        subjects.add(
          Subject(
            name: subjectData["subject_name"],
            imageURL: subjectData["subject_image"],
            isSelected: false,
          ),
        );
      }

      loadedClasses.add(
        Class(
          standartName: classData["standard"],
          subjects: subjects,
        ),
      );
    }

    print(loadedClasses);

    classes = loadedClasses;

    notifyListeners();
  }
}
