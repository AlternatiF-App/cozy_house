import 'package:cozy_house/pages/home_page.dart';
import 'package:cozy_house/theme.dart';
import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: edge,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/404.png'),
              const SizedBox(height: 70),
              Text(
                'Where are you going?',
                style: blackTextStyle.copyWith(
                  fontSize: 24,
                ),
              ),
              const SizedBox(height: 14),
              Text(
                'Seems like the page that you were\nrequested is already gone',
                style: greyTextStyle.copyWith(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 50),
              Container(
                width: 210,
                height: 50,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(purpleColor),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(17),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                      builder: (context) => HomePage()
                    ), (route) => false);
                  },
                  child: Text(
                    'Back To Home',
                    style: TextStyle(
                      color: whiteColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}