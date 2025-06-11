import '../unit_model.dart';

//i stopped at practice activity 1, you need to do it from there
final UnitModel unit7_3 = UnitModel(
  unitIndex: 31,
  unitName: "Using formal & informal expressions",
  introductionText: """
Hello everyone, welcome to lesson 7.3!
In this unit, we’ll explore how to recognize and use formal and informal expressions in your communication. Every context, whether academic, professional, or casual—requires a different tone. In computing, you might speak casually during a team meeting but use formal language in documentation, emails, or presentations. Being able to switch between formal and informal expressions is a key communication skill that helps you sound appropriate and professional.
As future IT professionals, you’ll need to write emails to clients, contribute in technical reports, chat with colleagues, or present projects to an audience. Each of these scenarios demands the right level of formality. In this lesson, you’ll learn how to identify tones, replace informal words with formal ones, and adjust your language to suit academic and technical environments.
By the end of this lesson, you will be able to:
1.	Identify formal and informal expressions in English.
2.	Distinguish between appropriate and inappropriate tone in academic and professional settings.
3.	Replace informal expressions with formal ones, especially in computing-related communication.
4.	Apply the correct level of formality in writing and speaking tasks.
""",

  preClassActivityDescription: """
Look at the sentences below and decide whether they are formal or informal. Tap each to check your answer.
""",
  preClassQuestions:[
    PreClassQuestion(
      questionText: "'Hey, I’m working on the app. Gimme a sec!' - _____",
      options: ['a) Informal', 'b) Formal'],
      correctOptionIndex: 0,
      correctAnswer: 'a) Informal',
      isTextAnswer: false,
    ),
    PreClassQuestion(
      questionText: "'I am currently developing the application. Please wait a moment.' - _____",
      options: ['a) Informal', 'b) Formal'],
      correctOptionIndex: 1,
      correctAnswer: 'b) Formal',
      isTextAnswer: false,
    ),
    PreClassQuestion(
      questionText: "'Lemme know when it’s done.' - _____",
      options: ['a) Informal', 'b) Formal'],
      correctOptionIndex: 0,
      correctAnswer: 'a) Informal',
      isTextAnswer: false,
    ),
    PreClassQuestion(
      questionText: "'Kindly inform me once the task is completed.' - _____",
      options: ['a) Informal', 'b) Formal'],
      correctOptionIndex: 1,
      correctAnswer: 'b) Formal',
      isTextAnswer: false,
    ),
  ],

  practiceActivityDescription1: """ 
Read each sentence and tap the informal word to switch it to a formal one. Then choose the most suitable formal version from the options. 
""",
  practiceActivityMCQ:[
    PracticeQuestionMCQ(
      questionText: "We **gotta** test the software again.",
      options: ["must", "maybe", "can"],
      correctOptionIndex: 0, // a) must
    ),
    PracticeQuestionMCQ(
      questionText: "The **thing** isn’t working properly.",
      options: ["mechanism", "gadget", "process"],
      correctOptionIndex: 0, // a) mechanism
    ),
    PracticeQuestionMCQ(
      questionText: "The report looks **kinda** weird.",
      options: ["somewhat", "totally", "extremely"],
      correctOptionIndex: 0, // a) somewhat
    ),
    PracticeQuestionMCQ(
      questionText: "**Hey guys**, here’s my part of the doc!",
      options: ["Good day team", "Yo peeps", "Dear all"],
      correctOptionIndex: 0, // a) Good day team
    ),
  ],

  practiceActivityDescription2: """
Imagine you are preparing to present your final-year project. You recorded your speech informally, but now you need to revise it to sound formal and academic. Use at least 3 formal expressions you learned in the video. Follow the steps given below.

Write a short informal version of your project intro (4-5 lines). 

Example:
“Hey, so we made this really cool tool that helps people code faster.”

Record your informal version using given tool, copy the record link and paste here. 

Then record your formal version using the same link and paste that link here as well. 

2 record links should be submitted. 
""",
  practiceActivityLink2:"https://www.speakpipe.com/voice-recorder",
  practiceUploadLink2:"https://courseweb.sliit.lk/mod/assign/view.php?id=375219",

  instructionsText: """
Watch the video lesson below to understand when and how to use formal vs. informal language. You’ll learn to spot differences in grammar, word choice, and tone. Make notes where necessary.
By the end, you’ll be more confident choosing the right tone in any setting—whether you’re chatting with peers or writing to a supervisor.
""",

  instructionVideoId: "https://lecturecapture.sliit.lk/eplayer.php?id=bktaUDJrOThKZF82NzgzNw==",

  summary: """
In this lesson, you learned the importance of selecting the right tone in your communication. Whether you are speaking with a classmate, emailing a lecturer, or documenting your work, understanding the difference between formal and informal expressions helps you communicate more clearly and appropriately. You practiced identifying tone, replacing casual words with formal equivalents, and even transformed your own speech. This skill is especially valuable in the computing field, where emails, presentations, and reports often require a polished, professional tone. By mastering this balance, you’ll not only sound more confident but also build credibility in academic and workplace settings.""",

  inClassActivity: """
In class, you’ll be given different communication scenarios: writing an email to a supervisor, chatting in a team meeting, or reporting a bug in a project presentation. You’ll work individually to rewrite informal statements into formal ones (and vice versa), and then explain why the change was needed. We’ll also role-play short conversations where you’ll practice switching tone depending on the audience. This is your chance to build fluency and adapt your voice to different real-life computing situations. Don’t worry about making mistakes—we’re here to learn together and polish your professional communication style!""",

  quizQuestions: [
    QuizQuestion(
      question: "What is the main purpose of using formal language in academic and professional settings?",
      options: [
        "To impress friends",
        "To sound casual and cool",
        "To communicate clearly and respectfully",
        "To use difficult words"
      ],
      correctOptionIndex: 2,
    ),
    QuizQuestion(
      question: "Which of the following is the most formal way to start an email?",
      options: [
        "Good afternoon, Professor",
        "Yo team",
        "Hey dude",
        "Sup everyone"
      ],
      correctOptionIndex: 0,
    ),
    QuizQuestion(
      question: "Choose the correct formal version of the sentence below:\nWe gotta finish the thing by tomorrow.",
      options: [
        "We gotta wrap up the thing fast.",
        "We need to complete the task by tomorrow.",
        "Finish it up already.",
        "Let’s do the stuff soon."
      ],
      correctOptionIndex: 1,
    ),
    QuizQuestion(
      question: "Identify the informal expression in the sentence:\nThe results were kinda unexpected, but it’s all good now.",
      options: [
        "results",
        "unexpected",
        "kinda",
        "now"
      ],
      correctOptionIndex: 2,
    ),
    QuizQuestion(
      question: """Rewrite this sentence using formal language:
      "Hey, I checked out the stuff. It looks awesome!""",
      correctTextAnswer: "Hello, I reviewed the materials. They appear to be excellent.",
      isTextAnswer: true,
    ),
  ],
);
