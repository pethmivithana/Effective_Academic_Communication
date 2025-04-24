import '../unit_model.dart';

final UnitModel unit6_3 = UnitModel(
  unitIndex: 26,
  unitName: "Summarizing Key Points in Discussions",
  introductionText: """
Dear Students,
Welcome to lesson 6.3! Today, we’ll focus on summarizing key points in discussions—an important skill in both academic and professional environments. By the end of this lesson, you'll be able to capture essential ideas and communicate them clearly and concisely.
Before we start the lesson, please take a moment to review the lesson objectives so you know what you should be able to do by the end of today’s lesson.
Lesson Objectives
By the end of this lesson, you should be able to:
1.	Identify the main points in a discussion and distinguish them from supporting details.
2.	Use appropriate transition words and phrases to summarize spoken interactions.
3.	Apply techniques to summarize discussions effectively in academic and professional contexts.
4.	Practice summarizing a conversation or discussion in a structured way.
""",

  preClassActivityDescription: """
Start by reflecting on your summarizing skills with the following self-assessment quiz. This will help you identify areas for improvement.

Write short answers:
3. If you had to summarize a meeting in 2-3 sentences, what key aspects would you include?
4. How do you ensure that your summary is accurate and not misleading?
5. What challenges do you face when summarizing long conversations?
6. Which skills do you think are most important for summarizing well? (Choose: Listening / Note-taking / Organizing ideas / Concise wording)
""",
  preClassSurvey:[
    SurveyQuestion(
      questionText: "1.	What is the most important aspect of summarizing a discussion?",
      options: [
        " a) Repeating everything exactly as it was said",
        "b) Identifying key points and main ideas",
        "c) Giving your personal opinion",
        "d) Making the summary as short as possible",

      ],
      allowsMultipleAnswers: false,
    ),
    SurveyQuestion(
      questionText: "2.	When summarizing a discussion, what should you avoid?",
      options: [
        "a) Using your own words",
        "b) Including examples and unnecessary details",
        "c) Organizing ideas clearly",
        "d) Highlighting the speaker’s main arguments",
      ],
      allowsMultipleAnswers: false,
    ),
  ],

  preClassActivityUploadLink:"",

  practiceActivityDescription1: """ 
  
Step 1: Listen to the short video on artificial intelligence by Prof. Mike Wooldridge and summarize the key points. Focus on condensing the ideas into a few sentences.

Step 2: Upload the summary document to the portal for review.
""",
  practiceActivityVideo:"https://www.youtube.com/watch?v=D2JY38VShxI&t=68s ",
  practiceUploadLink:"",

  practiceActivityDescription2: """
Watch this video for additional strategies to improve your summarizing skills. 
""",
  practiceVideoUrl:"https://www.youtube.com/watch?v=Z1vqOFTvQkk",

  instructionsText: """
Listen to the recorded lecture on effective techniques for summarizing discussions. Take notes on the key strategies such as identifying main points, using transition phrases, and structuring your summary.
""",

  instructionVideoId: "8laYlyAFd0o",

  summary: """
In this lesson, we focused on effective techniques for summarizing key points in discussions. You learned to identify the main points, use transition phrases, and structure your summaries to communicate ideas concisely. We also practiced identifying essential information in discussions and applied techniques such as active listening and paraphrasing. These strategies are essential in both academic and professional settings for clear and effective communication.
""",

  inClassActivity: """
Be ready to actively participate and apply the strategies we’ve learned!
""",

  quizQuestions: [
    QuizQuestion(
      question: 'Summarizing key points in a discussion helps to:',
      options: [
        'Add unnecessary details',
        'Focus on the main ideas',
        'Make the conversation longer',
        'Ignore minor points',
      ],
      correctOptionIndex: 1,
    ),
    QuizQuestion(
      question: 'Which of the following is NOT an effective way to summarize a discussion?',
      options: [
        'Rephrasing main ideas',
        'Repeating every word',
        'Using transition phrases like “In conclusion” or “To summarize”',
        'Focusing on the speaker’s main arguments',
      ],
      correctOptionIndex: 1,
    ),
    QuizQuestion(
      question: 'To ensure accuracy in your summary, you should:',
      options: [
        'Skip irrelevant points',
        'Only summarize the parts you agree with',
        'Include personal opinions',
        'Stay objective and cover all key ideas',
      ],
      correctOptionIndex: 3,
    ),
    QuizQuestion(
      question: 'A good summary should be:',
      options: [
        'A detailed, lengthy account of the entire conversation',
        'Concise and highlight only the main points',
        'Focused only on the speaker’s introduction',
        'Just a list of bullet points',
      ],
      correctOptionIndex: 1,
    ),
    QuizQuestion(
      question: 'When summarizing, you should avoid:',
      options: [
        'Including all the minor details',
        'Using transition words',
        'Focusing on the speaker’s conclusions',
        'Making your summary too short',
      ],
      correctOptionIndex: 0,
    ),
  ],
);
