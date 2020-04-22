import 'package:flutterwallpaper/models/categries_model.dart';

String apiKey = "563492ad6f917000010000010e671612ee3b483e94164021028cb808";

// ignore: missing_return
List<CategoriesModel> getCategories() {
  List<CategoriesModel> mCategories = new List();


  CategoriesModel categoriesModel = new CategoriesModel();
  categoriesModel.catNames = "Forest";
  categoriesModel.imgUrl = "https://images.pexels.com/photos/66898/elephant-cub-tsavo-kenya-66898.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940";
  mCategories.add(categoriesModel);

  categoriesModel = new CategoriesModel();
  categoriesModel.catNames = "Nature";
  categoriesModel.imgUrl = "https://images.pexels.com/photos/358457/pexels-photo-358457.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
  mCategories.add(categoriesModel);

  categoriesModel = new CategoriesModel();
  categoriesModel.catNames = "Street Art";
  categoriesModel.imgUrl = "https://images.pexels.com/photos/545008/pexels-photo-545008.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
  mCategories.add(categoriesModel);

  categoriesModel = new CategoriesModel();
  categoriesModel.catNames = "City";
  categoriesModel.imgUrl = "https://images.pexels.com/photos/466685/pexels-photo-466685.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940";
  mCategories.add(categoriesModel);

  categoriesModel = new CategoriesModel();
  categoriesModel.catNames = "Technology";
  categoriesModel.imgUrl = "https://images.pexels.com/photos/356056/pexels-photo-356056.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
  mCategories.add(categoriesModel);

  categoriesModel = new CategoriesModel();
  categoriesModel.catNames = "Space";
  categoriesModel.imgUrl = "https://images.pexels.com/photos/110854/pexels-photo-110854.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
  mCategories.add(categoriesModel);

  categoriesModel = new CategoriesModel();
  categoriesModel.catNames = "Abstract";
  categoriesModel.imgUrl = "https://images.pexels.com/photos/1509534/pexels-photo-1509534.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
  mCategories.add(categoriesModel);

  categoriesModel = new CategoriesModel();
  categoriesModel.catNames = "Creative";
  categoriesModel.imgUrl = "https://images.pexels.com/photos/1262304/pexels-photo-1262304.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940";
  mCategories.add(categoriesModel);

  categoriesModel = new CategoriesModel();
  categoriesModel.catNames = "Idea";
  categoriesModel.imgUrl = "https://images.pexels.com/photos/1314410/pexels-photo-1314410.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
  mCategories.add(categoriesModel);

  return mCategories;

}