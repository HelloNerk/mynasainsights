import 'package:flutter/material.dart';
import 'package:mynasainsights/core/app_constants.dart';

class CoverPage extends StatelessWidget {
  final String studentName = 'Joseph Alexis Huamani Mandujano';
  final String studentCode = 'U20221A133';

  const CoverPage({super.key});

  String determineApi(String code) {
    int lastDigit = int.tryParse(code.substring(code.length - 1)) ?? 0;
    return lastDigit % 2 == 0 ? 'Mars Rover Photos' : 'APOD';
  }

  @override
  Widget build(BuildContext context) {
    String apiName = determineApi(studentCode);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Application Cover',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center, // Asegurar alineación horizontal
          children: [
            // Image related to the app
            const Text(
              'Welcome to APOD NASA Insights',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                AppConstants.backgroundImage,
                width: MediaQuery.of(context).size.width * 0.8, // Ancho reducido
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            // Profile image
            const CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage(AppConstants.profileImage),
            ),
            const SizedBox(height: 16),
            // Student name
            Text(
              studentName,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            // Student code
            Text(
              'Student code: $studentCode',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 16),
            // API name
            Text(
              'Selected API: $apiName',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
