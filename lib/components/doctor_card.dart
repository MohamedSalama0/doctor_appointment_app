import 'package:doctor_appointment_app/main.dart';
import 'package:doctor_appointment_app/screens/doctor_details.dart';
import 'package:doctor_appointment_app/utils/config.dart';
import 'package:flutter/material.dart';

class DoctorCard extends StatelessWidget {
  const DoctorCard({
    Key? key,
    required this.doctor,
    required this.isFav,
  }) : super(key: key);

  final Map<String, dynamic> doctor;
  final bool isFav;

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      height: 150,
      child: GestureDetector(
        child: Card(
          elevation: 5,
          color: Colors.white,
          child: Row(
            children: [
              SizedBox(
                width: Config.widthSize * 0.33,
                child: Image.asset(
                  "${doctor['doctor_profile']}",
                  fit: BoxFit.fill,
                ),
              ),
              Flexible(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Dr ${doctor['doctor_name']}",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "${doctor['category']}",
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          const Icon(
                            Icons.star_border,
                            color: Colors.yellow,
                            size: 16,
                          ),
                          const Spacer(
                            flex: 1,
                          ),
                          const Text('4.5'),
                          const Spacer(
                            flex: 1,
                          ),
                          const Text('Reviews'),
                          const Spacer(
                            flex: 1,
                          ),
                          Text('(${doctor['patients']})'),
                          const Spacer(
                            flex: 7,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        onTap: () {
          //pass the details to detail page
          MyApp.navigatorKey.currentState!.push(
            MaterialPageRoute(
              builder: (_) => DoctorDetails(
                doctor: doctor,
                isFav: isFav,
              ),
            ),
          );
        },
      ),
    );
  }
}
