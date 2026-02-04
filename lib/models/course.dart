class Course {
  final int id;
  final String title;
  final String description;
  final String instructor;
  final List<Lesson> lessons;

  Course({
    required this.id,
    required this.title,
    required this.description,
    required this.instructor,
    required this.lessons,
  });
}

class Lesson {
  final int id;
  final String title;
  final String content;
  final LessonType type;

  Lesson({
    required this.id,
    required this.title,
    required this.content,
    required this.type,
  });
}

enum LessonType { video, text }
