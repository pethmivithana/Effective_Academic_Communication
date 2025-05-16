import '../unit_model.dart';

final UnitModel unit7_0 = UnitModel(
  unitIndex: 28,
  unitName: "Context based Vocabulary Development",
  introductionText: """
In this unit, we’ll explore how to expand your vocabulary using context. Words do not exist in isolation, they live in sentences, paragraphs, and conversations. By understanding how a word is used in a sentence, we can often guess its meaning, determine its tone, or choose a better alternative. This approach is especially useful in computing, where unfamiliar academic or technical terms are common. Whether you’re reading documentation, writing reports, or listening to lectures, context-based vocabulary development will help you decode meaning, use appropriate words, and improve your academic fluency.
This unit sets the foundation for future lessons, where we’ll dive into how to change word forms, use context clues, distinguish between formal and informal expressions, and replace everyday words with academic equivalents. But first, let’s learn how to notice the clues all around a word—so we can truly understand and use it effectively.
By the end of this lesson, you will be able to:
•	Understand what context-based vocabulary development means.
•	Recognize how surrounding words influence the meaning of unfamiliar terms.
•	Practice identifying appropriate vocabulary based on sentence clues.
•	Apply context awareness in reading, writing, and listening tasks.
""",

  preClassActivityDescription: """
Read the short paragraph below and guess the meanings of the underlined words based on context. Then, choose the best definition from the options given.
The programmer was praised for her meticulous documentation. Every function was clearly explained, and even the edge cases were handled with precision. Her attention to detail made the system more robust and easier for others to maintain.
""",
  preClassQuestions:[
  PreClassQuestion(
    questionText: 'What does meticulous most likely mean?',
    options: ['Careless', 'Very detailed', 'Fast'],
    correctOptionIndex: 1,
  ),
  PreClassQuestion(
    questionText: 'What does precision suggest in this context?',
    options: ['Accuracy', 'Guesswork', 'Repetition'],
    correctOptionIndex: 0,
  ),
  PreClassQuestion(
    questionText: 'What does robust describe about the system?',
    options: ['Easily broken', 'Outdated', 'Strong and reliable'],
    correctOptionIndex: 2,
  ),
  ],

  practiceActivityDescription1: """ 
Match each sentence to the type of context clue it uses:
🟩 Definition | 🟦 Synonym | 🟥 Antonym | 🟨 Example | 🟧 Inference
""",
  practiceActivityQuestions1:[
  PracticeQuestion1(
    questionText: 'The encryption process ensures data is secure, meaning it is protected from unauthorized access.',
    correctAnswer: '🟩 Definition',
  ),
  PracticeQuestion1(
    questionText: 'The system crashed due to a malfunction, a failure that disrupted normal operation.',
    correctAnswer: '🟩 Definition',
  ),
  PracticeQuestion1(
    questionText: 'The website was sluggish, similar to how a slow-loading app behaves when the internet is weak.',
    correctAnswer: '🟦 Synonym',
  ),
  PracticeQuestion1(
    questionText: 'While the old software was unstable and crashed frequently, the new version is reliable and smooth.',
    correctAnswer: '🟥 Antonym',
  ),
  PracticeQuestion1(
    questionText: 'The programmer used libraries like NumPy, Pandas, and TensorFlow to speed up the development process.',
    correctAnswer: '🟨 Example',
  ),
  PracticeQuestion1(
    questionText: 'The code was so inefficient that it took 10 minutes to complete a task normally done in 2 seconds.',
    correctAnswer: '🟧 Inference',
  ),
  PracticeQuestion1(
    questionText: 'Authentication, the process of verifying a user’s identity, is a crucial step in login systems.',
    correctAnswer: '🟩 Definition',
  ),
  PracticeQuestion1(
    questionText: 'The interface was user-friendly, just like other intuitive platforms such as Google Drive and Dropbox.',
    correctAnswer: '🟨 Example',
  ),
  PracticeQuestion1(
    questionText: 'Instead of a linear process, where each step follows another, the system used a parallel approach to execute tasks simultaneously.',
    correctAnswer: '🟥 Antonym',
  ),
  PracticeQuestion1(
    questionText: 'The debug tool flagged a syntax error, which is a mistake in the structure of the code.',
    correctAnswer: '🟩 Definition',
  ),
  ],

  practiceActivityDescription2: """
You're a vocabulary agent decoding mysterious computing texts! Your task is to unlock hidden words based on context. You’ll read short passages with a blank, examine the clues, and write the correct word in the blank given
""",
  practiceActivityQuestions2:[
  PracticeQuestion2(
    questionText: 'The CPU fan began to ______________ loudly, signaling that the system was overheating. [whisper / whir / glow]',
    correctAnswer: 'whir',
  ),
  PracticeQuestion2(
    questionText: 'To avoid data loss, the application was programmed to create an automatic ______________ every 10 minutes. [firewall / reboot / backup]',
    correctAnswer: 'backup',
  ),
  PracticeQuestion2(
    questionText: 'The developer wrote ______________ code so that even beginners could read and understand it. [messy / clear / encrypted]',
    correctAnswer: 'clear',
  ),
  PracticeQuestion2(
    questionText: 'During testing, the team noticed a ______________ in the app that caused it to crash under certain conditions. [feature / bug / button]',
    correctAnswer: 'bug',
  ),
  PracticeQuestion2(
    questionText: 'Using a ______________ interface, users could simply drag and drop files instead of typing commands. [graphical / command-line / rigid]',
    correctAnswer: 'graphical',
  ),
  PracticeQuestion2(
    questionText: 'Before launching the final version, the developers conducted extensive ______________ to identify potential issues. [formatting / testing / typing]',
    correctAnswer: 'testing',
  ),
  PracticeQuestion2(
    questionText: 'The database was ______________ to allow quick searches even with millions of records. [optimized / ignored / printed]',
    correctAnswer: 'optimized',
  ),
  PracticeQuestion2(
    questionText: 'To protect sensitive data, the files were ______________ using a secure algorithm. [deleted / uploaded / encrypted]',
    correctAnswer: 'encrypted',
  ),
  ],

  instructionsText: """
Now, let’s watch the video lesson below. You’ll learn how context helps shape meaning and how to identify clues in a sentence to understand unknown words. While watching the video try to take notes on the types of context clues (definition, synonym, antonym, example, inference), how to guess meaning without using a dictionary and the examples from computing-related texts and documentation. 
""",

  instructionVideoId: "8laYlyAFd0o",

  summary: """
In this lesson, you’ve been introduced to context-based vocabulary development—a skill that allows you to learn and use new words more naturally by analyzing their surroundings. You’ve seen how definitions, examples, synonyms, antonyms, and general logic in a sentence can provide clues about a word’s meaning. Instead of memorizing words in isolation, you now understand how to decode and retain vocabulary by observing how it functions in real-world texts. This skill is especially important in computing, where documentation, error messages, and reports are full of specialized terms. By using context to guide your understanding, you’ll build a more flexible and adaptive vocabulary that supports academic success and professional communication.""",

  inClassActivity: """
In our classroom session, we’ll take this further by analyzing technical paragraphs from real computing texts—such as user manuals, API documentation, and research abstracts. You’ll work individually to underline unfamiliar words and interpret their meanings based on context. Then, you’ll share your conclusions with a partner or the class and justify your reasoning. This hands-on analysis will help reinforce what you’ve learned and prepare you to approach future readings with confidence. Don’t worry if you’re unsure—this is your chance to practice and ask questions. Let’s build your vocabulary toolbox together!
""",

  quizQuestions: [
    QuizQuestion(
      question: 'What is the benefit of learning vocabulary through context?',
      correctTextAnswer: 'It helps understand the meaning of words based on how they are used in a sentence or situation.',
      isTextAnswer: true,
    ),
    QuizQuestion(
      question: 'Identify the context clue used in: “Cache memory, a small and fast type of memory, stores frequently used data.”',
      correctTextAnswer: 'Definition clue – the phrase "a small and fast type of memory" defines cache memory.',
      isTextAnswer: true,
    ),
    QuizQuestion(
      question: 'Choose the best word to complete: “The update was ___, meaning it would not last beyond this session.”',
      options: ['optional', 'temporary', 'consistent'],
      correctOptionIndex: 1,
      isTextAnswer: false,
    ),
    QuizQuestion(
      question: 'Write your own sentence using a technical word and include a context clue for its meaning.',
      correctTextAnswer: '', // Leave blank or allow user to input
      isTextAnswer: true,
    ),
  ],
);
