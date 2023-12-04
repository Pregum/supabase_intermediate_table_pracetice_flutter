import 'package:flutter/material.dart';
import 'package:supabase_intermediate_table_pracetice_flutter/main.dart';
import 'package:supabase_intermediate_table_pracetice_flutter/menu.dart';

Future<List<Menu>> getMenus() async {
  final response = await supabase.from('menus').select<List<dynamic>>('*');
  try {
    final menus = response;
    return menus.map(
      (menu) {
        debugPrint(menu.toString());
        return Menu.fromJson(menu);
      },
    ).toList();
  } catch (e) {
    debugPrint('error!: $e');
    return [];
  }
}
