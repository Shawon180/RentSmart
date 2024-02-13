import 'package:flutter/material.dart';
import 'package:home_rent_app/Const/const.dart';
import 'package:home_rent_app/Ui%20Screen/home.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
   Future<void> goHome()async {
Future.delayed(const Duration(seconds: 3)).then((value) => Navigator.push(context, MaterialPageRoute(builder: (context)=>const Home())));
  }

@override
  void initState() {
    goHome();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: kPrimaryColor,
body: Center(
  child:   Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset('images/logo.png',width: 160,height: 180,),
      Text('RentSmart',style: kTextStyle.copyWith(fontSize: 32,fontWeight: FontWeight.bold,color: kWhite),)
    ],
  ),
),
    );
  }
}
