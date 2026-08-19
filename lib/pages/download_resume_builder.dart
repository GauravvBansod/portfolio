import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/controllers/home_controller.dart';
import 'package:portfolio/pages/loading/loading_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class DownloadResumeBuilder extends StatefulWidget {
  const DownloadResumeBuilder({super.key});

  @override
  State<DownloadResumeBuilder> createState() => _DownloadResumeBuilderState();
}

class _DownloadResumeBuilderState extends State<DownloadResumeBuilder> {

  Future<void> _launchURL(String url) async {
    // Simulate a short delay to show the loading indicator
    await Future.delayed(const Duration(milliseconds: 1000));

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
    return Stack(
      alignment: Alignment.center,
      children: [
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.red,
              side: const BorderSide(color: Colors.red),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            ),
            onPressed:() {
              Get.find<HomeController>().isLoading.value = true;
              Future.delayed(const Duration(seconds: 5), () {
                Get.find<HomeController>().isLoading.value = false;
              });
              _launchURL(
                "https://drive.google.com/file/d/1NL0UF7olWxkc_DCSRplTx4rkAHsRjekV/view?usp=sharing",
              );
            },
            child: const Text("Download Resume"),
          ),
        ),

      ],
    );
  }
}
