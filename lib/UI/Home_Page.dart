import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_application_1/Helpers/decimalRounder.dart';
import 'package:flutter_application_1/Models/CryptoModel/CryptoData.dart';
import 'package:flutter_application_1/UI/Most_purchased.dart';
import 'package:flutter_application_1/network/ResponseModel.dart';
import 'package:flutter_application_1/provider/Crypto.dart';
import 'package:flutter_application_1/provider/MarketViewProvider.dart';
import 'package:flutter_application_1/provider/Theme_Switcher.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_application_1/UI/Panel_Register.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var Account1;
  late Timer _timer;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    _timer = Timer.periodic(const Duration(seconds: 20), (Timer t) {
      MarketViewProvider().getCryptoData();
      print('Call API');
    });
    final cryptoProvider = Provider.of<CryptoDataProvider>(context);

//Theme Mod
    var primarycolor = Theme.of(context).primaryColor;
    var scaffoldBackgroundColor = Theme.of(context).scaffoldBackgroundColor;
    TextTheme textTheme = Theme.of(context).textTheme;

//var
    List<String> _ChoiceChip = <String>[
      'Cap Top Market',
      'Top Cainars',
      'Top Losser',
    ];
    List imagesURL = [
      'assets/images/1393720.jpg',
      'assets/images/2927403.jpg',
    ];
