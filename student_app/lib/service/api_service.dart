import 'package:student_app/config/config.dart';

class ApiService {
  static Uri buildUrl(String endpoint)
  {
    return Uri.parse('${Config.baseUrl}$endpoint');
  }
}