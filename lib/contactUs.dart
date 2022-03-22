import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Home/homePage.dart';

class ContactUs extends StatefulWidget {
  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  final controllerName = TextEditingController(text: '');
  final controllerEmail = TextEditingController(text: '');
  final controllerMessage = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("Contact Us"),
          centerTitle: true,
          backgroundColor: Color(0xFF1E233C),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                child: Container(
                  color: Color(0xFFDDE3FD),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 20),
                    child: Text(
                      "If you have questions or just want to get in touch, use the form below. We look forward to hearing from you!",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 5, 16, 5),
                child: buildTextField(
                  title: 'Name',
                  controller: controllerName,
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 5, 16, 5),
                child: buildTextField(
                  title: 'Email',
                  controller: controllerEmail,
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 5, 16, 5),
                child: buildTextField(
                  title: 'Message',
                  controller: controllerMessage,
                  maxLines: 5,
                ),
              ),
              const SizedBox(height: 32),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 5, 16, 5),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size.fromHeight(50),
                    textStyle: TextStyle(fontSize: 20),
                    primary: Color(0xFF1E233C),
                  ),
                  child: Text(
                    'SEND',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5,
                    ),
                  ),
                  onPressed: () {
                    sendEmail(
                      name: controllerName.text,
                      email: controllerEmail.text,
                      message: controllerMessage.text,
                    );
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => Home()));
                  }
                ),
              ),
            ],
          ),
        ),
      );

  Future sendEmail({
    required String name,
    required String email,
    required String message,
  }) async {
    final serviceId = 'service_gpog28i';
    final templateId = 'template_izddwnp';
    final userId = '_8q3MgbgdLudlraWi';

    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    final response = await http.post(
      url,
      headers: {
        'origin': 'http://localhost',
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'service_id': serviceId,
        'template_id': templateId,
        'user_id': userId,
        'template_params': {
          'user_name': name,
          'user_email': email,
          // 'to_email': 'other.email@gmail.com',
          'user_message': message,
        },
      }),
    );
  }

  Widget buildTextField({
    required String title,
    required TextEditingController controller,
    int maxLines = 1,
  }) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          TextField(
            controller: controller,
            maxLines: maxLines,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
        ],
      );
}
