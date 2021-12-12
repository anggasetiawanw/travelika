import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelika/cubit/auth_cubit.dart';
import 'package:travelika/cubit/destination_cubit.dart';
import 'package:travelika/cubit/page_cubit.dart';
import 'package:travelika/cubit/seat_cubit.dart';
import 'package:travelika/cubit/transaction_cubit.dart';
import 'package:travelika/ui/pages/bonus_pages.dart';
import 'package:travelika/ui/pages/get_started_pages.dart';
import 'package:travelika/ui/pages/main_pages.dart';
import 'package:travelika/ui/pages/signin_page.dart';
import 'package:travelika/ui/pages/signup_page.dart';
import 'package:travelika/ui/pages/splash_pages.dart';
import 'package:travelika/ui/pages/success_checkout.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PageCubit(),
        ),
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        BlocProvider(
          create: (context) => DestinationCubit(),
        ),
        BlocProvider(
          create: (context) => SeatCubit(),
        ),
        BlocProvider(
          create: (context) => TransactionCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SplashPage(),
          '/get-started': (context) => GetStartedPages(),
          '/sign-up': (context) => SignUpPages(),
          '/sign-in': (context) => SignInPages(),
          '/bonus': (context) => BonusPages(),
          '/main': (context) => MainPage(),
          '/success': (contxt)=> SuccessCheckout()
        },
      ),
    );
  }
}
