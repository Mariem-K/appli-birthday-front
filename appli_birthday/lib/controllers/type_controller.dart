import 'dart:convert';

import 'package:appli_birthday/controllers/auth_controller.dart';
import 'package:appli_birthday/helpers/appli_api.dart';
import 'package:appli_birthday/models/event_type.dart';
import 'package:http/http.dart' as http;

class TypeController {

  static Future<List<EventType>> getAllTypes() async {
    String? token = await AuthController.getToken();

    if (token == null) {
      throw Exception('Failed to load user');
    }

    List<EventType> types = <EventType>[];

    final List<dynamic> responseMap = await AppliAPI.get('/types');

    types = responseMap.map((type) {
      return EventType.fromJson(type);
    }).toList();
    return types;
  }

}