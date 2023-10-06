import 'package:internship/domain/comment.dart';
import 'package:internship/domain/post.dart';
import 'package:internship/domain/user.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: "https://jsonplaceholder.typicode.com/")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/posts")
  Future<List<Post>> getPosts();

  @GET("/posts/{id}")
  Future<Post> getPost(
    @Path() int id,
  );

  @GET("/comments")
  Future<List<Comment>> getComments(
    @Query("postId") int postId,
  );

  @GET("/users")
  Future<List<User>> getUser();
}
