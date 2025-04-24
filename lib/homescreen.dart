import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:eng_app_2/models/all_units.dart' as unit_data;
import 'package:eng_app_2/models/unit_model.dart';
import 'introduction_screen.dart';

class HomeScreen extends StatefulWidget {
  final String username;
  const HomeScreen({super.key, required this.username});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final box = GetStorage();

  final List<Map<String, dynamic>> units = [
    {
      'title': 'Introduction to the program and getting to know each other',
      'icon': Icons.school,
      'subunits': [
        {
          'name': 'Introduction to the program and getting to know each other',
          'unitIndex': 1
        },
      ]
    },
    {
      'title': 'Basic grammar skills',
      'icon': Icons.book,
      'subunits': [
        {'name': 'Basic grammar skills', 'unitIndex': 2},
        {'name': 'Word order in English', 'unitIndex': 3},
        {'name': 'Types of sentences in English', 'unitIndex': 4},
      ]
    },
    {
      'title': 'Tenses',
      'icon': Icons.history_edu,
      'subunits': [
        {'name': 'Tenses', 'unitIndex': 5},
        {'name': 'Simple present', 'unitIndex': 6},
        {'name': 'Present continuous', 'unitIndex': 7},
        {'name': 'Present perfect', 'unitIndex': 8},
        {'name': 'Present perfect continuous', 'unitIndex': 9},
        {'name': 'Simple past', 'unitIndex': 10},
        {'name': 'Past continuous', 'unitIndex': 11},
        {'name': 'Past perfect continuous', 'unitIndex': 12},
        {'name': 'Simple future', 'unitIndex': 13},
        {'name': 'Future Continuous', 'unitIndex': 14},
        {'name': 'Future perfect', 'unitIndex': 15},
      ]
    },
    {
      'title': 'Essential study skills',
      'icon': Icons.lightbulb,
      'subunits': [
        {'name': 'Essential study skills', 'unitIndex': 16},
        {'name': 'Listening to lectures and taking notes', 'unitIndex': 17},
        {'name': 'Vocabulary learning strategies', 'unitIndex': 18},
      ]
    },
    {
      'title': 'Academic discussion and viva preparation',
      'icon': Icons.record_voice_over,
      'subunits': [
        {'name': 'Academic discussion and viva preparation', 'unitIndex': 19},
        {'name': 'Introduction to viva voce', 'unitIndex': 20},
        {'name': 'Structuring responses', 'unitIndex': 21},
        {'name': 'Handling examiner questions', 'unitIndex': 22},
      ]
    },
    {
      'title': 'Communication strategies',
      'icon': Icons.forum,
      'subunits': [
        {'name': 'Communication strategies', 'unitIndex': 23},
        {'name': 'Understanding communication strategies', 'unitIndex': 24},
        {'name': 'Types of questions', 'unitIndex': 25},
        {'name': 'Summarizing key points in discussions', 'unitIndex': 26},
        {'name': 'Paraphrasing for Better Understanding', 'unitIndex': 27},
      ]
    },
    {
      'title': 'Context-Based Vocabulary Development',
      'icon': Icons.spellcheck,
      'subunits': [
        {'name': 'Context-Based Vocabulary Development', 'unitIndex': 28},
        {'name': 'Changing word forms', 'unitIndex': 29},
        {
          'name': 'Using context clues to understand unfamiliar words',
          'unitIndex': 30
        },
        {'name': 'Using formal vs. informal expressions', 'unitIndex': 31},
        {
          'name': 'Replacing common words with academic equivalents',
          'unitIndex': 32
        },
      ]
    },
    {
      'title': 'Structuring ideas for academic discussions',
      'icon': Icons.account_tree,
      'subunits': [
        {
          'name': 'Structuring ideas for academic discussions',
          'unitIndex': 33
        },
        {
          'name': 'Organizing thoughts before speaking/writing',
          'unitIndex': 34
        },
        {
          'name': 'The point-evidence-explanation (PEE) method',
          'unitIndex': 35
        },
        {
          'name': 'Using topic sentences and supporting details',
          'unitIndex': 36
        },
      ]
    },
    {
      'title': 'Making academic presentations',
      'icon': Icons.present_to_all,
      'subunits': [
        {'name': 'Making academic presentations', 'unitIndex': 37},
        {'name': 'Introduction to academic presentations', 'unitIndex': 38},
        {'name': 'Tips to overcome presentation anxiety', 'unitIndex': 39},
        {'name': 'Structuring presentations', 'unitIndex': 40},
      ]
    },
    {
      'title': 'Enhancing coherence and logical flow',
      'icon': Icons.timeline,
      'subunits': [
        {'name': 'Enhancing coherence and logical flow', 'unitIndex': 41},
        {
          'name': 'Maintaining the rapport of the presentations',
          'unitIndex': 42
        },
        {
          'name': 'Practicing and refining delivery (online and in-person)',
          'unitIndex': 43
        },
      ]
    },
    {
      'title': 'Mastering Oral Exams & Viva Voce',
      'icon': Icons.mic,
      'subunits': [
        {'name': 'Mastering Oral Exams & Viva Voce', 'unitIndex': 44},
        {'name': 'Speaking with Confidence & Clarity', 'unitIndex': 45},
        {
          'name': 'Handling Challenging & Unexpected Questions',
          'unitIndex': 46
        },
        {'name': 'Responding with Critical Thinking', 'unitIndex': 47},
      ]
    },
    {
      'title': 'Reflection and self-improvement in academic communication',
      'icon': Icons.assessment,
      'subunits': [
        {
          'name': 'Reflection and self-improvement in academic communication',
          'unitIndex': 48
        },
        {'name': 'Self-Assessment & Reflection', 'unitIndex': 49},
        {'name': 'Peer Feedback & Group Discussion', 'unitIndex': 50},
      ]
    },
  ];

