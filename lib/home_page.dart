import 'package:flutter/material.dart';
import 'package:supabase_intermediate_table_pracetice_flutter/main.dart';
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
            color: Colors.red,
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
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.5,
            child: Row(
              children: [
                Expanded(
                  child: Center(
                    child: FutureBuilder<List<Menu>>(
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
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
                ),
                const SizedBox(
                  width: 8,
                  child: VerticalDivider(
                    color: Colors.grey,
                    thickness: 4,
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.blue,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  _buildMenuList(List<Menu> menus) {
    return ListView.builder(
      // shrinkWrap: true,
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
}
