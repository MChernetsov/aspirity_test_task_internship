import 'package:internship/domain/comment.dart';
import 'package:internship/domain/post.dart';
import 'package:internship/domain/user.dart';
import 'package:internship/infrastructure/service/rest_client.dart';
import 'package:mocktail/mocktail.dart';

class MockRestClient extends Mock implements RestClient {
  static const tPost = Post(
    userId: 0,
    id: 0,
    title: 'test post',
    body: 'test',
  );

  static const tComment = Comment(
    postId: 0,
    id: 0,
    name: 'test',
    email: 'test',
    body: 'test comment',
  );

  static const tUser = User(id: 0, username: 'test user', email: 'test');

  @override
  Future<List<Post>> getPosts() async => [tPost];

  @override
  Future<Post> getPost(
    int? id,
  ) async =>
      tPost;

  @override
  Future<List<Comment>> getComments(
    int? postId,
  ) async =>
      [tComment];

  @override
  Future<List<User>> getUser() async => [tUser];
}
