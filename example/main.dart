import 'package:flutter/material.dart';
import 'package:reusable_list_view/reusable_list_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reusable List View Example',
      home: const ExampleScreen(),
    );
  }
}

class ExampleScreen extends StatefulWidget {
  const ExampleScreen({super.key});

  @override
  State<ExampleScreen> createState() => _ExampleScreenState();
}

class _ExampleScreenState extends State<ExampleScreen> {
  final TextEditingController _searchController = TextEditingController();
  final List<String> _items = List.generate(100, (i) => 'Item $i');
  List<String> _filteredItems = [];

  @override
  void initState() {
    super.initState();
    _filteredItems = _items;
  }

  void _filterList(String query) {
    setState(() {
      _filteredItems = _items
          .filter([(item) => item], query); // Using ListFilterExtension
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('List View With Search')),
      body: AppListViewBuilderWithSearch<String>(
        listData: _filteredItems,
        searchController: _searchController,
        onChanged: _filterList,
        child: (item) => ListTile(title: Text(item)),
      ),
    );
  }
}