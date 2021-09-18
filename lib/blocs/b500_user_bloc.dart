import '../models/models.dart';
import '../repositories/repositories.dart';
import 'package:rxdart/rxdart.dart';

class UserBloc {
  final _repository = Repository();

  // for what 500
  List<M500UserModel> listUser500 = [];
  final _userSubject500 = PublishSubject<List<M500UserModel>>();
  Stream<List<M500UserModel>> get userStream500 => _userSubject500.stream;

  // for what 501
  List<M500UserModel> listUser501 = [];
  final _userSubject501 = PublishSubject<List<M500UserModel>>();
  Stream<List<M500UserModel>> get userStream501 => _userSubject501.stream;

  // for what 502
  List<M500UserModel> listUser502 = [];
  final _userSubject502 = PublishSubject<List<M500UserModel>>();
  Stream<List<M500UserModel>> get userStream502 => _userSubject502.stream;

  // for what 504
  List<M500UserModel> listUser504 = [];
  final _userSubject504 = PublishSubject<List<M500UserModel>>();
  Stream<List<M500UserModel>> get userStream504 => _userSubject504.stream;

  // for what 505
  List<M500UserModel> listUser505 = [];
  final _userSubject505 = PublishSubject<List<M500UserModel>>();
  Stream<List<M500UserModel>> get userStream505 => _userSubject505.stream;

  // for what 507
  List<M500UserModel> listUser507 = [];
  final _userSubject507 = PublishSubject<List<M500UserModel>>();
  Stream<List<M500UserModel>> get userStream507 => _userSubject507.stream;

  ///
  ///dispose subject
  ///
  void dispose() {
    _userSubject500.close();
    _userSubject501.close();
    _userSubject502.close();
    _userSubject504.close();
    _userSubject505.close();
    _userSubject507.close();
  }

  ///
  ///callWhat500 get all data User
  ///
  callWhat500() async {
    try {
      var what = 500;

      await _repository.executeService(what, {}).then((value) {
        if (value.length != 0) {
          listUser500.addAll(value);
        } else {
          listUser500 = [];
        }
      }).whenComplete(() {
        _userSubject500.sink.add(listUser500);
      });
    } catch (e) {
      print(e);
      throw e;
    }
  }

  ///
  ///callWhat501 insert data User
  ///
  callWhat501(String name, String phone, String email, String password,
      String avatarUrl) async {
    try {
      var what = 501;
      var param = {
        "Name": name,
        "Phone": phone,
        "Email": email,
        "Password": password,
        "Avatar_Url": avatarUrl,
      };

      await _repository.executeService(what, param).then((value) {
        if (value.length != 0) {
          listUser501.addAll(value);
        } else {
          listUser501 = [];
        }
      }).whenComplete(() {
        _userSubject501.sink.add(listUser501);
      });
    } catch (e) {
      print(e);
      throw e;
    }
  }

  ///
  ///callWhat502 update data User
  ///
  callWhat502(int id, String name, String phone, String email, String password,
      String avatarUrl) async {
    try {
      var what = 502;
      var param = {
        "id": "$id",
        "Name": name,
        "Phone": phone,
        "Email": email,
        "Password": password,
        "Avatar_Url": avatarUrl,
      };

      await _repository.executeService(what, param).then((value) {
        if (value.length != 0) {
          listUser502.addAll(value);
        } else {
          listUser502 = [];
        }
      }).whenComplete(() {
        _userSubject502.sink.add(listUser502);
      });
    } catch (e) {
      print(e);
      throw e;
    }
  }

  ///
  ///callWhat504 get data with id
  ///
  callWhat504(int id) async {
    try {
      var what = 504;
      var param = {"id": id};
      listUser504 = [];
      await _repository.executeService(what, param).then((value) {
        if (value.length != 0) {
          listUser504.addAll(value);
        } else {
          listUser504 = [];
        }
      }).whenComplete(() {
        _userSubject504.sink.add(listUser504);
      });
    } catch (e) {
      print(e);
      throw e;
    }
  }

  ///
  ///callWhat505 get data limit
  ///@page : number pagination
  ///@limit : limit of pagination
  ///@isPullRefresh: default is false
  ///
  callWhat505(int page, int limit, {bool isPullRefresh: false}) async {
    try {
      var what = 505;
      var param = {"offset": page * limit, "limit": limit};

      await _repository.executeService(what, param).then((value) {
        if (value.length != 0) {
          // clear data when pull refresh
          if (isPullRefresh == true) {
            listUser505 = [];
            listUser505.addAll(value);
          } else {
            // add more data
            listUser505.addAll(value);
          }
        }
      }).whenComplete(() {
        _userSubject505.sink.add(listUser505);
      });
    } catch (e) {
      print(e);
      throw e;
    }
  }

  ///
  ///callWhat502 update data User
  ///
  callWhat507(int id, String name, String phone) async {
    try {
      var what = 507;
      var param = {
        "id": "$id",
        "Name": name,
        "Phone": phone,
      };

      await _repository.executeService(what, param).then((value) {
        if (value.length != 0) {
          listUser507.addAll(value);
        } else {
          listUser507 = [];
        }
      }).whenComplete(() {
        _userSubject507.sink.add(listUser507);
      });
    } catch (e) {
      print(e);
      throw e;
    }
  }
}
