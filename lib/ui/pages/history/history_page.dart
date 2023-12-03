import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return Scaffold(
      body: SafeArea(
        child: Container(
          constraints: BoxConstraints.expand(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text('w100',
                      style: GoogleFonts.montserrat(
                          fontSize: 18.0, fontWeight: FontWeight.w100)),
                  Text('w200',
                      style: GoogleFonts.montserrat(
                          fontSize: 18.0, fontWeight: FontWeight.w200)),
                  Text('w300',
                      style: GoogleFonts.montserrat(
                          fontSize: 18.0, fontWeight: FontWeight.w300)),
                  Text('w400',
                      style: GoogleFonts.montserrat(
                          fontSize: 18.0, fontWeight: FontWeight.w400)),
                  Text('w500',
                      style: GoogleFonts.montserrat(
                          fontSize: 18.0, fontWeight: FontWeight.w500)),
                  Text('w600',
                      style: GoogleFonts.montserrat(
                          fontSize: 18.0, fontWeight: FontWeight.w600)),
                  Text('w700',
                      style: GoogleFonts.montserrat(
                          fontSize: 18.0, fontWeight: FontWeight.w700)),
                  Text('w800',
                      style: GoogleFonts.montserrat(
                          fontSize: 18.0, fontWeight: FontWeight.w800)),
                  Text('w900',
                      style: GoogleFonts.montserrat(
                          fontSize: 18.0, fontWeight: FontWeight.w900)),
                ],
              ),
              SizedBox(
                width: 20.0,
              ),
              Column(
                children: <Widget>[
                  Text('w100',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.w100)),
                  Text('w200',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.w200)),
                  Text('w300',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.w300)),
                  Text('w400',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.w400)),
                  Text('w500',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.w500)),
                  Text('w600',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.w600)),
                  Text('w700',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.w700)),
                  Text('w800',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.w800)),
                  Text('w900',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.w900)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
