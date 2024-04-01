import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class shoppee extends StatefulWidget {
  const shoppee({super.key});

  @override
  State<shoppee> createState() => _shoppeeState();
}

class _shoppeeState extends State<shoppee> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/bai.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(Icons.arrow_back_ios),
                color: Colors.white,
              ),
              // ElevatedButton(
              //     style: ButtonStyle(
              //       backgroundColor: MaterialStatePropertyAll<Color>(
              //         Colors.blueGrey,
              //       ),
              //     ),
              //     onPressed: () => {},
              //     child: Image.asset('assets/1.png')),
              // Container(
              //     width: 125.0,
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.end,
              //       children: <Widget>[
              //         IconButton(
              //           icon: Icon(Icons.menu),
              //           color: Colors.white,
              //           onPressed: () {},
              //         )
              //       ],
              //     ))
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 170.0, top: 30),
            child: Row(
              children: [
                Text('Shop',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0)),
                SizedBox(width: 10.0),
              ],
            ),
          ),
          SizedBox(height: 20.0),
          Padding(
            padding: EdgeInsets.only(right: 240),
            child: Text('Free items',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0)),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 5,
            width: MediaQuery.of(context).size.width - 20,
            decoration: BoxDecoration(
              color: const Color(0xff355BCA).withOpacity(0.8),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                  bottomLeft: Radius.circular(20.0)),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10.0, top: 10.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                height: MediaQuery.of(context).size.height / 15,
                                width: MediaQuery.of(context).size.width / 7,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(40.0),
                                      topRight: Radius.circular(40.0),
                                      bottomRight: Radius.circular(40.0),
                                      bottomLeft: Radius.circular(40.0)),
                                ),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(top: 0, left: 3),
                                      child: Container(
                                        child: Image(
                                          image: AssetImage('assets/tim.png'),
                                        ),
                                      ),
                                    )
                                  ],
                                ))
                          ]),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 35, left: 10),
                      child: Text(
                        '1',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 0, left: 30),
                      child: Text('Get free ',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0, left: 50.0),
                      child: Row(children: [
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll<Color>(
                              Colors.white,
                            ),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(22.0),
                              ),
                            ),
                          ),
                          onPressed: () => {},
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Image(
                              image: AssetImage('assets/tv.png'),
                            ),
                          ),
                        ),
                      ]),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10.0, top: 10.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                height: MediaQuery.of(context).size.height / 15,
                                width: MediaQuery.of(context).size.width / 7,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(40.0),
                                      topRight: Radius.circular(40.0),
                                      bottomRight: Radius.circular(40.0),
                                      bottomLeft: Radius.circular(40.0)),
                                ),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(top: 0, left: 3),
                                      child: Container(
                                        child: Image(
                                          image: AssetImage('assets/den.png'),
                                        ),
                                      ),
                                    )
                                  ],
                                ))
                          ]),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 35, left: 7),
                      child: Text(
                        '1',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 0, left: 30),
                      child: Text('Get free ',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0, left: 50.0),
                      child: Row(children: [
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll<Color>(
                              Colors.white,
                            ),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(22.0),
                              ),
                            ),
                          ),
                          onPressed: () => {},
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Image(
                              image: AssetImage('assets/tv.png'),
                            ),
                          ),
                        ),
                      ]),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // tra phiiiiiiiiiiiiiii//////////////////////////////////////////////////////////////////////////////////////
          SizedBox(height: 50.0),
          Padding(
            padding: EdgeInsets.only(right: 240),
            child: Text('VIP items',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0)),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 3.5,
            width: MediaQuery.of(context).size.width - 20,
            decoration: BoxDecoration(
              color: const Color(0xff355BCA).withOpacity(0.8),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                  bottomLeft: Radius.circular(20.0)),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10.0, top: 15.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                height: MediaQuery.of(context).size.height / 15,
                                width: MediaQuery.of(context).size.width / 7,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(40.0),
                                      topRight: Radius.circular(40.0),
                                      bottomRight: Radius.circular(40.0),
                                      bottomLeft: Radius.circular(40.0)),
                                ),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(top: 0, left: 3),
                                      child: Container(
                                        child: Image(
                                          image: AssetImage('assets/tim.png'),
                                        ),
                                      ),
                                    )
                                  ],
                                ))
                          ]),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 35, left: 3),
                      child: Text(
                        '1',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20, left: 5),
                      child: Text(
                        '+',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.0, top: 15.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                height: MediaQuery.of(context).size.height / 15,
                                width: MediaQuery.of(context).size.width / 7,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(40.0),
                                      topRight: Radius.circular(40.0),
                                      bottomRight: Radius.circular(40.0),
                                      bottomLeft: Radius.circular(40.0)),
                                ),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(top: 0, left: 3),
                                      child: Container(
                                        child: Image(
                                          image: AssetImage('assets/den.png'),
                                        ),
                                      ),
                                    )
                                  ],
                                ))
                          ]),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 35, left: 3),
                      child: Text(
                        '1',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20, left: 5),
                      child: Text(
                        '=',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20, left: 0),
                      child: Text(
                        '10',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Image(
                        image: AssetImage('assets/tien.png'),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0, left: 0.0),
                      child: Row(children: [
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll<Color>(
                              Colors.white,
                            ),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(22.0),
                              ),
                            ),
                          ),
                          onPressed: () => {},
                          child: Padding(
                            padding: EdgeInsets.all(6),
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.shopping_cart),
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ]),
                    ),
                  ],
                ),
                //////////////////////////////////////////////////////
                ///
                ///
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10.0, top: 15.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                height: MediaQuery.of(context).size.height / 15,
                                width: MediaQuery.of(context).size.width / 7,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(40.0),
                                      topRight: Radius.circular(40.0),
                                      bottomRight: Radius.circular(40.0),
                                      bottomLeft: Radius.circular(40.0)),
                                ),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(top: 0, left: 3),
                                      child: Container(
                                        child: Image(
                                          image: AssetImage('assets/tim.png'),
                                        ),
                                      ),
                                    )
                                  ],
                                ))
                          ]),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 35, left: 3),
                      child: Text(
                        '1',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20, left: 5),
                      child: Text(
                        '+',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.0, top: 15.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                height: MediaQuery.of(context).size.height / 15,
                                width: MediaQuery.of(context).size.width / 7,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(40.0),
                                      topRight: Radius.circular(40.0),
                                      bottomRight: Radius.circular(40.0),
                                      bottomLeft: Radius.circular(40.0)),
                                ),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(top: 0, left: 3),
                                      child: Container(
                                        child: Image(
                                          image: AssetImage('assets/tim.png'),
                                        ),
                                      ),
                                    )
                                  ],
                                ))
                          ]),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 35, left: 3),
                      child: Text(
                        '1',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20, left: 5),
                      child: Text(
                        '=',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20, left: 0),
                      child: Text(
                        '10',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Image(
                        image: AssetImage('assets/tien.png'),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0, left: 0.0),
                      child: Row(children: [
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll<Color>(
                              Colors.white,
                            ),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(22.0),
                              ),
                            ),
                          ),
                          onPressed: () => {},
                          child: Padding(
                            padding: EdgeInsets.all(6),
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.shopping_cart),
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ]),
                    ),
                  ],
                ),
                ///////////////////////////////////////////////////////////////////////
                ///
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10.0, top: 15.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                height: MediaQuery.of(context).size.height / 15,
                                width: MediaQuery.of(context).size.width / 7,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(40.0),
                                      topRight: Radius.circular(40.0),
                                      bottomRight: Radius.circular(40.0),
                                      bottomLeft: Radius.circular(40.0)),
                                ),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(top: 0, left: 3),
                                      child: Container(
                                        child: Image(
                                          image: AssetImage('assets/den.png'),
                                        ),
                                      ),
                                    )
                                  ],
                                ))
                          ]),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 35, left: 3),
                      child: Text(
                        '1',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20, left: 5),
                      child: Text(
                        '+',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.0, top: 15.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                height: MediaQuery.of(context).size.height / 15,
                                width: MediaQuery.of(context).size.width / 7,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(40.0),
                                      topRight: Radius.circular(40.0),
                                      bottomRight: Radius.circular(40.0),
                                      bottomLeft: Radius.circular(40.0)),
                                ),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(top: 0, left: 3),
                                      child: Container(
                                        child: Image(
                                          image: AssetImage('assets/den.png'),
                                        ),
                                      ),
                                    )
                                  ],
                                ))
                          ]),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 35, left: 3),
                      child: Text(
                        '1',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20, left: 5),
                      child: Text(
                        '=',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20, left: 0),
                      child: Text(
                        '10',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Image(
                        image: AssetImage('assets/tien.png'),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0, left: 0.0),
                      child: Row(children: [
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll<Color>(
                              Colors.white,
                            ),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(22.0),
                              ),
                            ),
                          ),
                          onPressed: () => {},
                          child: Padding(
                            padding: EdgeInsets.all(6),
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.shopping_cart),
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ]),
                    ),
                  ],
                ),
                /////////////////////////////////////////////////////////
                // Row(
                //   children: [
                //     Padding(
                //       padding: EdgeInsets.only(left: 10.0, top: 15.0),
                //       child: Row(
                //           mainAxisAlignment: MainAxisAlignment.start,
                //           children: [
                //             Container(
                //                 height: MediaQuery.of(context).size.height / 15,
                //                 width: MediaQuery.of(context).size.width / 7,
                //                 decoration: BoxDecoration(
                //                   color: Colors.white,
                //                   borderRadius: BorderRadius.only(
                //                       topLeft: Radius.circular(40.0),
                //                       topRight: Radius.circular(40.0),
                //                       bottomRight: Radius.circular(40.0),
                //                       bottomLeft: Radius.circular(40.0)),
                //                 ),
                //                 child: Row(
                //                   children: [
                //                     Padding(
                //                       padding: EdgeInsets.only(top: 0, left: 5),
                //                       child: Container(
                //                         child: Image(
                //                           image: AssetImage('assets/tim.png'),
                //                         ),
                //                       ),
                //                     )
                //                   ],
                //                 ))
                //           ]),
                //     ),
                //     Padding(
                //       padding: EdgeInsets.only(top: 35, left: 3),
                //       child: Text(
                //         '1',
                //         style: TextStyle(
                //           color: Colors.white,
                //           fontSize: 20,
                //           fontWeight: FontWeight.bold,
                //         ),
                //       ),
                //     ),
                //     Padding(
                //       padding: EdgeInsets.only(top: 20, left: 5),
                //       child: Text(
                //         '+',
                //         style: TextStyle(
                //             color: Colors.white,
                //             fontWeight: FontWeight.bold,
                //             fontSize: 30),
                //       ),
                //     ),
                //     Padding(
                //       padding: EdgeInsets.only(left: 10.0, top: 15.0),
                //       child: Row(
                //           mainAxisAlignment: MainAxisAlignment.start,
                //           children: [
                //             Container(
                //                 height: MediaQuery.of(context).size.height / 15,
                //                 width: MediaQuery.of(context).size.width / 7,
                //                 decoration: BoxDecoration(
                //                   color: Colors.white,
                //                   borderRadius: BorderRadius.only(
                //                       topLeft: Radius.circular(40.0),
                //                       topRight: Radius.circular(40.0),
                //                       bottomRight: Radius.circular(40.0),
                //                       bottomLeft: Radius.circular(40.0)),
                //                 ),
                //                 child: Row(
                //                   children: [
                //                     Padding(
                //                       padding: EdgeInsets.only(top: 0, left: 5),
                //                       child: Container(
                //                         child: Image(
                //                           image: AssetImage('assets/tim.png'),
                //                         ),
                //                       ),
                //                     )
                //                   ],
                //                 ))
                //           ]),
                //     ),
                //     Padding(
                //       padding: EdgeInsets.only(top: 35, left: 3),
                //       child: Text(
                //         '1',
                //         style: TextStyle(
                //           color: Colors.white,
                //           fontSize: 20,
                //           fontWeight: FontWeight.bold,
                //         ),
                //       ),
                //     ),
                //     Padding(
                //       padding: EdgeInsets.only(top: 20, left: 5),
                //       child: Text(
                //         '=',
                //         style: TextStyle(
                //             color: Colors.white,
                //             fontWeight: FontWeight.bold,
                //             fontSize: 30),
                //       ),
                //     ),
                //     Padding(
                //       padding: EdgeInsets.only(top: 20, left: 0),
                //       child: Text(
                //         '10',
                //         style: TextStyle(
                //             color: Colors.white,
                //             fontWeight: FontWeight.bold,
                //             fontSize: 30),
                //       ),
                //     ),
                //     Padding(
                //       padding: EdgeInsets.only(top: 20),
                //       child: Image(
                //         image: AssetImage('assets/tien.png'),
                //       ),
                //     ),
                //     Padding(
                //       padding: EdgeInsets.only(top: 10.0, left: 0.0),
                //       child: Row(children: [
                //         ElevatedButton(
                //           style: ButtonStyle(
                //             backgroundColor: MaterialStatePropertyAll<Color>(
                //               Colors.white,
                //             ),
                //             shape: MaterialStateProperty.all(
                //               RoundedRectangleBorder(
                //                 borderRadius: BorderRadius.circular(22.0),
                //               ),
                //             ),
                //           ),
                //           onPressed: () => {},
                //           child: Padding(
                //             padding: EdgeInsets.all(10),
                //             child: IconButton(
                //               onPressed: () {},
                //               icon: Icon(Icons.shopping_cart),
                //               color: Colors.black,
                //             ),
                //           ),
                //         ),
                //       ]),
                //     ),
                //   ],
                // ),

                //////////////////////////////////////////////////////////////////
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
