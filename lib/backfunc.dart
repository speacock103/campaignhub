import 'global.dart' as global;
import 'package:http/http.dart' as http;
import 'package:email_auth/email_auth.dart';

class Backend {

  //email otp
  static Future<int> sendOTP (String email, EmailAuth emailsesh) async {

    bool result = await emailsesh.sendOtp(recipientMail: email, otpLength: 5);
    if (result) {
      return 0;
    }

    return 1;
  }

  //verify otp
  static Future<int> verOTP (String email, EmailAuth emailsesh, String otptoken) async {

    bool result = emailsesh.validateOtp( recipientMail: email, userOtp: otptoken);
    if (result) {
      return 0;
    }

    return 1;
  }

  //db check uid

  //add user to db with username

  //fetch user info from db with uid

}