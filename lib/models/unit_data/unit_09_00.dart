import '../unit_model.dart';

final UnitModel unit9_0 = UnitModel(
  unitIndex: 37,
  unitName: "Making Academic Presentations",
  introductionText: """
Welcome back! 
Did you know? Academic presentations are more than just talking in front of a screen—they’re a powerful way to share your ideas, research, or solutions with an audience? 
In computing, you might present a project, explain how an algorithm works, or pitch a new app design. This lesson introduces the basics of academic presentations: what they are, why they matter, and how they’re different from casual speaking. You’ll explore how to engage your audience, use clear language, and present your content with confidence. Whether you’re new to public speaking or just want to level up your skills, this is the perfect place to begin. This unit lays the groundwork for upcoming lessons where we’ll dive deeper into effective presentation structure, strategies to manage nervousness, and how to make your delivery stand out. Let’s start your presentation journey here.
By the end of this lesson, you will be able to:
•	Understand the purpose and key features of academic presentations.
•	Identify the differences between casual and academic speaking.
•	Recognize the expectations of an academic audience.
•	Apply basic techniques to plan and prepare an academic presentation.
""",

  preClassActivityDescription: """
Read the following scenarios and choose whether the person is giving an academic presentation or casual talk.
""",
  preClassQuestions:[
    PreClassQuestion(
      questionText: '1. Sam is showing his final year project to lecturers and industry experts.',
      options: ['Academic Presentation', 'Casual Talk'],
      correctOptionIndex: 0,
    ),
    PreClassQuestion(
      questionText: '2. Laila is telling her friend about a new AI tool she found online.',
      options: ['Academic Presentation', 'Casual Talk'],
      correctOptionIndex: 1,
    ),
    PreClassQuestion(
      questionText: '3. A team is presenting their mobile app at a university tech fair.',
      options: ['Academic Presentation', 'Casual Talk'],
      correctOptionIndex: 0,
    ),
    PreClassQuestion(
      questionText: '4. Nina is explaining her research results during a group video call with her professor.',
      options: ['Academic Presentation', 'Casual Talk'],
      correctOptionIndex: 0,
    ),
    PreClassQuestion(
      questionText: '5. Raj is describing what he has learnt at school to his brother.',
      options: ['Academic Presentation', 'Casual Talk'],
      correctOptionIndex: 1,
    ),
  ],

  practiceActivityDescription1: """ 
Match the casual statements to their improved academic versions.

A)	This feature provides a user-friendly experience with streamlined functionality.
B)	Ultimately, the problem was resolved after thorough testing and adjustments. 
C)	This method demonstrates efficiency in data processing.
D)	In conclusion, we’ve demonstrated a working solution that meets our objectives. 
E)	Our team developed a mobile application designed to...
F)	After encountering a bug, we resolved it by refactoring the function.
G)	We encountered unexpected issues during the implementation phase.
H)	This section highlights the most innovative feature of our project.


""",
  practiceActivityQuestions1:[
  PracticeQuestion1(
    questionText: '1. So, like, we kinda made this app...',
    correctAnswer: 'E',
    isTextAnswer: true,
  ),
  PracticeQuestion1(
    questionText: '2. You guys are gonna love this part.',
    correctAnswer: 'H',
    isTextAnswer: true,
  ),
  PracticeQuestion1(
    questionText: '3. Basically, the code didn’t work, and we fixed it.',
    correctAnswer: 'F',
    isTextAnswer: true,
  ),
  PracticeQuestion1(
    questionText: '4. It’s super cool.',
    correctAnswer: 'A',
    isTextAnswer: true,
  ),
  PracticeQuestion1(
    questionText: '5. We ran into some weird stuff while coding.',
    correctAnswer: 'G',
    isTextAnswer: true,
  ),
  PracticeQuestion1(
    questionText: '6. Anyway, it all worked out somehow.',
    correctAnswer: 'B',
    isTextAnswer: true,
  ),
  PracticeQuestion1(
    questionText: '7. Check this out, it’s kinda awesome.',
    correctAnswer: 'C',
    isTextAnswer: true,
  ),
  PracticeQuestion1(
    questionText: '8. Umm... yeah, that’s it, I guess.',
    correctAnswer: 'D',
    isTextAnswer: true,
  ),
  ],

  practiceActivityDescription2: """
Imagine that you are about to give a short presentation about ‘How language games help you learn English’. Follow the steps given below:
	Make your introductory speech of about 1-2 minutes. It should include:
o	Greetings
o	Introduce the topic of your presentation
o	Purpose of the presentation
o	Structure of your presentation
	Record your speech.
	Copy the link/URL of the best version of your speech and paste it here!

""",

  practiceActivityLink2:"https://www.speakpipe.com/messages",
  practiceUploadLink2:"",

  instructionsText: """
Watch the video lesson carefully to understand what academic presentations are and how they differ from everyday conversations. The video will highlight key features, tone, and structure used in effective presentations, with examples. Feel free to take down notes wherever you think something is useful or interesting, you might find helpful phrases, sentence starters, or techniques that you can use in your own presentations later on.
""",

  instructionVideoId: "8laYlyAFd0o",

  summary: """
In this lesson, you explored the essentials of making academic presentations. You learned how they differ from casual conversations, the importance of using formal and structured language, and how to set the right tone from the start. Academic presentations allow you to explain your ideas, research, or work to an audience in a clear and organized way. By understanding your purpose, audience, and message, you can create presentations that are both informative and engaging. This introduction is just the beginning—soon, you’ll discover how to structure your content effectively and handle presentation anxiety like a pro!
""",

  inClassActivity: """
Now that you’ve completed the lesson, it’s time to put your presentation skills into action. In our classroom session, you’ll take part in a quick individual speaking challenge where you’ll present a computing-related topic of your choice in just one minute—no slides needed! This is your chance to practice using academic language, proper structure, and confident delivery in a friendly, low-pressure environment.
If you’re unsure about how to start or what to include, bring your notes and use the sentence starters from the lesson. Your lecturer will be there to support you, provide helpful feedback, and highlight your strengths. The goal isn’t perfection—it’s progress. Let’s turn nervousness into confidence and ideas into impactful presentations.
We can’t wait to hear what you have to share!
""",

  quizQuestions: [
    QuizQuestion(
      question: '1. What is the main goal of an academic presentation?',
      options: [
        'a) To entertain the audience',
        'b) To share research, findings, or information clearly and formally',
        'c) To promote your product to customers',
      ],
      correctOptionIndex: 1,
    ),
    QuizQuestion(
      question: '2. Which of the following is a feature of academic speaking?',
      options: [
        'a) Informal vocabulary and slang',
        'b) Telling jokes throughout',
        'c) Structured and precise language',
      ],
      correctOptionIndex: 2,
    ),
    QuizQuestion(
      question: '3. Which is not part of an academic presentation?',
      options: [
        'a) A clear introduction',
        'b) A slide full of memes',
        'c) A summary of your findings',
      ],
      correctOptionIndex: 1,
    ),
    QuizQuestion(
      question: '4. Why is it important to avoid casual language in academic presentations?',
      isTextAnswer: true,
    ),
    QuizQuestion(
      question: '5. What would be a good way to start an academic presentation?',
      options: [
        'a) Good morning. Today we’ll be discussing our project on...',
        'b) So, like, we made a thing...',
        'c) Hey guys, listen up!',
      ],
      correctOptionIndex: 0,
    ),
    QuizQuestion(
      question: '6. Write one sentence you could use to introduce a computing project in an academic setting.',
      isTextAnswer: true,
    ),
  ],
);
