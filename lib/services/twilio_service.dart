import 'dart:convert';
import 'package:http/http.dart' as http;

import '../constants/global.dart';

class TwilioService {
  static final String _accountSid = TWILIO_ACCOUNT_SID;
  static final String _authToken = TWILIO_AUTH_TOKEN;
  static final String _twilioPhoneNumber = TWILIO_PHONE_NUMBER;

  static Future<bool> sendMessage(String toPhoneNumber, String message) async {
    final String url =
        'https://api.twilio.com/2010-04-01/Accounts/$_accountSid/Messages.json';

    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Authorization':
            'Basic ${base64Encode(utf8.encode('$_accountSid:$_authToken'))}',
      },
      body: {
        'From': _twilioPhoneNumber,
        'To': toPhoneNumber,
        'Body': message,
      },
    );

    return response.statusCode == 201;
  }
}
