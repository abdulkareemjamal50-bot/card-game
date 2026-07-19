import 'package:audioplayers/audioplayers.dart';
import 'package:card_game/item_card_model.dart';
import 'package:flutter/material.dart';
import 'package:card_game/gradient_background.dart';
import 'dart:async';
import 'dart:ui';

class GridPage extends StatefulWidget {
  const GridPage({super.key});

  @override
  State<GridPage> createState() => GridPageState();
}

class GridPageState extends State<GridPage> {
  AudioPlayer player = AudioPlayer();

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
      id: 21,
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
    ItemCardModel(
      id: 1,
      image: 'assets/images/css.jpg',
      isMatched: false,
      isflipped: false,
    ),
    ItemCardModel(
      id: 21,
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
  int? firstIndex;
  int? secondIndex;
  int score = 0;
  int moves = 0;
  String timer = "05:00";
  Timer? gameTimer;
  int seconds = 5 * 60;

  void startTimer() {
    gameTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (seconds <= 0) {
        timer.cancel();
        return;
      }

      setState(() {
        seconds--;

        int minutes = seconds ~/ 60;
        int remainingSeconds = seconds % 60;

        this.timer =
            "${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}";
      });
    });
  }

  bool waiting = false;
  @override
  void initState() {
    cards.shuffle();
    startTimer();
    score = 0;
    moves++;
    super.initState();
  }

  void flipCard(int index) async {
    if (waiting) return;

    if (cards[index].isMatched) return;

    if (cards[index].isflipped) return;

    await player.play(AssetSource('audios/card_flip.mp3'));
    setState(() {
      cards[index].isflipped = true;
    });

    if (firstIndex == null) {
      firstIndex = index;
      return;
    }

    secondIndex = index;
    setState(() {
      moves++;
    });

    waiting = true;

    await Future.delayed(const Duration(seconds: 1));

    if (cards[firstIndex!].image == cards[secondIndex!].image) {
      //  await player.play(AssetSource('audios/wrong.mp3'));
      //  print('audio-player');
      await player.play(AssetSource('audios/correct.mp3'));
      setState(() {
        cards[firstIndex!].isMatched = true;
        cards[secondIndex!].isMatched = true;

        score++;
      });
    } else {
      await player.play(AssetSource('audios/wrong.mp3'));
      setState(() {
        cards[firstIndex!].isflipped = false;
        cards[secondIndex!].isflipped = false;
      });
    }

    firstIndex = null;
    secondIndex = null;
    waiting = false;

    // Check if the game is finished
    if (cards.every((card) => card.isMatched)) {
      gameTimer?.cancel();
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Congratulations!"),
          content: const Text("You matched all the cards."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("OK"),
            ),
          ],
        ),
      );
    }
  }

  void restartGame() {
    setState(() {
      score = 0;
      moves = 0;
      seconds = 0;
      timer = "00:00";

      firstIndex = null;
      secondIndex = null;
      waiting = false;

      for (var card in cards) {
        card.isflipped = false;
        card.isMatched = false;
      }

      cards.shuffle();
    });

    gameTimer?.cancel();
    startTimer();
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: Column(
          children: [
            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 15,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.white30),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        const Icon(Icons.star, color: Colors.amber),
                        const SizedBox(height: 5),
                        Text(
                          "$score",
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                        const Text(
                          "Score",
                          style: TextStyle(color: Colors.white70),
                        ),
                      ],
                    ),

                    Column(
                      children: [
                        const Icon(Icons.touch_app, color: Colors.white),
                        const SizedBox(height: 5),
                        Text(
                          "$moves",
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                        const Text(
                          "Moves",
                          style: TextStyle(color: Colors.white70),
                        ),
                      ],
                    ),

                    Column(
                      children: [
                        const Icon(Icons.timer, color: Colors.lightBlueAccent),
                        const SizedBox(height: 5),
                        Text(
                          timer,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                        const Text(
                          "Time",
                          style: TextStyle(color: Colors.white70),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),
            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: restartGame,
              child: const Text("Restart"),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: Container(
                margin: const EdgeInsets.all(10),
                child: GridView.builder(
                  itemCount: cards.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        flipCard(index);
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Colors.white.withOpacity(0.25),
                                  Colors.white.withOpacity(0.08),
                                ],
                              ),
                              border: Border.all(
                                color: Colors.white.withOpacity(0.3),
                                width: 1.5,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 10,
                                  offset: const Offset(0, 6),
                                ),
                              ],
                            ),
                            child: cards[index].isflipped
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.asset(
                                      cards[index].image,
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                : const Center(
                                    child: Icon(
                                      Icons.question_mark,
                                      color: Colors.white,
                                      size: 40,
                                    ),
                                  ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    gameTimer?.cancel();
    super.dispose();
  }
}
