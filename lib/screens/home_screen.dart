import 'package:flutter/material.dart';

import '../services/twilio_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  void _sendMessage() {
    final toPhoneNumber = _phoneNumberController.text.trim();
    final message = _messageController.text.trim();

    if (toPhoneNumber.isNotEmpty && message.isNotEmpty) {
      TwilioService.sendMessage(toPhoneNumber, message);
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ChatBot - Whatsapp'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            children: [
              TextField(
                controller: _phoneNumberController,
                decoration:
                    const InputDecoration(labelText: 'Número de teléfono'),
                keyboardType: TextInputType.phone,
              ),
              TextField(
                controller: _messageController,
                decoration: const InputDecoration(labelText: 'Mensaje'),
                keyboardType: TextInputType.multiline,
                minLines: 2,
                maxLines: 4,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _sendMessage,
                child: const Text('Enviar mensaje'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
