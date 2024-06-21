// import 'package:doctor_appointment_app/screens/pill%20reminder/local_notifications.dart';
// import 'package:flutter/material.dart';

// class PillReminderPage extends StatefulWidget {
//   const PillReminderPage({super.key});

//   @override
//   State<PillReminderPage> createState() => _PillReminderPageState();
// }

// class _PillReminderPageState extends State<PillReminderPage> {
//   @override
//   void initState() {
//     listenToNotifications();
//     super.initState();
//   }

// //  to listen to any notification clicked or not
//   listenToNotifications() {
//     print("Listening to notification");
//     LocalNotifications.onClickNotification.stream.listen((event) {
//       print(event);
//       Navigator.pushNamed(context, '/another', arguments: event);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: double.infinity,
//       child: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ElevatedButton.icon(
//               icon: const Icon(Icons.notifications_outlined),
//               onPressed: () {
//                 LocalNotifications.showSimpleNotification(
//                     title: "Simple Notification",
//                     body: "This is a simple notification",
//                     payload: "This is simple data");
//               },
//               label: const Text("Simple Notification"),
//             ),
//             ElevatedButton.icon(
//               icon: const Icon(Icons.timer_outlined),
//               onPressed: () {
//                 LocalNotifications.showPeriodicNotifications(
//                     title: "Periodic Notification",
//                     body: "This is a Periodic Notification",
//                     payload: "This is periodic data");
//               },
//               label: const Text("Periodic Notifications"),
//             ),
//             ElevatedButton.icon(
//               icon: const Icon(Icons.timer_outlined),
//               onPressed: () {
//                 LocalNotifications.showScheduleNotification(
//                     title: "Schedule Notification",
//                     body: "This is a Schedule Notification",
//                     payload: "This is schedule data");
//               },
//               label: const Text("Schedule Notifications"),
//             ),
//             // to close periodic notifications
//             ElevatedButton.icon(
//                 icon: const Icon(Icons.delete_outline),
//                 onPressed: () {
//                   LocalNotifications.cancel(1);
//                 },
//                 label: const Text("Close Periodic Notifcations")),
//             ElevatedButton.icon(
//                 icon: const Icon(Icons.delete_forever_outlined),
//                 onPressed: () {
//                   LocalNotifications.cancelAll();
//                 },
//                 label: const Text("Cancel All Notifcations"))
//           ],
//         ),
//       ),
//     );
//   }
// }
