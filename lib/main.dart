import 'package:flutter/material.dart';
import 'Story.dart';
import 'storybrain.dart';

void main() {
  runApp(const MyApp());
}

Story story = Story(storyTitle: '', choice1: '', choice2: '');
StoryBrain storyBrain = StoryBrain();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/Gojo-Satoru-Wallpapers.jpg'),
              fit: BoxFit.cover),
        ),
        child: const Scaffold(
          backgroundColor: Color.fromARGB(143, 0, 0, 0),
          body: MyBody(),
        ),
      ),
    );
  }
}

class MyBody extends StatefulWidget {
  const MyBody({super.key});

  @override
  State<MyBody> createState() => _MyBodyState();
}

class _MyBodyState extends State<MyBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                storyBrain.getStory(),
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: const Color.fromARGB(179, 68, 11, 77)),
              onPressed: () {
                setState(() {
                  storyBrain.nextStory(1);
                });
              },
              child: Text(storyBrain.getchoice1()),
            ),
          ),
        ),
        Expanded(
          child: Visibility(
            visible: storyBrain.buttonShouldBeVisible(),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: const Color.fromARGB(179, 22, 18, 93)),
                onPressed: () {
                  setState(() {
                    storyBrain.nextStory(2);
                    // Story.nextText();
                  });
                },
                child: Text(storyBrain.getchoice2()),
              ),
            ),
          ),
        )
      ],
    );
  }
}
