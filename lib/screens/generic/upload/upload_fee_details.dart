import 'package:flutter/material.dart';
import 'package:practice/services/other/fee_detail/fee_detail_services.dart';

class UploadFeeDetail extends StatefulWidget {
  const UploadFeeDetail({super.key});

  @override
  State<UploadFeeDetail> createState() => _UploadFeeDetailState();
}

class _UploadFeeDetailState extends State<UploadFeeDetail> {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0,horizontal: 24),
            child: Text("Upload fee details excel sheet in given format", style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 20
            ),),
          ),
          Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
            child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () async{
                   FeeDetailService.uploadFeeDataFromExcel(context: context);
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          20), // Adjust the value as needed
                    ),
                  ),
                  child: const Text("Upload Files"),
                )),
          )

        ],
      ),
    );
  }
}
