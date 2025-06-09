import '../unit_model.dart';

final UnitModel unit12_0 = UnitModel(
  unitIndex: 48,
  unitName: "Reflection and Self-Improvement in Academic Communication",
  introductionText: """
Welcome to Unit 12! In this unit, we will focus on reflection and self-improvement in your academic communication skills. Whether it’s through self-assessment, peer feedback, or group discussions, reflecting on your communication abilities and identifying areas for improvement is essential for continuous growth.
This unit includes two lessons that will guide you through the process of self-assessment, reflection, and improving your academic communication through peer feedback and group discussion.
Lesson Objectives:
By the end of this lesson, students will be able to:
1.	Reflect on their own academic communication strengths and weaknesses.
2.	Identify areas of improvement in their speaking and writing skills.
3.	Set personal goals for further improvement in academic communication.
""",

  preClassActivityDescription: """
Instructions:
Before we begin the lesson, take a few minutes to reflect on your academic communication skills. Think about your speaking and writing abilities in previous assignments, presentations, and discussions. Once you have reflected, answer the following questions:
""",

  preClassQuestions:[
    PreClassQuestion(
      questionText: "What do you believe is your strongest communication skill?",
      isTextAnswer: true,
    ),
    PreClassQuestion(
      questionText: "Which area of communication do you find most challenging? (e.g., speaking fluently, structuring arguments, using academic vocabulary, etc.)",
      isTextAnswer: true,
    ),
    PreClassQuestion(
      questionText: "How would you rate your overall academic communication skills on a scale from 1 to 10 (1 = very weak, 10 = excellent)?",
      isTextAnswer: true,
    ),
  ],

  practiceActivityDescription1: """ 
As a reflective exercise, we’d like you to write 50–100 words about your experience in this course so far. Think about what you’ve learned, any challenges you’ve faced, and how the course has helped improve your academic communication skills.

Use the following prompts to guide your reflection:
•	What has been most helpful to you?
•	Which areas do you feel you have improved in?
•	What challenges have you encountered?
•	What would you like to see more of in the course?

Submit your response in the given portal. 
""",

  practiceUploadLink:"https://courseweb.sliit.lk/mod/forum/view.php?id=375241",


  practiceActivityDescription2: """
Hello everyone, watch this video to understand “who we are” and you’ll learn how that knowledge will help you to achieve success in life. 
""",

  practiceVideoUrl:"https://www.youtube.com/watch?v=4lTbWQ8zD3w",

  instructionsText: """
Watch the short recorded lecture on the importance of self-assessment and reflection in academic communication. The lecture will provide useful tips on identifying your strengths and weaknesses and setting personal goals for improvement.
""",

  instructionVideoId: "https://lecturecapture.sliit.lk/eplayer.php?id=WmZwY1ExcXpVV182NzcyNw==",

  summary: """
In this lesson, we explored the role of self-reflection and goal-setting in enhancing academic communication. You assessed your own communication skills, identified areas of strength and improvement, and created personal action plans for growth. Self-assessment is a lifelong skill that supports academic, professional, and personal development.""",

  inClassActivity: """
I’m looking forward to seeing all of you in class for some fun and interactive activities! We’ll reflect together, discuss your responses, and engage in some hands-on communication exercises. See you soon!
""",

  quizQuestions: [
    QuizQuestion(
      question: "Which of the following strategies do you find most effective for self-improvement in academic communication?",
      options: [
        "a) Regular practice and reflection",
        "b) Seeking feedback from peers and instructors",
        "c) Watching recorded presentations of yourself",
        "d) All of the above"
      ],
      correctOptionIndex: 3,
    ),
    QuizQuestion(
      question: "Peer feedback is only useful when the person giving the feedback is an expert in the subject.",
      options: ["True", "False"],
      correctOptionIndex: 1,
    ),
    QuizQuestion(
      question: "How do you plan to continue improving your academic communication skills beyond this course?",
      isTextAnswer: true,
      correctTextAnswer: "Open-ended",
    ),
    QuizQuestion(
      question: "Which of the following is the best way to maintain self-improvement in academic communication after this course?",
      options: [
        "a) Never practicing public speaking again",
        "b) Continuously setting goals for speaking and writing skills",
        "c) Avoiding feedback to maintain confidence",
        "d) Focusing only on written communication"
      ],
      correctOptionIndex: 1,
    ),
  ],
);
