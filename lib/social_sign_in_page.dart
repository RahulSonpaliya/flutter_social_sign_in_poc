import 'package:flutter/material.dart';
import 'package:flutter_social_sign_in_poc/fb_sign_in_utils.dart';
import 'package:flutter_social_sign_in_poc/google_sign_in_utils.dart';
import 'package:flutter_social_sign_in_poc/social_sign_in_data.dart';

class SocialSignInPage extends StatefulWidget {
  const SocialSignInPage({super.key});

  @override
  State<SocialSignInPage> createState() => _SocialSignInPageState();
}

class _SocialSignInPageState extends State<SocialSignInPage> {
  SocialSignInData? _socialSignInData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                final data = await GoogleSignInUtils.singIn();
                setState(() {
                  _socialSignInData = data;
                });
              },
              child: const Text('Sign In With Google'),
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () async {
                final data = await FBSignInUtils.singIn();
                setState(() {
                  _socialSignInData = data;
                });
              },
              child: const Text('Sign In With FB'),
            ),
            const SizedBox(
              height: 15,
            ),
            if (_socialSignInData != null) Text(_socialSignInData!.email),
            if (_socialSignInData != null) Text(_socialSignInData!.socialID),
          ],
        ),
      ),
    );
  }
}
