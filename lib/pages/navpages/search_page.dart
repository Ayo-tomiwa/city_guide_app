import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  String _searchKeyword = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {
              // Open filter options
              _showFilterOptions();
            },
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              onChanged: (value) {
                setState(() {
                  _searchKeyword = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Search',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    _searchController.clear();
                    setState(() {
                      _searchKeyword = '';
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            // Display search results based on _searchKeyword
            Expanded(
              child: _buildSearchResults(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchResults() {
    // Logic to fetch and display search results
    if (_searchKeyword.isEmpty) {
      return const Center(
        child: Text('Enter a keyword to search'),
      );
    } else {
      // Implement search logic based on _searchKeyword
      return Center(
        child: Text('Display search results for: $_searchKeyword'),
      );
    }
  }

  void _showFilterOptions() {
    // Implement filter options dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // Add filter options UI here
        return AlertDialog(
          title: const Text('Filter Options'),
          content: const SingleChildScrollView(
            child: Column(
              children: [
                // Add filter options here
                Text('Filter options will be displayed here'),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
