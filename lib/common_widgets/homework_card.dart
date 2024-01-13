import 'package:flutter/material.dart';

class HomeWorkCard extends StatefulWidget {
  final String title;
  final String date;
  final bool status;
  const HomeWorkCard({super.key,required this.title,required this.date,this.status =false});

  @override
  State<HomeWorkCard> createState() => _HomeWorkCardState();
}

class _HomeWorkCardState extends State<HomeWorkCard> {
  bool? toogle;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    toogle = widget.status;

  }

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: const BoxDecoration(
          color: Color(0xfffff1ec),

        borderRadius: BorderRadius.all(Radius.circular(12))
      ),
      child:  Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 8),
        child: InkWell(
          onTap: (){
            toogle = !toogle!;
            setState(() {

            });
          },
          child:  Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: toogle!?const Icon(Icons.check_circle):const Icon(Icons.circle_outlined),
              ),
               Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width*.75,
                      child: Text(widget.title??"", style:  const TextStyle(fontWeight: FontWeight.w600 ),softWrap: true,overflow: TextOverflow.clip ,)),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Text(widget.date,style: const TextStyle(fontWeight: FontWeight.normal,color: Colors.grey),),
                  )

                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
