import 'package:google_sign_in/google_sign_in.dart';

import 'social_sign_in_data.dart';

class GoogleSignInUtils {
  GoogleSignInUtils._();

  static Future<SocialSignInData?> singIn() async {
    final googleSignIn = GoogleSignIn(scopes: ['email']);
    try {
      // make sure to sign out, it will prevent auto-signin problem
      // (this is a problem i faced in Iphone-5 in which after successful
      // google-login, i was unable to login with different google account
      // as it always logs-in with previous account.)
      await googleSignIn.signOut();
      var account = await googleSignIn.signIn();
      if (account != null) {
        return SocialSignInData(
            email: account.email,
            socialID: account.id,
            socialMediaType: 'google');
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }
}
