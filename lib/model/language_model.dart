class LanguageModel{
  final String lgName;
  final String lgCode;
  final String? imageUrl;
  final String countryCode;

  LanguageModel({
    required this.imageUrl,
    required this.countryCode,
    required this.lgCode,
    required this.lgName
});

  static const String LANGUAGE_CODE = "Language_code";
  static const String COUNTRY_CODE = "country_code";

  static List<LanguageModel> language = [
    LanguageModel( imageUrl: '', countryCode: 'US', lgCode: 'en', lgName: 'English'),
    LanguageModel( imageUrl: '', countryCode: 'VN', lgCode: 'vi', lgName: 'Vietnames')
  ];
}