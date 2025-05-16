import '../unit_model.dart';

final UnitModel unit12_2 = UnitModel(
  unitIndex: 50,
  unitName: "Peer Feedback & Group Discussion",
  introductionText: """
Hello everyone, and welcome to the final lesson of our course! 
You’ve made it all the way through, and today we’re wrapping things up with one last, powerful topic: Peer Feedback & Group Discussion.
So far, you’ve explored self-assessment and personal reflection—but developing strong communication also means learning from others. In this lesson, we’ll focus on how to give and receive constructive peer feedback and how to participate meaningfully in group discussions. These skills will not only boost your confidence but also prepare you for future academic and professional conversations.
Let’s make this final lesson count!
Lesson Objectives
By the end of this lesson, students will be able to:
1.	Understand the importance of peer feedback in improving communication.
2.	Give constructive feedback in a clear, respectful, and supportive way.
3.	Participate actively in group discussions, both as speakers and listeners.
""",

  preClassActivityDescription: """
Today as the end-of-lesson quiz, we are inviting you to fill out a survey. This survey is to find out how helpful this course was for you. Your honest responses will help us do this better for future learners. 
Course effectiveness survey
Thank you for completing this course! We would greatly appreciate your feedback to help improve the learning experience for future students. Your input is invaluable. Please take a moment to fill out this survey.
""",

  preClassSurvey:[
    // 1. Attractiveness and Usability of the App
    SurveyQuestion(
      description: """
1. Attractiveness and Usability of the App
Please rate the following aspects of the app on a scale of 1 to 5 (1 being strongly disagree and 5 being strongly agree).
      """,
      questionText: "The design and layout of the app were visually appealing.",
      options: ["1 (strongly disagree)", "2", "3", "4", "5 (strongly agree)"],
    ),
    SurveyQuestion(
      questionText: "The app was easy to navigate and user-friendly.",
      options: ["1 (strongly disagree)", "2", "3", "4", "5 (strongly agree)"],
    ),
    SurveyQuestion(
      questionText: "The app was responsive and free of technical issues (e.g., crashes, slow load times).",
      options: ["1 (strongly disagree)", "2", "3", "4", "5 (strongly agree)"],
    ),
    SurveyQuestion(
      questionText: "The app provided an effective platform for accessing course materials and activities.",
      options: ["1 (strongly disagree)", "2", "3", "4", "5 (strongly agree)"],
    ),
    SurveyQuestion(
      questionText: "Notifications and reminders in the app were helpful in keeping me on track with the course.",
      options: ["1 (strongly disagree)", "2", "3", "4", "5 (strongly agree)"],
    ),

    // 2. Course Content
    SurveyQuestion(
      description: """
2. Course Content
Please rate the following aspects of the course content:
      """,
      questionText: "The course content was relevant to my academic and professional goals.",
      options: ["1 (strongly disagree)", "2", "3", "4", "5 (strongly agree)"],
    ),
    SurveyQuestion(
      questionText: "The topics covered in the course were engaging and interesting.",
      options: ["1 (strongly disagree)", "2", "3", "4", "5 (strongly agree)"],
    ),
    SurveyQuestion(
      questionText: "The course materials (texts, videos, assignments, etc.) were clear and easy to understand.",
      options: ["1 (strongly disagree)", "2", "3", "4", "5 (strongly agree)"],
    ),
    SurveyQuestion(
      questionText: "The course objectives were clear and well communicated at the beginning.",
      options: ["1 (strongly disagree)", "2", "3", "4", "5 (strongly agree)"],
    ),
    SurveyQuestion(
      questionText: "The course helped improve my academic communication skills (both written and spoken).",
      options: ["1 (strongly disagree)", "2", "3", "4", "5 (strongly agree)"],
    ),

    // 3. Lectures and Presentations
    SurveyQuestion(
      description: """
3. Lectures and Presentations
Please rate the following aspects of the lectures and presentations:
      """,
      questionText: "The recorded lectures were engaging and kept my interest.",
      options: ["1 (strongly disagree)", "2", "3", "4", "5 (strongly agree)"],
    ),
    SurveyQuestion(
      questionText: "The content in the lectures was well-structured and easy to follow.",
      options: ["1 (strongly disagree)", "2", "3", "4", "5 (strongly agree)"],
    ),
    SurveyQuestion(
      questionText: "The instructor explained concepts clearly during the lectures.",
      options: ["1 (strongly disagree)", "2", "3", "4", "5 (strongly agree)"],
    ),
    SurveyQuestion(
      questionText: "The length of the lectures was appropriate (not too long or short).",
      options: ["1 (strongly disagree)", "2", "3", "4", "5 (strongly agree)"],
    ),
    SurveyQuestion(
      questionText: "The use of visuals and multimedia (e.g., slides, images, videos) in the lectures enhanced my learning.",
      options: ["1 (strongly disagree)", "2", "3", "4", "5 (strongly agree)"],
    ),

    // 4. Lessons and Activities
    SurveyQuestion(
      description: """
4. Lessons and Activities
Please rate the following aspects of the lessons and activities:
      """,
      questionText: "The lessons were interactive and encouraged active learning.",
      options: ["1 (strongly disagree)", "2", "3", "4", "5 (strongly agree)"],
    ),
    SurveyQuestion(
      questionText: "The activities provided a good opportunity to practice the skills I was learning.",
      options: ["1 (strongly disagree)", "2", "3", "4", "5 (strongly agree)"],
    ),
    SurveyQuestion(
      questionText: "The lessons were paced well and allowed me to absorb the material effectively.",
      options: ["1 (strongly disagree)", "2", "3", "4", "5 (strongly agree)"],
    ),
    SurveyQuestion(
      questionText: "The assignments and quizzes were helpful in reinforcing my understanding of the material.",
      options: ["1 (strongly disagree)", "2", "3", "4", "5 (strongly agree)"],
    ),
    SurveyQuestion(
      questionText: "The feedback I received on activities and assignments helped me improve my skills.",
      options: ["1 (strongly disagree)", "2", "3", "4", "5 (strongly agree)"],
    ),

    // 5. Overall Course Experience
    SurveyQuestion(
      description: """
5. Overall Course Experience
Please rate your overall experience with the course:
      """,
      questionText: "I feel that I have gained valuable skills that I can apply in my academic and professional life.",
      options: ["1 (strongly disagree)", "2", "3", "4", "5 (strongly agree)"],
    ),
    SurveyQuestion(
      questionText: "The course met my expectations in terms of content and delivery.",
      options: ["1 (strongly disagree)", "2", "3", "4", "5 (strongly agree)"],
    ),
    SurveyQuestion(
      questionText: "The course was engaging and held my interest throughout.",
      options: ["1 (strongly disagree)", "2", "3", "4", "5 (strongly agree)"],
    ),
    SurveyQuestion(
      questionText: "I would recommend this course to others who are interested in improving their academic communication skills.",
      options: ["1 (strongly disagree)", "2", "3", "4", "5 (strongly agree)"],
    ),

    // 6. Suggestions for Improvement (Open-ended)
    SurveyQuestion(
      questionText: "What did you like the most about this course?",
      description: """
6. Suggestions for Improvement
Please provide any suggestions or comments to help improve the course:
      """,
      isTextAnswer: true,
    ),
    SurveyQuestion(
      questionText: "What areas do you think could be improved?",
      description: "• What did you like the most about this course?\n• What areas do you think could be improved?\n• Do you have any suggestions for new topics or activities that could be included?",
      isTextAnswer: true,
    ),
    SurveyQuestion(
      questionText: "Do you have any suggestions for new topics or activities that could be included?",
      description: "• What did you like the most about this course?\n• What areas do you think could be improved?\n• Do you have any suggestions for new topics or activities that could be included?",
      isTextAnswer: true,
    ),


    // 7. Final Thoughts
    SurveyQuestion(
      description: """
7. Final Thoughts
Please rate your overall satisfaction with the course:
      """,
      questionText: "How satisfied are you with your learning experience overall?",
      options: ["1 (strongly disagree)", "2", "3", "4", "5 (strongly agree)"],
    ),
    SurveyQuestion(
      questionText: "Would you consider enrolling in another course like this in the future?",
      options: ["1 (strongly disagree)", "2", "3", "4", "5 (strongly agree)"],
    ),
  ],

  practiceActivityDescription1: """ 
Take a few moments to reflect on your own experiences with giving and receiving feedback. Then, answer the following prompts:
•	How did you feel the last time you received feedback? Was it helpful?
•	When you give feedback, what’s your usual approach?
•	How can peer feedback help you develop yourself? 

Share your thoughts in the discussion forum. 
""",

  practiceUploadLink:"https://example.com/upload-practice-activity",


  practiceActivityDescription2: """
Tips to Keep Improving

As we close this course, here are a few lasting tips to keep sharpening your English skills:
1.	Practice regularly – Try to include English in your daily routine.
2.	Engage with others – Join discussions or online communities in English.
3.	Use technology – Apps and learning platforms can support you.
4.	Read widely – Explore books, articles, and blogs in English.
5.	Write often – Journals, essays, or even social media posts are great ways to practice.

Language learning is a journey—stay curious and consistent!
""",

  instructionsText: """
Please watch the recorded video on Peer Feedback & Group Discussion. The video will guide you through:
•	How to give helpful and respectful feedback
•	How to receive feedback without becoming defensive
•	How to participate effectively in group conversations, including listening skills, turn-taking, and responding to others’ ideas
""",

  instructionVideoId: "8laYlyAFd0o",

  summary: """
In this final lesson, you explored how peer feedback and group discussion support your development as a confident academic communicator. Giving and receiving feedback allows for growth, and discussions build collaboration and critical thinking. These skills will remain useful in any setting where communication matters.
Good luck everyone!
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
