import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:internship/domain/post.dart';
import 'package:internship/domain/user.dart';

class FullPost extends StatelessWidget {
  const FullPost({
    Key? key,
    required this.post,
    required this.user,
  }) : super(key: key);

  final Post post;
  final User user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 24,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: Text(
                user.username,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              )),
              const SizedBox(
                width: 16,
              ),
              Text(
                user.email,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            post.title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            post.body,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          const Divider(
            height: 1,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
