import 'package:app_whitelabel/src/core/utils/hex_color.dart';
import 'package:flutter/material.dart';

class ClientModel {
  final int id;
  final String name;
  final String host;
  final ThemeModel theme;

  ClientModel({
    required this.id,
    required this.name,
    required this.host,
    required this.theme,
  });

  factory ClientModel.fromMap(Map<String, dynamic> map) {
    return ClientModel(
      id: map['id'],
      name: map['name'] ?? '',
      host: map['host'] ?? '',
      theme: ThemeModel.fromMap(map['theme'] ?? {}),
    );
  }
}

class ThemeModel {
  final String? logo;
  final String? layout;
  final Color? primaryColor;
  final Color? secondaryColor;

  ThemeModel({
    this.logo,
    this.layout,
    this.primaryColor,
    this.secondaryColor,
  });

  factory ThemeModel.fromMap(Map<String, dynamic> map) {
    return ThemeModel(
      logo: map['logo'],
      layout: map['layout'],
      primaryColor: map['primary'] != null ? HexColor(map['primary']) : const Color(0xFFAD059E),
      secondaryColor: map['secondary'] != null ? HexColor(map['secondary']) : const Color.fromARGB(255, 238, 167, 232),
    );
  }
}
