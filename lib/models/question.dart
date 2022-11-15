class Question {
  final String questionText;
  final List<Answer> answersList;

  Question(this.questionText, this.answersList);
}

class Answer {
  final String answerText;
  final bool isCorrect;
  Answer(this.answerText, this.isCorrect);
}

List<Question> getQuestions() {
  List<Question> list = [];

  list.add(
      Question("What is 11x11 ?",
          [
            Answer("A. 90", false),
            Answer("B. 120", false),
            Answer("C. 111", false),
            Answer("D. 121", true),
          ]
      )
  );

  list.add(
      Question("What is square root of 144?",
          [
            Answer("A. 1", false),
            Answer("B. 64", false),
            Answer("C. 14", false),
            Answer("D. 12", true),
          ]
      )
  );
  list.add(
      Question("What equals 1.92/3?",
          [
            Answer("A. 0.64", true),
            Answer("B. 0.60", false),
            Answer("C. 0.66", false),
            Answer("D. 0", false),
          ]
      )
  );
  list.add(
      Question("From this list what numbers are fibonacci?",
          [
            Answer("A. 0, 1, 1, 2, 3, 5, 8", true),
            Answer("B. 0, 2, 2, 3, 5, 8", false),
            Answer("C. 0, 1, 2, 3, 6, 8", false),
            Answer("D. 1, 2, 3, 4, 5, 6", false),
          ]
      )
  );
  list.add(
      Question("Solve 23 + 3 / 3",
          [
            Answer("A. 25", false),
            Answer("B. 24", true),
            Answer("C. 26", false),
            Answer("D. 27", false),
          ]
      )
  );

  list.add(
      Question("How many sides have decagon? ",
          [
            Answer("A.  9", false),
            Answer("B. 7",  false),
            Answer("C. 10", true),
            Answer("D. 5", false),
          ]
      )
  );

  list.add(
      Question("What is product of 200 * 0 * 15 * 3? ",
          [
            Answer("A.  600", false),
            Answer("B. 0",  true),
            Answer("C. 200", false),
            Answer("D. 5", false),
          ]
      )
  );

  list.add(
      Question("What is the value of Pi to four individual decimal places",
          [
            Answer("A.  3,1416", true),
            Answer("B. 3,15",  false),
            Answer("C. 3,10", false),
            Answer("D. 3,24", false),
          ]
      )
  );

  list.add(
      Question("What is five squared",
          [
            Answer("A.  1", false),
            Answer("B. 10",  false),
            Answer("C. 5", false),
            Answer("D. 25", true),
          ]
      )
  );

  list.add(
      Question("What is five to the power of zero? ",
          [
            Answer("A.  10", false),
            Answer("B. 0",  false),
            Answer("C. 5", false),
            Answer("D. 1", true),
          ]
      )
  );


  return list;
}