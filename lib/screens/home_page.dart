import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../models/course.dart';
import 'course_detail_page.dart';
import 'profile_page.dart';

const double _kPagePadding = 16.0;

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Courses'),
        elevation: 0,
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: const Icon(Icons.person_outline),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfilePage()),
                );
              },
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(_kPagePadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Welcome, ${dummyUser.name}!', style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 6),
            Text('Choose a course to get started', style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 12),

            // Expandable list
            Expanded(
              child: ListView.builder(
                itemCount: dummyCourses.length,
                padding: const EdgeInsets.only(top: 4, bottom: 8),
                itemBuilder: (context, index) {
                  final Course course = dummyCourses[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: CourseCard(
                      course: course,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CourseDetailPage(course: course)),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CourseCard extends StatelessWidget {
  final Course course;
  final VoidCallback onTap;

  const CourseCard({
    Key? key,
    required this.course,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        leading: Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.12),
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Icon(Icons.book, size: 30),
        ),
        title: Text(
          course.title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
        ),
        subtitle: Text(
          course.description,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.play_lesson, size: 18, color: Theme.of(context).colorScheme.primary),
            const SizedBox(height: 4),
            Text('${course.lessons.length}'),
          ],
        ),
      ),
    );
  }
}
