import 'package:cozy_house/models/city.dart';
import 'package:cozy_house/models/space.dart';
import 'package:cozy_house/models/tips.dart';
import 'package:cozy_house/providers/space_provider.dart';
import 'package:cozy_house/theme.dart';
import 'package:cozy_house/widgets/bottom_navbar_item.dart';
import 'package:cozy_house/widgets/city_card.dart';
import 'package:cozy_house/widgets/space_card.dart';
import 'package:cozy_house/widgets/tips_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    var spaceProvider = Provider.of<SpaceProvider>(context);
    spaceProvider.getRecommendedSpaces();

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: edge
          ),
          child: ListView(
            // NOTE: TITLE?HEADER
            children: [
              SizedBox(
                height: edge,
              ),
              Text(
                'Explore Now',
                style: blackTextStyle.copyWith(
                  fontSize: 24,
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                'Mencari kosan yang cozy',
                style: greyTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              // NOTE:POPULAR SUGGEST
              Text(
                'Popular Cities',
                style: regularTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    CityCard(
                      City(
                        id: 1,
                        name: 'Jakarta',
                        imageUrl: 'assets/city1.png',
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    CityCard(
                      City(
                        id: 2,
                        name: 'Bandung',
                        imageUrl: 'assets/city2.png',
                        isPopular: true,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    CityCard(
                      City(
                        id: 3,
                        name: 'Surabaya',
                        imageUrl: 'assets/city3.png',
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    CityCard(
                      City(
                        id: 4,
                        name: 'Palembang',
                        imageUrl: 'assets/city4.png',
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    CityCard(
                      City(
                        id: 5,
                        name: 'Aceh',
                        imageUrl: 'assets/city5.png',
                        isPopular: true
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    CityCard(
                      City(
                        id: 6,
                        name: 'Bogor',
                        imageUrl: 'assets/city6.png',
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              // NOTE: RECOMMENDED SPACE
              Text(
                'Recommended Space',
                style: regularTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              FutureBuilder(
                future: spaceProvider.getRecommendedSpaces(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<Space> data = snapshot.data as List<Space>;

                    int index = 0;

                    return Column(
                      children: data.map((item){
                        index++;
                        return Container(
                          margin: EdgeInsets.only(
                            top: index == 1 ? 0 : 30,
                          ),
                          child: SpaceCard(item),
                        );
                      }).toList(),
                    );
                  }

                  return Center(child: CircularProgressIndicator());
                },
              ),
              // NOTE: TIPS AND GUIDANCE
              const SizedBox(
                height: 30,
              ),
              Text(
                'Tips & Guidance',
                style: regularTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Column(
                children: [
                  TipsCard(
                    Tips(
                      id: 1,
                      title: 'City Guidelines',
                      imageUrl: 'assets/tips1.png',
                      updateAt: '20 Apr',
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TipsCard(
                    Tips(
                      id: 2,
                      title: 'Jakarta Fairship',
                      imageUrl: 'assets/tips2.png',
                      updateAt: '11 Dec',
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50 + 24,
              ),
              
            ],
          ),
        ),
      ),
      floatingActionButton: Container( 
        height: 65,
        width: MediaQuery.of(context).size.width - (2 * edge),
        margin: EdgeInsets.symmetric(
          horizontal: edge,
        ),
        decoration: BoxDecoration(
          color: Color(0xffF6F7F8),
          borderRadius: BorderRadius.circular(23),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomNavbarItem(
              imageUrl: 'assets/icon_home.png',
              isActive: true
            ),
            BottomNavbarItem(
              imageUrl: 'assets/icon_email.png'
            ),
            BottomNavbarItem(
              imageUrl: 'assets/icon_card.png'
            ),
            BottomNavbarItem(
              imageUrl: 'assets/icon_love.png'
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}