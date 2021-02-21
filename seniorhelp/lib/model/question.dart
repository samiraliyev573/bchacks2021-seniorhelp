class Question {
  String question;
  List<Option> options;
  String answer;
  Question({this.question, this.options, this.answer});
}

class Option {
  final String text;
  Option(this.text);
}

final quiz = [
  Question(
    question: "What are your children’s names?",
    options: [
      Option("Jack and Jill Doe"),
      Option("Jayden and Jane Doe"),
      Option("James and Jen Doe"),
      Option("Joe and June Doe"),
    ],
    answer: "Jack and Jill Doe",
  ),
  Question(
    question: "How old are your children?",
    options: [
      Option("39 and 36"),
      Option("45 and 40"),
      Option("34 and 39"),
      Option("44 and 55")
    ],
    answer: "39 and 36",
  ),
  Question(
    question: "What was your nickname growing up?",
    options: [
      Option("Bolt Doe"),
      Option("Dashing Doe"),
      Option("Red Hot Doe"),
      Option("Speedy Doe")
    ],
    answer: "Dashing Doe",
  ),
  Question(
    question: "What was your favorite time of year growing up? Why?",
    options: [
      Option("Late Summer"),
      Option("Rainy Fall"),
      Option("Tropic Spring"),
      Option("Snowy Winters")
    ],
    answer: "Tropic Spring",
  ),
  Question(
    question: "Did you play sports as a kid? Which ones?",
    options: [
      Option("Soccer"),
      Option("Swimming"),
      Option("Chess"),
      Option("Bodybuilding")
    ],
    answer: "Bodybuilding",
  ),
  Question(
    question:
        "What was the most historic event you witnessed as a young person?",
    options: [
      Option("Moon Landing"),
      Option("Black Hole image"),
      Option("DNA modifications"),
      Option("Launch of google")
    ],
    answer: "Moon Landing",
  ),
  Question(
    question:
        "What is your favorite cuisine and how has it changed over the years?",
    options: [
      Option("Chinese"),
      Option("Indian"),
      Option("Thai"),
      Option("Soul Food")
    ],
    answer: "Indian",
  ),
  Question(
      question: "Which childhood possession do you still own?",
      options: [
        Option("Watch from 1956"),
        Option("Classic Vinyl Records"),
        Option("Baseball Trading Cards"),
        Option("Graduation Robes")
      ],
      answer: "Graduation Robes"),
  Question(
      question: "What was the first vehicle you owned? ",
      options: [
        Option("Dodge Charger"),
        Option("Audi S class"),
        Option("Rolls Royce"),
        Option("Range Rover")
      ],
      answer: "Dodge Charger")
];
