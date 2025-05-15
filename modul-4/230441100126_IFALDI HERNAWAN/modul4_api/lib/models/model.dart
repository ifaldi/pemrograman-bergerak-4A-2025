class Motor {
  final String merek;
  final String noRangka; // ubah dari int ke String
  final String platMotor;

  Motor({
    required this.merek,
    required this.noRangka,
    required this.platMotor,
  });

  factory Motor.fromJson(Map<String, dynamic> json) {
    return Motor(
      merek: json['merek'] ?? '',
      noRangka: json['no_rangka'] ?? '', // aman meskipun null
      platMotor: json['plat_motor'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'merek': merek,
      'no_rangka': noRangka, // langsung String
      'plat_motor': platMotor,
    };
  }
}
