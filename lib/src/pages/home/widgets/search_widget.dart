import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key, required this.onSearch});

  final Function(String) onSearch;

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: searchController,
                    style: const TextStyle(color: Colors.blue),
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(0),
                      border: InputBorder.none,
                      hintText: 'Digite o nome do produto',
                      hintStyle: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.search, color: Colors.black, size: 24),
                  onPressed: () {
                    String searchTerm = searchController.text.trim();
                    if (searchTerm.isNotEmpty) {
                      onSearch(searchTerm);
                    } else {
                      onSearch("");
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
