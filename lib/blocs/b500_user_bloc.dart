import '../models/models.dart';
import '../repositories/repositories.dart';
import 'package:rxdart/rxdart.dart';

class UserBloc {
  final _repository = Repository();

  // for what 500
  List<M500UserModel> listUser500 = [];
  final _userSubject500 = PublishSubject<List<M500UserModel>>();
  Stream<List<M500UserModel>> get userStream500 => _userSubject500.stream;

  // for what 505
  List<M500UserModel> listUser505 = [];
  final _userSubject505 = PublishSubject<List<M500UserModel>>();
  Stream<List<M500UserModel>> get userStream505 => _userSubject505.stream;

  /**                                                                                                                                                                                           
   * dispose subject                                                                                                                                                                            
   */
  void dispose() {
    _userSubject500.close();
    _userSubject505.close();
  }

  /**                                                                                                                                                                                           
   * callWhat500 get all data User                                                                                                                             
   */
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

  /**                                                                                                                                                                                           
   * callWhat505 get data limit                                                                                                                                                  
   * @page : number pagination                                                                                                                                                                  
   * @limit : limit of pagination                                                                                                                                                               
   * @isPullRefresh: default is false                                                                                                                                                           
   */
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
}
