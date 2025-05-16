import '../unit_model.dart';

final UnitModel unit2_1= UnitModel(
  unitIndex: 3,
    unitName: "Word Order in English",
    introductionText: """
Welcome to Unit 02 – Lesson 01
This lesson introduces sentence structure. Before we move on to more advanced sentence patterns in upcoming lessons, it is important to first grasp the fundamental rules of word order in English and understand why they matter. Take a moment to reflect on how you currently structure sentences to recognize areas where you might need improvement.
This lesson will focus on building both accuracy and confidence in forming sentences. We will explore how to arrange words correctly to create clear and effective communication, a key skill for expressing your ideas in English.
To start, let’s take a moment to clarify our objectives. Knowing what we aim to accomplish will help you stay focused and motivated throughout the lesson. With that in mind, let’s go over the lesson goals.
By the end of this lesson, you will be able to:
-	Recognize the basic word order in English (Subject-Verb-Object structure).
-	Construct grammatically correct sentences in computing-related contexts.
-	 Identify and correct word order mistakes in simple and complex sentences.""",
    preClassActivityDescription: """
You will be given a list of jumbled sentences. Arrange the words in the correct order to form meaning sentences. Refer to the example given and complete the task accordingly.

Example:
Debugging/good/is/practice
Debugging is good practice. """,

    preClassQuestions: [
      PreClassQuestion(
        questionText: "writes / the developer / efficient / code",
        correctAnswer: "The developer writes efficient code.",
      ),
      PreClassQuestion(
        questionText: "restart / the system / you / must",
        correctAnswer: "You must restart the system.",
      ),
      PreClassQuestion(
        questionText: "the software / update / regularly / we",
        correctAnswer: "We update the software regularly.",
      ),
      PreClassQuestion(
        questionText: "a password / strong / create / should / you",
        correctAnswer: "You should create a strong password.",
      ),
      PreClassQuestion(
        questionText: "saves / every / the program / change / automatically",
        correctAnswer: "The program saves every change automatically.",
      ),
      PreClassQuestion(
        questionText: "server / the / is / down / temporarily",
        correctAnswer: "The server is down temporarily.",
      ),
      PreClassQuestion(
        questionText: "install / software / the / before / using / it",
        correctAnswer: "Install the software before using it.",
      ),
      PreClassQuestion(
        questionText: "protect / data / your / always / securely",
        correctAnswer: "Always protect your data securely.",
      ),
    ],
    practiceActivityDescription1: """
Okay, now that you have gone through the lesson, let’s practice what you have learned from the lesson again .""",
  practiceActivityQuestions1: [
      PracticeQuestion1(
        questionText: "networking / computers / of / a / system / interconnected / is",
        correctAnswer: "Networking is a system of interconnected computers.",
      ),
      PracticeQuestion1(
        questionText: "data / CPU / processing / performs / the / main",
        correctAnswer: "The CPU performs the main data processing.",
      ),
      PracticeQuestion1(
        questionText: "cloud / storing / data / remotely / involves / computing",
        correctAnswer: "Cloud computing involves storing data remotely.",
      ),
      PracticeQuestion1(
        questionText: "programming / languages / Python / Java / include / and",
        correctAnswer: "Programming languages include Python and Java.",
      ),
      PracticeQuestion1(
        questionText: "internet / a / protocol / communication / is",
        correctAnswer: "The internet is a communication protocol.",
      ),
      PracticeQuestion1(
        questionText: "artificial / intelligence / machines / exhibit / behavior / where",
        correctAnswer: "Artificial intelligence is where machines exhibit behavior.",
      ),
      PracticeQuestion1(
        questionText: "memory / RAM / temporary / computer's / is",
        correctAnswer: "RAM is the computer's temporary memory.",
      ),
      PracticeQuestion1(
        questionText: "hardware / physical / components / include / computer's",
        correctAnswer: "Hardware includes the computer's physical components.",
      ),
      PracticeQuestion1(
        questionText: "operating / system / software / manages / hardware / the",
        correctAnswer: "The operating system manages the software and hardware.",
      ),
      PracticeQuestion1(
        questionText: "cybersecurity / protects / systems / unauthorized / access / from",
        correctAnswer: "Cybersecurity protects systems from unauthorized access.",
      ),
    ],

    practiceActivityDescription2: """
 Instructions:
 
•	Please click on the link given below. 

•	Once you get directed to the website, scroll down and you will find a sentence “I would like to answer [….] selected from [….]. 

•	Please select 15 exercises and 04 parts as the answer to the above blanks. 

•	Click on the “Start test” and complete the activities given. 

•	Submit a screenshot of your test to the given link as proof. """,
    practiceActivityLink2:"https://www.englisch-hilfen.de/en/complex_tests/word_order1/task.php#google_vignette",
  practiceUploadLink2:"https://example.com/upload-practice-activity",
    instructionsText: """
You will now watch a video lesson on Word Order. Make sure you go through the whole lesson to understand how to implement word order in spoken language. Take down notes where necessary. Enjoy!
""",
    instructionVideoId: "8laYlyAFd0o",
    summary: """
Now, we have come to the end of Lesson 2.1. In this lesson, we explored the basic rules of word order in English, which generally follows the Subject-Verb-Object (SVO) structure. Using the correct word order is essential for making sentences clear and meaningful, especially when communicating in academic, professional, and technical settings. Misplacing words can lead to confusion, so applying these rules correctly helps ensure that your messages are understood as intended. Whether you are writing documentation, sending emails, or having conversations, following proper word order will improve both accuracy and fluency in your communication.""",
    inClassActivity: """
Join us in the classroom as we put word order into practice! In this session, you'll get the chance to refine your skills in structuring sentences clearly and effectively in spoken English. It’s also the perfect time to ask your lecturer any questions and gain confidence in applying these rules in real conversations.
Hope you enjoyed learning and see you there!
""",
  quizQuestions: [
    QuizQuestion(
      question: "Which sentence has the correct word order?",
      options: [
        "Always I eat breakfast at 8 AM.",
        "I eat always breakfast at 8 AM.",
        "I always eat breakfast at 8 AM.",
        "Eat I always breakfast at 8 AM.",
      ],
      correctOptionIndex: 2,
    ),
    QuizQuestion(
      question: "Which of the following is the correct word order for a question?",
      options: [
        "Where you are going?",
        "Where are you going?",
        "Where going are you?",
        "Are where you going?",
      ],
      correctOptionIndex: 1,
    ),
    QuizQuestion(
      question: "Which sentence is in the correct order?",
      options: [
        "The cat quickly the mouse caught.",
        "The cat caught quickly the mouse.",
        "The cat caught the mouse quickly.",
        "The quickly cat caught the mouse.",
      ],
      correctOptionIndex: 2,
    ),
    QuizQuestion(
      question: "Which of these sentences correctly places the adverb?",
      options: [
        "She speaks fluently English.",
        "She fluently speaks English.",
        "She speaks English fluently.",
        "Fluently she speaks English.",
      ],
      correctOptionIndex: 2,
    ),
    QuizQuestion(
      question: """Rearrange the words to form a correct sentence: 
          to / every / school / goes / morning / she""",
      isTextAnswer: true,
      correctTextAnswer: "She goes to school every morning.",
    ),
    QuizQuestion(
      question: "In English, what is the standard word order for a basic sentence? Explain with an example.",
      isTextAnswer: true,
      correctTextAnswer: "The standard word order is Subject-Verb-Object (SVO). For example: 'She (subject) reads (verb) books (object).'",
    ),
  ],
);


