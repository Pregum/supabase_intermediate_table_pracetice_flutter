import 'package:flutter/material.dart';
import 'package:supabase_intermediate_table_pracetice_flutter/allergen.dart';
import 'package:supabase_intermediate_table_pracetice_flutter/main.dart';

Future<List<Allergen>> getAllergens() async {
  final response = await supabase.from('allergens').select<List<dynamic>>('*');
  try {
    final allergens = response;
    return allergens.map(
      (allergen) {
        debugPrint(allergen.toString());
        return Allergen.fromJson(allergen);
      },
    ).toList();
  } catch (e) {
    debugPrint('error!: $e');
    return [];
  }
}
