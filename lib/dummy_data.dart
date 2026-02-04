import 'models/course.dart';
import 'models/user.dart';

final dummyUser = User(
  id: 1,
  name: 'John Doe',
  email: 'john@example.com',
  profileImageUrl: 'https://via.placeholder.com/150',
);

final dummyCourses = [
  Course(
    id: 1,
    title: 'Flutter Basics',
    description: 'Learn the fundamentals of Flutter development',
    instructor: 'Sarah Johnson',
    lessons: [
      Lesson(
        id: 1,
        title: 'Getting Started',
        content: 'https://www.youtube.com/embed/dQw4w9WgXcQ',
        type: LessonType.video,
      ),
      Lesson(
        id: 2,
        title: 'Widgets Introduction',
        content:
            'Widgets are the building blocks of Flutter apps. Learn about StatelessWidget, StatefulWidget, and more.',
        type: LessonType.text,
      ),
      Lesson(
        id: 3,
        title: 'Building Layouts',
        content: 'https://www.youtube.com/embed/7V3p9Cr3d2c',
        type: LessonType.video,
      ),
    ],
  ),
  Course(
    id: 2,
    title: 'Dart Programming',
    description: 'Master the Dart programming language',
    instructor: 'Mike Smith',
    lessons: [
      Lesson(
        id: 4,
        title: 'Dart Syntax',
        content:
            'Understand variables, functions, classes, and other Dart language features.',
        type: LessonType.text,
      ),
      Lesson(
        id: 5,
        title: 'Object-Oriented Programming',
        content: 'https://www.youtube.com/embed/AbC123def45',
        type: LessonType.video,
      ),
    ],
  ),
  Course(
    id: 3,
    title: 'State Management',
    description: 'Learn different state management techniques in Flutter',
    instructor: 'Emma Wilson',
    lessons: [
      Lesson(
        id: 6,
        title: 'Provider Pattern',
        content:
            'Explore the popular Provider package for managing state in Flutter applications.',
        type: LessonType.text,
      ),
      Lesson(
        id: 7,
        title: 'BLoC Pattern',
        content: 'https://www.youtube.com/embed/xyz789ABC012',
        type: LessonType.video,
      ),
      Lesson(
        id: 8,
        title: 'Riverpod Introduction',
        content:
            'Learn about Riverpod, a modern reactive caching and state management framework.',
        type: LessonType.text,
      ),
    ],
  ),
  Course(
    id: 4,
    title: 'Firebase Integration',
    description: 'Integrate Firebase services into your Flutter app',
    instructor: 'Alex Brown',
    lessons: [
      Lesson(
        id: 9,
        title: 'Firebase Setup',
        content:
            'Step-by-step guide to setting up Firebase in your Flutter project.',
        type: LessonType.text,
      ),
      Lesson(
        id: 10,
        title: 'Firestore Database',
        content: 'https://www.youtube.com/embed/123XYZ789ABC',
        type: LessonType.video,
      ),
    ],
  ),
];
