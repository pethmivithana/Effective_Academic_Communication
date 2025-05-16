import '../unit_model.dart';

final UnitModel unit9_1 = UnitModel(
  unitIndex: 38,
  unitName: "Introduction to Academic Presentations",
  introductionText: """
Hello everyone, Welcome to Unit 9.1! 
Academic presentations are a key part of university life, especially in fields like computing, where ideas, findings, and technical processes must be communicated clearly. Whether you're explaining a coding project, presenting a case study, or sharing research, an academic presentation helps your audience understand your thinking. Unlike casual speaking, academic presentations use a formal structure, planned visuals, and precise language. In this lesson, you'll dive deeper into what makes a presentation academic, explore real examples, and learn how to analyze presentation content like a pro. This lesson builds on what you learned in the previous unit and prepares you for future lessons on reducing anxiety and structuring your message. Let's take your skills one level up!
By the end of this lesson, you will be able to:
•	Identify the key components of academic presentations
•	Distinguish between academic and non-academic presentation features
•	Analyze the purpose and structure of sample academic presentations
•	Apply key phrases used in professional computing presentations.
""",

  preClassActivityDescription: """
Before we dive into the lesson, let’s see what you remember.
Look at the following pairs of presentation excerpts. Choose the more academic version of each excerpt given. 
""",
  preClassQuestions:[
    PreClassQuestion(
      questionText: 'Choose the more academic version:',
      options: [
        '“Our app is awesome because it helps people not forget stuff.”',
        '“This mobile application is designed to improve memory retention through scheduled notifications.”',
      ],
      correctOptionIndex: 1,
    ),
    PreClassQuestion(
      questionText: 'Choose the more academic version:',
      options: [
        '“We iteratively improved the user interface based on feedback to enhance usability.”',
        '“We messed around with the design until it looked cooler.”',
      ],
      correctOptionIndex: 0,
    ),
    PreClassQuestion(
      questionText: 'Choose the more academic version:',
      options: [
        '“In conclusion, we believe our solution addresses the problem effectively and has potential for future development.”',
        '“Anyway, we hope you liked our thing. That’s it!”',
      ],
      correctOptionIndex: 0,
    ),
    PreClassQuestion(
      questionText: 'Choose the more academic version:',
      options: [
        '“You’re gonna love this new feature—it’s super handy.”',
        '“This feature significantly improves user experience by streamlining navigation tasks.”',
      ],
      correctOptionIndex: 1,
    ),
    PreClassQuestion(
      questionText: 'Choose the more academic version:',
      options: [
        '“The program executed efficiently, producing results in under two seconds, which indicates strong performance.”',
        '“So, we ran the thing and got results, like, really.”',
      ],
      correctOptionIndex: 0,
    ),
  ],

  practiceActivityDescription1: """ 
Now let’s practice what you have learnt!

You’re given a short project summary. Drag and drop each sentence into the correct part of an academic presentation (There can be more than one sentence in each part):

Summary Sentences:
1.	We developed a Python-based tool to automate backup tasks.
2.	Let’s now look at how the tool was tested on different operating systems.
3.	In conclusion, the tool performed well and reduced manual effort by 85%.
4.	Our project focuses on solving a common problem in system administration: time-consuming backups.
5.	Thank you for listening. We’re happy to take your questions.
6.	We encountered several technical challenges, especially with cross-platform compatibility.
7.	To address this, we implemented modular scripts adaptable to both Linux and Windows.
8.	The evaluation metrics included speed, error handling, and user feedback.

""",
  practiceActivityQuestions1:[
    PracticeQuestion1(
      questionText: 'Which sentence numbers belong in the *Introduction* section?',
      correctAnswer: '1, 4',
      isTextAnswer: true,
    ),
    PracticeQuestion1(
      questionText: 'Which sentence numbers belong in the *Body* section?',
      correctAnswer: '2, 6, 7, 8',
      isTextAnswer: true,
    ),
    PracticeQuestion1(
      questionText: 'Which sentence numbers belong in the *Conclusion* section?',
      correctAnswer: '3, 5',
      isTextAnswer: true,
    ),
  ],
  practiceActivityDescription2: """
You’ve been given part of a casual script for a group presentation. Rewrite it to sound more academic and suitable for a university audience. Try to use formal language, structured sentences, and objective phrasing. Don’t forget to clearly state the problem, the solution, and the outcome.
""",
    practiceActivityQuestions2:[
  PracticeQuestion2(
      questionText: '''Casual Version:
So yeah, we worked on this project that kinda helps with saving files automatically. It was a bit tricky at first ‘cause the code didn’t really do what we wanted. But after playing around with it a bit, we got it working. We used some Python stuff and figured out how to make backups every 10 minutes or so. It’s actually pretty cool ‘cause now people won’t lose their files if something crashes.''',
      correctAnswer: '''(Model Answer: Our project focuses on developing an automated file backup system to prevent data loss. Initially, we encountered some technical challenges, as the program did not perform as expected. However, after refining the code and adjusting the logic, we successfully implemented a solution. Using Python, we created a script that automatically generates file backups at ten-minute intervals. This feature significantly enhances system reliability and ensures that important data is preserved even in the event of a system failure.)'''
  ),
  ],

  instructionsText: """
Watch the video lesson carefully to understand the structure and tone of academic presentations. As you watch, pay close attention to how the speaker organizes the content and uses formal language. Notice the phrases used to introduce topics, transition between points, and summarize findings. You are encouraged to take notes where you feel necessary—especially when you come across phrases or strategies you might want to use in your own presentations. These notes will help you prepare for future practice activities and real academic presentations.
""",

  instructionVideoId: "8laYlyAFd0o",

  summary: """
In this lesson, you explored what makes a presentation academic in both tone and structure. You learned that academic presentations are formal, clear, and well-organized. They include an introduction, a main body with evidence or examples, and a clear conclusion. In the world of computing, this approach is essential for sharing technical work with professors, peers, or even potential employers. You’ve also practiced using appropriate phrases and rewriting casual language to fit an academic setting. With this foundation, you're now ready to build and deliver structured presentations with confidence.
""",

  inClassActivity: """
Now that you’ve completed the lesson, it’s time to bring your speaking skills into a real-time setting. In our classroom session, you’ll do a small presentation on one of the given topics in front of your peers. Don’t worry, we’re all here to learn and improve together. Make a short presentation at home and come prepared to speak in class.
Topics:
	Artificial intelligence poses a danger to humankind.
	Responsible AI: Ethical Considerations in Artificial Intelligence
	The impact of social media on youth: Are we raising a generation addicted to screens?

If you’re unsure about what to say or how to organize your thoughts, bring your notes from this lesson to help you. Your lecturer will support you during the activity and give you feedback to help you improve. This is a great chance to practice, gain confidence, and speak in a clear and academic way. We’re excited to hear your ideas!
""",

  quizQuestions: [
    QuizQuestion(
      question: '1. What is the main purpose of an academic presentation?',
      options: [
        'a) To impress your classmates',
        'b) To clearly communicate research, ideas, or projects',
        'c) To make the audience laugh',
      ],
      correctOptionIndex: 1,
    ),
    QuizQuestion(
      question: '2. Which is not a typical part of an academic presentation?',
      options: [
        'a) Personal stories',
        'b) Structured content',
        'c) Objective language',
      ],
      correctOptionIndex: 0,
    ),
    QuizQuestion(
      question: '3. Choose the best opening line for an academic presentation:',
      options: [
        'a) “Let’s dive into some cool stuff.”',
        'b) “Today we’ll be discussing our project on AI-based fraud detection.”',
        'c) “Hey, we did something really great.”',
      ],
      correctOptionIndex: 1,
    ),
    QuizQuestion(
      question: '4. What are the 3 key parts of an academic presentation?',
      correctTextAnswer: 'Introduction, Body, Conclusion',
      isTextAnswer: true,
    ),
    QuizQuestion(
      question: '5. Why is clear and precise language important in technical presentations?',
      correctTextAnswer: 'It ensures the audience understands complex concepts accurately and avoids misinterpretation.',
      isTextAnswer: true,
    ),
    QuizQuestion(
      question: '6. Fill in the blank:\n“In conclusion, the findings suggest that our algorithm _________.”',
      options: [
        'a) was kinda okay',
        'b) might work, maybe',
        'c) improves accuracy by 22% in test conditions',
      ],
      correctOptionIndex: 2,
    ),
  ],
);
