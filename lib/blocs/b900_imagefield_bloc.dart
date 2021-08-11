import '../models/models.dart';
import '../repositories/repositories.dart';
import 'package:rxdart/rxdart.dart';

class ImageFieldBloc {
  final _repository = Repository();

  // for what 900
  List<M900ImageFieldModel> listImageField900 = [];
  final _imageFieldSubject900 = PublishSubject<List<M900ImageFieldModel>>();
  Stream<List<M900ImageFieldModel>> get imageFieldStream900 =>
      _imageFieldSubject900.stream;

  // for what 905
  List<M900ImageFieldModel> listImageField905 = [];
  final _imageFieldSubject905 = PublishSubject<List<M900ImageFieldModel>>();
  Stream<List<M900ImageFieldModel>> get imageFieldStream905 =>
      _imageFieldSubject905.stream;

  // for what 907
  List<M900ImageFieldModel> listImageField907 = [];
  final _imageFieldSubject907 = PublishSubject<List<M900ImageFieldModel>>();
  Stream<List<M900ImageFieldModel>> get imageFieldStream907 =>
      _imageFieldSubject907.stream;

  /**                                                                                                                                                                                           
   * dispose subject                                                                                                                                                                            
   */
  void dispose() {
    _imageFieldSubject900.close();
    _imageFieldSubject905.close();
    _imageFieldSubject907.close();
  }

  /**                                                                                                                                                                                           
   * callWhat900 get all data ImageField                                                                                                                             
   */
  callWhat900() async {
    try {
      var what = 900;

      await _repository.executeService(what, {}).then((value) {
        if (value.length != 0) {
          listImageField900.addAll(value);
        } else {
          listImageField900 = [];
        }
      }).whenComplete(() {
        _imageFieldSubject900.sink.add(listImageField900);
      });
    } catch (e) {
      print(e);
      throw e;
    }
  }

  /**                                                                                                                                                                                           
   * callWhat905 get data limit                                                                                                                                                  
   * @page : number pagination                                                                                                                                                                  
   * @limit : limit of pagination                                                                                                                                                               
   * @isPullRefresh: default is false                                                                                                                                                           
   */
  callWhat905(int page, int limit, {bool isPullRefresh: false}) async {
    try {
      var what = 905;
      var param = {"offset": page * limit, "limit": limit};

      await _repository.executeService(what, param).then((value) {
        if (value.length != 0) {
          // clear data when pull refresh
          if (isPullRefresh == true) {
            listImageField905 = [];
            listImageField905.addAll(value);
          } else {
            // add more data
            listImageField905.addAll(value);
          }
        }
      }).whenComplete(() {
        _imageFieldSubject905.sink.add(listImageField905);
      });
    } catch (e) {
      print(e);
      throw e;
    }
  }

  /**                                                                                                                                                                                           
   * callWhat907 get data with Field_Id                                                                                                                             
   */
  callWhat907(int fieldId) async {
    try {
      var what = 907;
      var param = {"Field_Id": fieldId};

      await _repository.executeService(what, param).then((value) {
        if (value.length != 0) {
          listImageField907.addAll(value);
        } else {
          listImageField907 = [];
        }
      }).whenComplete(() {
        _imageFieldSubject907.sink.add(listImageField907);
      });
    } catch (e) {
      print(e);
      throw e;
    }
  }
}
