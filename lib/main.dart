import 'package:doctor_appointment_app/global_bloc.dart';
import 'package:doctor_appointment_app/main_layout.dart';
import 'package:doctor_appointment_app/models/auth_model.dart';
import 'package:doctor_appointment_app/screens/auth_page.dart';
import 'package:doctor_appointment_app/screens/booking_page.dart';
import 'package:doctor_appointment_app/screens/success_booked.dart';
import 'package:doctor_appointment_app/utils/config.dart';
import 'package:doctor_appointment_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

//  handle in terminated state
  var initialNotification =
      await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();
  if (initialNotification?.didNotificationLaunchApp == true) {
    // LocalNotifications.onClickNotification.stream.listen((event) {
    // Future.delayed(Duration(seconds: 1), () {
    //   // print(event);
    //   navigatorKey.currentState!.pushNamed('/another',
    //       arguments: initialNotification?.notificationResponse?.payload);
    // });
  }
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  //this is for push navigator
  static final navigatorKey = GlobalKey<NavigatorState>();

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  GlobalBloc? globalBloc;

  @override
  void initState() {
    globalBloc = GlobalBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //define ThemeData here
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthModel>(
          create: (context) => AuthModel(),
        ),
        Provider<GlobalBloc>(
          create: (context) => GlobalBloc(),
        )
      ],
      child:  
        ScreenUtilInit(
          child: MaterialApp(
            navigatorKey: MyApp.navigatorKey,
            title: 'Medics App',
            debugShowCheckedModeBanner: false,
            // theme: ThemeData(
            //   //pre-define input decoration
            //   inputDecorationTheme: const InputDecorationTheme(
            //     focusColor: Config.primaryColor,
            //     border: Config.outlinedBorder,
            //     focusedBorder: Config.focusBorder,
            //     errorBorder: Config.errorBorder,
            //     enabledBorder: Config.outlinedBorder,
            //     floatingLabelStyle: TextStyle(color: Config.primaryColor),
            //     prefixIconColor: Colors.black38,
            //   ),
            //   scaffoldBackgroundColor: Colors.white,
            //   bottomNavigationBarTheme: BottomNavigationBarThemeData(
            //     backgroundColor: Config.primaryColor,
            //     selectedItemColor: Colors.white,
            //     showSelectedLabels: true,
            //     showUnselectedLabels: false,
            //     unselectedItemColor: Colors.grey.shade700,
            //     elevation: 10,
            //     type: BottomNavigationBarType.fixed,
            //   ),
            // ),
            theme: ThemeData.dark().copyWith(
            primaryColor: kPrimaryColor,
            scaffoldBackgroundColor: kScaffoldColor,
            //appbar theme
            appBarTheme: AppBarTheme(
              toolbarHeight: 7.h,
              backgroundColor: kScaffoldColor,
              elevation: 0,
              iconTheme: IconThemeData(
                color: kSecondaryColor,
                size: 20.sp,
              ),
              titleTextStyle: GoogleFonts.mulish(
                color: kTextColor,
                fontWeight: FontWeight.w800,
                fontStyle: FontStyle.normal,
                fontSize: 16.sp,
              ),
            ),
            textTheme: TextTheme(
              displaySmall: TextStyle(
                fontSize: 28.sp,
                color: kSecondaryColor,
                fontWeight: FontWeight.w500,
              ),
              headlineMedium: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.w800,
                color: kTextColor,
              ),
              headlineSmall: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w900,
                color: kTextColor,
              ),
              titleLarge: GoogleFonts.poppins(
                fontSize: 13.sp,
                color: kTextColor,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.0,
              ),
              titleMedium:
                  GoogleFonts.poppins(fontSize: 15.sp, color: kPrimaryColor),
              titleSmall:
                  GoogleFonts.poppins(fontSize: 12.sp, color: kTextLightColor),
              bodySmall: GoogleFonts.poppins(
                fontSize: 9.sp,
                fontWeight: FontWeight.w400,
                color: kTextLightColor,
              ),
              labelMedium: TextStyle(
                fontSize: 10.sp,
                fontWeight: FontWeight.w500,
                color: kTextColor,
              ),
            ),
            inputDecorationTheme: const InputDecorationTheme(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: kTextLightColor,
                  width: 0.7,
                ),
              ),
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: kTextLightColor),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: kPrimaryColor),
              ),
            ),
            //lets customize the timePicker theme
            timePickerTheme: TimePickerThemeData(
              backgroundColor: kScaffoldColor,
              hourMinuteColor: kTextColor,
              hourMinuteTextColor: kScaffoldColor,
              dayPeriodColor: kTextColor,
              dayPeriodTextColor: kScaffoldColor,
              dialBackgroundColor: kTextColor,
              dialHandColor: kPrimaryColor,
              dialTextColor: kScaffoldColor,
              entryModeIconColor: kOtherColor,
              dayPeriodTextStyle: GoogleFonts.aBeeZee(
                fontSize: 8.sp,
              ),
            ),
          ),
            initialRoute: '/',
            routes: {
              '/': (context) => const AuthPage(),
              'main': (context) => const MainLayout(),
              'booking_page': (context) => BookingPage(),
              'success_booking': (context) => const AppointmentBooked(),
            },
          ),
        ),
      
    );
  }
}
