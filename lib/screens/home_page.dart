import 'package:doctor_appointment_app/components/appointment_card.dart';
import 'package:doctor_appointment_app/components/doctor_card.dart';
import 'package:doctor_appointment_app/models/auth_model.dart';
import 'package:doctor_appointment_app/utils/config.dart';
import 'package:doctor_appointment_app/utils/image_manager.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map<String, dynamic> user = {};
  Map<String, dynamic> doctor = {};
  List doctors = [
    {
      'doctor_name': 'Sara',
      'category': 'general',
      'doc_id': 1,
      'experience': 10,
      'patients': 12,
      'doctor_profile': ImageManager.doctor4,
    },
    {
      'doctor_name': 'Mohamed',
      'category': 'Brain',
      'doc_id': 2,
      'experience': 10,
      'patients': 10,
      'doctor_profile': ImageManager.doctor8,
    },
    {
      'doctor_name': 'Khalid',
      'category': 'Dental',
      'doc_id': 3,
      'experience': 10,
      'patients': 15,
      'doctor_profile': ImageManager.doctor7,
    },
    {
      'doctor_name': 'Aleana',
      'category': 'Heart',
      'doc_id': 4,
      'experience': 10,
      'patients': 18,
      'doctor_profile': ImageManager.doctor6,
    },
  ];
  List<dynamic> favList = [];
  List<Map<String, dynamic>> medCat = [
    {
      "icon": FontAwesomeIcons.userDoctor,
      "category": "General",
    },
    {
      "icon": FontAwesomeIcons.heartPulse,
      "category": "Cardiology",
    },
    {
      "icon": FontAwesomeIcons.lungs,
      "category": "Respirations",
    },
    {
      "icon": FontAwesomeIcons.hand,
      "category": "Dermatology",
    },
    {
      "icon": FontAwesomeIcons.personPregnant,
      "category": "Gynecology",
    },
    {
      "icon": FontAwesomeIcons.teeth,
      "category": "Dental",
    },
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Config().init(context);
    user = Provider.of<AuthModel>(context, listen: false).getUser;
    doctor = {};
    // Provider.of<AuthModel>(context, listen: false).getAppointment;
    favList = [];
    // Provider.of<AuthModel>(context, listen: false).getFav;

    return Scaffold(
      //if user is empty, then return progress indicator
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 15,
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'userName',
                      // user['name'],
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage(ImageManager.doctor8),
                      ),
                    )
                  ],
                ),
                Config.spaceMedium,
                // Button(
                //   title: 'Edit Profile',
                //   onPressed: () {},
                //   width: Config.screenWidth! * 0.35,
                //   disable: true,
                // ),
                // Config.spaceMedium,
                const Text(
                  'Category',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Config.spaceSmall,
                SizedBox(
                  height: Config.heightSize * 0.05,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: List<Widget>.generate(medCat.length, (index) {
                      return InkWell(
                        onTap: (){
                          if(index ==0){
                            Navigator.of(context).pushNamed('/category_page');
                          }
                        },
                        child: Card(
                          margin: const EdgeInsets.only(right: 20),
                          color: Config.primaryColor,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                FaIcon(
                                  medCat[index]['icon'],
                                  color: Colors.white,
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  medCat[index]['category'],
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                Config.spaceSmall,
                const Text(
                  'Appointment Today',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Config.spaceSmall,
                doctor.isNotEmpty
                    ? AppointmentCard(
                        doctor: doctor,
                        color: Config.primaryColor,
                      )
                    : Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Center(
                          child: Padding(
                            padding: EdgeInsets.all(20),
                            child: Text(
                              'No Appointment Today',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                Config.spaceSmall,
                const Text(
                  'Top Doctors',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Config.spaceSmall,
                Column(
                  children: List.generate(
                    doctors.length,
                      // user['doctor'].length,
                      (index) {
                    return DoctorCard(
                      doctor: doctors[index],
                      // user['doctor'][index],
                      //if lates fav list contains particular doctor id, then show fav icon
                      isFav:
                          //  favList
                          //         .contains(user['doctor'][index]['doc_id'])
                          //     ? true
                          //     :
                          false,
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
