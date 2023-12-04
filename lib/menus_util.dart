import 'package:flutter/material.dart';
import 'package:supabase_intermediate_table_pracetice_flutter/allergen.dart';
import 'package:supabase_intermediate_table_pracetice_flutter/main.dart';
import 'package:supabase_intermediate_table_pracetice_flutter/menu.dart';

Future<List<Menu>> getMenus() async {
  final response = await supabase.from('menus').select<List<dynamic>>('*');
  try {
    final menus = response;
    return menus.map(
      (menu) {
        // debugPrint(menu.toString());
        return Menu.fromJson(menu);
      },
    ).toList();
  } catch (e) {
    debugPrint('error!: $e');
    return [];
  }
}

Future<List<Allergen>> getAllergensById(int menuId) async {
  try {
    final response = await supabase
        .from('menus')
        // .select<List<dynamic>>('*, allergens(id, type_name, created_at)')
        .select('*, allergens (*)')
        .eq('id', menuId);
        // .eq('id', menuId);
      
    if (response.isEmpty) {
      return [];
    }

    debugPrint('response: $response');
    final record = response[0] as Map<String, dynamic>;
    final allergens = record['allergens'] as List<dynamic>;
    final results = allergens.map(
      (allergen) {
        debugPrint('allergen: ${allergen.toString()}');
        return Allergen.fromJson(allergen);
      },
    ).toList();
    return results;
  } catch (e) {
    debugPrint('error!: $e');
    return [];
  }
}
