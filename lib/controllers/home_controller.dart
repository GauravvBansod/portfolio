import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController{

  RxBool isLoading = false.obs;
  static const String baseUrl = 'http://192.168.9.24:8080';

  Future<void> sendMail({required String email,
    required String subject,
    required String message,
    required BuildContext context})async {
    try {
      isLoading.value = true;
      // Prepare the JSON payload
      final Map<String, String> body = {
        'email': email ,
        'subject': subject,
        'message': message,
      };

      // Make the POST request
      final response = await http.post(
        Uri.parse('$baseUrl/send-mail'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(body),
      );

      // Check the response status
      if (response.statusCode == 200) {
        // Assuming the API returns "success" on successful email sending
        if (response.body == '"success"') {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Email sent successfully!'),
              backgroundColor: Colors.teal,
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
             SnackBar(
              content: Text('Failed to send email: ${response.body}'),
              backgroundColor: Colors.teal,
            ),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to send email: ${response.body}'),
            backgroundColor: Colors.teal,
          ),
        );
      }
    } catch (e) {
      // Handle network or other errors
      print("======================================");
      print(e.toString());
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Something went wrong please try again letter!'),
          backgroundColor: Colors.teal,
        ),
      );
    }
    finally{
    isLoading.value = false;
  }}

}