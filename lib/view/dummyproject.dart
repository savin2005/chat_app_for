import 'package:flutter/material.dart';

class Dummypage extends StatefulWidget {
  const Dummypage({super.key});

  @override
  State<Dummypage> createState() => _DummypageState();
}

class _DummypageState extends State<Dummypage> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff1E222D),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
              child: Column(
                children: [
                  Center(
                    child: Container(
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1E1F25),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedIndex = 0;
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 8),
                              decoration: BoxDecoration(
                                color: selectedIndex == 0
                                    ? Color(0xff1E222D)
                                    : Color(0xFF787F8F),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                'Exchange',
                                style: TextStyle(
                                  color: selectedIndex == 0
                                      ? Colors.white
                                      : Colors.grey,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          // Wallet
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedIndex = 1;
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 8),
                              decoration: BoxDecoration(
                                color: selectedIndex == 1
                                    ? Color(0xff1E222D)
                                    : Color(0xFF787F8F),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                'Wallet',
                                style: TextStyle(
                                  color: selectedIndex == 1
                                      ? Colors.white
                                      : Colors.grey,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      const Text('Overview',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                      const SizedBox(height: 10),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Spot',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Funding',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Futures',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Divider(
              color: Color.fromARGB(255, 133, 132, 132),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  // Balance Section
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text('Est. Total Value',
                                  style: TextStyle(
                                    color: Colors.white,
                                  )),
                              SizedBox(
                                width: 6,
                              ),
                              Icon(Icons.visibility,
                                  color: Colors.grey, size: 16),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.show_chart_outlined,
                                  color: Colors.white, size: 20),
                              SizedBox(
                                width: 20,
                              ),
                              Icon(Icons.history,
                                  color: Colors.white, size: 20),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            "\$0.31718378 ",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 26,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Column(
                            children: [
                              SizedBox(
                                height: 6,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "USD",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Icon(Icons.arrow_drop_down_outlined,
                                      color: Colors.white, size: 20),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Text(
                            "Today's PNL  +\$0.00(+0.00%)",
                            style: TextStyle(
                              color: Color(0xFFEAECEF), // soft white text
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: Colors.grey, // same as text color
                            size: 14,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Action Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: BorderSide.none,
                          backgroundColor: const Color(0xffF4CA45),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          "Add Funds",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: BorderSide.none,
                          fixedSize: Size(100, 40.5),
                          backgroundColor:
                              const Color.fromARGB(255, 98, 94, 94),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          "Send ",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: BorderSide.none,
                          backgroundColor:
                              const Color.fromARGB(255, 98, 94, 94),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          "Transfer",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),

                  // Transaction Row
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 12, horizontal: 7),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                            color: Colors.grey.shade800, width: 1.5)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 6),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.notifications,
                                  color: Colors.white, size: 16),
                              SizedBox(
                                width: 10,
                              ),
                              const Text('Pay Send -557 USDT',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white)),
                            ],
                          ),
                          Row(
                            children: [
                              Text('Complete',
                                  style: TextStyle(color: Colors.green[300])),
                              const SizedBox(width: 8),
                              const Icon(Icons.chevron_right,
                                  color: Colors.grey),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Crypto Section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Column(
                            children: [
                              const Text('Crypto',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                              Container(
                                width: MediaQuery.of(context).size.width / 18,
                                height:
                                    MediaQuery.of(context).size.height / 300,
                                color: Colors.yellow,
                              )
                            ],
                          ),
                          const SizedBox(width: 16),
                          const Text('Account',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey)),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.search, color: Colors.grey, size: 20),
                          SizedBox(
                            width: 20,
                          ),
                          Icon(Icons.settings, color: Colors.grey, size: 20),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(
                                  top: 4, right: 2, left: 2, bottom: 2),
                              decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 113, 205, 110),
                                  shape: BoxShape.circle),
                              child: Icon(
                                Icons.diamond_sharp,
                                color: Colors.white,
                                size: 18,
                              ),
                            ),
                            SizedBox(
                              height: 12,
                            )
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 4),
                            Text(
                              'USDT',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 17),
                            ),
                            Text('TetherUS',
                                style: TextStyle(color: Colors.grey)),
                          ],
                        ),
                        Expanded(
                          child: SizedBox(),
                        ),
                        Column(
                          children: [
                            const Text(
                              '0.31718378',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 17),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width / 20),
                              child: Text('\$0.31718378',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 12)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
