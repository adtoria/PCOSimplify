import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HealthData extends StatefulWidget {
  const HealthData({Key? key}) : super(key: key);

  @override
  State<HealthData> createState() => _HealthDataState();
}

class _HealthDataState extends State<HealthData> {
  List<int> Age = [
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20,
    21,
    22,
    23,
    24,
    25,
    26,
    27,
    28,
    29,
    30,
    31,
    32,
    33,
    34,
    35,
    36,
    37,
    38,
    39,
    40,
    41,
    42,
    43,
    44,
    45,
    46,
    47,
    48,
    49,
    50,
    51,
    52,
    53,
    54,
    55,
    56,
    57,
    58,
    59,
    60,
    61,
    62,
    63,
    64,
    65,
  ];
  int selectedAge = 25;

  List<int> Weight = [
    20,
    21,
    22,
    23,
    24,
    25,
    26,
    27,
    28,
    29,
    30,
    31,
    32,
    33,
    34,
    35,
    36,
    37,
    38,
    39,
    40,
    41,
    42,
    43,
    44,
    45,
    46,
    47,
    48,
    49,
    50,
    51,
    52,
    53,
    54,
    55,
    56,
    57,
    58,
    59,
    60,
    61,
    62,
    63,
    64,
    65,
    66,
    67,
    68,
    69,
    70,
    71,
    72,
    73,
    74,
    75,
    76,
    77,
    78,
    79,
    80,
    81,
    82,
    83,
    84,
    85,
    86,
    87,
    88,
    89,
    90,
    91,
    92,
    93,
    94,
    95,
    96,
    97,
    98,
    99,
    100,
    101,
    102,
    103,
    104,
    105,
    106,
    107,
    108,
    109,
    110,
    111,
    112,
    113,
    114,
    115,
    116,
    117,
    118,
    119,
    120,
    121,
    122,
    123,
    124,
    125,
    126,
    127,
    128,
    129,
    130,
    131,
    132,
    133,
    134,
    135,
    136,
    137,
    138,
    139,
    140,
    141,
    142,
    143,
    144,
    145,
    146,
    147,
    148,
    149,
    150,
    151,
    152,
    153,
    154,
    155,
    156,
    157,
    158,
    159,
    160,
    161,
    162,
    163,
    164,
    165,
    166,
    167,
    168,
    169,
    170,
    171,
    172,
    173,
    174,
    175,
    176,
    177,
    178,
    179,
    180,
    181,
    182,
    183,
    184,
    185,
    186,
    187,
    188,
    189,
    190,
  ];
  int selectedWeight = 50;

