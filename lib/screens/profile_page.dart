import 'package:flutter/material.dart';
import '../dummy_data.dart';

const double _kPagePadding = 16.0;

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late String _photoPlaceholder;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: dummyUser.name);
    _emailController = TextEditingController(text: dummyUser.email);
    _photoPlaceholder = 'A'; // Initial placeholder — first letter of name
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void _handleSaveChanges() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Profile updated')),
    );
  }

  void _handleChangePhoto() {
    setState(() {
      // Simulate photo change by toggling placeholder
      _photoPlaceholder = _photoPlaceholder == 'A' ? '😊' : 'A';
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Photo changed (demo)')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(_kPagePadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 16),

              // Profile photo
              Stack(
                children: [
                  CircleAvatar(
                    radius: 56,
                    backgroundColor: colorScheme.primary.withOpacity(0.1),
                    child: Text(
                      _photoPlaceholder,
                      style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: colorScheme.primary,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: CircleAvatar(
                      radius: 18,
                      backgroundColor: colorScheme.primary,
                      child: IconButton(
                        icon: const Icon(Icons.camera_alt, size: 14, color: Colors.white),
                        onPressed: _handleChangePhoto,
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              TextButton(onPressed: _handleChangePhoto, child: const Text('Change Photo')),
              const SizedBox(height: 24),

              // Name field
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  hintText: 'Enter your name',
                  prefixIcon: const Icon(Icons.person),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  isDense: true,
                ),
              ),
              const SizedBox(height: 12),

              // Email field
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: 'Enter your email',
                  prefixIcon: const Icon(Icons.email),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  isDense: true,
                ),
              ),
              const SizedBox(height: 24),

              // Save button
              FilledButton(
                onPressed: _handleSaveChanges,
                style: FilledButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  minimumSize: const Size.fromHeight(44),
                ),
                child: const Text('Save Changes'),
              ),
              const SizedBox(height: 16),

              // Info section
              Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(_kPagePadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Account Information', style: Theme.of(context).textTheme.titleMedium),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(Icons.verified_user, size: 18),
                          const SizedBox(width: 8),
                          Expanded(child: Text('Account verified', style: Theme.of(context).textTheme.bodySmall)),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(Icons.date_range, size: 18),
                          const SizedBox(width: 8),
                          Expanded(child: Text('Member since 2024', style: Theme.of(context).textTheme.bodySmall)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
