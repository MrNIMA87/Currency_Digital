import 'package:flutter/cupertino.dart';

import '../Models/CryptoModel/AllCryptoModel.dart';
import '../network/APIprovider.dart';
import '../network/ResponseModel.dart';

class MarketViewProvider extends ChangeNotifier{
  ApiProvider apiProvider = ApiProvider();

  late AllCryptoModel dataFuture;

  late ResponseModel state;
  var response;


  getCryptoData() async {

    // start loading api
    state = ResponseModel.loading("is loading...");
    // notifyListeners();

    try{
      response = await apiProvider.getAllCryptoData();
      if(response.statusCode == 200){
        dataFuture = AllCryptoModel.fromJson(response.data);
        state = ResponseModel.completed(dataFuture);
      }else{
        state = ResponseModel.error("something wrong please try again...");
      }
      notifyListeners();
    }catch(e){
      state = ResponseModel.error("please check your connection...");
      notifyListeners();

      print(e.toString());
    }
  }



}