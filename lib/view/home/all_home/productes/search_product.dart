import 'package:cached_network_image/cached_network_image.dart';
import 'package:express/control/controllerProduct.dart';
import 'package:express/model/api/products/productDetails.dart';
import 'package:express/model/api/products/search_product.dart';
import 'package:express/utilits/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class searchProduct extends StatefulWidget {
  searchProduct({Key? key}) : super(key: key);

  @override
  State<searchProduct> createState() => _searchProductState();
}

class _searchProductState extends State<searchProduct> {
  GlobalKey<FormState> formstate = new GlobalKey<FormState>();
  String searchWord = "";
  String t = "asc";
  controllerProduct controllerPro = Get.put(controllerProduct());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Form(
          key: formstate,
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Center(
                    child: GetBuilder<controllerProduct>(builder: (controller) {
                  return (TextFormField(
                    textInputAction: TextInputAction.next,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      suffixIcon: Container(
                        margin: EdgeInsets.all(1),
                        height: 58,
                        width: 100,
                        child: IntrinsicHeight(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              IconButton(
                                  icon: Icon(
                                    Icons.arrow_circle_down,
                                    color: t == "asc"
                                        ? MyColors.color2
                                        : Colors.grey,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      t = "asc";
                                      var formdata = formstate.currentState;
                                      if (formdata!.validate()) {
                                        formdata.save();
                                        print(searchWord);
                                        Searchproduct(searchWord, t);
                                      } else {
                                        print("not validddddddddddddddd");
                                      }
                                    });
                                  }),
                              IconButton(
                                  icon: Icon(Icons.arrow_circle_up,
                                      color: t == "desc"
                                          ? MyColors.color2
                                          : Colors.grey),
                                  onPressed: () {
                                    setState(() {
                                      t = "desc";
                                      var formdata = formstate.currentState;
                                      if (formdata!.validate()) {
                                        formdata.save();
                                        print(searchWord);
                                        Searchproduct(searchWord, t);
                                      } else {
                                        print("not validddddddddddddddd");
                                      }
                                    });
                                  })
                            ],
                          ),
                        ),
                      ),
                      prefixIcon: IconButton(
                          icon: Icon(Icons.search),
                          onPressed: () {
                            setState(() {
                              var formdata = formstate.currentState;
                              if (formdata!.validate()) {
                                formdata.save();
                                print(searchWord);
                                Searchproduct(searchWord, t);
                              } else {
                                print("not validddddddddddddddd");
                              }
                            });
                          }),
                      labelStyle: TextStyle(color: Colors.black),
                    ),
                    onSaved: (string) {
                      searchWord = string!;
                      // controller.SavePassWord(string);
                    },
                  ));
                })),
              ),
              GetBuilder<controllerProduct>(builder: (controller) {
                return (Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: GridView.builder(
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 200,
                              childAspectRatio: 3 / 2,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 20),
                      itemCount: controllerPro.saveSearchCateg.length,
                      itemBuilder: (BuildContext ctx, index) {
                        return InkWell(
                            onTap: () async {
                              await detailsProducts(
                                  controllerPro.saveSearchCateg[index]["id"]);
                              Navigator.of(context)
                                  .pushNamed("particularProducte");
                            },
                            child: Container(
                              alignment: Alignment.center,
                              child: Column(
                                children: [
                                  Expanded(
                                      flex: 4,
                                      child: Container(
                                        color: Colors.transparent,
                                      )),
                                  Expanded(
                                    flex: 1,
                                    child: Center(
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.transparent
                                                .withOpacity(0.6),
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(15),
                                              bottomRight: Radius.circular(15),
                                            )),
                                        alignment: Alignment.center,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Text(
                                          controllerPro.saveSearchCateg[index]
                                              ["name"],
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: CachedNetworkImageProvider(
                                        controllerPro.saveSearchCateg[index]
                                                ["images"][0]["image"]
                                            .toString()),
                                    fit: BoxFit.cover,
                                  ),
                                  color: MyColors.color2,
                                  borderRadius: BorderRadius.circular(15)),
                            ));
                      }),
                ));
              })
            ],
          )),
    ));
  }
}
