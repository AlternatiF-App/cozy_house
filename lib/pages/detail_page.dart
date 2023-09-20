import 'package:cozy_house/models/space.dart';
import 'package:cozy_house/pages/error_page.dart';
import 'package:cozy_house/pages/home_page.dart';
import 'package:cozy_house/theme.dart';
import 'package:cozy_house/widgets/facility_item.dart';
import 'package:cozy_house/widgets/rating_item.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

 class DetailPage extends StatefulWidget {
  // const DetailPage({super.key});

  final Space space;
  DetailPage(this.space);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  bool isClicked = false;

  @override
  Widget build(BuildContext context) {

    handleLaunchUrl(String url) async{
      if (await canLaunch(url)) {
        launch(url);
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ErrorPage(),
          ),
        );
      }
    }

    Future<void> showConfirmation() async{
      return showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text('Konfirmasi'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('Apakah kamu ingin menghubungi pemilik kos?')
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Batal')
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  handleLaunchUrl('tel:${widget.space.phone}');
                },
                child: Text('Hubungi')
              )
            ],
          );
        }
      );
    }

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Image.network(
              widget.space.imageUrl,
              width: MediaQuery.of(context).size.width,
              height: 350,
              fit: BoxFit.cover,
            ),
            ListView(
              children: [
                SizedBox(
                  height: 328,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(40),
                    ),
                    color: whiteColor,
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: edge
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                         // NOTE: TITLE
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.space.name,
                                  style: blackTextStyle.copyWith(
                                    fontSize: 22,
                                  ),
                                ),
                                const SizedBox(
                                  height: 2,
                                ),
                                Text.rich(
                                  TextSpan(
                                    text: '\$${widget.space.price}',
                                    style: purpleTextStyle.copyWith(
                                      fontSize: 16
                                    ),
                                    children: [
                                      TextSpan(
                                        text: ' / month',
                                        style: greyTextStyle.copyWith(
                                          fontSize: 16,
                                        ),
                                      )
                                    ]
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [1,2,3,4,5].map((index){
                                return Container(
                                  margin: EdgeInsets.only(
                                    left: 2
                                  ),
                                  child: RatingItem(
                                    index: index,
                                    rating: widget.space.rating
                                  ),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        // NOTE: MAIN FACILITIES
                        Text(
                          'Main Facilites',
                          style: regularTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FacilityItem(
                              name: 'kitchen',
                              imageUrl: 'assets/icon_kitchen.png',
                              total: widget.space.numberOfKitchens,
                            ),
                            FacilityItem(
                              name: 'bedroom',
                              imageUrl: 'assets/icon_bedroom.png',
                              total: widget.space.numberOfBedrooms,
                            ),
                            FacilityItem(
                              name: 'Big lemari',
                              imageUrl: 'assets/icon_cupboard.png',
                              total: widget.space.numberOfCupboards,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        // NOTE: PHOTO
                        Text(
                          'Photos',
                          style: regularTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(
                          height: 23,
                        ),
                        Container(
                          height: 88,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children:
                              widget.space.photos.map((item){
                                return Container(
                                  margin: EdgeInsets.only(
                                    left: 24,
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(16),
                                    child: Image.network(
                                      item,
                                      width: 110,
                                      height: 88,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                );
                              }).toList()
                          ),
                        ),
                        // NOTE: LOCATION
                        const SizedBox(height: 30),
                        Text(
                          'Location',
                          style: regularTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${widget.space.address}\n${widget.space.city}',
                              style: greyTextStyle,
                            ),
                            InkWell(
                              onTap: () {
                                handleLaunchUrl(
                                  widget.space.mapUrl
                                );
                              },
                              child: Image.asset('assets/btn_map.png', width: 40),
                            )
                          ],
                        ),
                        const SizedBox(height: 40),
                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(purpleColor),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(17),
                                ),
                              ),
                            ),
                            onPressed: () {
                              showConfirmation();
                            },
                            child: Text(
                              'Book Now',
                              style: TextStyle(
                                color: whiteColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 40),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: edge,
                vertical: 30,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      'assets/btn_back.png',
                      width: 40,
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      setState(() {
                        isClicked = !isClicked;
                      });
                    },
                    child: Image.asset(
                      isClicked
                        ? 'assets/btn_wishlist_filled.png'
                        : 'assets/btn_wishlist.png',
                      width: 40,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}