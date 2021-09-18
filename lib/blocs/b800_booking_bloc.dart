import 'package:field_for_rent/models/history_model.dart';

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

  // for what 801
  List<M800BookingModel> listBooking801 = [];
  final _bookingSubject801 = PublishSubject<List<M800BookingModel>>();
  Stream<List<M800BookingModel>> get bookingStream801 =>
      _bookingSubject801.stream;

  // for what 803
  List<M800BookingModel> listBooking803 = [];
  final _bookingSubject803 = PublishSubject<List<M800BookingModel>>();
  Stream<List<M800BookingModel>> get bookingStream803 =>
      _bookingSubject803.stream;

  // for what 805
  List<M800BookingModel> listBooking805 = [];
  final _bookingSubject805 = PublishSubject<List<M800BookingModel>>();
  Stream<List<M800BookingModel>> get bookingStream805 =>
      _bookingSubject805.stream;

  // for what 807
  List<M800BookingModel> listBooking807 = [];
  final _bookingSubject807 = PublishSubject<List<M800BookingModel>>();
  Stream<List<M800BookingModel>> get bookingStream807 =>
      _bookingSubject807.stream;

  // for what 808
  List<M800BookingModel> listBooking808 = [];
  final _bookingSubject808 = PublishSubject<List<M800BookingModel>>();
  Stream<List<M800BookingModel>> get bookingStream808 =>
      _bookingSubject808.stream;

  // for what 809
  List<HistoryModel> listHistory809 = [];
  final _historySubject809 = PublishSubject<List<HistoryModel>>();
  Stream<List<HistoryModel>> get historyStream809 => _historySubject809.stream;

  ///
  /// dispose subject
  ///
  void dispose() {
    _bookingSubject800.close();
    _bookingSubject801.close();
    _bookingSubject803.close();
    _bookingSubject805.close();
    _bookingSubject807.close();
    _bookingSubject808.close();
    _historySubject809.close();
  }

  ///
  /// ignore: slash_for_doc_comments
  /// callWhat800 get all data Booking
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

  ///
  ///callWhat801 insert data
  ///
  callWhat801(String eventName, DateTime from, DateTime to, int status,
      String userId, String fieldId, String total) async {
    try {
      var what = 801;
      var param = {
        "Message": eventName,
        "Start": "$from",
        "End": "$to",
        "Status": status,
        "User_Id": userId,
        "Field_Id": fieldId,
        "Total": total
      };

      await _repository.executeService(what, param).then((value) {
        if (value.length != 0) {
          listBooking801.addAll(value);
        } else {
          listBooking801 = [];
        }
      }).whenComplete(() {
        _bookingSubject801.sink.add(listBooking801);
      });
    } catch (e) {
      print(e);
      throw e;
    }
  }

  ///
  ///callWhat803 delete all data Booking
  ///
  callWhat803(int id) async {
    try {
      var what = 803;
      var param = {"id": id};

      await _repository.executeService(what, param).then((value) {
        if (value.length != 0) {
          listBooking803.addAll(value);
        } else {
          listBooking803 = [];
        }
      }).whenComplete(() {
        _bookingSubject803.sink.add(listBooking803);
      });
    } catch (e) {
      print(e);
      throw e;
    }
  }

  ///
  ///callWhat805 get data limit
  ///@page : number pagination
  ///@limit : limit of pagination
  ///@isPullRefresh: default is false
  ///
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

  ///
  ///callWhat807 get data with Field_Id
  ///
  callWhat807(int fieldId) async {
    try {
      var what = 807;
      var param = {"Field_Id": fieldId};
      listBooking807 = [];
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

  ///
  ///callWhat808 get data with User_Id
  ///
  callWhat808(int userId) async {
    try {
      var what = 808;
      var param = {"User_Id": userId};

      await _repository.executeService(what, param).then((value) {
        if (value.length != 0) {
          listBooking808.addAll(value);
        } else {
          listBooking808 = [];
        }
      }).whenComplete(() {
        _bookingSubject808.sink.add(listBooking808);
      });
    } catch (e) {
      print(e);
      throw e;
    }
  }

  ///
  ///callWhat808 get data with User_Id and Field_Name
  ///
  callWhat809(int userId) async {
    try {
      var what = 809;
      var param = {"User_Id": userId};

      await _repository.executeService(what, param).then((value) {
        if (value.length != 0) {
          listHistory809.addAll(value);
        } else {
          listHistory809 = [];
        }
      }).whenComplete(() {
        _historySubject809.sink.add(listHistory809);
      });
    } catch (e) {
      print(e);
      throw e;
    }
  }
}
