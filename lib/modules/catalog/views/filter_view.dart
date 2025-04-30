import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../utils/base_screens/loading_data_widget.dart';
import '../../../utils/hex_color.dart';
import '../controllers/filter_controller.dart';

class FilterView extends GetView<FilterController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [
          hexToColor('#FEF7FF'),
          hexToColor('#fefffe'),
          hexToColor('#deefe2'),
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
          ),
          title: Text(
            'Категория',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: 'Manrope',
                color: hexToColor('#343235'),
                fontWeight: FontWeight.w600,
                fontSize: 17),
          ),
          centerTitle: true,
          shape: const ContinuousRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          ),
        ),
        body: Obx(()=> Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              categoriesList(context),
              (controller.filter.value!=0)?InkWell(
                child: Container(
                  height: 50,
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  decoration: BoxDecoration(
                      color: hexToColor('#427a5b'),
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: Text(
                    'Сбросить фильтр',
                    style: TextStyle(
                        fontFamily: 'Manrope',
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 18),
                  ),
                ),
                onTap: (){
                  controller.dropFilter();
                },
              ):SizedBox(),


            ],
          ),
        ),
        ),

    );
  }

  Widget categoriesList(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
      child: Column(
        children: [
          ...controller.categories
              .map((categ_item) => Container(
                    child: ListTile(
                      leading: Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                '${categ_item.image}',
                              ),
                              fit: BoxFit.fitHeight),
                        ),
                      ),
                      onTap: (){
                        controller.changeFilter(context, categ_item.id);
                      },
                      trailing: (GetStorage().read('filter')==categ_item.id)?FaIcon(FontAwesomeIcons.check):null,
                      title: Text('${categ_item.category_name}', style: TextStyle(fontFamily: 'Manrope',
                          color: hexToColor('#343235'),fontWeight: FontWeight.w300, fontSize: 18),),
                    ),
                  ))
              .toList(),

        ],
      ),
    );
  }
}
