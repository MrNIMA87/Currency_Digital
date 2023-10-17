import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/Models/CryptoModel/AllCryptoModel.dart';
import 'package:flutter_application_1/Models/CryptoModel/CryptoData.dart';
import 'package:flutter_application_1/Repository/CryproDataRepository.dart';
import 'package:flutter_application_1/network/APIprovider.dart';
import 'package:flutter_application_1/network/ResponseModel.dart';

class CryptoDataProvider extends ChangeNotifier {
  ApiProvider apiProvider = ApiProvider();

  late AllCryptoModel dataFuture;
  late ResponseModel state;
  var response;

  var defaultChoiceIndex = 0;

  CryptoDataRepository repository = CryptoDataRepository();

  CryptoDataProvider() {
    getTopMarketCapData();
  }

  getTopMarketCapData() async {
    defaultChoiceIndex = 0;
    state = ResponseModel.loading("is Loading...");
    notifyListeners();

    try {
      response = await apiProvider.getTopMarketCapData();

      if (response.statusCode == 200) {
        dataFuture = AllCryptoModel.fromJson(response.data);
        state = ResponseModel.completed(dataFuture);
      } else {
        state = ResponseModel.error("something wrong...");
      }

      notifyListeners();
    } catch (e) {
      state = ResponseModel.error("please check your connection...");
      notifyListeners();
    }
  }

  getTopGainersData() async {
    defaultChoiceIndex = 1;
    state = ResponseModel.loading("is Loading...");
    notifyListeners();

    try {
      dataFuture = (await repository.getTopGainerData());
      state = ResponseModel.completed(dataFuture);
      notifyListeners();
    } catch (e) {
      state = ResponseModel.error("please check your connection...");
      notifyListeners();
    }
  }

  getTopLosersData() async {
    defaultChoiceIndex = 2;
    state = ResponseModel.loading("is Loading...");
    notifyListeners();

    try {
      response = await apiProvider.getTopLosersData();

      if (response.statusCode == 200) {
        dataFuture = AllCryptoModel.fromJson(response.data);
        state = ResponseModel.completed(dataFuture);
      } else {
        state = ResponseModel.error("something wrong...");
      }

      notifyListeners();
    } catch (e) {
      state = ResponseModel.error("please check your connection...");
      notifyListeners();
    }
  }
}
