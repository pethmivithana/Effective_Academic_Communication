//practice activity 1 2 not working properly

import '../unit_model.dart';

final UnitModel unit7_2 = UnitModel(
  unitIndex: 30,
  unitName: "Using context clues to understand unfamiliar words",
  introductionText: """
Welcome to lesson 7.2!
As computing students, you’ll often encounter unfamiliar technical or academic terms while reading documentation, research papers, or system interfaces. Instead of pausing every time to consult a dictionary, there’s a smarter strategy—using context clues. Context clues are the hints found in the words, phrases, or sentences surrounding an unfamiliar word. These clues can help you make educated guesses about meanings, which boosts your reading speed, comprehension, and confidence.
In this lesson, we’ll learn how to spot five key types of context clues: definition, synonym, antonym, example, and inference. Mastering these will help you decode unfamiliar vocabulary more naturally and apply this skill across any computing-related text—from user manuals to technical blogs. Ready to become a vocabulary detective?
By the end of this lesson, you will be able to:
1.	Identify the main types of context clues.
2.	Use context clues to infer the meaning of unfamiliar words.
3.	Improve your reading fluency in technical and academic contexts.
4.	Apply this strategy to computing-related texts and documentation.
""",

  preClassActivityDescription: """
Below is a paragraph from a software engineering article. Read it carefully and guess the meaning of the underlined words using the context.

Text:
**To avoid redundancy, the developer used modular functions, which can be reused in different parts of the code. This practice improves maintainability, making the code easier to update and debug.**

Now answer the following:
""",
  preClassQuestions:[
    PreClassQuestion(
      questionText: 'What does modular most likely mean?',
      options: ['Slow and complex', 'Built in independent units', 'Fully encrypted'],
      correctOptionIndex: 1,
      correctAnswer: 'Built in independent units',
    ),
    PreClassQuestion(
      questionText: 'What does maintainability suggest about the code?',
      options: ['It is outdated', 'It’s difficult to understand', 'It’s easy to manage and improve'],
      correctOptionIndex: 2,
      correctAnswer: 'It’s easy to manage and improve',
    ),
  ],

  practiceActivityDescription1: """ 
Read the sentences and select the correct type of context clue used. 
""",
  practiceActivityMCQ:[
    PracticeQuestionMCQ(
      questionText:
      "The software uses a cache, a small and fast memory that stores frequently accessed data to speed up processing. What type of context clue is used to explain “cache”?",
      options: ["Definition", "Synonym", "Example", "Inference"],
      correctOptionIndex: 0, // Definition
    ),
    PracticeQuestionMCQ(
      questionText:
      "Unlike the old UI, which was rigid and difficult to modify, the new one is far more flexible and user-friendly. What type of context clue helps you understand “flexible”?",
      options: ["Example", "Antonym", "Inference", "Synonym"],
      correctOptionIndex: 1, // Antonym
    ),
    PracticeQuestionMCQ(
      questionText:
      "The interface is very intuitive, just like Dropbox or Google Drive, where users can navigate easily without instruction. What clue type is used to explain “intuitive”?",
      options: ["Inference", "Definition", "Synonym", "Example"],
      correctOptionIndex: 3, // Example
    ),
    PracticeQuestionMCQ(
      questionText:
      "The Wi-Fi connection was unstable. It disconnected three times during the meeting without warning. What clue helps you understand “unstable”?",
      options: ["Definition", "Example", "Synonym", "Inference"],
      correctOptionIndex: 1, // Example
    ),
    PracticeQuestionMCQ(
      questionText:
      "A redundant variable is one that is no longer needed in the program. What clue type is used for “redundant”?",
      options: ["Antonym", "Definition", "Example", "Inference"],
      correctOptionIndex: 1, // Definition
    ),
    PracticeQuestionMCQ(
      questionText:
      "This function is efficient, meaning it performs tasks quickly without wasting resources. Which clue type explains “efficient”?",
      options: ["Synonym", "Antonym", "Definition", "Example"],
      correctOptionIndex: 2, // Definition
    ),
  ],

  practiceActivityDescription2: """
You’ll read a computing-related sentence and guess the meaning of the unfamiliar word based on context. Then, explain your guess out loud. Follow the steps given:

Choose one sentence with an unknown word.

Record a 30-second audio explaining what you think the word means, based on surrounding clues.

Use one of the clue types in your explanation (e.g., “I used an example clue…”).

Record your answer via the given site. 

Paste the audio link here!

Example Prompt:
The program was deprecated, meaning it is no longer supported or recommended.
Explain: What does “deprecated” mean, and what clue helped you?
""",
  practiceActivityLink2:"https://www.speakpipe.com/voice-recorder",
  practiceUploadLink2:"https://courseweb.sliit.lk/mod/assign/view.php?id=375218",

  instructionsText: """
Now, let’s watch the video lesson below. You’ll learn how to use different types of context clues to guess the meaning of unfamiliar words. While watching, pay close attention to examples drawn from computing topics—like documentation, system descriptions, and feature summaries. Take notes on the five types of clues: definition, synonym, antonym, example, and inference. This will help you build confidence in understanding new vocabulary without needing constant translation.
""",

  instructionVideoId: "https://lecturecapture.sliit.lk/eplayer.php?id=aDJyc3hwYk13M182NzgzNg==",

  summary: """
In this lesson, you learned how to use context clues to understand unfamiliar words—an essential strategy for academic success in computing. We explored five types of clues: definitions, which directly explain the word; synonyms and antonyms, which offer comparisons; examples, which give real-life scenarios; and inferences, which require you to think critically about the meaning. By practicing these techniques, you’ve taken a big step toward becoming an independent reader. Instead of stopping at every unfamiliar term, you can now use the context around it to make sense of what you’re reading. This skill will help you understand documentation, analyze reports, and follow discussions with more ease—making you a more confident communicator in your field.""",

  inClassActivity: """
During our next class, we’ll explore context clues through real computing texts—like open-source project readme files or documentation snippets. You’ll work individually to highlight unfamiliar words, identify the clue type used, and guess the word’s meaning. Then, we’ll compare answers as a group and discuss different interpretations. To make it more fun, we’ll wrap up with a “Context Clue Showdown,” where you’ll compete in teams to solve tricky vocabulary challenges using only clues from sentences. Come prepared to think fast and learn collaboratively!
""",

  quizQuestions: [
    QuizQuestion(
      question: "What is a context clue?",
      options: ['a) A type of computer program', 'b) A hint in the sentence that helps define a word', 'c) A synonym dictionary'],
      correctOptionIndex: 1,
      correctTextAnswer: 'b) A hint in the sentence that helps define a word',
      isTextAnswer: false,
    ),
    QuizQuestion(
      question: "What clue type is used here: 'Encryption, the process of converting data into a secure format…'?",
      options: null,
      correctOptionIndex: null,
      correctTextAnswer: 'Definition',
      isTextAnswer: true,
    ),
    QuizQuestion(
      question: "Choose the best word to complete:\nThe design is __________, adjusting automatically to any device.",
      options: ['a) flexible', 'b) static', 'c) frozen'],
      correctOptionIndex: 0,
      correctTextAnswer: 'a) flexible',
      isTextAnswer: false,
    ),
    QuizQuestion(
      question: "Write your own sentence using a computing term and include a context clue.",
      options: null,
      correctOptionIndex: null,
      correctTextAnswer: 'Example Answer: An API, or Application Programming Interface, allows programs to communicate with each other.',
      isTextAnswer: true,
    ),
  ],
);