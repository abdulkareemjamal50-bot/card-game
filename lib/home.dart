import 'package:flutter/material.dart';

class GridPage extends StatefulWidget {
  const GridPage({super.key});

  @override
  State<GridPage> createState() => GridPageState();
}

class GridPageState extends State<GridPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              itemCount: 9,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemBuilder: (context, index) {
                return Expanded(
                  flex: 3,

                  child: Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      color: Colors.pink,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}