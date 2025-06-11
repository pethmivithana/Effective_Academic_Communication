import '../unit_model.dart';

final UnitModel unit5_2 = UnitModel(
  unitIndex: 21,
  unitName: "Structuring responses",
  introductionText: """
Hello and welcome!
In this lesson, we’ll focus on how to structure your responses clearly and confidently in a viva voce examination. In a viva, it’s not just what you say, but how you say it that matters. A well-structured answer helps you show your understanding, stay calm, and impress your examiners with logical thinking.
Imagine this: you're asked a complex question about your final-year project. Do you panic—or do you take a moment, structure your response with a clear opening, a logical explanation, and a confident conclusion? That’s what this lesson will help you do.
You’ll learn simple strategies to organize your ideas, use linking phrases, and handle questions step by step. These skills are essential not only for the viva but also for tech presentations, interviews, and meetings in your professional future.
Let’s begin building your response strategy!
By the end of this lesson, you will be able to:
1.	Understand the structure of a clear and complete viva response
2.	Use linking phrases to organize and guide your speech
3.	Practice giving answers with a strong opening, explanation, and closing
4.	Apply logical response frameworks in computing-related contexts""",

  preClassActivityDescription: """
Watch this short clip. 
Describe the type of student shown.""",

  preClassActivityLocalVideo:"assets/videos/video_5.2.mp4",
  preClassActivityUploadLink:"https://courseweb.sliit.lk/mod/forum/view.php?id=375194",

  practiceActivityDescription1: """ 
Choose suitable words/phrases from the box and fill in the blanks to form a well-structured viva response.

Word Bank:
To begin with – In addition – This demonstrates – For example – Therefore – Overall – My main point is – Specifically""",

  practiceActivityQuestions1: [
    PracticeQuestion1(
      questionText: "__________, my project focuses on user-friendly design and automation.",
      correctAnswer: "To begin with",
      isTextAnswer: true,
    ),
    PracticeQuestion1(
      questionText: "__________, it allows users to track inventory in real-time.",
      correctAnswer: "In addition",
      isTextAnswer: true,
    ),
    PracticeQuestion1(
      questionText: "__________, I used Firebase for the backend and implemented dynamic UI with React.",
      correctAnswer: "For example",
      isTextAnswer: true,
    ),
    PracticeQuestion1(
      questionText: "__________, the system updates stock levels instantly after each transaction.",
      correctAnswer: "Specifically",
      isTextAnswer: true,
    ),
    PracticeQuestion1(
      questionText: "__________, the software enhances both accuracy and user experience.",
      correctAnswer: "Overall",
      isTextAnswer: true,
    ),
  ],

  practiceActivityDescription2: """
Record your response to the following viva-style question:
Can you describe the challenges you faced during the development process of your imaginary project?

Follow the ISE structure:
•	Introduce the main challenge
•	Support with examples or tools you used
•	End with how you overcame it or what you learned

Submit your final voice recording link here.""",

  practiceActivityLink2: "https://www.speakpipe.com/voice-recorder",
  practiceUploadLink2: "https://courseweb.sliit.lk/mod/assign/view.php?id=375195",

  instructionsText: """
Watch this mini-lesson on how to structure answers using the ISE technique:
I – Introduce your main idea
S – Support with explanation or example
E – End with a short summary or conclusion""",

  instructionVideoId: "https://lecturecapture.sliit.lk/eplayer.php?id=ZTM0cVB0SnlTRF82NzgzMg==",

  summary: """
Excellent work! In this lesson, you’ve taken a deep dive into how to structure your answers effectively for a viva. You learned the value of organizing your thoughts using the ISE method—Introduce, Support, and End. Whether you're answering a technical question about your project or explaining your reasoning to an examiner, a structured response helps you stay focused and sound professional.
We explored useful linking phrases, practiced turning rough answers into strong, polished ones, and applied these techniques in computing-related scenarios. The ability to give organized, thoughtful answers is a key skill that will help you not just in exams, but also in team meetings, job interviews, and client presentations.
Keep practicing, and soon, structuring your responses will become second nature!""",

  inClassActivity: """
Now that you’ve completed the lesson, it’s time to bring your speaking skills into a real-time setting. 

In our classroom session, you’ll participate in a mini viva simulation. 

You’ll be given a common computing-related question and will practice giving a structured response in front of your peers. 

Don’t worry—we’re all here to learn and improve together.

If you feel unsure about what to say or how to organize your thoughts, bring your notes! Your lecturer will guide you and give you personalized feedback. 

This is your chance to gain confidence and polish your response strategy in a supportive environment.

Looking forward to hearing your ideas—structured and strong!""",

  quizQuestions: [
    QuizQuestion(
      question: "Which is the correct way to start a structured response?",
      options: [
        "Umm... so yeah...",
        "Maybe it’s about...",
        "To begin with...",
        "I think I did something like..."
      ],
      correctOptionIndex: 2,
      isTextAnswer: false,
    ),
    QuizQuestion(
      question: "What does the ISE structure stand for?",
      options: [
        "Introduce – Support – Example",
        "Introduce – Support – End",
        "Idea – Speak – Exit",
        "Initial – Statement – Explanation"
      ],
      correctOptionIndex: 0,
      isTextAnswer: false,
    ),
    QuizQuestion(
      question: "Choose the most appropriate closing phrase:",
      options: [
        "I guess that’s all.",
        "So yeah, that’s the thing.",
        "That’s it, maybe?",
        "Therefore, the method is efficient."
      ],
      correctOptionIndex: 3,
      isTextAnswer: false,
    ),
    QuizQuestion(
      question: "Rewrite this response using the ISE structure:\n\"I used Python, and it was difficult. But I did it.\"",
      correctTextAnswer: "I used Python for my project. It was quite challenging because I hadn’t worked with some of the libraries before. For example, I had trouble with API integration at first, but I eventually solved it.",
      isTextAnswer: true,
    ),
    QuizQuestion(
      question: "Explain why a structured response is useful in a viva. Provide one benefit.",
      correctTextAnswer: "A structured response helps convey ideas clearly and confidently, making it easier for examiners to follow and evaluate your understanding.",
      isTextAnswer: true,
    ),
  ],
);
