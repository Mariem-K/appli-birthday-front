import 'package:appli_birthday/pages/edit_event.dart';
import 'package:appli_birthday/pages/home_page.dart';
import 'package:appli_birthday/pages/event_detail.dart';
import 'package:appli_birthday/pages/edit_event.dart';
import 'package:appli_birthday/pages/create_event.dart';
import 'package:appli_birthday/pages/sign_in.dart';
import 'package:appli_birthday/pages/register.dart';
import 'package:appli_birthday/pages/account.dart';
import 'package:flutter/material.dart';
import 'package:appli_birthday/providers/user_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserProvider>(create: (context) => UserProvider())
      ],
      child: MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromARGB(255, 0, 0, 0),
          textTheme: const TextTheme(
              bodyText2: TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
        ),
        initialRoute: SignInPage.routeName,
        routes: {
          '/home': (context) => const HomePage(),
          '/event-detail': (context) => EventDetailPage(eventId: ModalRoute.of(context)!.settings.arguments as int),
          '/edit-event': (context) => EditEventPage(eventId: ModalRoute.of(context)!.settings.arguments as int),
          '/create-event': (context) => const CreateEventPage(),
          '/sign-in': (context) => const SignInPage(),
          '/register': (context) => const RegisterPage(),
          '/account': (context) => const AccountPage()
        }
      )
    );
  }
}