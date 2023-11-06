import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../AdHelper/adshelper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  var count = 1;
  var random_dice_no_1 = Random();
  var random_dice_no_2 = Random();
  var random_dice_no_3 = Random();
  var random_dice_no_4 = Random();
  var random_dice_no_5 = Random();
  var random_dice_no_6 = Random();

  var rnd_1 = 1;
  var rnd_2 = 1;
  var rnd_3 = 1;
  var rnd_4 = 1;
  var rnd_5 = 1;
  var rnd_6 = 1;

  var back = Colors.blue.shade100;

  Future<void>? _launched;

  late BannerAd _bannerAd;

  bool _isBannerAdReady = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _bannerAd = BannerAd(
      adUnitId: AdHelper.bannerAdUnitIdOfHomeScreen,
      request: AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (_) {
          setState(() {
            _isBannerAdReady = true;
          });
        },
        onAdFailedToLoad: (ad, err) {
          print('Failed to load a banner ad: ${err.message}');
          _isBannerAdReady = false;
          ad.dispose();
        },
      ),
    );
    _bannerAd.load();
  }


  @override
  void dispose() {
    super.dispose();
    _bannerAd.dispose();
  }

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));


    return GestureDetector(
      onTap: () {
        // back = Color((random_dice_no_1.nextDouble() * 0x00FFFFFF).toInt()).withOpacity(1);

        setState(() {
          rnd_1 = random_dice_no_1.nextInt(6)+1;
          rnd_2 = random_dice_no_2.nextInt(6)+1;
          rnd_3 = random_dice_no_3.nextInt(6)+1;
          rnd_4 = random_dice_no_4.nextInt(6)+1;
          rnd_5 = random_dice_no_5.nextInt(6)+1;
          rnd_6 = random_dice_no_6.nextInt(6)+1;

        });
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: 20.0,),

                Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [

                    count > 1 ? GestureDetector(
                      onTap: (){
                        if(count >= 2)
                        {
                          count_minus();
                        }
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(Icons.indeterminate_check_box_outlined,size: 60,),
                      ),
                    ) : Container(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                          "${count} Dice",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.mochiyPopOne(textStyle: TextStyle(fontSize: 50,color: Colors.black,fontWeight: FontWeight.w600,))

                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        if(count < 6)
                          {
                            count_add();
                          }
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(Icons.add_box_outlined,size: 60,),
                      ),
                    ),
                  ],
                ),
              ),

              if (count == 1) ...[
                Expanded(
                  flex: 3,
                  child: Center(
                    child: Image.asset('assets/images/$rnd_1-dice.png',
                      height: 280,
                      width: 280,
                      alignment: Alignment.center,),
                  ),
                ),
              ]
               else if (count == 2) ...[
                Expanded(
                  flex: 3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Image.asset('assets/images/$rnd_1-dice.png',
                          height: 180,
                          width: 180,
                          alignment: Alignment.center,),
                      ),
                      Center(
                        child: Image.asset('assets/images/$rnd_2-dice.png',
                          height: 180,
                          width: 180,
                          alignment: Alignment.center,),
                      ),

                    ],
                  ),
                ),
              ]
               else if (count == 3) ...[
                Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Image.asset('assets/images/$rnd_1-dice.png',
                              height: 180,
                              width: 180,
                              alignment: Alignment.center,),
                          ),
                          Center(
                            child: Image.asset('assets/images/$rnd_2-dice.png',
                              height: 180,
                              width: 180,
                              alignment: Alignment.center,),
                          ),

                        ],
                      ),
                      Center(
                        child: Image.asset('assets/images/$rnd_3-dice.png',
                          height: 180,
                          width: 180,
                          alignment: Alignment.center,),
                      ),
                    ],
                  ),
                ),
              ]
                else if (count == 4) ...[
                    Expanded(
                      flex: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: Image.asset('assets/images/$rnd_1-dice.png',
                                  height: 180,
                                  width: 180,
                                  alignment: Alignment.center,),
                              ),
                              Center(
                                child: Image.asset('assets/images/$rnd_2-dice.png',
                                  height: 180,
                                  width: 180,
                                  alignment: Alignment.center,),
                              ),

                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,

                            children: [
                              Center(
                                child: Image.asset('assets/images/$rnd_3-dice.png',
                                  height: 180,
                                  width: 180,
                                  alignment: Alignment.center,),
                              ),
                              Center(
                                child: Image.asset('assets/images/$rnd_4-dice.png',
                                  height: 180,
                                  width: 180,
                                  alignment: Alignment.center,),
                              ),

                            ],
                          ),
                        ],
                      ),
                    ),
                  ]
                  else if (count == 5) ...[
                      Expanded(
                        flex: 3,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                  child: Image.asset('assets/images/$rnd_1-dice.png',
                                    height: 150,
                                    width: 150,
                                    alignment: Alignment.center,),
                                ),
                                Center(
                                  child: Image.asset('assets/images/$rnd_2-dice.png',
                                    height: 150,
                                    width: 150,
                                    alignment: Alignment.center,),
                                ),

                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,

                              children: [
                                Center(
                                  child: Image.asset('assets/images/$rnd_3-dice.png',
                                    height: 150,
                                    width: 150,
                                    alignment: Alignment.center,),
                                ),
                                Center(
                                  child: Image.asset('assets/images/$rnd_4-dice.png',
                                    height: 150,
                                    width: 150,
                                    alignment: Alignment.center,),
                                ),

                              ],
                            ),
                            Center(
                              child: Image.asset('assets/images/$rnd_5-dice.png',
                                height: 150,
                                width: 150,
                                alignment: Alignment.center,),
                            ),

                          ],
                        ),
                      ),
                    ]
                    else if (count == 6) ...[
                        Expanded(
                          flex: 3,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Center(
                                    child: Image.asset('assets/images/$rnd_1-dice.png',
                                      height: 150,
                                      width: 150,
                                      alignment: Alignment.center,),
                                  ),
                                  Center(
                                    child: Image.asset('assets/images/$rnd_2-dice.png',
                                      height: 150,
                                      width: 150,
                                      alignment: Alignment.center,),
                                  ),

                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,

                                children: [
                                  Center(
                                    child: Image.asset('assets/images/$rnd_3-dice.png',
                                      height: 150,
                                      width: 150,
                                      alignment: Alignment.center,),
                                  ),
                                  Center(
                                    child: Image.asset('assets/images/$rnd_4-dice.png',
                                      height: 150,
                                      width: 150,
                                      alignment: Alignment.center,),
                                  ),

                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Center(
                                    child: Image.asset('assets/images/$rnd_5-dice.png',
                                      height: 150,
                                      width: 150,
                                      alignment: Alignment.center,),
                                  ),
                                  Center(
                                    child: Image.asset('assets/images/$rnd_6-dice.png',
                                      height: 150,
                                      width: 150,
                                      alignment: Alignment.center,),
                                  ),
                                ],
                              ),

                            ],
                          ),
                        ),
                      ],

              SizedBox(height: 10,),
              Text(
                  "Tap to Roll..",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.mochiyPopOne(textStyle: TextStyle(fontSize: 40,color: Colors.black,fontWeight: FontWeight.w600,))

              ),
              SizedBox(height: 30,),

            ],
          ),
        ),
        bottomNavigationBar: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_isBannerAdReady)
              Container(
                width: _bannerAd.size.width.toDouble(),
                height: _bannerAd.size.height.toDouble(),
                child: AdWidget(ad: _bannerAd),
              ),
          ],
        ),

      ),
    );
  }


  void count_add() {

    setState(() {

      count = count + 1;

    });
  }

  void count_minus() {

    setState(() {
      count = count - 1;

    });
  }
}
