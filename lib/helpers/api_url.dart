class ApiUrl {
  static const String baseUrl = 'https://responsi1a.dalhaqq.xyz';

  static const String listIkan = '$baseUrl/ikan';
  static const String createIkan = '$baseUrl/ikan';

  static String showIkan(int id) {
    return '$baseUrl/ikan/$id';
  }

  static String updateIkan(int id) {
    return '$baseUrl/ikan/$id/update/';
  }

  static String deleteIkan(int id) {
    return '$baseUrl/ikan/$id';
  }
}
