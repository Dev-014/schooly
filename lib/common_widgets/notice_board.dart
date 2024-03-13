import 'package:flutter/material.dart';

class NoticeBoard extends StatefulWidget {
  final String notice;
  final String date;
  final String? image;
  final double? height;
  final double? width;
  const NoticeBoard(
      {super.key,
      required this.notice,
      required this.date,
      this.image,
      this.height,
      this.width});

  @override
  State<NoticeBoard> createState() => _NoticeBoardState();
}

class _NoticeBoardState extends State<NoticeBoard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          constraints: BoxConstraints(
              minWidth: 150,
              maxWidth: widget.width ?? 150,
              minHeight: widget.height ?? 150),
          padding: EdgeInsets.all(12),
          // alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color:  Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Padding(
                  padding: EdgeInsets.symmetric(vertical: 2),
                  child: Icon(Icons.ac_unit)),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 2.0),
                child: Text(widget.notice, softWrap: true),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  widget.date,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
