import 'package:flutter/material.dart';
import 'package:realestate/screans/sign_up.dart';

// ignore: camel_case_types
class Terms_of_service extends StatelessWidget {
  const Terms_of_service({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Terms of Service',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Our Terms of Services:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.blueGrey[800],
                ),
              ),
              SizedBox(height: 24),
              _buildSectionTitle('1. Acceptance of Terms'),
              _buildSectionContent(
                'By using this app, you agree to comply with the terms and conditions outlined here. '
                'If you disagree, please refrain from using the app.',
              ),
              SizedBox(height: 15),
              const Divider(height: 40),
              _buildSectionTitle('2. Service Description'),
              _buildSectionContent(
                'The app facilitates real estate transactions (buying/selling) and booking consultations '
                'with certified agents.',
              ),
              SizedBox(height: 8),
              _buildBulletPoint(
                'We provide detailed property information (images, prices, locations, etc.), '
                'though data may slightly differ from reality.',
              ),
              
              const Divider(height: 40),
              _buildSectionTitle('3. Legal Responsibilities'),
              _buildSectionContent(
                'The app is not liable for inaccuracies in property details provided by advertisers or agents.',
              ),
              SizedBox(height: 8),
              _buildBulletPoint(
                'Illegal activities or posting misleading content on the app are strictly prohibited.',
              ),
              
              const Divider(height: 40),
              _buildSectionTitle('4. Cancellations and Refunds'),
              _buildSectionContent(
                  'You are responsible for maintaining the confidentiality of your account credentials.'),
              SizedBox(height: 8),
              _buildBulletPoint(
                  'We collect personal data to improve services and will not share it with third parties without your consent (unless required by law).'),
              
              const Divider(height: 40),
              _buildSectionTitle('5. Updates and Technical Support'),
              _buildSectionContent(
                  'Cancellations or refund requests must align with the policy stated during payment.'),
              SizedBox(height: 8),
              _buildBulletPoint(
                  'Refunds will not be issued for violations of these terms..'),
              const Divider(height: 40),
              _buildSectionTitle('6. Payments and Commissions'),
              _buildSectionContent(
                  'Payments are subject to the policies of third-party financial providers (e.g., credit cards, e-wallets).'),
              SizedBox(height: 8),
              _buildBulletPoint(
                  'A predefined commission may apply to completed transactions, and you will be notified in advance.'),
              const Divider(height: 40),
              _buildSectionTitle('7. Updates and Technical Support'),
              _buildSectionContent(
                  'Payments are subject to the policies of third-party financial providers (e.g., credit cards, e-wallets).'),
              SizedBox(height: 8),
              _buildBulletPoint(
                  'For support, contact us at: support@realestateapp.com.'),
              const Divider(height: 40),
              _buildSectionTitle('8. Modification of Terms'),
              _buildSectionContent(
                  'We reserve the right to update these terms at any time. Users will be notified via the app or email.'),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 129, 128, 128),
                      padding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Delince',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: color,
                      padding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      _showBookingConfirmation(context);
                    },
                    child: Text(
                      'Agree',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
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

  // Helper widget for section titles
  Widget _buildSectionTitle(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.indigo[700],
        ),
      ),
    );
  }

// Helper widget for section content
  Widget _buildSectionContent(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 14,
        height: 1.4,
        color: Colors.grey[600],
      ),
      textAlign: TextAlign.start,
    );
  }

// Helper widget for bullet points
  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('• ', style: TextStyle(fontSize: 14)),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 14,
                height: 1.4,
                color: Colors.grey[600],
              ),
              textAlign: TextAlign.start,
            ),
          ),
        ],
      ),
    );
  }
}
