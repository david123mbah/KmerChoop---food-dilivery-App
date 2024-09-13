import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: const Center(child: Text('Contact Us')),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Animated image with fade, shake, and scale effects
            Image.asset(
              "lib/assets/images/undraw_Chat_bot_re_e2gj.png",
              width: 360,
              height: 360,
            )
                .animate()
                .fadeIn(duration: 1000.ms)
                .shake(
                  duration: 1500.ms,
                  hz: 10,
                  offset: const Offset(10, 0),
                )
                .scale(
                  begin: const Offset(0.8, 0.8),
                  end: const Offset(1.0, 1.0),
                  duration: 1000.ms,
                ),
            const SizedBox(height: 45),

            // Contact information
            Text(
              'Get in touch with us',
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            )
                .animate()
                .fadeIn(delay: 1200.ms, duration: 800.ms)
                .slideY(begin: 0.2, end: 0),
            const SizedBox(height: 20),
            Text(
              'Phone: +237 652 892 462',
              style: TextStyle(
                fontSize: 14,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            )
                .animate()
                .fadeIn(delay: 1500.ms, duration: 800.ms)
                .slideX(begin: -0.2, end: 0),
            const SizedBox(height: 10),
            Text(
              'Email: davidmbah1234@gmail.com',
              style: TextStyle(
                fontSize: 14,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            )
                .animate()
                .fadeIn(delay: 1800.ms, duration: 800.ms)
                .slideX(begin: 0.2, end: 0),

            const SizedBox(height: 45),

            // Animated WhatsApp button
            ElevatedButton(
              onPressed: () async {
               
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF25D366), // WhatsApp green
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.phone_android_rounded),
                  SizedBox(width: 8),
                  Text(
                    'Chat with us on WhatsApp ',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