  List<int> Height = [
    70,
    71,
    72,
    73,
    74,
    75,
    76,
    77,
    78,
    79,
    80,
    81,
    82,
    83,
    84,
    85,
    86,
    87,
    88,
    89,
    90,
    91,
    92,
    93,
    94,
    95,
    96,
    97,
    98,
    99,
    100,
    101,
    102,
    103,
    104,
    105,
    106,
    107,
    108,
    109,
    110,
    111,
    112,
    113,
    114,
    115,
    116,
    117,
    118,
    119,
    120,
    121,
    122,
    123,
    124,
    125,
    126,
    127,
    128,
    129,
    130,
    131,
    132,
    133,
    134,
    135,
    136,
    137,
    138,
    139,
    140,
    141,
    142,
    143,
    144,
    145,
    146,
    147,
    148,
    149,
    150,
    151,
    152,
    153,
    154,
    155,
    156,
    157,
    158,
    159,
    160,
    161,
    162,
    163,
    164,
    165,
    166,
    167,
    168,
    169,
    170,
    171,
    172,
    173,
    174,
    175,
    176,
    177,
    178,
    179,
    180,
    181,
    182,
    183,
    184,
    185,
    186,
    187,
    188,
    189,
    190,
    191,
    192,
    193,
    194,
    195,
    196,
    197,
    198,
    199,
    200,
  ];
  int selectedHeight = 155;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Health Data",
          style: TextStyle(
            color: Colors.white,
            fontSize: 21.5,
            letterSpacing: 0.5,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF1E233C),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 25),
            Container(
              child: Card(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 20, 0, 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Age : ",
                        style: GoogleFonts.montserrat(
                          fontSize: 25,
                          color: Color(0xFF1E233C),
                        ),
                      ),
                      DropdownButton<int>(
                        dropdownColor: Color(0xFFDDE3FD),
                        menuMaxHeight: 250,
                        value: selectedAge,
                        items: Age.map((item) => DropdownMenuItem<int>(
                            value: item,
                            child: Text(
                              item.toString(),
                              style: GoogleFonts.montserrat(
                                fontSize: 25,
                                color: Color(0xFF1E233C),
                              ),
                            ))).toList(),
                        onChanged: (item) {
                          setState(() {
                            selectedAge = item!;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                elevation: 10,
                margin: EdgeInsetsDirectional.fromSTEB(80, 20, 80, 20),
                shadowColor: Color(0xFFDDE3FD),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
              ),
            ),
            Container(
              child: Card(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 20, 0, 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Weight : ",
                        style: GoogleFonts.montserrat(
                          fontSize: 25,
                          color: Color(0xFF1E233C),
                        ),
                      ),
                      DropdownButton<int>(
                        dropdownColor: Color(0xFFDDE3FD),
                        menuMaxHeight: 250,
                        value: selectedWeight,
                        items: Weight.map((item) => DropdownMenuItem<int>(
                            value: item,
                            child: Text(
                              item.toString(),
                              style: GoogleFonts.montserrat(
                                fontSize: 25,
                                color: Color(0xFF1E233C),
                              ),
                            ))).toList(),
                        onChanged: (item) {
                          setState(() {
                            selectedWeight = item!;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                elevation: 10,
                margin: EdgeInsetsDirectional.fromSTEB(80, 20, 80, 20),
                shadowColor: Color(0xFFDDE3FD),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
              ),
            ),
            Container(
              child: Card(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 20, 0, 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Height : ",
                        style: GoogleFonts.montserrat(
                          fontSize: 25,
                          color: Color(0xFF1E233C),
                        ),
                      ),
                      DropdownButton<int>(
                        dropdownColor: Color(0xFFDDE3FD),
                        menuMaxHeight: 250,
                        value: selectedHeight,
                        items: Height.map((item) => DropdownMenuItem<int>(
                            value: item,
                            child: Text(
                              item.toString(),
                              style: GoogleFonts.montserrat(
                                fontSize: 25,
                                color: Color(0xFF1E233C),
                              ),
                            ))).toList(),
                        onChanged: (item) {
                          setState(() {
                            selectedHeight = item!;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                elevation: 10,
                margin: EdgeInsetsDirectional.fromSTEB(80, 20, 80, 20),
                shadowColor: Color(0xFFDDE3FD),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
              ),
            ),
            Container(
              child: Card(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(40, 30, 40, 30),
                  child: Text(
                    "BMI : " +
                        ((selectedWeight * 10000) /
                                (selectedHeight * selectedHeight))
                            .toStringAsFixed(2),
                    style: GoogleFonts.montserrat(
                      fontSize: 28,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                color: Color(0xFF1E233C),
                margin: EdgeInsetsDirectional.fromSTEB(30, 60, 30, 5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50.0)),
                ),
              ),
            ),
            Text("BMI = Body Mass Index."),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(7, 30, 7, 7),
                    child: SizedBox(
                      width: 150,
                      child: ListTile(
                        tileColor: Colors.lightBlueAccent,
                        title: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 5),
                          child: Text(
                            "Underweight",
                            style: TextStyle(
                              color: Color(0xFF1E233C),
                              fontSize: 15.5,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        subtitle: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 10),
                          child: Text(
                            "BMI: < 18.5",
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 13,
                              //fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        contentPadding:
                            EdgeInsetsDirectional.fromSTEB(15, 5, 15, 5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(
                            color: Color(0xFF595B82),
                            width: 0.5,
                          ),
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(7, 30, 7, 7),
                    child: SizedBox(
                      width: 150,
                      child: ListTile(
                        tileColor: Colors.green,
                        title: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 5),
                          child: Text(
                            "Normal",
                            style: TextStyle(
                              color: Color(0xFF1E233C),
                              fontSize: 15.5,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        subtitle: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 10),
                          child: Text(
                            "BMI: 18.5 - 24.9",
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 13,
                              //fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        contentPadding:
                        EdgeInsetsDirectional.fromSTEB(15, 5, 15, 5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(
                            color: Color(0xFF595B82),
                            width: 0.5,
                          ),
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(7, 30, 7, 7),
                    child: SizedBox(
                      width: 150,
                      child: ListTile(
                        tileColor: Colors.yellow,
                        title: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 5),
                          child: Text(
                            "Overweight",
                            style: TextStyle(
                              color: Color(0xFF1E233C),
                              fontSize: 15.5,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        subtitle: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 10),
                          child: Text(
                            "BMI: 25 - 29.9",
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 13,
                              //fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        contentPadding:
                        EdgeInsetsDirectional.fromSTEB(15, 5, 15, 5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(
                            color: Color(0xFF595B82),
                            width: 0.5,
                          ),
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(7, 30, 7, 7),
                    child: SizedBox(
                      width: 150,
                      child: ListTile(
                        tileColor: Colors.red,
                        title: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 5),
                          child: Text(
                            "Obese",
                            style: TextStyle(
                              color: Color(0xFF1E233C),
                              fontSize: 15.5,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        subtitle: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 10),
                          child: Text(
                            "BMI: > 30",
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 13,
                              //fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        contentPadding:
                        EdgeInsetsDirectional.fromSTEB(15, 5, 15, 5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(
                            color: Color(0xFF595B82),
                            width: 0.5,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
