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
      questionText: "1. I can express my ideas clearly in presentations.",
      options: ["1 (Never)", "2", "3", "4", "5 (Always)"],
    ),
    SurveyQuestion(
      questionText: "2. I feel confident speaking in front of an audience.",
      options: ["1 (Never)", "2", "3", "4", "5 (Always)"],
    ),
    SurveyQuestion(
      questionText: "3. I can give constructive feedback to peers.",
      options: ["1 (Never)", "2", "3", "4", "5 (Always)"],
    ),
    SurveyQuestion(
      questionText: "4. I actively listen when others are speaking.",
      options: ["1 (Never)", "2", "3", "4", "5 (Always)"],
    ),
    SurveyQuestion(
      questionText: "5. I stay calm and composed during oral exams or presentations.",
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

  practiceUploadLink:"https://example.com/upload-practice-activity",


  practiceActivityDescription2: """
Goal: Deliver a short presentation using rapport-building strategies. 
Please follow the steps given below. 
Step 1 - Choose one topic:
o	A new AI-based product
o	A cybersecurity concept
o	The impact of social media on communication
Step 2 - Prepare and deliver a 2-minute presentation using rapport techniques.
Step 3 - Use a mirror or camera to observe your:
o	Facial expressions
o	Hand gestures
o	Voice modulation
Step 4 - Self-assess with the checklist below:
✅ Did I make eye contact?
✅ Was my tone engaging and varied?
✅ Did I connect with the audience?
✅ Did I use relevant and relatable examples?
Step 5 – Do the same presentation using zoom and download it. Now you can share it in the portal, so your lecturer can provide feedback. We encourage you to switch on your camera when you present. 

""",

  practiceUploadLink2:"https://example.com/upload-practice-activity",

  instructionsText: """
Watch the video lesson where we discuss the power of reflection and how it can be a game-changer in your academic journey. We’ll break down how to identify patterns in your performance and how those insights can fuel progress.
""",

  instructionVideoId: "8laYlyAFd0o",

  summary: """
Self-assessment and reflection are essential tools for personal and academic growth. By identifying your strengths and weaknesses in communication, you gain clarity on how to move forward. Setting SMART goals gives your progress direction and purpose, making you more confident and effective in your academic journey.
""",

  inClassActivity: """
Looking forward to seeing you in our next live session! We’ll be engaging in some fun, reflective, and interactive tasks that will help you put your SMART goals into action. Can’t wait to hear about your reflections and the goals you’ve set!
""",

  quizQuestions: [
    QuizQuestion(
      question: "1. True/False: Self-assessment helps you identify areas for improvement in your communication skills.",
      options: ["True", "False"],
      correctOptionIndex: 0,
    ),
    QuizQuestion(
      question: "2. What does a SMART goal stand for?",
      options: [
        "a) Specific, Measurable, Achievable, Realistic, Time-bound",
        "b) Simple, Measurable, Achievable, Realistic, Timely",
        "c) Specific, Measurable, Achievable, Relevant, Time-bound"
      ],
      correctOptionIndex: 2,
    ),
    QuizQuestion(
      question: "3. Describe one area of communication skills that you’d like to improve and explain why it is important.",
      isTextAnswer: true,
      correctTextAnswer: "Open-ended response based on learner reflection",
    ),
  ],
);
