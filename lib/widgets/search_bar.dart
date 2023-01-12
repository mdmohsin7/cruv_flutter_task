import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  final TextEditingController controller;
  final Function(String) textChanged;
  const SearchBar(
      {super.key, required this.controller, required this.textChanged});

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  bool isSearching = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10.0),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        border: Border.all(color: const Color(0xFF80CBFF), width: 2),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              controller: widget.controller,
              onChanged: (value) {
                setState(() {
                  isSearching = value.isNotEmpty;
                });
              },
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Enter Seat Number',
                hintStyle: TextStyle(color: Colors.blue),
              ),
            ),
          ),
          const SizedBox(width: 10.0),
          ElevatedButton(
            style: ButtonStyle(
                elevation: MaterialStateProperty.all(0),
                backgroundColor: MaterialStateProperty.all(
                  isSearching
                      ? const Color(0xFF80CBFF)
                      : const Color(0xFFDADADA),
                ),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                )),
            onPressed: isSearching
                ? () {
                    widget.textChanged(widget.controller.text);
                  }
                : null,
            child: const Padding(
              padding: EdgeInsets.all(18.0),
              child: Text(
                'Find',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
