import 'package:flutter/material.dart';
import 'package:internship/domain/comment.dart';

class CommentTile extends StatelessWidget {
  const CommentTile({
    Key? key,
    required this.comment,
  }) : super(key: key);

  final Comment comment;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: Text(
                comment.name,
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
                comment.email,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            comment.body,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 8,
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
