import '../unit_model.dart';

final UnitModel unit7_1 = UnitModel(
  unitIndex: 29,
  unitName: "Changing Word Forms",
  introductionText: """
Hello everyone, welcome to lesson 7.1!
In this unit, we’ll explore the skill of changing word forms—a powerful tool for improving your academic writing and communication. In English, many words can take on different forms depending on how they are used in a sentence. For example, the verb "optimize" becomes the noun "optimization", and the adjective "efficient" becomes the adverb "efficiently". Understanding how to correctly form and use nouns, verbs, adjectives, and adverbs helps you write with greater accuracy and flexibility, especially in academic and technical contexts.
As computing students, you often need to describe processes, explain functions, or evaluate results. These tasks require you to shift between word forms to match the sentence structure and tone. By learning to identify and apply the correct form of a word, you’ll strengthen your grammar, expand your vocabulary, and express your ideas more clearly.

By the end of this lesson, you will be able to:
•	Identify different forms of a base word (noun, verb, adjective, adverb).
•	Choose the appropriate word form based on the sentence structure.
•	Apply word transformation rules in writing and speaking.
•	Recognize how word forms function in technical writing.
""",

  preClassActivityDescription: """
Below are a few words commonly used in computing. Can you identify and list their nouns, adjective, and adverb forms (if they exist)? 
""",
  preClassQuestions:[
    PreClassQuestion(
      questionText: 'Provide the Noun, Adjective, and Adverb forms of the verb: Analyze',
      correctAnswer: 'Noun: Analysis, Adjective: Analytical, Adverb: Analytically',
      isTextAnswer: true,
    ),
    PreClassQuestion(
      questionText: 'Provide the Noun, Adjective, and Adverb forms of the verb: Develop',
      correctAnswer: 'Noun: Development, Adjective: Developmental, Adverb: Developmentally',
      isTextAnswer: true,
    ),
    PreClassQuestion(
      questionText: 'Provide the Noun, Adjective, and Adverb forms of the verb: Secure',
      correctAnswer: 'Noun: Security, Adjective: Secure, Adverb: Securely',
      isTextAnswer: true,
    ),
    PreClassQuestion(
      questionText: 'Provide the Noun, Adjective, and Adverb forms of the verb: Connect',
      correctAnswer: 'Noun: Connection, Adjective: Connected/Connective, Adverb: Connectively',
      isTextAnswer: true,
    ),
    PreClassQuestion(
      questionText: 'Provide the Noun, Adjective, and Adverb forms of the verb: Optimize',
      correctAnswer: 'Noun: Optimization, Adjective: Optimal, Adverb: Optimally',
      isTextAnswer: true,
    ),
  ],

  practiceActivityDescription1: """ 
Read each sentence and tap the base word to transform it into the correct form to complete the sentence.
""",
  practiceActivityQuestions1:[
    PracticeQuestion1(
      questionText: 'The system’s ______________ (reliable) ensured stable performance across platforms.',
      correctAnswer: 'reliability',
    ),
    PracticeQuestion1(
      questionText: 'The engineer had to ______________ (analysis) the logs before debugging.',
      correctAnswer: 'analyze',
    ),
    PracticeQuestion1(
      questionText: 'We aim to improve the app’s ______________ (secure) using two-factor authentication.',
      correctAnswer: 'security',
    ),
    PracticeQuestion1(
      questionText: 'Our code now runs more ______________ (efficient), reducing the response time.',
      correctAnswer: 'efficiently',
    ),
    PracticeQuestion1(
      questionText: 'This design is highly ______________ (adapt), allowing changes based on user feedback.',
      correctAnswer: 'adaptable',
    ),
  ],

  practiceActivityDescription2: """
You’re going to explain a basic computing task using three different word forms from a single root. 
Follow the steps given:
	Go to the given site.
	Choose ONE base word (e.g., develop, analyze, optimize, connect).
	Record a 30–45 second explanation of a computing task (like developing a mobile app or analyzing data).
	Make sure your response includes at least three different forms of your chosen word (e.g., development, developed, developer).
	Submit your final audio link here!
Example Prompt:
Describe how your team developed a software project. Use words like ‘develop’, ‘developer’, and ‘development’ in your answer.

""",
  practiceActivityLink2:"https://www.speakpipe.com/voice-recorder ",
  practiceUploadLink2:"",

  instructionsText: """
Now, let’s watch the video lesson below. You’ll learn how to recognize and change word forms. These transformations are common in academic and technical communication, especially in the field of computing. Try to note examples where different word forms are used in real-world tech contexts like documentation, reports, or instructions. 
""",

  instructionVideoId: "8laYlyAFd0o",

  summary: """
In this lesson, you explored how to change word forms to match academic and technical language needs. You learned how one base word can transform into different grammatical forms depending on its role in a sentence. By identifying the appropriate suffixes and understanding usage patterns, you now have greater control over how you write and speak—essential for clarity in documentation, presentations, and discussions. For example, knowing when to use "analyze" vs. "analysis" or "develop" vs. "development" allows you to communicate ideas precisely. These transformation skills are especially valuable in computing, where concise and correct language improves collaboration and professionalism. Going forward, you’ll be able to spot, build, and use different word forms with greater confidence and fluency.
""",

  inClassActivity: """
During our in-class session, we’ll dive into computing-related reading materials like system design briefs, research abstracts, or user manuals. You’ll work individually to highlight different word forms and then rewrite selected sections using alternative forms (e.g., changing a sentence from a noun-based to a verb-based structure). We’ll also play a mini "Word Morph" game where students race to transform as many base words as possible within 2 minutes. Bring any tricky words you’ve come across—we’ll discuss them as a group. 
""",

  quizQuestions: [
    QuizQuestion(
      question: 'What suffix is often used to form a noun from a verb?',
      options: ['-ly', '-tion', '-able', '-ous'],
      correctOptionIndex: 1,
    ),
    QuizQuestion(
      question: 'Rewrite the sentence using the correct form:\n"The team collaboration was very product."',
      correctTextAnswer: 'The team collaboration was very productive',
      isTextAnswer: true,
    ),
    QuizQuestion(
      question: 'Choose the correct form:\n"We aim to __________ the code to support new features."',
      options: ['optimize', 'optimization', 'optimized', 'optimizing'],
      correctOptionIndex: 0,
    ),
    QuizQuestion(
      question: 'Fill in:\n"The user interface was appreciated for its ______________ (intuitive) design."',
      correctTextAnswer: 'intuitive',
      isTextAnswer: true,
    ),
    QuizQuestion(
      question: 'Which of the following sentences uses the correct form of the word “secure”?',
      options: [
        'The system needs to be security.',
        'We are working to secure the database.',
        'The secure of the system is low.',
        'He runs secure.',
      ],
      correctOptionIndex: 1,
    ),
    QuizQuestion(
      question: 'Rewrite this sentence using a different form of the word in brackets:\nThe software is very (optimize).',
      correctTextAnswer: 'The software is very optimized',
      isTextAnswer: true,
    ),
  ],
);
