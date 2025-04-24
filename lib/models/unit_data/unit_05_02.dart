import '../unit_model.dart';

final UnitModel unit5_2 = UnitModel(
  unitIndex: 21,
  unitName: "Structuring responses",
  introductionText: """
Hello and welcome!
In this lesson, we’ll explore what a viva voce is and how to prepare for it with confidence and clarity. A viva voce—often simply called a viva—is an oral examination where you present and defend your academic work, such as your final year project or research report. For computing undergraduates, this means explaining your code, decisions, methods, and even the bugs you fixed!
Unlike written exams, a viva requires you to think on your feet, express ideas fluently, and engage in a professional discussion. It’s not just about knowing your subject—it’s about communicating it effectively. You’ll be assessed on your technical understanding, clarity of explanation, and your ability to respond thoughtfully to questions. In this lesson, we’ll break down the purpose of a viva, typical structures, and common question types so you’ll know exactly what to expect—and how to shine!
By the end of this lesson, you will be able to:
•	Understand the purpose and format of a viva voce
•	Identify common types of viva questions and how to respond
•	Practice introducing your project and defending key decisions
•	Build confidence using academic and technical vocabulary in speech
""",

  preClassActivityDescription: """
Watch this short clip. 
Describe the type of student shown. 
""",
  preClassActivityLocalVideo:"assets/videos/video_5.2.mp4",
  preClassActivityUploadLink:"",

  practiceActivityDescription1: """ 
Choose suitable words/phrases from the box and fill in the blanks to form a well-structured viva response.

Word Bank:
To begin with – In addition – This demonstrates – For example – Therefore – Overall – My main point is – Specifically
""",
  practiceActivityQuestions1: [
    PracticeQuestion1(
      questionText: "___________, this algorithm provides faster processing time for large datasets compared to traditional methods.",
      correctAnswer: "From a technical perspective",
    ),
    PracticeQuestion1(
      questionText: "___________, it uses less memory.",
      correctAnswer: "Furthermore",
    ),
    PracticeQuestion1(
      questionText: "___________, the alternative approach has its strengths.",
      correctAnswer: "In my opinion",
    ),
    PracticeQuestion1(
      questionText: "___________, I believe my method suits the project's requirements better.",
      correctAnswer: "However",
    ),
    PracticeQuestion1(
      questionText: "___________, in the second step, the program filters the data based on the user’s input before analysis.",
      correctAnswer: "To clarify",
    ),
    PracticeQuestion1(
      questionText: "___________. We could explore integrating AI-based optimization to enhance performance.",
      correctAnswer: "That’s a valid question",
    ),
    PracticeQuestion1(
      questionText: "___________, the system would be more adaptive and scalable.",
      correctAnswer: "As a result",
    ),
  ],

  practiceActivityDescription2: """
Follow the instructions given.

- Go to the given website
- Record a 30-second response to this question: Why is clear communication important in a viva?
- Use at least two academic phrases from the lesson video.
- Check the speech-to-text output to see if it reflects your intended message.
- Submit your final audio with clear pronunciation and tone.
""",
  practiceActivityLink2: "https://www.speakpipe.com/voice-recorder",
  practiceUploadLink2: "https://example.com/upload-practice-activity",

  instructionsText: """
Watch this mini-lesson on how to structure answers using the ISE technique:
I – Introduce your main idea
S – Support with explanation or example
E – End with a short summary or conclusion
""",

  instructionVideoId: "8laYlyAFd0o",

  summary: """
Excellent work! In this lesson, you’ve taken a deep dive into how to structure your answers effectively for a viva. You learned the value of organizing your thoughts using the ISE method—Introduce, Support, and End. Whether you're answering a technical question about your project or explaining your reasoning to an examiner, a structured response helps you stay focused and sound professional.
We explored useful linking phrases, practiced turning rough answers into strong, polished ones, and applied these techniques in computing-related scenarios. The ability to give organized, thoughtful answers is a key skill that will help you not just in exams, but also in team meetings, job interviews, and client presentations.
Keep practicing, and soon, structuring your responses will become second nature!
""",

  inClassActivity: """
Now that you’ve completed the lesson, it’s time to bring your speaking skills into a real-time setting. In our classroom session, you’ll participate in a mini viva simulation. You’ll be given a common computing-related question and will practice giving a structured response in front of your peers. Don’t worry—we’re all here to learn and improve together.
If you feel unsure about what to say or how to organize your thoughts, bring your notes! Your lecturer will guide you and give you personalized feedback. This is your chance to gain confidence and polish your response strategy in a supportive environment.
Looking forward to hearing your ideas—structured and strong!
""",

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
