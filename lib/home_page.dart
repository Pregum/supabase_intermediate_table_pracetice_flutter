import 'package:flutter/material.dart';
import 'package:supabase_intermediate_table_pracetice_flutter/allergen.dart';
import 'package:supabase_intermediate_table_pracetice_flutter/allergen_util.dart';
import 'package:supabase_intermediate_table_pracetice_flutter/menu.dart';
import 'package:supabase_intermediate_table_pracetice_flutter/menus_util.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  build(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Supabase Flutter'),
      ),
      body: Column(
        children: [
          Container(
            height: 50,
            color: Theme.of(context).secondaryHeaderColor,
            child: const Row(
              children: [
                Expanded(child: Center(child: Text('menu'))),
                SizedBox(
                  width: 8,
                  child: VerticalDivider(
                    color: Colors.grey,
                    thickness: 4,
                  ),
                ),
                Expanded(child: Center(child: Text('allergen'))),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: FutureBuilder<List<Menu>>(
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator.adaptive();
                      }

                      final menus = snapshot.data;
                      if (menus == null) {
                        return const Center(child: Text('No menus found'));
                      }
                      return _buildMenuList(menus);
                    },
                    future: getMenus(),
                  ),
                ),
                const SizedBox(
                  width: 8,
                  child: VerticalDivider(
                    color: Colors.grey,
                    thickness: 4,
                  ),
                ),
                Expanded(
                  child: FutureBuilder<List<Allergen>>(
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator.adaptive();
                      }

                      final allergens = snapshot.data;
                      if (allergens == null) {
                        return const Center(child: Text('No allergens found'));
                      }
                      return _buildAllergenList(allergens);
                    },
                    future: getAllergens(),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuList(List<Menu> menus) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final menu = menus[index];
        return ListTile(
          onTap: () {
            debugPrint('tapped: ${menu.name}');
          },
          title: Text(menu.name),
          subtitle: Text(menu.createdAt.toIso8601String()),
        );
      },
      itemCount: menus.length,
    );
  }

  Widget _buildAllergenList(List<Allergen> allergens) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final allergen = allergens[index];
        return ListTile(
          onTap: () {
            debugPrint('tapped: ${allergen.typeName}');
          },
          leading: Text(allergen.id.toString()),
          title: Text(allergen.typeName),
          subtitle: Text(allergen.createdAt.toIso8601String()),
        );
      },
      itemCount: allergens.length,
    );
  }
}
