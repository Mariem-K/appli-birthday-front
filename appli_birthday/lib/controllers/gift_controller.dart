import 'dart:convert';

import 'package:appli_birthday/controllers/auth_controller.dart';
import 'package:appli_birthday/helpers/appli_api.dart';
import 'package:appli_birthday/models/gift.dart';
import 'package:http/http.dart' as http;

class GiftController {

  static Future<Gift> getGift(int id) async {
    String? token = await AuthController.getToken();

    if (token == null) {
      throw Exception('Failed to load user');
    }

    var responseMap = await AppliAPI.get('/gift/$id');

    return Gift.fromJson(responseMap);
  }

  static createGifts(int eventId, List<Gift> gifts) async {
    String? token = await AuthController.getToken();

    if (token == null) {
      throw Exception('Failed to load user');
    }
    var response = await AppliAPI.post(
      '/gift/add',
      {
        'event_id': eventId,
        'gifts': gifts
      },
    );

    return response;
  }

  static Future<Gift> editGift(Gift gift, int id) async {
    String? token = await AuthController.getToken();

    if (token == null) {
      throw Exception('Failed to load user');
    }

    var response = await AppliAPI.patch(
      '/gift/edit/$id',
      {
        'name': gift.name,
      },
    );

    return Gift.fromJson(response);
  }

  
  static Future<void> deleteGift(int id) async {
    String? token = await AuthController.getToken();

    if (token == null) {
      throw Exception('Failed to load user');
    }

    var response = await AppliAPI.get('/gift/$id/delete');

    return;
  }


}