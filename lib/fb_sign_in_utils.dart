import 'package:flutter/cupertino.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';

import 'social_sign_in_data.dart';

class FBSignInUtils {
  FBSignInUtils._();

  static Future<SocialSignInData?> singIn() async {
    final fb = FacebookLogin();
    final res = await fb.logIn(permissions: [
      FacebookPermission.publicProfile,
      FacebookPermission.email,
    ]);
    switch (res.status) {
      case FacebookLoginStatus.success:
        final email = await fb.getUserEmail();
        final profile = await fb.getUserProfile();
        if (email != null && profile != null) {
          return SocialSignInData(
            email: email,
            socialID: profile.userId,
            socialMediaType: 'facebook',
          );
        }
        return null;
      case FacebookLoginStatus.cancel:
        debugPrint('User cancel log in');
        return null;
      case FacebookLoginStatus.error:
        debugPrint('Error while log in: ${res.error}');
        return null;
    }
  }
}
