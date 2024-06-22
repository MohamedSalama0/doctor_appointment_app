import 'package:doctor_appointment_app/components/custom_appbar.dart';
import 'package:doctor_appointment_app/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});
  static const String routeName = "/category_page";
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        appTitle: 'Cardiology',
        icon: FaIcon(Icons.arrow_back_ios),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              AboutCategory(),
            ],
          ),
        ),
      ),
    );
  }
}

class AboutCategory extends StatelessWidget {
  const AboutCategory({super.key});

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            child: Image.asset(
              "assets/icons/cardiology.png",
              width: Config.widthSize * 0.7,
            ),
          ),
          Config.spaceMedium,
          const Text(
            "Heart",
            style: TextStyle(
              color: Colors.black,
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Config.spaceSmall,
          SizedBox(
            width: Config.widthSize * 0.90,
            child: const Text(
              'Cardiology is the study of the heart. Cardiology is a branch of medicine that deals with disorders of the heart and the cardiovascular system.\n The field includes medical diagnosis and treatment of congenital heart defects, coronary artery disease, heart failure, valvular heart disease, and electrophysiology. Physicians who specialize in this field of medicine are called cardiologists, a sub-specialty of internal medicine. Pediatric cardiologists are pediatricians who specialize in cardiology. Physicians who specialize in cardiac surgery are called cardiothoracic surgeons or cardiac surgeons, a specialty of general surgery',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 15,
              ),
              softWrap: true,
              textAlign: TextAlign.center,
            ),
          ),
          Config.spaceSmall,
        ],
      ),
    );
  }
}
