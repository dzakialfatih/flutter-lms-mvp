import 'package:flutter/material.dart';

const double _kPagePadding = 16.0;

class LessonPage extends StatelessWidget {
  final String lessonTitle;
  final String courseName;

  const LessonPage({
    Key? key,
    required this.lessonTitle,
    required this.courseName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(title: Text(lessonTitle), elevation: 0),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with breadcrumb
            Container(
              color: colorScheme.primary.withOpacity(0.06),
              padding: const EdgeInsets.all(_kPagePadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(courseName, style: Theme.of(context).textTheme.bodySmall?.copyWith(color: colorScheme.primary)),
                  const SizedBox(height: 8),
                  Text(lessonTitle, style: Theme.of(context).textTheme.headlineSmall),
                ],
              ),
            ),

            // Placeholder content area (UI-only)
            Padding(
              padding: const EdgeInsets.all(_kPagePadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: colorScheme.surfaceVariant),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.play_circle_filled, size: 72, color: colorScheme.primary),
                          const SizedBox(height: 8),
                          Text('Lesson content not available in demo', style: Theme.of(context).textTheme.bodySmall),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text('Lesson Overview', style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 8),
                  Text(
                    'This page receives the lesson title from the course detail screen and displays a UI-only placeholder for content. In a full app you would pass the lesson data and render video or text here.',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),

            // Finish Lesson button — returns to previous page
            Padding(
              padding: const EdgeInsets.all(_kPagePadding),
              child: FilledButton(
                onPressed: () => Navigator.pop(context),
                style: FilledButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 14), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                child: const Text('Finish Lesson'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
