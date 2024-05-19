import 'package:flutter/material.dart';
import 'package:practice/screens/generic/upload/upload_announcement.dart';
import 'package:practice/widgets/pt_wrapper.dart';

class TeacherAnnouncementPage extends StatefulWidget {
  const TeacherAnnouncementPage({super.key});

  @override
  State<TeacherAnnouncementPage> createState() => _TeacherAnnouncementPageState();
}

class _TeacherAnnouncementPageState extends State<TeacherAnnouncementPage> {
  @override
  Widget build(BuildContext context) {
    return const PTWrapper(tabBarView1: UploadAnnouncement(), tabBarView2: SizedBox(), firstTabTitle: "ANNOUNCEMENT", title: "Announcement");
  }
}
