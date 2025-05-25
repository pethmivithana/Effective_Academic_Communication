import '../unit_model.dart';

final UnitModel unit3_0 = UnitModel(
  unitIndex: 5,
  unitName: "Introduction to Tenses",
  introductionText: """
Our third unit is about tenses. Before exploring different tenses in future lessons, we first need to understand what tenses are and why they are important. Additionally, you should assess your own knowledge of tenses to identify which ones you struggle with.
This lesson focuses more on speaking skills. We will prioritize using tenses in speaking activities rather than writing because we understand how important it is for you to improve your spoken English.
At the beginning of the lesson, it is essential to understand what we aim to achieve by the end. This will help guide you and motivate you to actively participate in the activities. So, without further delay, let’s take a look at the lesson objectives.

By the end of this lesson, students should be able to:
1.	Understand what tenses are and their role in indicating time in language.
2.	Discuss why understanding tenses is essential for clear and accurate communication.
3.	Identify the three main categories of tenses (past, present, and future) without going into detailed forms or structures.

  """,

  preClassActivityDescription: """
We are sure you have heard of “tenses” before! From your point of view, why do we have different tenses? 
  """,


  preClassQuestions: [
    PreClassQuestion(
      questionText: 'Write your thoughts in the given blank.',
      correctAnswer: """We use different tenses to show the timing of an action or event. Without tenses, we wouldn't know if something happened in the past, is happening now, or will happen in the future.""",
    ),
  ],

  practiceActivityDescription1: """
Dear all, now that you have watched the recorded lecture, we have another video for you. This video, taken from BBC Learning English, will reinforce what you learned in the previous video. If you don’t understand everything in this video, don’t worry! There will be separate lessons on the most common tenses later.
""",

  practiceActivityVideo:"https://www.youtube.com/watch?v=GiI3wjFWSXQ&t=20s ",

  practiceActivityDescription2: """
Since you have now watched two videos on tenses, it’s time to take a quiz on mixed tenses and assess your strengths and weaknesses. This quiz is for self-awareness only—we will not check your marks. The goal is to help you identify which areas you need to focus on in future lessons. After completing the quiz, take a screenshot of the final page showing your answers and upload it to the designated submission portal as proof of completion.
  """,
  practiceUploadLink2: "https://courseweb.sliit.lk/mod/assign/view.php?id=374545",
  practiceActivityLink2:"https://www.ego4u.com/en/cram-up/tests/language-course",

  instructionsText: """
We have a brief recorded video introducing different tenses. Please watch it before moving on to the activities. Feel free to take notes, as this will help you remember and understand the concepts better.
""",

  instructionVideoId: "https://lecturecapture.sliit.lk/eplayer.php?id=bXJUbW1IOXRjd182NzY1Nw==",

  summary: """
  This lesson is an introduction to our third unit, where we will learn about the most commonly used tenses. The main goal is to check your current understanding of tenses since they are important for daily communication. In the next lessons, we will focus on each tense separately and do speaking activities to help you use them correctly.""",

  inClassActivity: """
Hi everyone! We’ll meet in class to talk about useful ways to improve how we use tenses. We’ll also do some fun and interactive activities. See you there!
  """,

  quizQuestions: [
    QuizQuestion(
      question: 'What is the purpose of tenses in language?',
      options: [
        'a) To describe objects',
        'b) To indicate time in a sentence',
        'c) To make sentences longer',
        'd) To add adjectives to sentences',
      ],
      correctOptionIndex: 1,
    ),
    QuizQuestion(
      question: 'Which tense is used to describe actions that are happening right now?',
      options: [
        'a) Past tense',
        'b) Present tense',
        'c) Future tense',
        'd) None of the above',
      ],
      correctOptionIndex: 1,
    ),
    QuizQuestion(
      question: 'What are the three main categories of tenses?',
      options: [
        'a) Future, continuous, and perfect',
        'b) Present, past, and future',
        'c) Simple, continuous, and perfect',
        'd) Present, past, and perfect',
      ],
      correctOptionIndex: 1,
    ),
    QuizQuestion(
      question: 'Why is it important to use the correct tense in communication?',
      correctTextAnswer: 'Using the correct tense helps others understand when an action happened, which makes communication clearer.',
      isTextAnswer: true,
    ),
    QuizQuestion(
      question: 'Identify the tense in the following sentence: "She will be traveling to Japan next month."',
      correctTextAnswer: 'Future continuous tense.',
      isTextAnswer: true,
    ),
  ],
);
