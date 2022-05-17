import 'package:test/test.dart';

import '../../lib/models/classes_and_subjects.dart';

void main() {
  group("Classes And Subjects", () {
    test("Initial Value", () {
      final ClassesAndSubjects classesAndSubjects = ClassesAndSubjects();

      expect(
        classesAndSubjects.classes,
        [],
      );
    });

    test("After Fecthing Data from JSON File", () {
      final ClassesAndSubjects classesAndSubjects = ClassesAndSubjects();

      classesAndSubjects.fetchClasses();

      expect(
        classesAndSubjects.classes,
        [],
      );
    });
  });
}
