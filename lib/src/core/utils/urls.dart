import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class Url {
  static final base = dotenv.env['API_URL'] ;
  // static const base = "http://192.168.18.23:3000";
}
