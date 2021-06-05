import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Container(
              height: 350,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [const Color(0xFF3827B4), const Color(0xFF6C18A4)],
                ),
              ),
            ),

            // Image(
            //   height: 370,
            //   fit: BoxFit.cover,
            //   image:,
            // ),
            _buildDashboard()
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.deepPurple,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet_outlined),
            label: 'Carteiras',
            backgroundColor: Colors.deepPurple,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money_outlined),
            label: 'Lançamentos',
            backgroundColor: Colors.deepPurple,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category_outlined),
            label: 'Categorias',
            backgroundColor: Colors.deepPurple,
          ),
        ],
        currentIndex: 0,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        onTap: (int) {
          print("");
        },
      ),
      // BottomAppBar(
      //   shape: const CircularNotchedRectangle(),
      //   child: Container(height: 50.0),
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment Counter',
        child: const Icon(Icons.add),
        backgroundColor: Colors.deepPurple,
      ),
    );
  }

  Widget _buildDashboard() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
            ),
            Text(
              "Início",
              style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Março",
              style: TextStyle(color: Colors.white, fontSize: 20),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buttonMonth(Icons.arrow_left),
              Text(
                "R\$ 3.000,00",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              _buttonMonth(Icons.arrow_right)
            ],
          ),
        ),
        Container(
          height: 350,
          margin: EdgeInsets.only(top: 50),
          decoration: BoxDecoration(
            boxShadow: [BoxShadow(spreadRadius: 2, blurRadius: 8, color: Colors.black12)],
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(100),
              topRight: Radius.circular(100),
            ),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
                    child: Text(
                      "Carteiras",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                ],
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      height: 80,
                      width: 120,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomCenter,
                          colors: [const Color(0xFFD0FFAE), const Color(0xFF34EBE9)],
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      height: 80,
                      width: 120,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomCenter,
                          colors: [const Color(0xFFFEC180), const Color(0xFFFF8993)],
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      height: 80,
                      width: 120,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomCenter,
                          colors: [const Color(0xFFEFBAD3), const Color(0xFFA254F2)],
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0, left: 16.0),
                    child: Text(
                      "Últimas transações",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Stack(
                        alignment: Alignment.centerLeft,
                        children: [
                          Center(
                            child: Container(
                              height: 92,
                              width: double.infinity,
                              margin: EdgeInsets.only(left: 30),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [BoxShadow(spreadRadius: 2, blurRadius: 8, color: Colors.black12)],
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                              ),
                            ),
                          ),
                          Container(
                            height: 80,
                            width: 100,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomCenter,
                                colors: [const Color(0xFFEFBAD3), const Color(0xFFA254F2)],
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                            ),
                            //child: Icon(Icons.payments , size: 50, color: Colors.white,),
                            child: Icon(Icons.money_off , size: 50, color: Colors.white,),

                          ),
                        ],
                      )
                    ),
                  ],
                ),
              ),
              
            ],
          ),
        ),
      ],
    );
  }

  Padding _buttonMonth(IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ClipOval(
        child: Material(
          color: Colors.white, // button color
          child: InkWell(
            child: SizedBox(
                width: 40,
                height: 40,
                child: Icon(
                  icon,
                  color: Colors.black,
                )),
            onTap: () {},
          ),
        ),
      ),
    );
  }
}
