class Question {
  String question;
  List<String> options;
  String answer;
  Question({this.question, this.options, this.answer});
}

final quiz = [
  Question(
    question: "What are your children’s names?",
    options: [
      "Jack and Jill Doe",
      "Jayden and Jane Doe",
      "James and Jen Doe) ",
      "Joe and June Doe"
    ],
    answer: "Jack and Jill Doe",
  ),
  Question(
    question: "How old are your children?",
    options: ["39 and 36", "45 and 40", "34 and 39", "44 and 55"],
    answer: "39 and 36",
  ),
  Question(
    question: "What was your nickname growing up?",
    options: ["Bolt Doe", "Dashing Doe", "Red Hot Doe", "Speedy Doe"],
    answer: "Dashing Doe",
  ),
  Question(
    question: "What was your favorite time of year growing up? Why?",
    options: ["Late Summer", "Rainy Fall", "Tropic Spring", "Snowy Winters"],
    answer: "Tropic Spring",
  ),
  Question(
    question: "Did you play sports as a kid? Which ones?",
    options: ["Soccer", "Swimming", "Chess", "Bodybuilding"],
    answer: "Bodybuilding",
  ),
  Question(
    question:
        "What was the most historic event you witnessed as a young person?",
    options: [
      "Moon Landing",
      "Black Hole image",
      "DNA modifications",
      "Launch of google"
    ],
    answer: "Moon Landing",
  ),
  Question(
    question:
        "What is your favorite cuisine and how has it changed over the years?",
    options: ["Chinese", "Indian", "Thai", "Soul Food"],
    answer: "Indian",
  ),
  Question(
      question: "Which childhood possession do you still own?",
      options: [
        "Watch from 1956",
        "Classic Vinyl Records",
        "Baseball Trading Cards",
        "Graduation Robes"
      ],
      answer: "Graduation Robes"),
  Question(
      question: "What was the first vehicle you owned? ",
      options: ["Dodge Charger", "Audi S class", "Rolls Royce", "Range Rover"],
      answer: "Dodge Charger")
];