  UnitModel? _getUnitData(int? unitIndex) {
    if (unitIndex == null) return null;
    final unit = unit_data.units.firstWhere(
          (unit) => unit.unitIndex == unitIndex,
      orElse: () => null as UnitModel,
    );
    return unit;
  }

  void _navigateToScreen(int unitIndex, int subunitIndex) {
    final subunit = units[unitIndex]['subunits'][subunitIndex];
    final unitData = _getUnitData(subunit['unitIndex'] as int?);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => IntroductionScreen(
          unitIndex: unitIndex,
          subunitIndex: subunitIndex,
          subunitTitle: subunit['name'],
          unitData: unitData,
        ),
      ),
    );
  }

  void _showSubunitModal(int unitIndex) {
    final subunits = units[unitIndex]['subunits'];

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Select a Lesson',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black87),
                ),
                ...subunits.map<Widget>((subunit) {
                  int subIndex = subunits.indexOf(subunit);
                  return ListTile(
                    leading: const Icon(Icons.play_circle_outline, color: Color(0xFF010066)),
                    title: Text(
                      subunit['name'],
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 12),
                    onTap: () {
                      Navigator.pop(context);
                      _navigateToScreen(unitIndex, subIndex);
                    },
                  );
                }).toList(),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FC),
      appBar: AppBar(
        backgroundColor: const Color(0xFF010066),
        title: Text(
          'Welcome, ${widget.username} 👋',
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20,color: Colors.white),
        ),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            decoration: const BoxDecoration(
              color: Color(0xFF010066),
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(32), bottomRight: Radius.circular(32)),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Your Learning Journey 📚",
                  style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 4),
                Text(
                  "Explore units below and start learning.",
                  style: TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GridView.builder(
                itemCount: units.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.85,
                ),
                itemBuilder: (context, index) {
                  final unit = units[index];
                  return GestureDetector(
                    onTap: () => _showSubunitModal(index),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 6,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          CircleAvatar(

                            backgroundColor: const Color(0xFFFF6100),
                            radius: 35,
                            child: Icon(unit['icon'], color: Colors.white),
                          ),
                          const SizedBox(height: 12),
                          Expanded(
                            child: Text(
                              unit['title'],
                              textAlign: TextAlign.center,
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: Color(0xFF010066),
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Icon(Icons.touch_app_rounded, color: Colors.grey, size: 18),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}