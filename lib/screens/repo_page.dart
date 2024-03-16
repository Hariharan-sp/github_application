import 'package:flutter/material.dart';

class RepositoryPage extends StatelessWidget {
  final int repositoryCount;

  const RepositoryPage({super.key, required this.repositoryCount});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Text(
                  "Total number of repositories $repositoryCount",
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
