class Question {
  String question;
  List<String> options;
  String answer;
  Question(this.question, this.options, this.answer);
}

final quiz = [
  Question(
    "What are your children’s names?",
    [
      "Jack and Jill Doe",
      "Jayden and Jane Doe",
      "James and Jen Doe) ",
      "Joe and June Doe"
    ],
    "Jack and Jill Doe",
  ),
  Question(
    "How old are your children?",
    ["39 and 36", "45 and 40", "34 and 39", "44 and 55"],
    "39 and 36",
  ),
  Question(
    "What was your nickname growing up?",
    ["Bolt Doe", "Dashing Doe", "Red Hot Doe", "Speedy Doe"],
    "Dashing Doe",
  ),
  Question(
    "What was your favorite time of year growing up? Why?",
    ["Late Summer", "Rainy Fall", "Tropic Spring", "Snowy Winters"],
    "Tropic Spring",
  ),
  Question(
    "Did you play sports as a kid? Which ones?",
    ["Soccer", "Swimming", "Chess", "Bodybuilding"],
    "Bodybuilding",
  ),
  Question(
    "What was the most historic event you witnessed as a young person?",
    [
      "Moon Landing",
      "Black Hole image",
      "DNA modifications",
      "Launch of google"
    ],
    "Moon Landing",
  ),
  Question(
    "What is your favorite cuisine and how has it changed over the years?",
    ["Chinese", "Indian", "Thai", "Soul Food"],
    "Indian",
  ),
  Question(
      "Which childhood possession do you still own?",
      [
        "Watch from 1956",
        "Classic Vinyl Records",
        "Baseball Trading Cards",
        "Graduation Robes"
      ],
      "Graduation Robes"),
  Question(
      "What was the first vehicle you owned? ",
      ["Dodge Charger", "Audi S class", "Rolls Royce", "Range Rover"],
      "Dodge Charger")
];
