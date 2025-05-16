import '../unit_model.dart';

final UnitModel unit3_4 = UnitModel(
  unitIndex: 9,
  unitName: "Present Perfect Continuous Tense",
  introductionText: """
Hello everyone, and welcome back! Today’s lesson is all about the Present Perfect Continuous tense. Let me ask you a question: How many years have you been learning English? To answer that, you’d need to use the Present Perfect Continuous tense, as you would say, “I have been learning English for X years.” Now, do you see why this tense is important? By the end of this lesson, you’ll be using it fluently to talk about ongoing actions and experiences.
We’ll start by reviewing the lesson objectives, so you know exactly what to expect:
Lesson Objectives
By the end of today’s lesson, you should be able to:
1.	Understand the structure of the Present Perfect Continuous tense and recognize its usage in expressing ongoing actions.
2.	Distinguish between the Present Perfect and Present Perfect Continuous tenses, knowing when to use each based on the duration or recentness of an action.
3.	Develop fluency in using the Present Perfect Continuous tense by engaging in conversations or role-plays to describe ongoing actions or experiences.

  """,

  preClassActivityDescription: """
Watch this short YouTube video on Present Perfect Continuous. It will introduce you to the structure and usage of the tense.
""",

  preClassQuestions: [
    PreClassQuestion(
        questionText: "After watching the video, please write 3 sentences in the space provided. Each sentence should explain something you have been doing recently.",
        correctAnswer: """I have been studying English grammar. 
        I have been working on a project. 
        I have been reading a book."""
    ),
  ],
  preClassActivityVideo:"https://www.youtube.com/watch?v=Ttr7DowBUBk ",


  practiceActivityDescription1: """
Next, it’s time to test your understanding with an online quiz. This quiz will help you compare the Present Perfect tense and the Present Perfect Continuous tense. 

Please complete the quiz and upload the screenshot of your completed quiz to the platform as proof of completion.
 """,
  practiceActivityLink:"https://test-english.com/grammar-points/b1/present-perfect-simple-present-perfect-continuous/ ",
  practiceUploadLink: "https://example.com/upload-practice-activity",

  practiceActivityDescription2: """
Step 1 - Open ChatGPT and use the voice feature for a more interactive experience.

Step 2 - Give this prompt to ChatGPT:
“Hi, I want to practice speaking in the Present Perfect Continuous tense. Can you ask me questions about what I’ve been doing recently?”

Step 3 - ChatGPT will ask you a series of questions. Try to answer them in detail, using the Present Perfect Continuous tense. Have a natural conversation as you explain what you’ve been doing.
""",

  practiceUploadLink2: "https://example.com/upload-practice-activity",

  instructionsText: """
Now that you've watched the video and started thinking about the Present Perfect Continuous tense, there is a brief recorded session that you should watch next. This session will cover all the details you need to know, including the structure, usage, and how to distinguish this tense from the Present Perfect tense.
""",

  instructionVideoId: "8laYlyAFd0o",

  summary: """
In today’s lesson, we explored the Present Perfect tense, which is essential for discussing past experiences that are relevant to the present. Through a series of engaging activities, such as chatting with AI to highlight Present Perfect sentences and completing a mock interview, you got a hands-on opportunity to practice using the tense in real-life situations. By the end of the lesson, you should feel confident in recognizing and using the Present Perfect in conversations, especially in computing contexts.""",

  inClassActivity: """
As we move forward, get ready for some exciting in-class activities! In our upcoming classes, we’ll be focusing on making learning more interactive. We’ll dive into discussions, group exercises, and role-plays that will help you apply what you’ve learned about the Present Perfect tense in real-time. These activities are designed to be fun and engaging, and they will give you the chance to practice speaking and listening in a collaborative, dynamic environment.
 """,

  quizQuestions: [
    QuizQuestion(
      question: "I ________ (study) the impact of machine learning on data analysis for the past few months.",
      options: ["have studied", "have been studying", "studied"],
      correctOptionIndex: 1,
      isTextAnswer: false,
    ),
    QuizQuestion(
      question: "How long ________ (you/attempt) to solve the error in the system?",
      options: ["have you been attempting", "did you attempt", "do you attempt"],
      correctOptionIndex: 0,
      isTextAnswer: false,
    ),
    QuizQuestion(
      question: "We ________ (wait) for the server to come back online since 10 AM.",
      options: ["have been waiting", "waited", "have waited"],
      correctOptionIndex: 0,
      isTextAnswer: false,
    ),
    QuizQuestion(
      question: "He ________ (work) on improving his coding efficiency by attending workshops lately.",
      options: ["has worked", "works", "has been working"],
      correctOptionIndex: 2,
      isTextAnswer: false,
    ),
    QuizQuestion(
      question: "They ________ (discuss) the latest technological advancements in their last few meetings.",
      options: ["have been discussing", "discussed", "have discussed"],
      correctOptionIndex: 0,
      isTextAnswer: false,
    ),
],
);
