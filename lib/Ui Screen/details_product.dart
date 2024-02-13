import 'package:flutter/material.dart';

import '../Const/const.dart';

class DetailsProduct extends StatefulWidget {
  const DetailsProduct({Key? key}) : super(key: key);

  @override
  State<DetailsProduct> createState() => _DetailsProductState();
}

class _DetailsProductState extends State<DetailsProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(

        height: 60,
        width: double.infinity,
        decoration: const BoxDecoration(
       color: kWhite,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30)
          )
            ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text(
                  'Price',
                  style: kTextStyle.copyWith(
                    color: kSubTitleColor,
                  ),
                ),

                Text(
                  'Rp. 2.500.000.000 / Year',
                  style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ],),
              Container(
               alignment: Alignment.center,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(colors: [Colors.blue.withOpacity(0.8), Colors.blue.withOpacity(0.6)])),
                child:  Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Rent Now',
                    style: kTextStyle.copyWith(color: kWhite, fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
              ),

            ],
          ),
        ),

      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //image product
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width / 1.15,
              decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(30),
                  image:
                      const DecorationImage(image: NetworkImage('https://cdn.pixabay.com/photo/2014/08/11/21/39/wall-416060_960_720.jpg'), fit: BoxFit.cover)),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30, left: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: (){
                              Navigator.pop(context);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: kTitleColor.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(36),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.arrow_back_outlined,
                                  color: kWhite,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: kTitleColor.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(36),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.bookmark_border,
                                color: kWhite,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Text(
                        "DreamsVille House",
                        style: kTextStyle.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Jl. Sultan Iskandar ",
                        style: kTextStyle.copyWith(
                          color: kWhite,
                        ),
                      )
                    ]),
                  ],
                ),
              ),
            ),
            //description
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Description",
                    style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    "The 3 level house that has a modern design, has a large pool and a garage that fits up to four cars... Show More",
                    style: kTextStyle.copyWith(
                      color: kSubTitleColor,
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ),


                  Text(
                    "Gallery",
                    style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold),
                  ),


                ],
              ),
            ),
            //profile
      ListTile(
        leading: Container(
          width: 40,
          height: 40,
          decoration: const BoxDecoration(
              color: kPrimaryColor,
             shape: BoxShape.circle,
              image: DecorationImage(
                  image: NetworkImage('https://cdn.pixabay.com/photo/2016/11/21/12/42/beard-1845166_960_720.jpg'), fit: BoxFit.cover)),
        ),
        title: Text(
          'Garry Allen',
          style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold, fontSize: 16),
        ),
        subtitle:Text(
          'Owner',
          style: kTextStyle.copyWith(
            color: kSubTitleColor,
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(colors: [Colors.blue.withOpacity(0.8), Colors.blue.withOpacity(0.6)])),
              child: const Icon(
                Icons.call,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 8,),
            Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(colors: [Colors.blue.withOpacity(0.8), Colors.blue.withOpacity(0.6)])),
              child: const Icon(
                Icons.chat,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
            //gallery
            SizedBox(
              height: 72,
              child: ListView.builder(
                  shrinkWrap: true,

                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Container(
                        width: 72,
                        height: 72,
                        decoration: BoxDecoration(
                            color: kPrimaryColor,
                            borderRadius: BorderRadius.circular(10),
                            image: const DecorationImage(
                                image: NetworkImage('https://cdn.pixabay.com/photo/2014/07/10/17/18/large-home-389271_1280.jpg'), fit: BoxFit.cover)),
                      ),
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width /2,
                decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(30),
                    image:
                    const DecorationImage(image: AssetImage('images/Map.png'), fit: BoxFit.cover)),

              ),
            ),

          ],
        ),
      ),
    );
  }
}
