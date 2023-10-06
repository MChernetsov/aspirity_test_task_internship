import 'package:flutter/material.dart';
import 'package:internship/domain/post.dart';

class PostCard extends StatelessWidget {
  const PostCard({
    Key? key,
    required this.onTap,
    required this.post,
  }) : super(key: key);

  final VoidCallback onTap;
  final Post post;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        vertical: 4,
        horizontal: 16,
      ),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post.title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                post.body,
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
              )
            ],
          ),
        ),
      ),
    );
  }
}
