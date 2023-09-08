
import 'package:dio/dio.dart' hide Headers;
import 'package:dio/io.dart';
import 'package:notes_app/API/get.dart';
import 'package:notes_app/API/post_model.dart';
import 'dart:io';
import 'package:retrofit/retrofit.dart';
part 'restClient.g.dart';


@RestApi(baseUrl: 'https://nutty-lingerie-frog.cyclic.app/tasks/')
abstract class RestClient {

  factory RestClient(Dio dio, {String? baseUrl}) {
    dio
      ..options = BaseOptions(receiveTimeout: Duration(seconds: 30000), connectTimeout: Duration(seconds: 30000))
      ..httpClientAdapter = (DefaultHttpClientAdapter()
        ..onHttpClientCreate = (client) {
          client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
          return client;
        })
      ..interceptors.addAll([
        InterceptorsWrapper(
          onRequest: (options, handler) {
            // Do something before request is sent
            options.headers.addAll(<String, String>{"Content-Type": "application/json"});
            print(options);
            return handler.next(options); // continue
          },
          onResponse: (response, handler) {
            // Do something with response data
            print(response);
            return handler.next(response); // continue
          },
          onError: (DioError error, handler) {
            // Error handling
            print(error.message);
            return handler.next(error); // continue
          },
        ),
  
        LogInterceptor(responseBody: true, requestBody: true), // Logging
      ]);

    return _RestClient(dio, baseUrl: baseUrl);
  }

  @POST("/createTask")
  Future<GetTask> AddTaskResquest(@Body()  AddTask addTask);


  @GET("/getTask")
  Future<List<GetTask>> getTasks();

  @DELETE("/{taskId}") 
  Future<void> deleteTask(@Path("taskId") String taskId);


  @PUT("/{taskId}") // Replace with your API endpoint to update a task
  Future<GetTask> updateTask(@Path("taskId") String taskId, @Body() GetTask updatedTask);


}