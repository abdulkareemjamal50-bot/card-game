import 'package:flutter/material.dart';

class GridPage extends StatefulWidget {
  const GridPage({super.key});

  @override
  State<GridPage> createState() => GridPageState();
}

class GridPageState extends State<GridPage> {
  List<String> image = [
    'assets/images/css.jpg',
    'assets/images/bootstrap.jpg',
    'assets/images/dart.jpg',
    'assets/images/figmaa.jpg',
    'assets/images/flutter.jpg',
    'assets/images/github.jpg',
    'assets/images/html.jpg',
    'assets/images/js.jpg',
    'assets/images/kali.jpg',
    'assets/images/linux.jpg',
    'assets/images/meta.jpg',
    'assets/images/python.jpg',
    'assets/images/react.jpg',
    'assets/images/vscode.jpg',
    'assets/images/windows.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.all(50),
              child: GridView.builder(
                itemCount: 15,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
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
                      child: Image.asset(
                        image[index],
                        width: double.infinity,
                        height: double.infinity,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
