// List<String> subcategories = [
//   "Clothes",
//   "accessories",
//   "perfumes",
//   "linginer",
//   "shose",
//   "linginer",
//   "shose",
//   "Bags"
// ];
// List<Map<String, dynamic>> subcategoriesMap = [
//   {"type": "All"},
//   {
//     "type": "Women",
//     "subCat": ["Clothes", "accessories", "perfumes", "linginer", "shose"]
//   },
//   {
//     "type": "Man",
//     "subCat": ["Clothes", "shose", "Bags"]
//   },
//   {
//     "type": "Kids",
//     "subCat": ["Clothes", "shose", "Bags"]
//   },
//   {
//     "type": "Beauty",
//     "subCat": ["Clothes", "shose"]
//   },
//   {
//     "type": "Electronic",
//     "subCat": ["Clothes", "shose", "Bags"]
//   },
//   {
//     "type": "MakeUp",
//     "subCat": ["Clothes"]
//   }
// ];
List<Map> myType =
    List.generate(10, (index) => {"id": index, "name": "Type $index"}).toList();
List<Map> myProducts = List.generate(
    4,
    (index) => {
          "id": index,
          "name": "Product $index",
          "image":
              "https://www.productplan.com/uploads/2018/08/product-development.png"
        }).toList();
