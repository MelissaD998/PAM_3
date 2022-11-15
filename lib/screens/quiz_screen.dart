import 'package:flutter/material.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:quiz_lab3/models/question.dart';
import 'package:quiz_lab3/screens/score_screen.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
//init the variables
  List<Question> questionList = getQuestions();
  int currentQuestionIndex = 0;
  int answeredQuestions = 0;
  int correctAnsweredQuestions = 0;
  int totalQuizTime = 0;
  int questionElapsedTime = 0;
  double progress = 1.0;
  final maxTimePerQuestion = 20;
  Answer? selectedAnswer;

//time for each question
//flutter widget
  final _stopWatchTimer = StopWatchTimer(
      mode: StopWatchMode.countDown, presetMillisecond: 20 * 1000);

  @override
  void initState() {
    super.initState();
    _stopWatchTimer.secondTime.listen((value) {
      setState(() {
        questionElapsedTime = value;
        progress = progress - (1 / 20);  //the line
      });

      if (value == 0) {
        _handleNext();  // to the next
      }
    });
    _stopWatchTimer.onStartTimer();
  }

  //build the boxes with text
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child:
        Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          const Text(
            "Quiz App",
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
            ),

          ),
          _questionWidget(),
          _answerList(),
          _nextButton(),
        ]),
      ),
    );
  }


  //the position of the icon
  _questionWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.timer_rounded, color: Colors.grey, size: 18),
            const Divider(height: 8),
            Text(
              "${questionElapsedTime}s",
              style: Theme.of(context)
                  .textTheme
                  .caption
                  ?.copyWith(color: Colors.grey),
            )
          ],
        ),

        const SizedBox(height: 16),

        LinearProgressIndicator(
            backgroundColor: Colors.white,
            color: Colors.greenAccent,
            minHeight: 4,
            value: progress),

        const SizedBox(height: 24),

        //text of questions
        Text(
          "Question ${currentQuestionIndex + 1} of ${questionList.length}",
          style: const TextStyle(
            color: Colors.black12,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),

        const SizedBox(height: 20),

        Container(
          alignment: Alignment.center, //alingment of text
          width: double.infinity,
          padding: const EdgeInsets.all(38),
          child: Text(
            questionList[currentQuestionIndex].questionText,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 19,
              fontWeight: FontWeight.w600,
            ),
          ),
        )
      ],
    );
  }

  _answerList() { //call the question list
    return Column(
      children: questionList[currentQuestionIndex]
          .answersList
          .map(
            (e) => _answerButton(e), //event
      )
          .toList(),
    );
  }

  Widget _answerButton(Answer answer) {  //characteristics of the answer button
    bool isSelected = answer == selectedAnswer;

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 20),
      height: 48,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          primary: isSelected ? Colors.blueAccent : Colors.white,
          onPrimary: isSelected ? Colors.white : Colors.black,
        ),
        onPressed: () {
          if (selectedAnswer == null) {
            answeredQuestions++;
            if (answer.isCorrect) {
              correctAnsweredQuestions++;
            }
            setState(() {
              selectedAnswer = answer;
            });
          }
        },
        child: Text(answer.answerText),
      ),
    );
  }

  _nextButton() {  //charact of the next button
    return SizedBox(
      height: 49,
      width: MediaQuery.of(context).size.width * 0.5,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          primary: Colors.black,
          onPrimary: Colors.white,
        ),
        onPressed: _handleNext,
        child: Text(_isLastQuestion() ? "Submit" : "Next"),
        //afisarea rezultatelor
      ),
    );
  }

  _isLastQuestion() => currentQuestionIndex == questionList.length - 1;

  _handleNext() {
    totalQuizTime += maxTimePerQuestion - _stopWatchTimer.secondTime.value;

    setState(() {
      progress = 2;
    });

    _stopWatchTimer.onResetTimer();
    _stopWatchTimer.onStartTimer();

    if (_isLastQuestion()) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ScoreScreen(  //next slide
              answeredQuestions: answeredQuestions,  //send the values
              correctAnsweredQuestions: correctAnsweredQuestions,
              quizTime: totalQuizTime)));
    } else {
      setState(() {
        selectedAnswer = null;
        currentQuestionIndex++;
      });
    }
  }

  @override
  void dispose() async {
    super.dispose();
    await _stopWatchTimer.dispose();
  }
}
