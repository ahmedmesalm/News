import 'package:flutter/material.dart';
import 'package:news/data/model/categoris_Dm.dart';

import 'categories_wediget.dart';

class CategoriesTab extends StatelessWidget {
  final Function(CategoryDm)  onCategoryClick;
  const CategoriesTab(this.onCategoryClick,{super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 10,),
        const Text(
          "     Pick your Category",
          style: TextStyle(fontSize: 28,color: Color(0xff9b27af)),
          textAlign: TextAlign.start,
        ),
        const SizedBox(height: 20,),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
                itemCount: CategoryDm.categories.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 1.2
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: (){
                      onCategoryClick(CategoryDm.categories[index]);
                    },
                    child: categoryWidget(
                      categoryDm: CategoryDm.categories[index],),
                  );
                }),
          ),
        ),
      ],
    );
  }
}
