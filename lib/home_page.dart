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
      body: Center(
        child: FutureBuilder<List<Menu>>(
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator.adaptive();
            }

            final menus = snapshot.data;
            if (menus == null) {
              return const Text('No menus found');
            }
            return _buildMenuList(menus);
          },
          future: getMenus(),
        ),
      ),
    );
  }

  _buildMenuList(List<Menu> menus) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final menu = menus[index];
        return ListTile(
          title: Text(menu.name),
          subtitle: Text(menu.createdAt.toIso8601String()),
        );
      },
      itemCount: menus.length,
    );
  }
}
