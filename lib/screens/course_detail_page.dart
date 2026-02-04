import 'package:flutter/material.dart';
import '../models/course.dart';
import 'lesson_page.dart';

const double _kPagePadding = 16.0;

class CourseDetailPage extends StatelessWidget {
  final Course course;

  const CourseDetailPage({Key? key, required this.course}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(title: Text(course.title), elevation: 0),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header graphic
            Container(
              width: double.infinity,
              height: 160,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [colorScheme.primary, colorScheme.primary.withOpacity(0.7)],
                ),
              ),
              child: const Center(child: Icon(Icons.book, size: 72, color: Colors.white)),
            ),

            Padding(
              padding: const EdgeInsets.all(_kPagePadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(course.title, style: Theme.of(context).textTheme.headlineSmall),
                  const SizedBox(height: 8),
                  Row(children: [
                    Icon(Icons.person, size: 16, color: Colors.grey[600]),
                    const SizedBox(width: 8),
                    Text('by ${course.instructor}', style: Theme.of(context).textTheme.bodySmall),
                  ]),
                  const SizedBox(height: 16),
                  Text('Description', style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 8),
                  Text(course.description, style: Theme.of(context).textTheme.bodyMedium),
                  const SizedBox(height: 20),
                  Text('Lessons (${course.lessons.length})', style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 8),

                  // Lessons list
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: course.lessons.length,
                    separatorBuilder: (context, index) => const SizedBox(height: 8),
                    itemBuilder: (context, index) {
                      final lesson = course.lessons[index];
                      return LessonTile(
                        lesson: lesson,
                        lessonNumber: index + 1,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LessonPage(
                                lessonTitle: lesson.title,
                                courseName: course.title,
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LessonTile extends StatelessWidget {
  final Lesson lesson;
  final int lessonNumber;
  final VoidCallback onTap;

  const LessonTile({Key? key, required this.lesson, required this.lessonNumber, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isVideo = lesson.type == LessonType.video;

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        leading: Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: colorScheme.primary.withOpacity(0.12),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(isVideo ? Icons.play_circle : Icons.article, size: 30, color: colorScheme.primary),
        ),
        title: Text('Lesson $lessonNumber: ${lesson.title}', style: Theme.of(context).textTheme.titleMedium),
        subtitle: Text(isVideo ? 'Video Lesson' : 'Text Lesson'),
        trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey[600]),
      ),
    );
  }
}
