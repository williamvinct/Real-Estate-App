import 'package:flutter/material.dart';
import 'package:rumah/kartu.dart';
import 'package:intl/intl.dart';

class Awal extends StatefulWidget {
  @override
  _AwalState createState() => _AwalState();
}

class _AwalState extends State<Awal> {
  //link gambar
  List<String> urls = [
    "https://www.rumahome.com/wp-content/uploads/2020/12/cluster-hummingbird-bsd-city.jpg",
    "https://www.rumahome.com/wp-content/uploads/2019/01/Cluster-Martinez-Lingkungan.jpg",
    "https://www.rumahome.com/wp-content/uploads/2020/02/cluster-nara-village-tipe-8.jpg",
    "https://www.rumahome.com/wp-content/uploads/2020/09/cluster-lyndon-bsd-city-tipe-15-tampak.jpg",
    "https://www.rumahome.com/wp-content/uploads/2018/10/carstensz-apartemen-serpong-fasilitas-lantai.jpg"
  ];
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    //pesan greeting
    DateTime now = DateTime.now();
    var timeNow = int.parse(DateFormat('kk').format(now));

    String pesan = '';

    if (timeNow < 11) {
      pesan = 'Halo, Selamat Pagi';
    } else if ((timeNow > 11) && (timeNow < 14)) {
      pesan = 'Halo, Selamat Siang';
    } else if ((timeNow > 14) && (timeNow < 18)) {
      pesan = 'Halo, Selamat Sore';
    } else {
      pesan = 'Halo, Selamat Malam';
    }

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Color(0xFFF6F7FF),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color(0xFFF6F7FF),
        title: Row(
          children: [
            IconButton(
              onPressed: () {
                _scaffoldKey.currentState.openEndDrawer();
              },
              icon: Icon(
                Icons.menu,
                color: Color(0xffFF4B5C),
              ),
            ),
          ],
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //navbarnya
            Text(
              pesan,
              style: TextStyle(
                color: Colors.black,
                fontSize: 26.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              "Cari Rumah Impianmu Disini !",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            //search
            Material(
              elevation: 10.0,
              borderRadius: BorderRadius.circular(30.0),
              shadowColor: Color(0x55434343),
              child: TextField(
                textAlign: TextAlign.start,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  hintText: "Cari Rumah, Apartemen...",
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.black54,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(height: 30.0),
            //tabulation bar
            DefaultTabController(
              length: 3,
              child: Expanded(
                child: Column(
                  children: [
                    TabBar(
                      indicatorColor: Color(0xffFF4B5C),
                      unselectedLabelColor: Color(0xFFB7B7B7),
                      labelColor: Color(0xffFF4B5C),
                      labelPadding: EdgeInsets.symmetric(horizontal: 8.0),
                      tabs: [
                        Tab(
                          text: "Terbaru",
                        ),
                        Tab(
                          text: "Termurah",
                        ),
                        Tab(
                          text: "Favorit",
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      height: 300.0,
                      child: TabBarView(
                        children: [
                          //tab1
                          Container(
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                //kartu pertama
                                kartu(urls[3], "Cluster Lyndon", "BSD City",
                                    "Rp 15 Milyar"),
                                kartu(urls[4], "Apartemen Carstenz", "Serpong",
                                    "Rp 800 Jutaan"),
                                kartu(urls[2], "Cluster Nara", "BSD City",
                                    "Rp 2 Milyar"),
                              ],
                            ),
                          ),
                          Container(
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                kartu(urls[0], "Cluster HummingBird",
                                    "BSD City", "Rp 2 Milyar"),
                                kartu(urls[1], "Cluster Martinez", "Serpong",
                                    "Rp 3 Milyar"),
                              ],
                            ),
                          ),
                          Container(
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                kartu(urls[3], "Cluster Lyndon", "BSD City",
                                    "Rp 15 Milyar"),
                                kartu(urls[4], "Apartemen Carstenz", "Serpong",
                                    "Rp 800 Jutaan"),
                                kartu(urls[2], "Cluster Nara", "BSD City",
                                    "Rp 2 Milyar"),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),

      //botnavbar
    );
  }
}
