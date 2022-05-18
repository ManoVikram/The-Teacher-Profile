import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import './subjects_taught_screen.dart';
import '../models/classes_and_subjects.dart';
import '../models/Class.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isCheckBoxOn = false;

  int numberOfCoosenSubjects = 0;

  late ClassesAndSubjects classesAndSubjectsProvider;

  // bool isRebuilt = false;

  // Map<int, List<int>> checkedIndexMap = {};

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      classesAndSubjectsProvider =
          await Provider.of<ClassesAndSubjects>(context, listen: false);
      await classesAndSubjectsProvider.fetchClasses();
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    List<Class> classes = classesAndSubjectsProvider.classes;

    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 7.0,
            alignment: Alignment.center,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            minimumSize: Size(size.width - 50, 56.0),
            side: BorderSide.none,
            primary: numberOfCoosenSubjects > 0 ? const Color(0xFF270F36) : Colors.grey[400],
          ),
          onPressed: () {
            if (numberOfCoosenSubjects > 0) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SubjectsTaughtScreen(),
                ),
              );
            }
          },
          child: const Text(
            "Continue",
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SvgPicture.asset("assets/icons/DarkCircle.svg"),
                    const SizedBox(width: 10.0),
                    SvgPicture.asset("assets/icons/LightCircle.svg"),
                  ],
                ),
                const SizedBox(height: 20.0),
                Stack(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Teacher profile",
                            style: TextStyle(
                              color: Color(0xFF270F36),
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Text(
                            "Which grades &\nsubjecs you teach",
                            style: TextStyle(
                              color: Color(0xFF270F36),
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: -70,
                      right: 0,
                      height: 230,
                      child: Image.asset(
                        "assets/images/OnboardingTeacher.png",
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30.0),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: classes.length,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 40.0,
                          width: 40.0,
                          decoration: BoxDecoration(
                            color: const Color(0xFF270F36),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Center(
                            child: Text(
                              // "${index + 1}th",
                              classes[index].standartName,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        SizedBox(
                          height: 250.0,
                          width: 500,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            physics: const BouncingScrollPhysics(),
                            itemCount: classes[index].subjects.length,
                            itemBuilder: (context, subjectsIndex) {
                              // final bool? x = checkedIndexMap[index]
                              //     ?.contains(subjectsIndex);

                              return Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                  height: 220.0,
                                  width: 160.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.black26,
                                        offset: Offset(5, 3),
                                        blurRadius: 10.0,
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    children: [
                                      Expanded(
                                        flex: 4,
                                        child: Container(
                                          color: const Color(0xFFFAF1F0),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            child: Image.network(
                                              // "assets/images/English.png",
                                              classes[index]
                                                  .subjects[subjectsIndex]
                                                  .imageURL,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Consumer<ClassesAndSubjects>(
                                          builder: (context, classesAndSubjects,
                                                  child) =>
                                              Container(
                                            decoration: const BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.vertical(
                                                bottom: Radius.circular(10.0),
                                              ),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Checkbox(
                                                  /* value: x!,
                                                onChanged: (checkValue) {
                                                  if (checkedIndexMap[index] ==
                                                      []) {
                                                    checkedIndexMap[index] = [
                                                      subjectsIndex
                                                    ];
                                                  } else {
                                                    checkedIndexMap[index]
                                                        ?.add(subjectsIndex);
                                                  }
                                                }, */
                                                  value: classesAndSubjects
                                                      .classes[index]
                                                      .subjects[subjectsIndex]
                                                      .isSelected,
                                                  onChanged: (value) {
                                                    print(classesAndSubjects
                                                        .classes[index]
                                                        .subjects[subjectsIndex]
                                                        .isSelected);

                                                    if (value == true) {
                                                      numberOfCoosenSubjects++;
                                                    } else {
                                                      numberOfCoosenSubjects--;
                                                    }

                                                    setState(() {
                                                      classesAndSubjects
                                                          .classes[index]
                                                          .subjects[
                                                              subjectsIndex]
                                                          .isSelected = value!;
                                                    });

                                                    print(classesAndSubjects
                                                        .classes[index]
                                                        .subjects[subjectsIndex]
                                                        .isSelected);
                                                  },
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    // "English",
                                                    classes[index]
                                                        .subjects[subjectsIndex]
                                                        .name,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: const TextStyle(
                                                      fontSize: 16.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 30.0),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
