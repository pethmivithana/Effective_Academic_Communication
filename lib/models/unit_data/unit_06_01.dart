import '../unit_model.dart';

final UnitModel unit6_1 = UnitModel(
  unitIndex: 24,
  unitName: "Understanding Communication Strategies",
  introductionText: """
Dear Students,
Welcome to Lesson 6.1! You’ve now completed the introduction to Unit 6, where we explored the importance of communication and how communication strategies can support meaningful interactions. In today’s lesson, we will discuss more about communication strategies so that you can confidently apply them in real-life conversations—with both peers and academics.
Before we begin, please take a moment to carefully read the lesson objectives. This will help you understand what you’re expected to achieve by the end of this lesson.
Lesson Objectives
By the end of this lesson, you should be able to:
1.	Identify common communication strategies such as clarification, paraphrasing, and turn-taking used in spoken interactions.
2.	Recognize effective methods for overcoming communication barriers in real-life conversations.
3.	Apply basic strategies such as asking for repetition, confirming understanding, and using body language to improve spoken communication.
4.	Practice active listening techniques to enhance comprehension in conversations.
""",

  preClassActivityDescription: """
Let’s begin with a quick self-assessment to reflect on your current communication strengths and areas for improvement. Please be honest with your answers—this quiz is just for you to better understand your communication habits.
""",
  preClassSurvey:[
  SurveyQuestion(
    questionText: "What do you do when you don’t understand someone in a conversation?",
    options: [
      "Stay silent",
      "Ask them to repeat",
      "Guess and respond anyway",
      "Change the topic",
    ],
    allowsMultipleAnswers: true,
  ),
  SurveyQuestion(
    questionText: "What makes you nervous when speaking in English?",
    options: [
      "Fear of making mistakes",
      "Not knowing enough words",
      "Speaking too slowly",
      "All of the above",
    ],
    allowsMultipleAnswers: true,
  ),
    SurveyQuestion(
      questionText: "Which communication problems do you face the most?",
      options: [
        "Pronunciation",
        "Vocabulary",
        "Listening",
        "Confidence",
        "Grammar",
      ],
      allowsMultipleAnswers: true,
    ),
  ],
  preClassQuestions:[
  PreClassQuestion(
    questionText: "You are ordering food at a restaurant, but the waiter doesn’t understand you. What do you do?",
    isTextAnswer: true,
  ),
  PreClassQuestion(
    questionText: "Your friend is speaking too fast. How do you ask them to slow down?",
    isTextAnswer: true,
  ),
  PreClassQuestion(
    questionText: "Think about the last time you had difficulty communicating in English. What happened?",
    isTextAnswer: true,
  ),
  ],


  practiceActivityDescription1: """ 
Practice is the key to improvement! Try out this fun role-play using an AI chatbot.

Steps to follow:
Step 1: Go to ChatGPT or any preferred AI platform.

Step 2: Type this prompt:
"Let's do a role-play where I'm a customer at a restaurant, and you're the waiter. I will practice ordering food, and you should respond naturally. Please correct any mistakes I make."

Step 3: Start chatting! Begin with text and then switch to speech if possible.

Step 4: Take a screenshot of your conversation and upload it as proof of completion.

This activity will help you practice clarification, confidence, and fluency in everyday settings.

""",
  practiceUploadLink:"https://courseweb.sliit.lk/mod/assign/view.php?id=375201",

  practiceActivityDescription2: """
Hello students! As for the practice activity 2, you are supposed to watch this video. We are sure you’ll enjoy it! 
""",
  practiceVideoUrl:"https://www.youtube.com/watch?v=rpFmRq5KeJs",

  instructionsText: """
Now that you’ve identified your own communication challenges, please listen to the recorded lecture on communication strategies. Take notes, especially on strategies such as paraphrasing, asking for repetition, and active listening
""",

  instructionVideoId: "https://lecturecapture.sliit.lk/eplayer.php?id=S2hJenVGRHJTZ182NzcxNQ==",

  summary: """
In this lesson, we explored essential communication strategies such as asking for clarification, paraphrasing, active listening, and overcoming communication barriers. You completed a self-assessment to reflect on your communication challenges, listened to a lecture for deeper understanding, and practiced real-life conversations with an AI.
These strategies are crucial for becoming an effective communicator—both in academic and social settings. Keep practicing and applying them in your daily interactions!""",

  inClassActivity: """
We will practice communication strategies in small role-play activities and guided discussions. See you in the class! 
""",

  quizQuestions: [
    QuizQuestion(
      question: "Which of the following is a good communication strategy?",
      options: [
        "Ignoring the speaker",
        "Interrupting to finish their sentence",
        "Asking for clarification",
        "Speaking in your first language"
      ],
      correctOptionIndex: 2,
    ),
    QuizQuestion(
      question: "When someone doesn’t understand you, what is the best response?",
      options: [
        "Repeat slowly or use gestures",
        "Walk away",
        "Get angry",
        "Talk louder without changing your words"
      ],
      correctOptionIndex: 0,
    ),
    QuizQuestion(
      question: "Active listening includes:",
      options: [
        "Thinking about your response while they talk",
        "Making eye contact, and asking questions",
        "Interrupting to clarify a point",
        "Looking at your phone while they talk"
      ],
      correctOptionIndex: 1,
    ),
    QuizQuestion(
      question: "If someone is speaking too fast, you should say:",
      options: [
        "I don’t understand anything you’re saying!",
        "Slow down, you’re too fast!",
        "Could you please speak a bit more slowly?",
        "Never mind."
      ],
      correctOptionIndex: 2,
    ),
    QuizQuestion(
      question: "Which of the following helps overcome communication barriers in a conversation?",
      options: [
        "Avoiding eye contact",
        "Using clear, simple language",
        "Speaking as fast as possible",
        "Ignoring the listener’s body language"
      ],
      correctOptionIndex: 1,
    ),
  ],
);
