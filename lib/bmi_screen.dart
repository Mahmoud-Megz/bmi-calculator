import 'dart:math';

import 'package:bmicalculator/bmi_result_screen.dart';
import 'package:flutter/material.dart';

class BmiCalculatorScreen extends StatefulWidget {
  const BmiCalculatorScreen({Key? key}) : super(key: key);

  @override
  State<BmiCalculatorScreen> createState() => _BmiCalculatorScreenState();
}

class _BmiCalculatorScreenState extends State<BmiCalculatorScreen> {

bool isMale= true;
double height=120;
int weight=40;
int age=10;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bmi Calculator"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: ()
                      {
                        setState(() {
                          isMale=true;

                        });
                      },
                      child: Container(

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.male,
                              size: 70,
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            Text(
                              'Male',
                              style: TextStyle(
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),


                          ],
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: isMale ? Colors.blue : Colors.grey[400],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: ()
                      {
                      setState(() {
                        isMale=false;
                      });
                      },
                      child: Container(

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.female,
                              size: 70,
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            Text(
                              'Female',
                              style: TextStyle(
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),


                          ],
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: !isMale ? Colors.blue : Colors.grey[400],

                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
          decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.grey[400],),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'HEIGHT',
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${height.round()}',
                          style: TextStyle(
                            fontSize: 40.0,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'CM',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                      ],
                    ),
                    Slider(
                      value: height ,
                      min: 80,
                      max: 220,
                      onChanged: (value)
                      {
                        setState(() {
                          height=value;

                        });
                      },

                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[400],),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                               Text(
                                 'Weight',
                                 style: TextStyle(
                                   fontSize: 20.0,
                                   fontWeight: FontWeight.bold,
                                 ),
                               ),
                               Text(
                                 '${weight}',
                                 style: TextStyle(
                                   fontSize: 30.0,
                                   fontWeight: FontWeight.bold,
                                 ),
                               ),
                             Row(
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                                 FloatingActionButton.small(
                                     onPressed: ()
                                     {
                                       setState(() {
                                         weight--;
                                       });
                                     },
                                   child: Icon(
                                     Icons.remove,
                                      ),
                                 ),
                           FloatingActionButton.small(
                                onPressed: ()
                                {
                                  setState(() {
                                    weight++;
                                  });
                                },
                                child: Icon(
                                Icons.add,
                                      ),
                           ),
                         ],
                       )

                 ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[400],),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Age',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '${age}',
                            style: TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton.small(
                                onPressed: ()
                                {
                                  setState(() {
                                    age--;
                                  });
                                },
                                child: Icon(
                                  Icons.remove,
                                ),
                              ),
                              FloatingActionButton.small(
                                onPressed: ()
                                {
                                  setState(() {
                                    age++;
                                  });
                                },
                                child: Icon(
                                  Icons.add,
                                ),
                              ),
                            ],
                          )

                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ),
          Container(
            color: Colors.blue,
            width: double.infinity,
            child: MaterialButton(
              onPressed: ()
              {
                var result = weight / pow(height / 100, 2);
                print(result.round());
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context)=>BMIResultScreen(
                        age: age,
                        isMale: isMale,
                        result: result.round(),
                      ),
                    ),
                );
              },
                height: 50.0,
              child:Text(
                'Calculate',
                    style:TextStyle(
                      color: Colors.white,
                    )
              ),


            ),
          )
        ],
      )
    );
  }
}
