// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:guess_number/game.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  final _controller = TextEditingController();
  final _game = Game(maxRandom: 100);
  var _feedbackText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Container(
                decoration:  BoxDecoration(
                  color: Colors.indigoAccent,
                  shape: BoxShape.circle,
                ),
                child:  Icon(
                  Icons.accessibility,
                  color: Theme.of(context).primaryColor,
                ),
              ),
               SizedBox(width: 10),
               Text('GUESS THE NUMBER'),
            ],
          ),
        ),
        body:  Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Please guess the number between 1 and 100',
                      style: TextStyle(
                      fontSize: 20,
                      color: Colors.deepOrange,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                    ),
                        textAlign: TextAlign.center,
                    ),
                  ),
                  TextField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter your guess',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        onPressed: (){
                          //todo:
                          var input = _controller.text;

                          var guess = int.tryParse(input);

                          var result = _game.doGuess(guess!);
                          setState(() {
                            if(result == GuessResult.correct){
                              _feedbackText = 'Correct!';

                            }else if(result == GuessResult.tooHigh){
                              _feedbackText = 'Too High, please try again!';

                            }else{
                              _feedbackText = 'Too Low,please try again!';
                            }
                          });


                          print(input);
                        },
                        child: Text('GUESS'),
                    ),
                  ),
                ],
              ),
            ),
            Text(_feedbackText),
          ],
        ),
    );
  }
}
