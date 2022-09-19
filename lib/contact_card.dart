import 'package:flutter/material.dart';
import 'package:flutter_course_summer_2022/constants.dart';
import 'package:flutter_course_summer_2022/main.dart';

class ContactCard extends StatelessWidget {
  String? image;
  String contact;
  String? message;
  String? date;
  int unreadMessaged;
  ContactCard(
      {Key? key,
      this.image,
      required this.contact,
      this.message,
      this.date,
      required this.unreadMessaged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: EdgeInsets.only(top: 16, bottom: 16, right: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              width: 60,
              height: 60,
              child: CircleAvatar(
                foregroundImage: detectImage(),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spacer(),
              Text(
                '$contact',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              Spacer(),
              Text(
                '$message',
              ),
              Spacer()
            ],
          ),
          const Spacer(),
          Column(
            children: [
              Spacer(),
              Text(
                '6:42 PM',
                style: TextStyle(color: detectDateColor()),
              ),
              Spacer(),
              unreadMessaged > 0
                  ? SizedBox(
                      width: 25,
                      height: 25,
                      child: CircleAvatar(
                        backgroundColor: MaterialColor(0xFF25D366, color),
                        child: const Text(
                          '4',
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      ),
                    )
                  : const SizedBox(
                      width: 0,
                      height: 0,
                    ),
              Spacer()
            ],
          )
        ],
      ),
    );
  }

  ImageProvider<Object> detectImage() {
    if (this.image != null) {
      return NetworkImage(image ?? '');
    } else {
      return const AssetImage('assets/default-user.jpg');
    }
  }

  Color detectDateColor() {
    if (this.unreadMessaged > 0) {
      return MaterialColor(0xFF25D366, color);
    } else {
      return Colors.grey;
    }
  }
}
