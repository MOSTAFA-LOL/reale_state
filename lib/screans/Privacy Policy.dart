import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Policy'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionHeader(
              title: '1. Introduction',
              content:
                  'Welcome to [AQAREK], a mobile application for buying, selling, and renting real estate. By using the app, you consent to the practices described below.',
            ),
            const SectionHeader(
              title: '2. Data We Collect',
              content: 'We collect the following types of information:',
              bullets: [
                'Personal Information (Name, email, phone number, address)',
                'Government-issued ID (for property transactions)',
                'Usage Data (search history, device information)',
                'Location Data (GPS or approximate location)',
                'Financial Information (processed via secure gateways)',
              ],
            ),
            const SectionHeader(
              title: '3. How We Use Your Data',
              bullets: [
                'Personalize your experience',
                'Facilitate transactions and bookings',
                'Improve app performance',
                'Send updates and legal notices',
              ],
            ),
            const SectionHeader(
              title: '4. Data Sharing',
              content: 'We share data with:',
              bullets: [
                'Payment gateways (Stripe, PayPal)',
                'Cloud services (Firebase)',
                'Analytics tools (Google Analytics)',
                'Legal authorities when required',
              ],
              note: 'We do NOT sell your data to advertisers.',
            ),
            const SectionHeader(
              title: '5. Data Security',
              bullets: [
                'SSL/TLS encryption',
                'Restricted database access',
                'Regular security audits',
              ],
            ),
            const SectionHeader(
              title: '6. Your Rights',
              bullets: [
                'Access/Edit your data',
                'Request deletion',
                'Opt-out of marketing',
              ],
            ),
            const SectionHeader(
              title: '7. Cookies & Tracking',
              content:
                  'We use cookies and analytics tools. You can disable these in your device settings.',
            ),
            const SectionHeader(
              title: '8. Children’s Privacy',
              content:
                  'Not intended for users under 18. We do not knowingly collect minor data.',
            ),
            const SectionHeader(
              title: '9. Policy Updates',
              content: 'Changes will be notified via in-app alerts or email.',
            ),
            const SectionHeader(
              title: '10. Contact Us',
              content: 'For questions or requests: privacy@realestateapp.com',
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[300],
                  ),
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Decline',
                      style: TextStyle(color: Colors.black)),
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                    onPressed: () {
                      // Handle agreement
                      _showBookingConfirmation(context);
                      Navigator.pop(context);
                    },
                    child: const Text('Agree',
                        style: TextStyle(color: Colors.white))),
              ],
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  void _showBookingConfirmation(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Acceptance of Terms Successfully ',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Colors.green.shade600,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;
  final String? content;
  final List<String>? bullets;
  final String? note;

  const SectionHeader({
    super.key,
    required this.title,
    this.content,
    this.bullets,
    this.note,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[800],
                )),
        const SizedBox(height: 8),
        if (content != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child:
                Text(content!, style: Theme.of(context).textTheme.titleMedium),
          ),
        if (bullets != null)
          ...bullets!.map((bullet) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 2.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('• ', style: TextStyle(fontSize: 16)),
                    Expanded(
                        child: Text(bullet,
                            style: Theme.of(context).textTheme.titleMedium)),
                  ],
                ),
              )),
        if (note != null)
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(note!,
                style: TextStyle(
                  color: Colors.green[800],
                  fontWeight: FontWeight.bold,
                )),
          ),
        const Divider(height: 40),
      ],
    );
  }
}
