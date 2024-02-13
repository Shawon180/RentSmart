import 'package:flutter/material.dart';

import '../Const/const.dart';
import '../Ui Screen/details_product.dart';
class Apartment extends StatelessWidget {
  const Apartment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 3,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: InkWell(
              onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=> const DetailsProduct())),
              child: Container(
                width: 220,
                decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                        image: NetworkImage('https://cdn.pixabay.com/photo/2014/08/11/21/39/wall-416060_960_720.jpg'), fit: BoxFit.cover)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          decoration: BoxDecoration(
                            color: kTitleColor.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(
                                  Icons.location_on_outlined,
                                  color: kWhite,
                                  size: 15,
                                ),
                                Text(
                                  '1.8',
                                  style: kTextStyle.copyWith(color: kWhite, fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Text(
                          "Dreamsville House",
                          style: kTextStyle.copyWith(color: kWhite, fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Jl. Sultan Iskandar Muda",
                          style: kTextStyle.copyWith(
                            color: kWhite,
                          ),
                        )
                      ]),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
