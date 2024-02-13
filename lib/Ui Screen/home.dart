import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:home_rent_app/Const/const.dart';
import 'package:home_rent_app/Widgets/apartment.dart';
import 'package:home_rent_app/Widgets/hotel.dart';
import 'package:home_rent_app/Widgets/villa.dart';
import '../Widgets/best_for_you.dart';
import '../Widgets/house.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<String> options = ['Alabama', 'Alaska', 'Arizona', 'Connecticut'];
  List<String> tabList = ['House', 'Hotel', 'Apartment', 'Villa'];

  final GlobalKey<SliderDrawerState> _sliderDrawerKey = GlobalKey<SliderDrawerState>();
  late String title;

  String selectedOption = 'Alabama';
  @override
  void initState() {
    super.initState();
    title = "Home";
    _tabController = TabController(length: options.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          body: SliderDrawer(
            splashColor: kPrimaryColor,
            appBar: SliderAppBar(
              appBarColor: kWhite,
              appBarHeight: 80,
              isTitleCenter: false,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      DropdownButton<String>(
                        padding: EdgeInsets.zero,
                        value: selectedOption,
                        onChanged: (String? value) {
                          setState(() {
                            selectedOption = value!;
                            _tabController.animateTo(options.indexOf(value));
                          });
                        },
                        icon: const Icon(Icons.keyboard_arrow_down),
                        style: const TextStyle(color: Colors.blue),
                        alignment: Alignment.center,
                        items: options.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: kTextStyle.copyWith(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 16),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                  const Icon(Icons.notifications_none)
                ],
              ),
            ),
            key: _sliderDrawerKey,
            sliderOpenSize: 179,
            slider: _SliderView(
              onItemClick: (title) {
                _sliderDrawerKey.currentState!.closeSlider();
                setState(() {
                  this.title = title;
                });
              },
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                width: 50,
                                height: 50,
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    filled: true,
                                    hintText: "Search address, or near you ",
                                    prefixIcon: const Icon(
                                      Icons.search,
                                      color: kSubTitleColor,
                                    ),
                                    hintStyle: kTextStyle.copyWith(color: kSubTitleColor, fontSize: 14),
                                    fillColor: Colors.blue.withOpacity(0.06),
                                    enabledBorder: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10.0),
                                        ),
                                        borderSide: BorderSide.none),
                                    focusedBorder: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10.0),
                                        ),
                                        borderSide: BorderSide.none),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: LinearGradient(colors: [Colors.blue.withOpacity(0.8), Colors.blue.withOpacity(0.6)])),
                              child: const Icon(
                                Icons.filter_list_alt,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Align(
                          alignment: Alignment.topLeft,
                          child: TabBar(
                            padding: EdgeInsets.zero,
                            indicatorPadding: EdgeInsets.zero,
                            unselectedLabelColor: kSubTitleColor,
                            isScrollable: true,
                            indicator: BoxDecoration(
                              borderRadius: BorderRadius.circular(10), // Creates border
                              gradient: LinearGradient(colors: [Colors.blue.withOpacity(0.8), Colors.blue.withOpacity(0.6)]),
                            ),
                            tabs: tabList.map((String option) {
                              return Tab(
                                text: option,
                              );
                            }).toList(),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Near from you',
                              style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            Text(
                              'See more',
                              style: kTextStyle.copyWith(
                                color: kSubTitleColor,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 260,
                    child: TabBarView(
                      children: [House(), Apartment(), Hotel(), Villa()],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Best for you',
                          style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Text(
                          'See more',
                          style: kTextStyle.copyWith(
                            color: kSubTitleColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                 //best for you
                  const BestForYou()
                ],
              ),
            ),
          ),
        ));
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}

class _SliderView extends StatelessWidget {
  final Function(String)? onItemClick;

  const _SliderView({Key? key, this.onItemClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(colors: [kPrimaryColor, kPrimaryColor.withOpacity(0.7), kPrimaryColor.withOpacity(0.5)])),
        padding: const EdgeInsets.only(top: 20),
        child: ListView(children: <Widget>[
          Container(
            width: 90,
            height: 90,
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(image: NetworkImage('https://cdn.pixabay.com/photo/2017/08/01/01/33/beanie-2562646_960_720.jpg'))),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 30),
            child: Container(
              decoration: const BoxDecoration(color: kWhite, borderRadius: BorderRadius.only(topRight: Radius.circular(30), bottomRight: Radius.circular(30))),
              child: ListTile(
                horizontalTitleGap: 0,
                leading: const Icon(
                  Icons.home_outlined,
                  color: kPrimaryColor,
                ),
                title: Text(
                  'Home',
                  style: kTextStyle.copyWith(
                    color: kPrimaryColor,
                  ),
                ),
              ),
            ),
          ),
          ListTile(
            horizontalTitleGap: 0,
            leading: const Icon(
              Icons.person_outline_rounded,
              color: kWhite,
            ),
            title: Text(
              'Profile',
              style: kTextStyle.copyWith(
                color: kWhite,
              ),
            ),
          ),
          ListTile(
            horizontalTitleGap: 0,
            leading: const Icon(
              Icons.location_on_outlined,
              color: kWhite,
            ),
            title: Text(
              'Nearby',
              style: kTextStyle.copyWith(
                color: kWhite,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 18.0),
            child: Divider(
              thickness: 1,
              color: kWhite,
            ),
          ),
          ListTile(
            horizontalTitleGap: 0,
            leading: const Icon(
              Icons.bookmark_border,
              color: kWhite,
            ),
            title: Text(
              'Bookmark',
              style: kTextStyle.copyWith(
                color: kWhite,
              ),
            ),
          ),
          ListTile(
            horizontalTitleGap: 0,
            leading: const Icon(
              Icons.notifications_none_outlined,
              color: kWhite,
            ),
            title: Text(
              'Notification',
              style: kTextStyle.copyWith(
                color: kWhite,
              ),
            ),
          ),
          ListTile(
            horizontalTitleGap: 0,
            leading: const Icon(
              Icons.message,
              color: kWhite,
            ),
            title: Text(
              'Message',
              style: kTextStyle.copyWith(
                color: kWhite,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 18.0),
            child: Divider(
              thickness: 1,
              color: kWhite,
            ),
          ),
          ListTile(
            horizontalTitleGap: 0,
            leading: const Icon(
              Icons.settings,
              color: kWhite,
            ),
            title: Text(
              'Setting',
              style: kTextStyle.copyWith(
                color: kWhite,
              ),
            ),
          ),
          ListTile(
            horizontalTitleGap: 0,
            leading: const Icon(
              Icons.help_outline,
              color: kWhite,
            ),
            title: Text(
              'Help',
              style: kTextStyle.copyWith(
                color: kWhite,
              ),
            ),
          ),
          ListTile(
            horizontalTitleGap: 0,
            leading: const Icon(
              Icons.logout,
              color: kWhite,
            ),
            title: Text(
              'Logout',
              style: kTextStyle.copyWith(
                color: kWhite,
              ),
            ),
          ),
        ]));
  }
}
