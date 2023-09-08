
import 'package:dio/dio.dart';
import 'package:notes_app/API/restClient.dart';


final dio = Dio(); // Provide a dio instance/ config your dio headers globally
final client = RestClient(dio);