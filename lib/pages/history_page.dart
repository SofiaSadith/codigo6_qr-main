import 'package:codigo6_qr/db/db_admin.dart';
import 'package:codigo6_qr/models/qr_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                const Text(
                  "Historial general",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 12.0,
                ),
                const Text(
                  "Listado general de tus QR registrados.",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                FutureBuilder(
                  future: DBAdmin().getQRList(),
                  builder: (BuildContext context, AsyncSnapshot snap) {
                    if (snap.hasData) {
                      List<QRModel> qrList = snap.data;
                      return ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: qrList.length,
                        itemBuilder: (BuildContext context, int index) {
                          //Validar si es o no un url

                          // bool isUrl = false;
                          // if (qrList[index].url.contains("http")) {
                          //   isUrl = true;
                          // }

                          bool isUrl = qrList[index].url.contains("http");

                          return Container(
                            margin: const EdgeInsets.symmetric(vertical: 10.0),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12.0,
                              vertical: 14.0,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.09),
                              borderRadius: BorderRadius.circular(14.0),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.calendar_month,
                                            size: 14.0,
                                            color: Colors.white54,
                                          ),
                                          Text(
                                            " ${qrList[index].datetime}",
                                            style: TextStyle(
                                              color: Colors.white54,
                                              fontSize: 14.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                        qrList[index].title,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16.0,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                        qrList[index].observation,
                                        style: TextStyle(
                                          color: Colors.white54,
                                          fontSize: 14.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                isUrl
                                    ? IconButton(
                                        onPressed: () {
                                          Uri uri =
                                              Uri.parse(qrList[index].url);
                                          launchUrl(uri,
                                              mode: LaunchMode
                                                  .externalApplication);
                                        },
                                        icon: Icon(
                                          Icons.link,
                                          color: Colors.white,
                                        ),
                                      )
                                    : const SizedBox(),
                                IconButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Dialog(
                                            child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 11.0,
                                                        vertical: 23.0),
                                                child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Text(qrList[index].title,style: TextStyle(fontSize: 18)),
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [
                                                          Icon(
                                                            Icons
                                                                .calendar_month,
                                                            size: 14.0,
                                                          ),
                                                          Text(
                                                            " ${qrList[index].datetime}",
                                                            style: TextStyle(
                                                              fontSize: 14.0,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Text(qrList[index]
                                                          .observation),
                                                      FadeInImage(
                                                          placeholder:
                                                              const AssetImage(
                                                                  'assets/images/qr.png'),
                                                          image: NetworkImage(
                                                              'https://borealtech.com/wp-content/uploads/2018/10/codigo-qr-1024x1024-1.jpg'))
                                                    ])));
                                      },
                                    );
                                  },
                                  icon: Icon(
                                    Icons.qr_code,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    }
                    return CircularProgressIndicator();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
