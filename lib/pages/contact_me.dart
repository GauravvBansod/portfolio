import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/utils/CommonSizedBox.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactMe extends StatefulWidget {
  const ContactMe({super.key});

  @override
  State<ContactMe> createState() => _ContactMeState();
}

class _ContactMeState extends State<ContactMe> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      print("Name: ${_nameController.text}");
      print("Email: ${_emailController.text}");
      print("Message: ${_messageController.text}");

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Message sent!'),
          backgroundColor: Colors.teal,
        ),
      );

      _nameController.clear();
      _emailController.clear();
      _messageController.clear();
    }
  }

  // Function to launch URLs for social links
  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Could not launch URL')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        width: screenSize.width,
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            boxH10(),
            Text(
              'Contact Me',
              style: GoogleFonts.poppins(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            boxH10(),
            // const Text(
            //   'Get in touch to collaborate or discuss opportunities',
            //   style: TextStyle(
            //     fontSize: 16,
            //     color: Colors.black87,
            //     height: 1.6,
            //   ),
            //   textAlign: TextAlign.center,
            // ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 800),
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade50,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.teal.withOpacity(0.2)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header with Icon
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.teal.withOpacity(0.1),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.connect_without_contact,
                              color: Colors.teal,
                              size: 32,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Text(
                            'Let’s Connect',
                            style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                      boxH20(),
                      // Form
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: _nameController,
                              decoration: InputDecoration(
                                labelText: 'Name',
                                labelStyle: const TextStyle(color: Colors.teal),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(color: Colors.teal, width: 2),
                                ),
                                filled: true,
                                fillColor: Colors.teal.withOpacity(0.05),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your name';
                                }
                                return null;
                              },
                            ),
                            boxH20(),
                            TextFormField(
                              controller: _emailController,
                              decoration: InputDecoration(
                                labelText: 'Email',
                                labelStyle: const TextStyle(color: Colors.teal),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(color: Colors.teal, width: 2),
                                ),
                                filled: true,
                                fillColor: Colors.teal.withOpacity(0.05),
                              ),
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your email';
                                } else if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                                  return 'Enter a valid email address';
                                }
                                return null;
                              },
                            ),
                            boxH20(),
                            TextFormField(
                              controller: _messageController,
                              decoration: InputDecoration(
                                labelText: 'Message',
                                labelStyle: const TextStyle(color: Colors.teal),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(color: Colors.teal, width: 2),
                                ),
                                filled: true,
                                fillColor: Colors.teal.withOpacity(0.05),
                                alignLabelWithHint: true,
                              ),
                              maxLines: 5,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter a message';
                                }
                                return null;
                              },
                            ),
                            boxH30(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      icon: Image.asset('assets/skils/gmail.png', height: 24),
                                      onPressed: () => _launchURL('mailto:gauravbansod020@gmail.com'),
                                      tooltip: 'Email',
                                    ),
                                    IconButton(
                                      icon: Image.asset('assets/skils/linkedin.png', height: 24), // Adjust path
                                      onPressed: () => _launchURL('https://www.linkedin.com/in/gaurav-bansod'), // Replace with your LinkedIn
                                      tooltip: 'LinkedIn',
                                    ),
                                    IconButton(
                                      icon: Image.asset('assets/skils/github.png', height: 24), // Adjust path
                                      onPressed: () => _launchURL('https://github.com/gauravbansod'), // Replace with your GitHub
                                      tooltip: 'GitHub',
                                    ),
                                  ],
                                ),
                                ElevatedButton.icon(
                                  onPressed: _submitForm,
                                  icon: const Icon(Icons.send, size: 20),
                                  label: const Text('Send Message'),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.teal,
                                    foregroundColor: Colors.white,
                                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    textStyle: GoogleFonts.poppins(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                    elevation: 2,
                                    shadowColor: Colors.teal.withOpacity(0.3),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}