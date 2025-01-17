import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_electric_application/src/config/Result.dart';
import 'package:smart_electric_application/src/data/dto/JwtTokenDTO.dart';
import 'package:smart_electric_application/src/data/retrofit/AuthRetrofit.dart';
import 'package:smart_electric_application/src/domain/model/UserModel.dart';
import 'package:smart_electric_application/src/domain/repository_interface/AuthRepositoryInterface.dart';

class AuthRepository implements AuthRepositoryInterface {
  /// firebase id token을 이용해 서버에서 access/refresh 토큰 발급받기
  @override
  Future<Result<JwtTokenDTO, String>> requestJwt(String firebaseIdToken) async {
    try {
      final dio = Dio();
      final authRetrofit = AuthRetrofit(dio);

      // 서버에서 firbase id token으로 access/refresh token 발급받기
      JwtTokenDTO jwtTokens =
          await authRetrofit.requestJwt('Bearer ${firebaseIdToken}');

      return Result.success(jwtTokens);
    } catch (err) {
      return Result.failure(err.toString());
    }
  }

  /// 내부 저장소의 토큰값 읽어오기
  @override
  Future<Result<JwtTokenDTO, String>> getJwt() async {
    try {
      const storage = FlutterSecureStorage();

      // access/refesh token 내부 DB에 저장하기
      var accessToken = await storage.read(key: 'ACCESS_TOKEN');
      var refreshToken = await storage.read(key: 'REFRESH_TOKEN');

      if (accessToken != null && refreshToken != null) {
        var jwtTokenDTO =
            JwtTokenDTO(accessToken: accessToken, refreshToken: refreshToken);
        return Result.success(jwtTokenDTO);
      } else {
        return const Result.failure("Token null");
      }
    } catch (err) {
      return Result.failure(err.toString());
    }
  }

  /// 서버에서 받은 access/refresh 토큰을 내부 DB에 저장하기
  @override
  Future<Result<bool, String>> saveJwt(JwtTokenDTO tokens) async {
    try {
      const storage = FlutterSecureStorage();

      // 기존 로그인 정보 초기화
      await storage.deleteAll();

      // access/refesh token 내부 DB에 저장하기
      await storage.write(key: 'ACCESS_TOKEN', value: tokens.accessToken);
      await storage.write(key: 'REFRESH_TOKEN', value: tokens.refreshToken);

      return const Result.success(true);
    } catch (err) {
      return Result.failure(err.toString());
    }
  }

  @override
  Future<Result<bool, String>> removeJwt() async {
    try {
      const storage = FlutterSecureStorage();

      // 기존 로그인 정보 초기화
      await storage.deleteAll();

      return const Result.success(true);
    } catch (err) {
      return Result.failure(err.toString());
    }
  }

  @override
  Future<Result<bool, String>> checkEmailDuplicate(String email) async {
    try {
      final dio = Dio();
      final authRetrofit = AuthRetrofit(dio);

      var emailDuplicateResult = await authRetrofit.checkEmailDuplicate(email);

      if (emailDuplicateResult.isEmailDuplicated == true) {
        return const Result.success(true);
      } else {
        return const Result.success(false);
      }
    } catch (err) {
      return Result.failure(err.toString());
    }
  }

  @override
  Future<Result<bool, String>> saveEmail(String email) async {
    try {
      final dio = Dio();
      final authRetrofit = AuthRetrofit(dio);

      var saveEmailResult = await authRetrofit.saveEmail(email);

      if (saveEmailResult.updated == true) {
        return const Result.success(true);
      } else {
        return const Result.success(false);
      }
    } catch (err) {
      return Result.failure(err.toString());
    }
  }

  @override
  Future<Result<bool, String>> saveUser(
      {required String customerNumber,
      required String name,
      required String email,
      required bool isSmartMeter,
      required String billDate}) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('customerNumber', customerNumber);
      await prefs.setString('name', name);
      await prefs.setString('email', email);
      await prefs.setBool('isSmartMeter', isSmartMeter);
      await prefs.setString('billDate', billDate);

      return const Result.success(true);
    } catch (err) {
      return Result.failure(err.toString());
    }
  }

  @override
  Future<UserModel> getUser() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      String? customerNumber = prefs.getString('customerNumber');
      String? name = prefs.getString('name');
      String? email = prefs.getString('email');
      bool? isSmartMeter = prefs.getBool('isSmartMeter');
      String? billDate = prefs.getString('billDate');

      if (customerNumber == null &&
          name == null &&
          email == null &&
          isSmartMeter == null) {
        throw Exception("found null");
      }

      return UserModel(
          customerNumber: customerNumber!,
          name: name!,
          email: email!,
          isSmartMeter: isSmartMeter!,
          billDate: billDate!);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<Result<String, String>> getCustomerNumber() async {
    try {
      final prefs = await SharedPreferences.getInstance();

      var customerNumber = prefs.getString('customerNumber');

      return Result.success(customerNumber);
    } catch (err) {
      return Result.failure(err.toString());
    }
  }

  @override
  Future<Result<bool, String>> removeEmail(email) async {
    try {
      final dio = Dio();
      final authRetrofit = AuthRetrofit(dio);

      await authRetrofit.removeEmail(email);

      return const Result.success(true);
    } catch (err) {
      return Result.failure(err.toString());
    }
  }

  @override
  Future<Result<String, String>> getEmail() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      String? email = prefs.getString('email');

      return Result.success(email!);
    } catch (err) {
      return Result.failure(err.toString());
    }
  }

  @override
  Future<Result<bool, String>> removeUser() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('customerNumber');
      await prefs.remove('name');
      await prefs.remove('email');
      await prefs.remove('isSmartMeter');

      return const Result.success(true);
    } catch (err) {
      return Result.failure(err.toString());
    }
  }

  @override
  Future<Result<String, String>> getUserName() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      var userName = prefs.getString('name');

      if (userName == null) {
        return const Result.failure("The name is null");
      }

      return Result.success(userName);
    } catch (err) {
      return Result.failure(err.toString());
    }
  }

  @override
  Future<Result<bool, String>> getIsSmartMeter() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      var isSmartMeter = prefs.getBool('isSmartMeter');

      if (isSmartMeter == null) {
        return const Result.failure("The isSmartMeter is null");
      }

      return Result.success(isSmartMeter);
    } catch (err) {
      return Result.failure(err.toString());
    }
  }

  @override
  Future<Result<bool, String>> saveAddress(String address) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('address', address);

      return Result.success(true);
    } catch (err) {
      return Result.failure(err.toString());
    }
  }

  @override
  Future<Result<String?, String>> getAddress() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      var address = prefs.getString('address');

      return Result.success(address);
    } catch (err) {
      return Result.failure(err.toString());
    }
  }

  @override
  Future<Result<bool, String>> checkLogin() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      var isLogin = prefs.getBool('isLogin');

      if (isLogin == null || isLogin == false) {
        return Result.success(false);
      } else {
        return Result.success(true);
      }
    } catch (err) {
      return Result.failure(err.toString());
    }
  }

  @override
  Future<Result<bool, String>> setLogin() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLogin', true);

      return Result.success(true);
    } catch (err) {
      return Result.failure(err.toString());
    }
  }
}
