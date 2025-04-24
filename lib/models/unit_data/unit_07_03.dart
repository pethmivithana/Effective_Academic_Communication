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
•	Identify formal and informal expressions in English.
•	Distinguish between appropriate and inappropriate tone in academic and professional settings.
•	Replace informal expressions with formal ones, especially in computing-related communication.
•	Apply the correct level of formality in writing and speaking tasks.
""",

  preClassActivityDescription: """
Look at the sentences below and decide whether they are formal or informal. Tap each to check your answer.
""",
  preClassQuestions:[
    PreClassQuestion(
      questionText: "1. 'Hey, I’m working on the app. Gimme a sec!' - _____",
      options: ['a) Informal', 'b) Formal'],
      correctOptionIndex: 0,
      correctAnswer: 'a) Informal',
      isTextAnswer: false,
    ),
    PreClassQuestion(
      questionText: "2. 'I am currently developing the application. Please wait a moment.' - _____",
      options: ['a) Informal', 'b) Formal'],
      correctOptionIndex: 1,
      correctAnswer: 'b) Formal',
      isTextAnswer: false,
    ),
    PreClassQuestion(
      questionText: "3. 'Lemme know when it’s done.' - _____",
      options: ['a) Informal', 'b) Formal'],
      correctOptionIndex: 0,
      correctAnswer: 'a) Informal',
      isTextAnswer: false,
    ),
    PreClassQuestion(
      questionText: "4. 'Kindly inform me once the task is completed.' - _____",
      options: ['a) Informal', 'b) Formal'],
      correctOptionIndex: 1,
      correctAnswer: 'b) Formal',
      isTextAnswer: false,
    ),
  ],

  practiceActivityDescription1: """ 
Read the sentences and select the correct type of context clue used. 
""",
  practiceActivityQuestions1:[
    PracticeQuestion1(
      questionText: "1. The software uses a cache, a small and fast memory that stores frequently accessed data to speed up processing. What type of context clue is used to explain 'cache'?",
      options: ['a) Definition', 'b) Synonym', 'c) Example', 'd) Inference'],
      correctOptionIndex: 0,
      correctAnswer: 'a) Definition',
    ),
    PracticeQuestion1(
      questionText: "2. Unlike the old UI, which was rigid and difficult to modify, the new one is far more flexible and user-friendly. What type of context clue helps you understand 'flexible'?",
      options: ['a) Example', 'b) Antonym', 'c) Inference', 'd) Synonym'],
      correctOptionIndex: 1,
      correctAnswer: 'b) Antonym',
    ),
    PracticeQuestion1(
      questionText: "3. The interface is very intuitive, just like Dropbox or Google Drive, where users can navigate easily without instruction. What clue type is used to explain 'intuitive'?",
      options: ['a) Inference', 'b) Definition', 'c) Synonym', 'd) Example'],
      correctOptionIndex: 3,
      correctAnswer: 'd) Example',
    ),
    PracticeQuestion1(
      questionText: "4. The Wi-Fi connection was unstable. It disconnected three times during the meeting without warning. What clue helps you understand 'unstable'?",
      options: ['a) Definition', 'b) Example', 'c) Synonym', 'd) Inference'],
      correctOptionIndex: 1,
      correctAnswer: 'b) Example',
    ),
    PracticeQuestion1(
      questionText: "5. A redundant variable is one that is no longer needed in the program. What clue type is used for 'redundant'?",
      options: ['a) Antonym', 'b) Definition', 'c) Example', 'd) Inference'],
      correctOptionIndex: 1,
      correctAnswer: 'b) Definition',
    ),
    PracticeQuestion1(
      questionText: "6. This function is efficient, meaning it performs tasks quickly without wasting resources. Which clue type explains 'efficient'?",
      options: ['a) Synonym', 'b) Antonym', 'c) Definition', 'd) Example'],
      correctOptionIndex: 2,
      correctAnswer: 'c) Definition',
    ),
  ],

  practiceActivityDescription2: """
You’ll read a computing-related sentence and guess the meaning of the unfamiliar word based on context. Then, explain your guess out loud. Follow the steps given:

	Choose one sentence with an unknown word.
	Record a 30-second audio explaining what you think the word means, based on surrounding clues.
	Use one of the clue types in your explanation (e.g., “I used an example clue…”).
	Record your answer via the given site. 
	Paste the audio link here!

Example Prompt:
The program was deprecated, meaning it is no longer supported or recommended.
Explain: What does “deprecated” mean, and what clue helped you?
""",
  practiceActivityLink2:"https://www.speakpipe.com/voice-recorder ",
  practiceUploadLink2:"",

  instructionsText: """
Watch the video lesson below to understand when and how to use formal vs. informal language. You’ll learn to spot differences in grammar, word choice, and tone. Make notes where necessary.
By the end, you’ll be more confident choosing the right tone in any setting—whether you’re chatting with peers or writing to a supervisor.

""",

  instructionVideoId: "8laYlyAFd0o",

  summary: """
In this lesson, you learned how to use context clues to understand unfamiliar words—an essential strategy for academic success in computing. We explored five types of clues: definitions, which directly explain the word; synonyms and antonyms, which offer comparisons; examples, which give real-life scenarios; and inferences, which require you to think critically about the meaning. By practicing these techniques, you’ve taken a big step toward becoming an independent reader. Instead of stopping at every unfamiliar term, you can now use the context around it to make sense of what you’re reading. This skill will help you understand documentation, analyze reports, and follow discussions with more ease—making you a more confident communicator in your field.
""",

  inClassActivity: """
During our next class, we’ll explore context clues through real computing texts—like open-source project readme files or documentation snippets. You’ll work individually to highlight unfamiliar words, identify the clue type used, and guess the word’s meaning. Then, we’ll compare answers as a group and discuss different interpretations. To make it more fun, we’ll wrap up with a “Context Clue Showdown,” where you’ll compete in teams to solve tricky vocabulary challenges using only clues from sentences. Come prepared to think fast and learn collaboratively!
""",

  quizQuestions: [
    QuizQuestion(
      question: "1. What is a context clue?",
      options: ['a) A type of computer program', 'b) A hint in the sentence that helps define a word', 'c) A synonym dictionary'],
      correctOptionIndex: 1,
      correctTextAnswer: 'b) A hint in the sentence that helps define a word',
      isTextAnswer: false,
    ),
    QuizQuestion(
      question: "2. What clue type is used here: 'Encryption, the process of converting data into a secure format…'?",
      options: null,
      correctOptionIndex: null,
      correctTextAnswer: 'Definition',
      isTextAnswer: true,
    ),
    QuizQuestion(
      question: "3. Choose the best word to complete:\nThe design is __________, adjusting automatically to any device.",
      options: ['a) flexible', 'b) static', 'c) frozen'],
      correctOptionIndex: 0,
      correctTextAnswer: 'a) flexible',
      isTextAnswer: false,
    ),
    QuizQuestion(
      question: "4. Write your own sentence using a computing term and include a context clue.",
      options: null,
      correctOptionIndex: null,
      correctTextAnswer: 'Example Answer: An API, or Application Programming Interface, allows programs to communicate with each other.',
      isTextAnswer: true,
    ),
  ],
);
