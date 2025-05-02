import '../unit_model.dart';

final UnitModel unit5_1 = UnitModel(
  unitIndex: 20,
  unitName: "Introduction to Viva Voce",
  introductionText: """
Hello and welcome!
In this lesson, we’ll explore what a viva voce is and how to prepare for it with confidence and clarity. A viva voce—often simply called a viva—is an oral examination where you present and defend your academic work, such as your final year project or research report. For computing undergraduates, this means explaining your code, decisions, methods, and even the bugs you fixed!
Unlike written exams, a viva requires you to think on your feet, express ideas fluently, and engage in a professional discussion. It’s not just about knowing your subject—it’s about communicating it effectively. You’ll be assessed on your technical understanding, clarity of explanation, and your ability to respond thoughtfully to questions. In this lesson, we’ll break down the purpose of a viva, typical structures, and common question types so you’ll know exactly what to expect—and how to shine!
By the end of this lesson, you will be able to:
•	Understand the purpose and format of a viva voce
•	Identify common types of viva questions and how to respond
•	Practice introducing your project and defending key decisions
•	Build confidence using academic and technical vocabulary in speech
""",

  preClassActivityDescription: """
Before we start our lesson, let’s watch a small video on “The viva as an experience”
""",

  preClassActivityVideo:"https://www.youtube.com/watch?v=C__QSSqoor4 ",

  preClassQuestions: [
    PreClassQuestion(
      questionText: "Now that you have gotten a small idea, write a summary paragraph of the video you have just watched.",
      correctAnswer: "null",
    )
  ],

  practiceActivityDescription1: """ 
Read the questions below that a computing student might be asked during a viva. Choose the most appropriate academic response from the options provided. 
""",
  practiceActivityMCQ: [
    PracticeQuestionMCQ(
      questionText: "What made you choose this topic for your final project?",
      options: [
        "It was the easiest.",
        "I found it interesting.",
        "My interest in machine learning and its application in mobile health tracking led me to this topic."
      ],
      correctOptionIndex: 2,
    ),
    PracticeQuestionMCQ(
      questionText: "Can you explain your methodology?",
      options: [
        "I applied a hybrid model combining agile development and waterfall principles to test the system incrementally.",
        "I did some stuff and got results.",
        "I followed a random process.",
      ],
      correctOptionIndex: 0,
    ),
    PracticeQuestionMCQ(
      questionText: "Why didn’t you use a different programming language?",
      options: [
        "I just like this one better.",
        "Because I didn't think of using another one.",
        "I chose Python because of its extensive libraries for data analysis and rapid prototyping, which aligned with my project goals.",
      ],
      correctOptionIndex: 2,
    ),
    PracticeQuestionMCQ(
      questionText: "What challenges did you face during the project?",
      options: [
        "Everything went smoothly.",
        "One major challenge was integrating the API with the database, which required several rounds of debugging.",
        "I struggled a lot, but it’s fine now.",
      ],
      correctOptionIndex: 1,
    ),
    PracticeQuestionMCQ(
      questionText: "How do you evaluate the success of your project?",
      options: [
        "I tested it against predefined benchmarks and received positive feedback during the pilot phase.",
        "I think it’s good enough.",
        "My friends liked it.",
      ],
      correctOptionIndex: 0,
    ),
  ],

  practiceActivityDescription2: """
Follow the instructions given.

- Go to the given website

-	Record a short 60-second introduction to your imaginary final-year project. Use phrases like:
•	My project focuses on…
•	The main objective was to…
•	One key challenge I faced was…

-	After recording, copy the link and submit your audio response here.
""",
  practiceActivityLink2: "https://www.vocaroo.com ",
  practiceUploadLink2: "https://example.com/upload-practice-activity",

  instructionsText: """
Watch the video lesson below, where we walk you through the structure of a viva voce, the examiner’s role, common question types, and how to stay calm and confident. You can take notes on how to introduce your project, what kinds of questions you may be asked and some tips for staying professional under pressure. 
""",

  instructionVideoId: "8laYlyAFd0o",

  summary: """
You’ve now taken your first step into understanding the viva voce process. In this lesson, you learned what a viva is, why it's important, and what to expect in terms of structure and examiner interaction. We explored the types of questions typically asked—ranging from project explanations to justifying your decisions—and discussed how to respond with confidence and clarity. Through individual practice activities, you applied academic language to real-world scenarios, building both fluency and professionalism.
Being able to communicate your work is just as vital as doing the work itself. Whether you're presenting a project, debugging in front of a panel, or explaining a design choice, viva skills will help you thrive in your academic and professional journey.
Keep practicing—and remember, your voice is your strongest tool in a viva!
""",

  inClassActivity: """
Well done on completing the lesson!
Now that you’ve explored the basics of the viva voce and how to respond professionally, we’ll bring those skills into the classroom. Get ready to participate in mini viva simulations, where you’ll answer questions about your project or a familiar topic in pairs or small groups.
If you have doubts or need help framing your responses, bring those questions with you—we’ll break them down together, and your lecturer will offer feedback on how to strengthen your delivery.
Let’s get you comfortable, confident, and ready to speak up in your viva!
""",

  quizQuestions: [
    QuizQuestion(
      question: "What is a viva voce?",
      options: [
        "a) A written report",
        "b) A presentation to your class",
        "c) An oral defense of your academic work",
        "d) A group project discussion"
      ],
      correctOptionIndex: 2, // Index of the correct answer
      isTextAnswer: false,
    ),
    QuizQuestion(
      question: "What should you focus on in a viva introduction?",
      options: [
        "a) Telling jokes",
        "b) Explaining your background in music",
        "c) Listing all your hobbies",
        "d) Clearly stating your project’s purpose and approach"
      ],
      correctOptionIndex: 3, // Index of the correct answer
      isTextAnswer: false,
    ),
    QuizQuestion(
      question: "Which response sounds most professional in a viva?",
      options: [
        "a) 'I have no idea.'",
        "b) 'That’s a good question. Let me explain…'",
        "c) 'Why do you want to know?'",
        "d) 'Oops.'"
      ],
      correctOptionIndex: 1, // Index of the correct answer
      isTextAnswer: false,
    ),
    QuizQuestion(
      question: "Rewrite this informal phrase into a formal viva-style response:\nI just made it like that because it looked cool.",
      correctTextAnswer: "I chose this design based on its alignment with the project’s objectives and aesthetic principles.",
      isTextAnswer: true,
    ),
    QuizQuestion(
      question: "Name one way to prepare for unexpected questions in a viva.",
      correctTextAnswer: "Anticipating potential questions and practicing responses helps prepare for unexpected queries during the viva.",
      isTextAnswer: true,
    ),
  ],
);
