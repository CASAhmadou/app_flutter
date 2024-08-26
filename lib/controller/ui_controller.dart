import 'package:get/get.dart';

import '../model/photos_model.dart';
import '../service/api_service.dart';

class UiController extends GetxController{
  var  selectedIndex = 0.obs;
  RxList<PhotosModel> photos = RxList();
  RxBool isLoading = true.obs;
  RxString orderBy = "latest".obs;
  List<String> orders = [
    "latest",
    "oldest",
    "popular",
    "views"
  ];

  getPhotos() async {
    isLoading.value = true;
    var response = await ApiService().getMethod(
      "https://api.unsplash.com/photos/?per_page=30&order_by=${orderBy.value}&client_id=8r7hznUswxlk32AM40psd5U7dgaATwKOcTLtOAlxRmU");
      photos = RxList();
    if(response.statusCode == 200){
      response.data.forEach((elm){
        photos.add(PhotosModel.fromJson(elm));
      });
      isLoading.value = false;
    }
  }

  orderFunc(String newVal){
    orderBy.value = newVal;
    getPhotos();
  }

  @override
  void onInit(){
    getPhotos();
    super.onInit();
  }
}