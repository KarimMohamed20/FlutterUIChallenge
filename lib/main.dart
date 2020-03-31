import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
void main() => runApp(MaterialApp(
      home: FlutterUIChallenge(),
      debugShowCheckedModeBanner: false,
    ));

class FlutterUIChallenge extends StatefulWidget {
  @override
  _FlutterUIChallengeState createState() => _FlutterUIChallengeState();
}

class _FlutterUIChallengeState extends State<FlutterUIChallenge> {
  List<Map> map = [
    {
      "title":"Uber",
      "date":"August 12, 2019",
      "price":"-\$30.20",
      "color":Colors.pink[300]
    },
    {
      "title":"Shopping",
      "date":"February 18, 2019",
      "price":"-\$80.00",
      "color":Colors.blue[400]
      },
      {
      "title":"Taxes",
      "date":"February 18, 2019",
      "price":"-\$20.00",
      "color":Colors.red
      },{
      "title":"Shopping",
      "date":"February 18, 2019",
      "price":"-\$20.00",
      "color":Colors.orange
      }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
    backgroundColor: Colors.blueAccent,
    height: 50,
    items: <Widget>[
      Icon(Icons.add, size: 30),
      Icon(Icons.home, size: 30),
      Icon(Icons.compare_arrows, size: 30),
    ],
    onTap: (index) {
      //Handle button tap
    },
  ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "My Wallet",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://images.pexels.com/photos/736716/pexels-photo-736716.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
              radius: 20,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
              child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              visaCard(double.infinity,
                  type: 'VISA',
                  cardNumber: '7589 6589 2548 7502',
                  cardHolder: 'Mr. John',
                  expireDate: '05/22'),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  "Payment Info",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: <Widget>[
                    revenueCard('Revenues'),
                    SizedBox(width: 20),
                     revenueCard('Expense')
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30,vertical: 15),
                child: Text(
                  "Overview",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                ),
              ),
              Flexible(
                              child: ListView.builder(

                                itemCount: map.length,itemBuilder: (context,i){
                  return ListTile(
                    leading: CircleAvatar(
                      radius: 3,
                      backgroundColor: map[i]['color'],
                    ),
                    title:Text(map[i]['title']),subtitle: Text(map[i]['date']),trailing: Text(map[i]['price']),);
                }),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget visaCard(width, {type, cardNumber, cardHolder, expireDate}) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              alignment: Alignment.topLeft,
              // decoration: BoxDecoration(color: Colors.white),

              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(type,
                    style: TextStyle(
                        backgroundColor: Colors.white,
                        color: Color.fromRGBO(101, 78, 163, 1),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic)),
              ),
            ),
            Center(
                child: Text(cardNumber,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 17))),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Card Holder",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w200),
                  ),
                  Text(
                    "Exp. Date",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w200),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    cardHolder,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    expireDate,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            )
          ],
        ),
        width: width,
        height: 165,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            gradient: LinearGradient(colors: [
              Color.fromRGBO(101, 78, 163, 1),
              Color.fromRGBO(234, 175, 200, 1),
            ])),
      ),
    );
  }
  Widget revenueCard(type){
    return Expanded(
                    child: Container(
                      height: 100,
                      child: Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(7),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 9, top: 9, bottom: 1),
                                  child: Text("\$560.50",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 9, top: 9, ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: type == 'Revenues' ?  Colors.blue[400] : Colors.pink[300]
                                    ), 
                                    height: 25,
                                    width: 45,
                                    child: Center(child: Text('15%',style: TextStyle(color:Colors.white),),),
                                  ),
                                ),

                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 9, top: 1),
                              child: Text(
                                type,
                                style: TextStyle(color: Colors.grey[700],fontSize: 13),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
  }
}
