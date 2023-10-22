import 'package:flutter/cupertino.dart';

import '../../../../../data/model/categoris_Dm.dart';

class categoryWidget extends StatelessWidget {
  final CategoryDm categoryDm ;
  const categoryWidget({super.key, required this.categoryDm});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: categoryDm.backgroundcolor,
        borderRadius: BorderRadius.circular(20)
      ),
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           Image.asset(categoryDm.imagepath,
             height: MediaQuery.of(context).size.height*.14,),
           Text(categoryDm.title,style: TextStyle(fontSize: 20),),

         ],
       ),
    );
  }
}
