class UnitModel {
  String unitName;

  int unitIndex;

  String introductionText;

  String preClassActivityDescription;
  String? preClassActivityLink;
  String? preClassActivityVideo;
  String? preClassActivityUploadLink;
  List<PreClassQuestion>? preClassQuestions;
  List<SurveyQuestion>? preClassSurvey;
  String? preClassActivityLocalVideo;  // Local video file path

  String instructionsText;
  String instructionVideoId;

  String practiceActivityDescription1;
  String? practiceActivityLink;
  String? practiceActivityVideo;
  List<PracticeQuestion1>? practiceActivityQuestions1;
  List<PracticeQuestionMCQ>? practiceActivityMCQ;
  String? practiceUploadLink;

  String practiceActivityDescription2;
  String? practiceVideoUrl;
  String? practiceUploadLink2;
  String? practiceActivityLink2;
  List<PracticeQuestion2>? practiceActivityQuestions2;
  List<PracticeQuestionMCQ2>? practiceActivityMCQ2;

  String summary;
  String inClassActivity;
  List<QuizQuestion> quizQuestions;

  UnitModel({
    required this.unitIndex,
    required this.unitName,

    required this.introductionText,

    required this.preClassActivityDescription,
    this.preClassActivityLink,
    this.preClassActivityVideo,
    this.preClassQuestions,
    this.preClassActivityUploadLink,
    this.preClassSurvey,
    this.preClassActivityLocalVideo,

    required this.instructionsText,
    required this.instructionVideoId,

    required this.practiceActivityDescription1,
    this.practiceActivityLink,
    this.practiceActivityVideo,
    this.practiceUploadLink,
    this.practiceActivityQuestions1,
    this.practiceActivityMCQ,

    required this.practiceActivityDescription2,
    this.practiceVideoUrl,
    this.practiceActivityLink2,
    this.practiceUploadLink2,
    this.practiceActivityQuestions2,
    this.practiceActivityMCQ2,

    required this.summary,
    required this.inClassActivity,
    required this.quizQuestions,

  });
}

class QuizQuestion {
  String question;
  String? description; // New optional description field
  List<String>? options;
  int? correctOptionIndex;
  String? correctTextAnswer;
  bool isTextAnswer;

  QuizQuestion({
    required this.question,
    this.description,
    this.options,
    this.correctOptionIndex,
    this.correctTextAnswer,
    this.isTextAnswer = false,
  });
}

class PreClassQuestion {
  final String questionText;
  final List<String>? options;
  final int? correctOptionIndex;
  final String? correctAnswer;
  final bool isTextAnswer;

  PreClassQuestion({
    required this.questionText,
    this.options,
    this.correctOptionIndex,
    this.correctAnswer,
    this.isTextAnswer = false,
  });
}


class PracticeQuestion1 {
  final String questionText;
  final List<String>? options;
  final int? correctOptionIndex;
  final String? correctAnswer;
  final bool isTextAnswer;

  PracticeQuestion1({
    required this.questionText,
    this.options,
    this.correctOptionIndex,
    this.correctAnswer,
    this.isTextAnswer = false,
  });
}

class PracticeQuestion2 {
  final String questionText;
  final List<String>? options;
  final int? correctOptionIndex;
  final String? correctAnswer;
  final bool isTextAnswer;

  PracticeQuestion2({
    required this.questionText,
    this.options,
    this.correctOptionIndex,
    this.correctAnswer,
    this.isTextAnswer = false,
  });
}


class PracticeQuestionMCQ {
  final String questionText;
  final List<String> options;
  final int? correctOptionIndex;

  PracticeQuestionMCQ({
    required this.questionText,
    required this.options,
    this.correctOptionIndex,
  });
}

class PracticeQuestionMCQ2 {
  final String questionText;
  final List<String> options;
  final int? correctOptionIndex;

  PracticeQuestionMCQ2({
    required this.questionText,
    required this.options,
    this.correctOptionIndex,
  });
}

class SurveyQuestion {
  final String questionText;
  final String? description; // Optional additional description
  final List<String>? options; // For multiple choice or rating scale
  final bool allowsMultipleAnswers;
  final bool isTextAnswer; // Indicates if it's an open-ended question

  SurveyQuestion({
    required this.questionText,
    this.description,
    this.options,
    this.allowsMultipleAnswers = false,
    this.isTextAnswer = false,
  });
}



