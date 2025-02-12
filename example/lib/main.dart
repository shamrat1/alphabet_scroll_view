import 'package:flutter/material.dart';

import 'package:alphabet_scroll_view/alphabet_scroll_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _incrementCounter() {}
  List<String> list = [
    "אביגיל",
    "יעקב",
    "מרים",
    "יוסף",
    "רחל",
    "משה",
    "שרה",
    "דוד",
    "אלישבע",
    "יהושע",
    "חנה",
    "יהונתן",
    "לאה",
    "שלמה",
    "דבורה",
    "נתן",
    "עדל",
    "אהרון",
    "מרגלית",
    "יצחק"
  ];
  List<String> liste = [
    'angel',
    'bubbles',
    'shimmer',
    'angelic',
    'bubbly',
    'glimmer',
    'baby',
    'pink',
    'little',
    'butterfly',
    'sparkly',
    'doll',
    'sweet',
    'sparkles',
    'dolly',
    'sweetie',
    'sprinkles',
    'lolly',
    'princess',
    'fairy',
    'honey',
    'snowflake',
    'pretty',
    'sugar',
    'cherub',
    'lovely',
    'blossom',
    'Ecophobia',
    'Hippophobia',
    'Scolionophobia',
    'Ergophobia',
    'Musophobia',
    'Zemmiphobia',
    'Geliophobia',
    'Tachophobia',
    'Hadephobia',
    'Radiophobia',
    'Turbo Slayer',
    'Cryptic Hatter',
    'Crash TV',
    'Blue Defender',
    'Toxic Headshot',
    'Iron Merc',
    'Steel Titan',
    'Stealthed Defender',
    'Blaze Assault',
    'Venom Fate',
    'Dark Carnage',
    'Fatal Destiny',
    'Ultimate Beast',
    'Masked Titan',
    'Frozen Gunner',
    'Bandalls',
    'Wattlexp',
    'Sweetiele',
    'HyperYauFarer',
    'Editussion',
    'Experthead',
    'Flamesbria',
    'HeroAnhart',
    'Liveltekah',
    'Linguss',
    'Interestec',
    'FuzzySpuffy',
    'Monsterup',
    'MilkA1Baby',
    'LovesBoost',
    'Edgymnerch',
    'Ortspoon',
    'Oranolio',
    'OneMama',
    'Dravenfact',
    'Reallychel',
    'Reakefit',
    'Popularkiya',
    'Breacche',
    'Blikimore',
    'StoneWellForever',
    'Simmson',
    'BrightHulk',
    'Bootecia',
    'Spuffyffet',
    'Rozalthiric',
    'Bookman'
  ];
  Map<String, int> _headers = Map();

  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    list.sort((x, y) => x.toLowerCase().compareTo(y.toLowerCase()));
    for (var i = 0; i < list.length; i++) {
      var e = list[i];
      var k = e[0].toUpperCase();
      print(k);
      if (!_headers.containsKey(k)) {
        _headers.addAll({k: i});
      }
    }
    print(_headers);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Expanded(
            child: AlphabetScrollView(
              list: list.map((e) => AlphaModel(e)).toList(),
              headers: _headers,
              hebrewAlphabets: true,
              headerBuilder: (context, index) {
                if (_headers.containsValue(index)) {
                  var item =
                      _headers.entries.where((e) => e.value == index).first;
                  return Container(
                    height: 20,
                    color: Colors.blue,
                    child: Center(
                      child: Text(item.key),
                    ),
                  );
                }
                return null;
              },
              items: [
                for (var i = 0; i < list.length; i++) _itemWidget(list[i], i),
              ],
              isAlphabetsFiltered: false,
              alignment: LetterAlignment.right,
              itemExtent: 80,
              unselectedTextStyle: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.normal,
                  color: Colors.black),
              selectedTextStyle: TextStyle(
                  fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
              overlayWidget: (value) => Stack(
                alignment: Alignment.center,
                children: [
                  Icon(
                    Icons.star,
                    size: 50,
                    color: Colors.red,
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      // color: Theme.of(context).primaryColor,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      '$value'.toUpperCase(),
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }

  Widget _itemWidget(String id, int k) {
    return Container(
      height: 80,
      child: Padding(
        padding: const EdgeInsets.only(right: 40, left: 20),
        child: ListTile(
          shape: RoundedRectangleBorder(side: BorderSide()),
          title: Text('$id'),
          subtitle: Text('Secondary text'),
          leading: Icon(Icons.person),
          trailing: Radio<bool>(
            value: false,
            groupValue: selectedIndex != k,
            onChanged: (value) {
              setState(() {
                selectedIndex = k;
              });
            },
          ),
        ),
      ),
    );
  }
}