// ScaFFold

    return Scaffold(
//FloatingActionButton
      floatingActionButton: FloatingActionButton(
        backgroundColor: primarycolor,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Most_purchased(),
            ),
          );
        },
        child: Icon(Icons.search),
        elevation: 20,
        tooltip: 'Search',
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      //Drawer
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(''),
              accountEmail: Text('${Register.usernamecontroler.text}'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/2927403.jpg',
                    fit: BoxFit.cover,
                    width: 80,
                    height: 80,
                  ),
                ),
              ),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/1393720.jpg'),
                ),
              ),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(
                Icons.settings,
                color: Colors.blueGrey,
              ),
              trailing: Text(
                'Setting',
                textAlign: TextAlign.right,
                style: textTheme.titleSmall,
              ),
            ),
            const Divider(),
            ListTile(
              onTap: () {},
              leading: Icon(
                Icons.security,
                color: Colors.black,
              ),
              trailing: Text(
                'Security',
                textAlign: TextAlign.right,
                style: textTheme.titleSmall,
              ),
            ),
            const Divider(),
            ListTile(
              onTap: () {},
              leading: Icon(
                Icons.supervisor_account_rounded,
                color: Colors.grey,
              ),
              trailing: Text(
                'Profile Setting',
                textAlign: TextAlign.right,
                style: textTheme.titleSmall,
              ),
            ),
            const Divider(),
            ListTile(
              onTap: () {},
              leading: Icon(
                Icons.favorite,
                color: Colors.redAccent[700],
              ),
              trailing: Text(
                'Favorite',
                textAlign: TextAlign.right,
                style: textTheme.titleSmall,
              ),
            ),
          ],
        ),
        backgroundColor: scaffoldBackgroundColor,
      ),
      //AppBar
      appBar: AppBar(
        backgroundColor: primarycolor,
        actions: const [
          ThemeSwitcher(),
        ],
        title: Shimmer.fromColors(
          child: const Text(
            'Digital Currency Analysis',
            style: TextStyle(fontSize: 21),
          ),
          baseColor: Colors.white,
          highlightColor: Colors.grey,
        ),
        centerTitle: true,
      ),
      //Body
      body: SafeArea(
        child: Column(
          children: [
            //Slider
            CarouselSlider.builder(
              itemCount: imagesURL.length,
              itemBuilder: ((context, index, index2) {
                final ImageURL = imagesURL[index];
                return buildCarouser(ImageURL, index);
              }),
              options: CarouselOptions(
                height: 150,
                autoPlay: true,
                enlargeCenterPage: true,
              ),
            ),
            Divider(),
            //Button
            Padding(
              padding: EdgeInsets.only(left: 5, right: 5),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('Buy'),
                      style: ElevatedButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        padding: EdgeInsets.all(20),
                        backgroundColor: Colors.greenAccent[700],
                        side: const BorderSide(
                            color: Color.fromARGB(139, 1, 44, 5)),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('Sell'),
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          padding: EdgeInsets.all(20),
                          backgroundColor: Colors.redAccent[700],
                          side: const BorderSide(
                              color: Color.fromARGB(127, 44, 1, 1))),
                    ),
                  ),
                ],
              ),
            ),
            //ChoiceChip

            Padding(
              padding: const EdgeInsets.only(right: 5.0, left: 5),
              child: Row(
                children: [
                  Consumer<CryptoDataProvider>(
                    builder: (context, cryptoDataProvider, child) {
                      return Wrap(
                        spacing: 8,
                        children: List.generate(_ChoiceChip.length, (index) {
                          return ChoiceChip(
                              label: Text(_ChoiceChip[index],
                                  style: textTheme.titleSmall),
                              selected: cryptoDataProvider.defaultChoiceIndex ==
                                  index,
                              selectedColor: Colors.blue,
                              onSelected: (value) {
                                switch (index) {
                                  case 0:
                                    cryptoProvider.getTopMarketCapData();
                                    break;
                                  case 1:
                                    cryptoProvider.getTopGainersData();
                                    break;
                                  case 2:
                                    cryptoProvider.getTopLosersData();
                                    break;
                                }
                              });
                        }),
                      );
                    },
                  )
                ],
              ),
            ),
            const Divider(),
            //list

            SizedBox(
              height: 400,
              child: Consumer<CryptoDataProvider>(
                // ignore: avoid_types_as_parameter_names
                builder: (context, CryptoDataProvider, child) {
                  switch (CryptoDataProvider.state.status) {
                    //Loading
                    case Status.LOADING:
                      return SizedBox(
                        height: 80,
                        child: Shimmer.fromColors(
                          // ignore: sort_child_properties_last
                          child: ListView.builder(
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              return Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: 8.0, bottom: 8, left: 8),
                                    child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      radius: 30,
                                      child: Icon(Icons.add),
                                    ),
                                  ),
                                  Flexible(
                                    fit: FlexFit.tight,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        right: 8,
                                        left: 8,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: 280,
                                            height: 20,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              right: 8,
                                              left: 8,
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  width: 250,
                                                  height: 18,
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      color: Colors.white,
                                                    ),
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
                              );
                            },
                          ),
                          baseColor: Colors.grey.shade400,
                          highlightColor: Colors.white,
                        ),
                      );
                    //complated
                    case Status.COMPLETED:
                      List<CryptoData>? model = CryptoDataProvider
                          .dataFuture.data!.cryptoCurrencyList;

                      return SizedBox(
                          //List Cap Top Market currency
                          child: ListView.builder(
                              itemCount: 20,
                              itemBuilder: (context, index) {
                                var tokenID = model![index].id;

                                MaterialColor filtercolor =
                                    DecimalRounder.setColorFilter(model[index]
                                        .quotes![0]
                                        .percentChange24h);
                                var finalPrice =
                                    DecimalRounder.removePriceDecimals(
                                        model[index].quotes![0].price);

                                var prcentChange =
                                    DecimalRounder.removePercentDecimals(
                                        model[index]
                                            .quotes![0]
                                            .percentChange24h);
                                Color percentColor =
                                    DecimalRounder.setPercentChangesColor(
                                        model[index]
                                            .quotes![0]
                                            .percentChange24h);
                                Icon percentIcon =
                                    DecimalRounder.setPercentChangesIcon(
                                        model[index]
                                            .quotes![0]
                                            .percentChange24h);
                                return SizedBox(
                                  width: double.infinity,
                                  height: 70,
                                  child: ListTile(
                                    //Logos
                                    leading: CachedNetworkImage(
                                      imageUrl:
                                          'https://s2.coinmarketcap.com/static/img/coins/32x32/$tokenID.png',
                                      fit: BoxFit.cover,
                                      width: 35,
                                      height: 35,
                                      placeholder: (context, url) =>
                                          CircularProgressIndicator(),
                                      errorWidget: (context, url, error) =>
                                          Icon(Icons.error),
                                    ),
                                    title: Text(model[index].name!,
                                        style: textTheme.bodySmall),
                                    subtitle: Text(model[index].symbol!,
                                        style: textTheme.labelSmall),
                                    trailing: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          '\$$finalPrice',
                                          style: textTheme.bodySmall,
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Wrap(
                                          children: [
                                            percentIcon,
                                            Text(
                                              prcentChange = '% $prcentChange',
                                              style: GoogleFonts.ubuntu(
                                                  color: percentColor,
                                                  fontSize: 13),
                                            ),
                                          ],
                                        )
                                        // ColorFiltered(
                                        //   colorFilter: ColorFilter.mode(
                                        //       filtercolor, BlendMode.srcATop),
                                        //   child: SvgPicture.network(
                                        //     'https://s3.coinmarketcap.com/generated/sparklines/web/1d/2781/$tokenID.svg',
                                        //   ),
                                        // ),
                                      ],
                                    ),
                                  ),
                                );
                              }));

                    //Error
                    case Status.ERROR:
                      return Text(CryptoDataProvider.state.message);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCarouser(String imageUrl, int index) {
    return Container(
      margin: EdgeInsets.only(top: 9, bottom: 5),
      color: Colors.grey,
      width: double.infinity,
      child: Image.asset(
        imageUrl,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget buildCarousel(String imageURL, int index) {
    return Container(
      height: 18,
      width: double.infinity,
    );
  }
}
