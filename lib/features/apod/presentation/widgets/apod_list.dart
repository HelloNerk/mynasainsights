import 'package:flutter/material.dart';

import '../../domain/apod.dart';
import 'apod_list_item.dart';

class ApodList extends StatelessWidget{
  const ApodList({super.key,required this.items});
  final List<Apod>items;

  @override
  Widget build(BuildContext context){
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context,index)=>GestureDetector(
          onTap: (){
          },
          child: ApodListItem(item: items[index])
      ),
    );
  }
}