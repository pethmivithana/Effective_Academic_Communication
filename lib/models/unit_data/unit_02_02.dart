import '../unit_model.dart';

final UnitModel unit2_2 = UnitModel(
  unitIndex: 4,
  unitName: "Types of Sentences",
  introductionText: """
Welcome to Unit 02 – Lesson 02
This lesson will introduce the different types of sentences commonly used in spoken English. Understanding how different sentence types function will help you communicate clearly and effectively. Spoken English relies on a mix of sentence structures to convey meaning, express emotions, and engage in natural conversations. Before diving into the details, reflect on the way you speak. Do you vary your sentences when talking to different people? Recognizing different sentence types will help enhance your communication skills.
By the end of this lesson, you will be able to:
- Identify and classify the four main types of sentences in spoken English.
- Use different sentence structures to enhance fluency and natural speech.
- Apply sentence variation in conversations to improve engagement and clarity.
  """,

  preClassActivityDescription: """
1. Click on the given link and watch the short video. 

2. Listen carefully and identify the sentence types. 

3. Write down at least one example of each sentence type (Declarative, Interrogative, Imperative, and Exclamatory) from the video.""",

  preClassActivityVideo: "https://www.youtube.com/watch?v=1t9UHQgtDfU",

  preClassQuestions: [
    PreClassQuestion(
      questionText: 'Write one example of a **Declarative** sentence (e.g., I love this song).',
      correctAnswer: 'I love this song.',
    ),
    PreClassQuestion(
      questionText: 'Write one example of an **Interrogative** sentence (e.g., Where did you find this?).',
      correctAnswer: 'Where did you find this?',
    ),
    PreClassQuestion(
      questionText: 'Write one example of an **Imperative** sentence (e.g., Turn up the volume!).',
      correctAnswer: 'Turn up the volume!',
    ),
    PreClassQuestion(
      questionText: 'Write one example of an **Exclamatory** sentence (e.g., This is amazing!).',
      correctAnswer: 'This is amazing!',
    ),
  ],

  practiceActivityDescription1: """
Now that you have an understanding of sentence types, let’s practice converting one type of sentence into another
  """,

  practiceActivityQuestions1: [
    PracticeQuestion1(
      questionText: '(Declarative) “She passed her exam.”\nInterrogative: ____________________',
      correctAnswer: 'Did she pass her exam?',
    ),
    PracticeQuestion1(
      questionText: '(Declarative) “She passed her exam.”\nImperative: ____________________',
      correctAnswer: 'Tell her she passed the exam.',
    ),
    PracticeQuestion1(
      questionText: '(Declarative) “She passed her exam.”\nExclamatory: ____________________',
      correctAnswer: 'What a great result she got!',
    ),
    PracticeQuestion1(
      questionText: '(Interrogative) “Did he call you yesterday?”\nDeclarative: ____________________',
      correctAnswer: 'He called me yesterday.',
    ),
    PracticeQuestion1(
      questionText: '(Interrogative) “Did he call you yesterday?”\nImperative: ____________________',
      correctAnswer: 'Call him and ask about yesterday.',
    ),
    PracticeQuestion1(
      questionText: '(Interrogative) “Did he call you yesterday?”\nExclamatory: ____________________',
      correctAnswer: 'I can’t believe he called yesterday!',
    ),
    PracticeQuestion1(
      questionText: '(Imperative) “Give me back my pen.”\nDeclarative: ____________________',
      correctAnswer: 'She asked for her pen back.',
    ),
    PracticeQuestion1(
      questionText: '(Imperative) “Give me back my pen.”\nInterrogative: ____________________',
      correctAnswer: 'Can you give me back my pen?',
    ),
    PracticeQuestion1(
      questionText: '(Imperative) “Give me back my pen.”\nExclamatory: ____________________',
      correctAnswer: 'I need my pen back now!',
    ),
  ],

  practiceActivityDescription2: """
Step 01: Use ChatGPT voice mode.

Step 02: Have a conversation with ChatGPT on any of the given topics. Make sure you use all the types of sentences we have learnt so far in your conversation. 
- A conversation about a movie/TV series you have watched
- A conversation planning a trip. 
- A conversation on the development of AI.

Step 03: Take a Screenshot/Screenshots of your conversation and submit it! 
  """,

  practiceUploadLink2: "https://example.com/upload-practice-activity",

  instructionsText: """
You will now watch a video lesson on Word Order. Make sure you go through the whole lesson to understand how to implement word order in spoken language. Take down notes where necessary. Enjoy!
  """,

  instructionVideoId: "8laYlyAFd0o",

  summary: """
In this lesson, we explored the four types of sentences and their importance in communication. Understanding sentence types helps in structuring messages clearly and effectively. Keep practicing by identifying different sentence types in daily conversations and writing exercises.""",

  inClassActivity: """
Step into the classroom and dive deeper into the different types of sentences! This is a great opportunity to apply what you've learned and clarify any questions directly with your lecturer. 
Don't miss out—see you there!""",

  quizQuestions: [
    QuizQuestion(
      question: '1. Which sentence is interrogative?',
      options: [
        'a) She is a great singer.',
        'b) Did you see that movie?',
        'c) What a wonderful day!',
        'd) Close the door.',
      ],
      correctOptionIndex: 1,
    ),
    QuizQuestion(
      question: '2. What punctuation mark typically ends an imperative sentence?',
      options: [
        'a) Period (.)',
        'b) Exclamation mark (!)',
        'c) Question mark (?)',
        'd) Comma (,)',
      ],
      correctOptionIndex: 0,
    ),
    QuizQuestion(
      question: '3. Choose the exclamatory sentence:',
      options: [
        'a) How did you solve this problem?',
        'b) I am going to the library.',
        'c) What an incredible match that was!',
        'd) Please take out the trash.',
      ],
      correctOptionIndex: 2,
    ),
    QuizQuestion(
      question: '4. Rearrange the words to form a correct imperative sentence:\nhelp / me / please / this / with / assignment',
      correctTextAnswer: 'Please help me with this assignment.',
      isTextAnswer: true,
    ),
    QuizQuestion(
      question: '5. Define a declarative sentence and provide an example:',
      correctTextAnswer: 'A declarative sentence states a fact or opinion. Example: The sky is blue.',
      isTextAnswer: true,
    ),
  ],
);
