//not fully done

import '../unit_model.dart';

final UnitModel unit11_2 = UnitModel(
  unitIndex: 46,
  unitName: "Handling Challenging & Unexpected Questions",
  introductionText: """
Hi everyone!
Imagine this: you’re in a viva or an oral exam, answering confidently… and suddenly, the examiner asks a question that completely catches you off guard. What now? Do you freeze? Guess? Or can you take a breath, stay calm, and respond smartly?
This lesson is all about helping you handle difficult and unexpected questions with confidence. Whether the question is too technical, off-topic, or something you’ve never thought about, you can still give a strong response by using the right strategies and language. Together, we’ll explore how to buy time, reframe tricky questions, and stay calm under pressure—all while keeping your tone polite and academic. These skills are incredibly useful not only in viva exams, but also in job interviews, presentations, and even team meetings in your future career.
By the end of this lesson, you will be able to:
•	Recognize different types of challenging or unexpected questions.
•	Use strategies to stay calm and composed when unsure.
•	Politely ask for clarification or rephrase your answer.
•	Use sentence starters and phrases to structure your response clearly.
""",

  preClassActivityDescription: """
In this warm-up, you'll read three real-world tricky questions that a computing student might face in a viva or interview.
For each one, choose one of the following:
	I’d panic
	I’d try to guess
	I’d ask for clarification
	I’d give a structured answer
""",

  preClassSurvey:[
    SurveyQuestion(
      questionText: "Why did you choose an outdated library for your implementation?",
      options: [
        "I’d panic",
        "I’d try to guess",
        "I’d ask for clarification",
        "I’d give a structured answer"
      ],
      allowsMultipleAnswers: false,
      isTextAnswer: false,
    ),
    SurveyQuestion(
      questionText: "What would you do differently if you had twice the computing resources?",
      options: [
        "I’d panic",
        "I’d try to guess",
        "I’d ask for clarification",
        "I’d give a structured answer"
      ],
      allowsMultipleAnswers: false,
      isTextAnswer: false,
    ),
    SurveyQuestion(
      questionText: "Your system worked in simulation, but how would it perform in real-world deployment?",
      options: [
        "I’d panic",
        "I’d try to guess",
        "I’d ask for clarification",
        "I’d give a structured answer"
      ],
      allowsMultipleAnswers: false,
      isTextAnswer: false,
    ),
    SurveyQuestion(
      questionText: "Can you explain why your model underperformed during testing?",
      options: [
        "I’d panic",
        "I’d try to guess",
        "I’d ask for clarification",
        "I’d give a structured answer"
      ],
      allowsMultipleAnswers: false,
      isTextAnswer: false,
    ),
    SurveyQuestion(
      questionText: "A more efficient algorithm exists—why didn’t you use it?",
      options: [
        "I’d panic",
        "I’d try to guess",
        "I’d ask for clarification",
        "I’d give a structured answer"
      ],
      allowsMultipleAnswers: false,
      isTextAnswer: false,
    ),
    SurveyQuestion(
      questionText: "What security concerns might arise from your current setup, and how would you address them?",
      options: [
        "I’d panic",
        "I’d try to guess",
        "I’d ask for clarification",
        "I’d give a structured answer"
      ],
      allowsMultipleAnswers: false,
      isTextAnswer: false,
    ),
  ],

  practiceActivityDescription1: """ 
You’ll see six tricky situations related to viva or oral exams.
Rate each one based on how confident you would feel handling it.
(from 😟 Nervous → 😐 Unsure → 😎 Confident).
""",

  practiceActivityMCQ:[
    PracticeQuestionMCQ(
      questionText: "You’re asked to explain a topic that was only briefly mentioned in your report.",
      options: [
        "😟 Nervous",
        "😐 Unsure",
        "😎 Confident"
      ],
    ),
    PracticeQuestionMCQ(
      questionText: "The examiner challenges your decision and suggests a better alternative.",
      options: [
        "😟 Nervous",
        "😐 Unsure",
        "😎 Confident"
      ],
    ),
    PracticeQuestionMCQ(
      questionText: "You forget the exact technical term for something mid-sentence.",
      options: [
        "😟 Nervous",
        "😐 Unsure",
        "😎 Confident"
      ],
    ),
    PracticeQuestionMCQ(
      questionText: "You are asked about a tool or framework you didn't use or mention.",
      options: [
        "😟 Nervous",
        "😐 Unsure",
        "😎 Confident"
      ],
    ),
    PracticeQuestionMCQ(
      questionText: "The examiner asks a question completely unrelated to your project.",
      options: [
        "😟 Nervous",
        "😐 Unsure",
        "😎 Confident"
      ],
    ),
    PracticeQuestionMCQ(
      questionText: "You're asked about how your system would scale for 1 million users.",
      options: [
        "😟 Nervous",
        "😐 Unsure",
        "😎 Confident"
      ],
    ),
    PracticeQuestionMCQ(
      questionText: "You’re interrupted mid-explanation and asked to clarify a detail you hadn’t prepared for.",
      options: [
        "😟 Nervous",
        "😐 Unsure",
        "😎 Confident"
      ],
    ),
    PracticeQuestionMCQ(
      questionText: "You realize halfway through answering that you misunderstood the question.",
      options: [
        "😟 Nervous",
        "😐 Unsure",
        "😎 Confident"
      ],
    ),
    PracticeQuestionMCQ(
      questionText: "You're asked about the ethical or social impacts of your solution.",
      options: [
        "😟 Nervous",
        "😐 Unsure",
        "😎 Confident"
      ],
    ),
    PracticeQuestionMCQ(
      questionText: "You're asked to compare your solution with a cutting-edge technology you’ve only heard about.",
      options: [
        "😟 Nervous",
        "😐 Unsure",
        "😎 Confident"
      ],
    ),
    PracticeQuestionMCQ(
      questionText: "You’re asked to explain why your model failed to pass one specific test case.",
      options: [
        "😟 Nervous",
        "😐 Unsure",
        "😎 Confident"
      ],
    ),
    PracticeQuestionMCQ(
      questionText: "You are asked to defend your choice of programming language for the project.",
      options: [
        "😟 Nervous",
        "😐 Unsure",
        "😎 Confident"
      ],
    ),
  ],


  practiceActivityDescription2: """
You’re shown a badly phrased or unprofessional response, and your task is to fix it using more academic language.
Example Bad Answer: 
I don’t know what that means, sorry.		I’m not entirely sure, but I can try to explain what I do 
know. 
""",
  practiceActivityQuestions2:[
    PracticeQuestion2(
      questionText: "Bad Answer: I don’t know what that means, sorry.\nRewrite:",
      correctAnswer: "I’m not familiar with that term at the moment, but I’d be happy to look into it and get back to you.",
      isTextAnswer: true,
    ),
    PracticeQuestion2(
      questionText: "Bad Answer: That wasn’t really my job, so I didn’t look into it.\nRewrite:",
      correctAnswer: "While that wasn’t my main responsibility, I understand its importance and I can explain how it connects to the overall system.",
      isTextAnswer: true,
    ),
    PracticeQuestion2(
      questionText: "Bad Answer: It just works, that’s why I used it.\nRewrite:",
      correctAnswer: "I chose it because it’s well-documented, reliable, and suited the requirements of my project based on benchmarks and use cases.",
      isTextAnswer: true,
    ),
    PracticeQuestion2(
      questionText: "Bad Answer: That’s not relevant to my project.\nRewrite:",
      correctAnswer: "That’s an interesting point. While it wasn’t part of my current scope, I can see how it could be related and worth considering in future improvements.",
      isTextAnswer: true,
    ),
    PracticeQuestion2(
      questionText: "Bad Answer: I didn’t have time, so I skipped that part.\nRewrite:",
      correctAnswer: "Due to time constraints, I prioritized core functionality, but I’ve noted that part for further development or research.",
      isTextAnswer: true,
    ),
    PracticeQuestion2(
      questionText: "Bad Answer: I think that’s obvious from the code.\nRewrite:",
      correctAnswer: "Let me walk you through the code logic and explain how each part contributes to the overall functionality.",
      isTextAnswer: true,
    ),
    PracticeQuestion2(
      questionText: "Bad Answer: Honestly, I just followed what someone else did.\nRewrite:",
      correctAnswer: "I based my approach on a commonly used method, and after reviewing it, I found it aligned well with my project’s needs.",
      isTextAnswer: true,
    ),
    PracticeQuestion2(
      questionText: "Bad Answer: I never thought about that, so I can’t say anything.\nRewrite:",
      correctAnswer: "That’s a good question. I haven’t explored that area deeply yet, but here’s how I would begin to approach it.",
      isTextAnswer: true,
    ),
    ],

  instructionsText: """
Watch the video lesson carefully to understand how to deal with difficult and unexpected questions in academic settings. The video will walk you through common question types, how to stay calm, and how to respond with confidence even when you're unsure. You’ll also see examples of both strong and weak responses.
Feel free to pause and take notes when you hear useful phrases or techniques. Look out for tips on tone, structure, and body language—especially how to sound thoughtful instead of panicking. These phrases can become part of your toolkit for oral exams and beyond.
""",

  instructionVideoId: "8laYlyAFd0o",

  summary: """
In this lesson, you explored how to handle those tricky, unpredictable questions that often come up in oral exams and discussions. Whether the question was unclear, outside your preparation, or just plain tough—you now have strategies to stay calm, clarify the question, buy thinking time, and still respond confidently. Through scenario-based games and practical phrase building, you learned to recover from small mistakes and keep your tone respectful and academic. These strategies are valuable not just in your viva, but anytime you're under pressure to speak intelligently. Remember: staying calm is a skill—and you’re learning it well!""",

  inClassActivity: """
Now that you’ve completed the lesson, it’s time to sharpen these skills in our classroom session. When we meet in person, we’ll practice how to respond to unexpected or challenging questions using the techniques and phrases you've just learned.
If any parts of the lesson felt confusing or if you’d like help practicing a specific response, bring your notes and your questions to class. Your lecturer will be ready to guide you, give feedback, and help you build stronger, clearer answers. There’s no pressure to be perfect, this is your opportunity to learn and grow together.
""",

  quizQuestions: [
    QuizQuestion(
      question: "What is a good first step when you don’t understand a question?",
      options: ["Guess wildly", "Ignore it", "Ask for clarification", "Change the topic"],
      correctOptionIndex: 2,
    ),
    QuizQuestion(
      question: "Which phrase helps buy time while you think?",
      options: ["Hold on, I’m panicking", "I never thought of that", "Why do you ask?", "That’s an interesting point—let me consider that"],
      correctOptionIndex: 3,
    ),
    QuizQuestion(
      question: "What should you do if you make a small error in your answer?",
      options: ["Hide it", "Politely correct yourself", "Blame the examiner", "Say nothing"],
      correctOptionIndex: 1,
    ),
    QuizQuestion(
      question: "If a question sounds too technical, what can you do?",
      options: ["Ask the examiner to rephrase", "Laugh it off", "Say it’s irrelevant", "Pretend you know"],
      correctOptionIndex: 0,
    ),
    QuizQuestion(
      question: "Fill in the blank: “_________, I would say the main reason is performance efficiency.”",
      options: ["Actually", "From what I understand", "Basically", "I guess"],
      correctOptionIndex: 1,
    ),
    QuizQuestion(
      question: "What does “rephrasing a question” help you do?",
      options: ["Waste time", "Avoid the topic", "Make it easier to answer", "Confuse the examiner"],
      correctOptionIndex: 2,
    ),
    QuizQuestion(
      question: "Choose a polite disagreement:",
      options: ["That’s wrong", "I completely disagree", "Nope, not true", "I respect your view, but my findings suggest otherwise"],
      correctOptionIndex: 3,
    ),
  ],
);
