import 'package:flutter/material.dart';
import '../models/course.dart';

class LessonPage extends StatefulWidget {
  final Lesson lesson;
  final String courseName;

  const LessonPage({
    Key? key,
    required this.lesson,
    required this.courseName,
  }) : super(key: key);

  @override
  State<LessonPage> createState() => _LessonPageState();
}

class _LessonPageState extends State<LessonPage> {
  bool _isCompleted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.lesson.title),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with breadcrumb
            Container(
              color: Theme.of(context).primaryColor.withOpacity(0.1),
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.courseName,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).primaryColor,
                        ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.lesson.title,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
            ),

            // Content based on lesson type
            if (widget.lesson.type == LessonType.video)
              _buildVideoContent(context)
            else
              _buildTextContent(context),

            // Completion button
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: FilledButton.icon(
                      onPressed: () {
                        setState(() => _isCompleted = !_isCompleted);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              _isCompleted
                                  ? 'Lesson marked as completed!'
                                  : 'Lesson marked as incomplete',
                            ),
                            duration: const Duration(seconds: 2),
                          ),
                        );
                      },
                      icon: Icon(
                        _isCompleted
                            ? Icons.check_circle
                            : Icons.check_circle_outline,
                      ),
                      label: Text(
                        _isCompleted ? 'Completed' : 'Mark as Complete',
                      ),
                      style: FilledButton.styleFrom(
                        backgroundColor: _isCompleted
                            ? Colors.green
                            : Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVideoContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.black87,
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.play_circle_filled,
                    size: 80,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Video Player',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'URL: ${widget.lesson.content}',
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Video Description',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            'This is a video lesson. In a production app, you would integrate a video player like YouTube player, Vimeo, or custom video streaming.',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }

  Widget _buildTextContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Theme.of(context).primaryColor.withOpacity(0.1),
            ),
            child: Icon(
              Icons.article,
              size: 60,
              color: Theme.of(context).primaryColor,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Lesson Content',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey.withOpacity(0.3),
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: SelectableText(
              widget.lesson.content,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    height: 1.6,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
