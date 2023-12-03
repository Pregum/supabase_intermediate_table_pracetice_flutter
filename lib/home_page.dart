import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  build(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Supabase Flutter'),
      ),
      body: const Center(
        child: Text('Hello world!'),
      ),
    );
  }
}
