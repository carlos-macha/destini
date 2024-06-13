import 'package:destini/service/story_brain.dart';
import 'package:flutter/material.dart';

class DestiniScreen extends StatelessWidget {
  const DestiniScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue,
        body: SafeArea(
          child: Container(
            child: DestiniScreenFunctions(),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('lib/images/background.png'),
                  fit: BoxFit.cover),
            ),
          ),
        ),
      ),
    );
  }
}

class DestiniScreenFunctions extends StatefulWidget {
  const DestiniScreenFunctions({super.key});

  @override
  State<DestiniScreenFunctions> createState() => _DestiniScreenFunctionsState();
}

class _DestiniScreenFunctionsState extends State<DestiniScreenFunctions> {
  StoryBrain story = StoryBrain();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Center(
              child: Text(
                story.getStory().toString(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(15),
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                story.nextStory(1);
              });
              
            },
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all<Color>(Colors.red),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                child: Center(
                  child: Text(
                    story.getChoice1().toString(),
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
                width: double.infinity,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(15),
          child: Visibility(
            visible: story.buttonShouldBeVisible(),
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  story.nextStory(2);
                });
                
              },
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all<Color>(Colors.blue),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Container(
                  child: Center(
                    child: Text(
                      story.getChoice2().toString(),
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                  width: double.infinity,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
