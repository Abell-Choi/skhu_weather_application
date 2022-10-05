import 'package:flutter/material.dart';

class HelpingForBlueArchive extends StatefulWidget {
  const HelpingForBlueArchive({super.key});

  @override
  State<HelpingForBlueArchive> createState() => _HelpingForBlueArchiveState();
}

class _HelpingForBlueArchiveState extends State<HelpingForBlueArchive> {
  @override
  Widget build(BuildContext context) {
    String lnk = 'https://ac2-p2.namu.la/20221005sac2/f008982c14d0056332e45d82b024d35d73750e79adafe5ebdd1cadb733f0f5d7.jpg?type=orig';
    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              width: 150,
              height: 130,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
              color: Colors.white,
                borderRadius: BorderRadius.circular(20)
              ),
              child: Container(
                width: 80,
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: NetworkImage(lnk),
                    fit: BoxFit.fill
                  )
                ),
            ),
            )
          ],
        )
      ),
    );
  }
}