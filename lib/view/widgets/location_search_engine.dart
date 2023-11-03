import 'package:flutter/material.dart';

class LocationSearch extends StatefulWidget {
  const LocationSearch({super.key});

  @override
  State<LocationSearch> createState() => LocationSearchState();
}

class LocationSearchState extends State<LocationSearch> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.06,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            blurRadius: 20,
            color: Colors.black54,
            spreadRadius: 1,
            offset: Offset(0.8, 0.8),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            const Icon(
              Icons.search,
              color: Colors.black54,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.02,
            ),
            const Text(
              "Search Destination",
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
}
