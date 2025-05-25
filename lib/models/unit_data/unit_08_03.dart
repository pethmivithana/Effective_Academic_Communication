import '../unit_model.dart';

final UnitModel unit8_3 = UnitModel(
  unitIndex: 36,
  unitName: "Using Topic Sentences and Supporting Details",
  introductionText: """
Hello everyone! 
Welcome back to Unit 8: Structuring Ideas for Academic Discussions.
In our previous lesson, we learned how to build well-developed arguments using the Point-Evidence-Explanation method. Today, we shift our focus to another essential academic writing and speaking skill—using topic sentences and supporting details. Mastering this technique will help you express your ideas more clearly and effectively in both written and spoken academic contexts.
Lesson Objectives
By the end of this lesson, you will be able to:
1.	Identify topic sentences in paragraphs.
2.	Understand the role of supporting details in strengthening arguments.
3.	Write clear and well-structured paragraphs using topic sentences and supporting details.
4.	Apply this structure in academic discussions and essays.
""",

  preClassActivityDescription: """
Please watch this short video to understand what topic sentences and supporting details are, and how they improve clarity in writing. After watching, answer the quiz that follows.
""",
  preClassActivityVideo:"https://www.youtube.com/watch?v=49jRtuh4rUk",
  preClassQuestions:[
    PreClassQuestion(
      questionText: 'What is the purpose of a topic sentence in a paragraph?',
      options: [
        'a) To provide evidence and examples',
        'b) To introduce the main idea',
        'c) To summarize the paragraph',
        'd) To add a concluding thought',
      ],
      correctOptionIndex: 1,
    ),
    PreClassQuestion(
      questionText: 'Which of the following is a strong topic sentence?',
      options: [
        'a) Many people like pizza.',
        'b) Exercise is good.',
        'c) Regular exercise improves both physical and mental health.',
        'd) There are different kinds of food in the world.',
      ],
      correctOptionIndex: 2,
    ),
    PreClassQuestion(
      questionText: 'Write a topic sentence about the importance of time management.',
      isTextAnswer: true,
      correctAnswer: 'Open-ended',
    ),
    PreClassQuestion(
      questionText: 'Provide two supporting details for the topic sentence:\n“Social media has changed the way people communicate.”',
      isTextAnswer: true,
      correctAnswer: 'Open-ended',
    ),
  ],

  practiceActivityDescription1: """ 
Task: Use ChatGPT to help you build a well-developed paragraph.

Step 1: Use this prompt:
"Can you help me write a paragraph on the benefits of reading? I will write the topic sentence, and you will help me add supporting details."

Step 2: Type your own topic sentence and let ChatGPT help you expand it with supporting details. Make sure the ideas are logically connected.

Step 3: Take a screenshot of the final paragraph and upload it to the learning portal.
""",
  practiceUploadLink:"https://courseweb.sliit.lk/mod/assign/view.php?id=375228",

  practiceActivityDescription2: """
Step 1: Choose one of the following topic sentences and write a paragraph including at least three supporting details:
•	"Technology has significantly improved the way we communicate."
•	"A healthy diet plays a crucial role in maintaining overall well-being."
•	"Traveling broadens one’s perspective on life and culture."

Step 2: Review your paragraph and check if the supporting details clearly relate to the topic sentence.

Step 3: Submit your paragraph to the assigned portal.
""",
  practiceUploadLink2:"https://courseweb.sliit.lk/mod/assign/view.php?id=375229",

  instructionsText: """
Please listen to the short recorded lecture explaining how to write effective topic sentences and use appropriate supporting details. This will guide you through the upcoming practice tasks.
""",

  instructionVideoId: "https://lecturecapture.sliit.lk/eplayer.php?id=U2twQXFaTWx2ZV82NzcyMg==",

  summary: """
In this lesson, you learned how to structure a paragraph using a clear topic sentence followed by supporting details that explain, illustrate, or develop the main idea. You also practiced using these skills to write organized, logical, and coherent academic paragraphs. This foundation is essential for both academic writing and discussions, helping you present your ideas more convincingly and clearly.""",

  inClassActivity: """
Looking forward to seeing you in class! 
We'll do some fun and interactive activities to practice identifying and writing topic sentences together and give feedback on each other’s paragraphs.
""",

  quizQuestions: [
    QuizQuestion(
      question: 'What should a good topic sentence do?',
      options: [
        'a) Repeat the conclusion of the essay',
        'b) Provide all the details of the paragraph',
        'c) Clearly state the main idea of the paragraph',
        'd) Include statistics and data',
      ],
      correctOptionIndex: 2,
    ),
    QuizQuestion(
      question: 'Which of the following best supports a topic sentence about "The benefits of learning a new language"?',
      options: [
        'a) I once took a trip to Italy.',
        'b) Learning a new language improves memory and opens up job opportunities.',
        'c) I prefer English to other languages.',
        'd) People speak many languages across the world.',
      ],
      correctOptionIndex: 1,
    ),
    QuizQuestion(
      question: 'What do supporting details do in a paragraph?',
      options: [
        'a) Introduce a new topic',
        'b) Conclude the essay',
        'c) Provide evidence and explanation for the topic sentence',
        'd) Ask the reader a question',
      ],
      correctOptionIndex: 2,
    ),
    QuizQuestion(
      question: 'Give two supporting details for this topic sentence:\n“Online learning has changed the way students access education.”',
      isTextAnswer: true,
      correctTextAnswer: 'Open-ended',
    ),
  ],
);
