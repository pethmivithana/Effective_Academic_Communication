import '../unit_model.dart';

final UnitModel unit12_1 = UnitModel(
  unitIndex: 49,
  unitName: "Self-Assessment & Reflection",
  introductionText: """
Hello everyone!
Welcome to our first lesson in Unit 12. Today, we’re diving into something incredibly important—Self-Assessment & Reflection. It might sound like a big idea, but at its core, it's just about taking a moment to pause and think:
•	How am I doing as a communicator?
•	What am I already doing well?
•	What could I do better?
Have you ever finished a presentation or a discussion and thought, “That went well, but I could’ve improved that one part”? That’s exactly what we’re going to focus on—recognizing strengths, identifying areas for growth, and setting meaningful personal goals to develop your academic communication skills.
Let’s start!
Lesson Objectives
By the end of this lesson, you will be able to:
1.	Understand the importance of self-assessment in improving academic communication.
2.	Reflect on your strengths and areas for improvement in communication.
3.	Use self-reflection to set personal goals for continuous growth.
""",

  preClassActivityDescription: """
Instructions:
Before we begin the lesson, take a few minutes to reflect on your academic communication skills. Think about your speaking and writing abilities in previous assignments, presentations, and discussions. Once you have reflected, answer the following questions:
""",

  preClassSurvey:[
    SurveyQuestion(
      questionText: "I can express my ideas clearly in presentations.",
      options: ["1 (Never)", "2", "3", "4", "5 (Always)"],
    ),
    SurveyQuestion(
      questionText: "I feel confident speaking in front of an audience.",
      options: ["1 (Never)", "2", "3", "4", "5 (Always)"],
    ),
    SurveyQuestion(
      questionText: "I can give constructive feedback to peers.",
      options: ["1 (Never)", "2", "3", "4", "5 (Always)"],
    ),
    SurveyQuestion(
      questionText: "I actively listen when others are speaking.",
      options: ["1 (Never)", "2", "3", "4", "5 (Always)"],
    ),
    SurveyQuestion(
      questionText: "I stay calm and composed during oral exams or presentations.",
      options: ["1 (Never)", "2", "3", "4", "5 (Always)"],
    ),
  ],

  practiceActivityDescription1: """ 
Step 1: Reflect on one area of communication that you'd like to improve. (e.g., Clarity, confidence, reducing filler words, managing nerves, etc.)

Step 2: Set a SMART goal to improve that area.

For example:
“I will reduce the use of filler words in my presentations by practicing a 5-minute speech every day for the next week.” If you don’t have an idea about setting SMART goals, please watch the video below. 

Step 3: Share your reflection and SMART goal in the class discussion forum.
""",

  practiceActivityVideo:"https://www.youtube.com/watch?v=1-SvuFIQjK8",

  practiceUploadLink:"https://courseweb.sliit.lk/mod/forum/view.php?id=375242",


  practiceActivityDescription2: """
Watch this short video on smart goals which will help you to plan out your academic journey. 
""",

  practiceVideoUrl:"https://www.youtube.com/watch?v=SVBOjp2uxZE",

  instructionsText: """
Watch the video lesson where we discuss the power of reflection and how it can be a game-changer in your academic journey. We’ll break down how to identify patterns in your performance and how those insights can fuel progress.
""",

  instructionVideoId: "https://lecturecapture.sliit.lk/eplayer.php?id=SHdHNUdldVFiRF82NzcyOA==",

  summary: """
Self-assessment and reflection are essential tools for personal and academic growth. By identifying your strengths and weaknesses in communication, you gain clarity on how to move forward. Setting SMART goals gives your progress direction and purpose, making you more confident and effective in your academic journey.""",

  inClassActivity: """
Looking forward to seeing you in our next live session! We’ll be engaging in some fun, reflective, and interactive tasks that will help you put your SMART goals into action. Can’t wait to hear about your reflections and the goals you’ve set!
""",

  quizQuestions: [
    QuizQuestion(
      question: "True/False: Self-assessment helps you identify areas for improvement in your communication skills.",
      options: ["True", "False"],
      correctOptionIndex: 0,
    ),
    QuizQuestion(
      question: "What does a SMART goal stand for?",
      options: [
        "a) Specific, Measurable, Achievable, Realistic, Time-bound",
        "b) Simple, Measurable, Achievable, Realistic, Timely",
        "c) Specific, Measurable, Achievable, Relevant, Time-bound"
      ],
      correctOptionIndex: 2,
    ),
    QuizQuestion(
      question: "Describe one area of communication skills that you’d like to improve and explain why it is important.",
      isTextAnswer: true,
      correctTextAnswer: "Open-ended response based on learner reflection",
    ),
  ],
);
