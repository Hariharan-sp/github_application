import 'package:flutter/material.dart';
import 'package:github_application/provider/common_provider.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GitHub Search'),
        backgroundColor: Colors.indigo, // Change app bar color
      ),
      body: context.watch<CommonProvider>().inProgress
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      labelText: 'Enter GitHub Username',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.search), // Add search icon
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      context
                          .read<CommonProvider>()
                          .getUserData(_controller.text, context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigo, // Change button color
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 12), // Adjust button padding
                    ),
                    child: const Text(
                      'Search',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white), // Adjust button text size
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
