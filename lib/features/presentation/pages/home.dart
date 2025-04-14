import 'package:flutter/material.dart';
import 'package:shopapp/features/presentation/widgets/listview.dart';
import 'package:shopapp/features/presentation/widgets/search.dart';
import 'package:shopapp/features/presentation/widgets/slider.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.brown,
        onPressed: () {
          showSearch(context: context, delegate: DataSearch());
        },
        child: const Icon(
          Icons.search,
          color: Colors.white,
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: const Text(
          'furniture ',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            productSlider(),
            Expanded(child: Listview()),
          ],
        ),
      ),
    );
  }
}
