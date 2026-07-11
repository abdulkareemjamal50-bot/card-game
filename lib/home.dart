import 'package:card_game/item_card_model.dart';
import 'package:flutter/material.dart';

class GridPage extends StatefulWidget {
  const GridPage({super.key});

  @override
  State<GridPage> createState() => GridPageState();
}

class GridPageState extends State<GridPage> {
  List<String> images = [
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
  List<ItemCardModel> cards = [
    ItemCardModel(
      id: 1,
      image: 'assets/images/css.jpg',
      isMatched: false,
      isflipped: false,
    ),
     ItemCardModel(
    id:21,
    image: 'assets/images/bootstrap.jpg',
    isMatched: false,
    isflipped: false,
  ),
  ItemCardModel(
    id: 3,
    image: 'assets/images/dart.jpg',
    isMatched: false,
    isflipped: false,
  ),
  ItemCardModel(
    id: 4,
    image: 'assets/images/figmaa.jpg',
    isMatched: false,
    isflipped: false,
  ),
  ItemCardModel(
    id: 5,
    image: 'assets/images/flutter.jpg',
    isMatched: false,
    isflipped: false,
  ),
  ItemCardModel(
    id: 6,
    image: 'assets/images/github.jpg',
    isMatched: false,
    isflipped: false,
  ),
  ItemCardModel(
    id: 7,
    image: 'assets/images/html.jpg',
    isMatched: false,
    isflipped: false,
  ),
  ItemCardModel(
    id: 8,
    image: 'assets/images/js.jpg',
    isMatched: false,
    isflipped: false,
  ),
  ItemCardModel(
    id: 9,
    image: 'assets/images/kali.jpg',
    isMatched: false,
    isflipped: false,
  ),
  ItemCardModel(
    id: 10,
    image: 'assets/images/linux.jpg',
    isMatched: false,
    isflipped: false,
  ),
  ItemCardModel(
    id: 11,
    image: 'assets/images/meta.jpg',
    isMatched: false,
    isflipped: false,
  ),
  ItemCardModel(
    id: 12,
    image: 'assets/images/python.jpg',
    isMatched: false,
    isflipped: false,
  ),
  ItemCardModel(
    id: 13,
    image: 'assets/images/react.jpg',
    isMatched: false,
    isflipped: false,
  ),
  ItemCardModel(
    id: 14,
    image: 'assets/images/vscode.jpg',
    isMatched: false,
    isflipped: false,
  ),
  ItemCardModel(
    id: 15,
    image: 'assets/images/windows.jpg',
    isMatched: false,
    isflipped: false,
  ),
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
                        images[index],
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
