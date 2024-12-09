class SocialSignInData {
  final String email;
  final String? phone;
  final String socialMediaType;
  final String socialID;

  SocialSignInData({
    required this.email,
    this.phone,
    required this.socialMediaType,
    required this.socialID,
  });
}
