import '../models/models.dart';
import '../repositories/repositories.dart';
import 'package:rxdart/rxdart.dart';

class FootbalFieldBloc {
  final _repository = Repository();

  // for what 700
  List<M700FootbalFieldModel> listFootbalField700 = [];
  final _footbalFieldSubject700 = PublishSubject<List<M700FootbalFieldModel>>();
  Stream<List<M700FootbalFieldModel>> get footbalFieldStream700 =>
      _footbalFieldSubject700.stream;

  // for what 704
  List<M700FootbalFieldModel> listFootbalField704 = [];
  final _footbalFieldSubject704 = PublishSubject<List<M700FootbalFieldModel>>();
  Stream<List<M700FootbalFieldModel>> get footbalFieldStream704 =>
      _footbalFieldSubject704.stream;

  // for what 705
  List<M700FootbalFieldModel> listFootbalField705 = [];
  final _footbalFieldSubject705 = PublishSubject<List<M700FootbalFieldModel>>();
  Stream<List<M700FootbalFieldModel>> get footbalFieldStream705 =>
      _footbalFieldSubject705.stream;

  /**                                                                                                                                                                                           
   * dispose subject                                                                                                                                                                            
   */
  void dispose() {
    _footbalFieldSubject700.close();
    _footbalFieldSubject704.close();
    _footbalFieldSubject705.close();
  }

  /**                                                                                                                                                                                           
   * callWhat700 get all data FootbalField                                                                                                                             
   */
  callWhat700() async {
    try {
      var what = 700;
      await _repository.executeService(what, {}).then((value) {
        if (value.length != 0) {
          listFootbalField700.addAll(value);
        } else {
          listFootbalField700 = [];
        }
      }).whenComplete(() {
        _footbalFieldSubject700.sink.add(listFootbalField700);
      });
    } catch (e) {
      print(e);
      throw e;
    }
  }

  /**                                                                                                                                                                                           
   * callWhat704 get data with id                                                                                                                             
   */
  callWhat704(int id) async {
    try {
      var what = 704;
      var param = {"idField": id};

      await _repository.executeService(what, param).then((value) {
        if (value.length != 0) {
          listFootbalField704.addAll(value);
        } else {
          listFootbalField704 = [];
        }
      }).whenComplete(() {
        _footbalFieldSubject704.sink.add(listFootbalField704);
      });
    } catch (e) {
      print(e);
      throw e;
    }
  }

  /**                                                                                                                                                                                           
   * callWhat705 get data limit                                                                                                                                                  
   * @page : number pagination                                                                                                                                                                  
   * @limit : limit of pagination                                                                                                                                                               
   * @isPullRefresh: default is false                                                                                                                                                           
   */
  callWhat705(int page, int limit, {bool isPullRefresh: false}) async {
    try {
      var what = 705;
      var param = {"offset": page * limit, "limit": limit};

      await _repository.executeService(what, param).then((value) {
        if (value.length != 0) {
          // clear data when pull refresh
          if (isPullRefresh == true) {
            listFootbalField705 = [];
            listFootbalField705.addAll(value);
          } else {
            // add more data
            listFootbalField705.addAll(value);
          }
        }
      }).whenComplete(() {
        _footbalFieldSubject705.sink.add(listFootbalField705);
      });
    } catch (e) {
      print(e);
      throw e;
    }
  }
}
