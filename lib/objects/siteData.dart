class SiteData {
  final String telegramViber;
  final String workPhone;
  final String privatCard;
  final String monoCard;
  final String monoJar;
  final String siteLink;
  final String donationLink;
  final String instagram;
  final String facebook;
  final String tiktok;

  SiteData({
    required this.telegramViber,
    required this.workPhone,
    required this.privatCard,
    required this.monoCard,
    required this.monoJar,
    required this.siteLink,
    required this.donationLink,
    required this.instagram,
    required this.facebook,
    required this.tiktok,
  });

  factory SiteData.fromMap(Map<String, dynamic> map) {
    return SiteData(
      telegramViber: map['p_telegramViber'] ?? '',
      workPhone: map['p_work'] ?? '',
      privatCard: map['c_privat'] ?? '',
      monoCard: map['c_mono'] ?? '',
      monoJar: map['l_c_mono'] ?? '',
      siteLink: map['l_site'] ?? '',
      donationLink: map['l_donation'] ?? '',
      instagram: map['l_instagram'] ?? '',
      facebook: map['l_facebook'] ?? '',
      tiktok: map['l_tiktok'] ?? '',
    );
  }
}
