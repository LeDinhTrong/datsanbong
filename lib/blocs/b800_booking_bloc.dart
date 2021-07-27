import '../models/models.dart';
import '../repositories/repositories.dart';
import 'package:rxdart/rxdart.dart';

class BookingBloc {
  final _repository = Repository();

  // for what 800
  List<M800BookingModel> listBooking800 = [];
  final _bookingSubject800 = PublishSubject<List<M800BookingModel>>();
  Stream<List<M800BookingModel>> get bookingStream800 =>
      _bookingSubject800.stream;

  // for what 805
  List<M800BookingModel> listBooking805 = [];
  final _bookingSubject805 = PublishSubject<List<M800BookingModel>>();
  Stream<List<M800BookingModel>> get bookingStream805 =>
      _bookingSubject805.stream;

  // for what 807
  List<M800BookingModel> listBooking807 = [];
  final _bookingSubject807 = PublishSubject<List<M800BookingModel>>();
  Stream<List<M800BookingModel>> get bookingStream807 =>
      _bookingSubject805.stream;

  /**                                                                                                                                                                                           
   * dispose subject                                                                                                                                                                            
   */
  void dispose() {
    _bookingSubject800.close();
    _bookingSubject805.close();
  }

  /**                                                                                                                                                                                           
   * callWhat800 get all data Booking                                                                                                                             
   */
  callWhat800() async {
    try {
      var what = 800;

      await _repository.executeService(what, {}).then((value) {
        if (value.length != 0) {
          listBooking800.addAll(value);
        } else {
          listBooking800 = [];
        }
      }).whenComplete(() {
        _bookingSubject800.sink.add(listBooking800);
      });
    } catch (e) {
      print(e);
      throw e;
    }
  }

  /**                                                                                                                                                                                           
   * callWhat805 get data limit                                                                                                                                                  
   * @page : number pagination                                                                                                                                                                  
   * @limit : limit of pagination                                                                                                                                                               
   * @isPullRefresh: default is false                                                                                                                                                           
   */
  callWhat805(int page, int limit, {bool isPullRefresh: false}) async {
    try {
      var what = 805;
      var param = {"offset": page * limit, "limit": limit};

      await _repository.executeService(what, param).then((value) {
        if (value.length != 0) {
          // clear data when pull refresh
          if (isPullRefresh == true) {
            listBooking805 = [];
            listBooking805.addAll(value);
          } else {
            // add more data
            listBooking805.addAll(value);
          }
        }
      }).whenComplete(() {
        _bookingSubject805.sink.add(listBooking805);
      });
    } catch (e) {
      print(e);
      throw e;
    }
  }

  /**                                                                                                                                                                                           
   * callWhat807 get data with Field_Id                                                                                                                             
   */
  callWhat807(String fieldId) async {
    try {
      var what = 807;
      var param = {"Field_Id": fieldId};

      await _repository.executeService(what, param).then((value) {
        if (value.length != 0) {
          listBooking807.addAll(value);
        } else {
          listBooking807 = [];
        }
      }).whenComplete(() {
        _bookingSubject807.sink.add(listBooking807);
      });
    } catch (e) {
      print(e);
      throw e;
    }
  }
}
