import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hyper_ui_test_test/core.dart';
import 'package:hyper_ui_test_test/shared/theme/theme_config.dart';
import 'package:hyper_ui_test_test/shared/widget/expansion_panel/expansion_panel.dart';
import '../bloc/patient_doctor_detail_bloc.dart';
import '../event/patient_doctor_detail_event.dart';
import '../state/patient_doctor_detail_state.dart';
import 'package:get_it/get_it.dart';

class PatientDoctorDetailView extends StatefulWidget {
  final Map item;
  const PatientDoctorDetailView({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  State<PatientDoctorDetailView> createState() =>
      _PatientDoctorDetailViewState();
}

class _PatientDoctorDetailViewState extends State<PatientDoctorDetailView> {
  PatientDoctorDetailBloc bloc = PatientDoctorDetailBloc();

  @override
  void initState() {
    if (GetIt.I.isRegistered<PatientDoctorDetailBloc>()) {
      GetIt.I.unregister<PatientDoctorDetailBloc>();
    }
    GetIt.I.registerSingleton(bloc);
    bloc.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => bloc.ready(),
    );
    super.initState();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => bloc,
      child: BlocListener<PatientDoctorDetailBloc, PatientDoctorDetailState>(
        listener: (context, state) {},
        child: BlocBuilder<PatientDoctorDetailBloc, PatientDoctorDetailState>(
          builder: (context, state) {
            final bloc = context.read<PatientDoctorDetailBloc>();
            return buildView(context, bloc, state);
          },
        ),
      ),
    );
  }

  Widget buildView(
    BuildContext context,
    PatientDoctorDetailBloc bloc,
    PatientDoctorDetailState state,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Doctor Profile'),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.share,
              size: 24.0,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        controller: ScrollController(),
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[200]!,
                      blurRadius: 24,
                      offset: Offset(0, 14),
                    ),
                  ],
                  border: Border(
                    bottom: BorderSide(
                      width: 1.0,
                      color: Colors.grey[300]!,
                    ),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 32.0,
                          backgroundImage: NetworkImage(
                            widget.item["photo"],
                          ),
                        ),
                        const SizedBox(
                          width: 8.0,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.item["doctor_name"],
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 2.0,
                              ),
                              Text(
                                widget.item["specialization"],
                                style: TextStyle(
                                  fontSize: 14.0,
                                ),
                              ),
                              const SizedBox(
                                height: 2.0,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                padding: const EdgeInsets.all(4.0),
                                decoration: BoxDecoration(
                                  color: Color(0xfff4f9ff),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(4.0),
                                  ),
                                ),
                                child: RichText(
                                  text: TextSpan(
                                    text: '',
                                    children: <TextSpan>[
                                      TextSpan(
                                        text:
                                            "${widget.item["patient_count"]} patient",
                                        style: TextStyle(
                                          color: infoColor,
                                          fontSize: 12.0,
                                        ),
                                      ),
                                      TextSpan(
                                        text: ' booked today',
                                        style: TextStyle(
                                          color: secondaryTextColor,
                                          fontSize: 12.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Divider(),
                    Row(
                      children: [
                        Icon(
                          Icons.thumb_up,
                          size: 12.0,
                          color: infoColor,
                        ),
                        Text(
                          " 100%",
                          style: TextStyle(
                            fontSize: 12.0,
                            color: infoColor,
                          ),
                        ),
                        Text(
                          "  19 patient",
                          style: TextStyle(
                            fontSize: 12.0,
                            color: secondaryTextColor,
                          ),
                        ),
                        Icon(
                          Icons.chevron_right,
                          size: 12.0,
                          color: secondaryTextColor,
                        ),
                        Spacer(),
                        OutlinedButton.icon(
                          icon: const Icon(
                            Icons.add,
                            size: 16,
                          ),
                          label: const Text(
                            "Berikan Ulasan ",
                            style: TextStyle(
                              fontSize: 14.0,
                            ),
                          ),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: infoColor,
                            side: const BorderSide(
                              color: Colors.transparent,
                              width: 0.0,
                            ),
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(12.0),
                        ),
                        border: Border.all(
                          width: 1.0,
                          color: Colors.grey[200]!,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x19000000),
                            blurRadius: 24,
                            offset: Offset(0, 11),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Address and Schedule practice",
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          Row(
                            children: [
                              Container(
                                height: 64.0,
                                width: 64.0,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      "https://images.unsplash.com/photo-1587351021759-3e566b6af7cc?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8ODh8fGhvc3BpdGFsfGVufDB8fDB8fHww",
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(
                                      8.0,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 6.0,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "RS Gatoel Mojokerto",
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 4.0,
                                    ),
                                    Text(
                                      "Jl Raden Wijaya 56 (Mojokerto), Mojokerto, Jawa Timur, Indonesia",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 12.0,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 4.0,
                                    ),
                                    Text(
                                      "Fee Rp100.000,-",
                                      style: TextStyle(
                                          fontSize: 12.0, color: warningColor),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 4.0,
                              ),
                              CircleAvatar(
                                radius: 20.0,
                                backgroundColor: infoColor,
                                child: Icon(
                                  Icons.directions,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 12.0,
                          ),
                          Container(
                            padding: const EdgeInsets.all(12.0),
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(
                                  8.0,
                                ),
                              ),
                              border: Border.all(
                                width: 1.0,
                                color: Colors.grey[200]!,
                              ),
                            ),
                            child: Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Senin, 16 Oktober 2023",
                                    style: TextStyle(
                                        fontSize: 12.0,
                                        color: secondaryTextColor),
                                  ),
                                  const SizedBox(
                                    height: 8.0,
                                  ),
                                  OutlinedButton(
                                    style: OutlinedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(6.0)),
                                      foregroundColor: infoColor,
                                      side: BorderSide(
                                        color: infoColor,
                                      ),
                                    ),
                                    onPressed: () => Get.to(PatientOrderView()),
                                    child: const Text("16.30 - 18.30"),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          Container(
                            padding: const EdgeInsets.all(12.0),
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(
                                  8.0,
                                ),
                              ),
                              border: Border.all(
                                width: 1.0,
                                color: Colors.grey[200]!,
                              ),
                            ),
                            child: Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Rabu, 18 Oktober 2023",
                                    style: TextStyle(
                                        fontSize: 12.0,
                                        color: secondaryTextColor),
                                  ),
                                  const SizedBox(
                                    height: 8.0,
                                  ),
                                  OutlinedButton(
                                    style: OutlinedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(6.0)),
                                      foregroundColor: infoColor,
                                      side: BorderSide(
                                        color: infoColor,
                                      ),
                                    ),
                                    onPressed: () => Get.to(PatientOrderView()),
                                    child: const Text("16.30 - 18.30"),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          Container(
                            padding: const EdgeInsets.all(12.0),
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(
                                  8.0,
                                ),
                              ),
                              border: Border.all(
                                width: 1.0,
                                color: Colors.grey[200]!,
                              ),
                            ),
                            child: Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Senin, 16 Oktober 2023",
                                    style: TextStyle(
                                        fontSize: 12.0,
                                        color: secondaryTextColor),
                                  ),
                                  const SizedBox(
                                    height: 8.0,
                                  ),
                                  OutlinedButton(
                                    style: OutlinedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(6.0)),
                                      foregroundColor: infoColor,
                                      side: BorderSide(
                                        color: infoColor,
                                      ),
                                    ),
                                    onPressed: () => Get.to(PatientOrderView()),
                                    child: const Text("16.30 - 18.30"),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          Row(
                            children: [
                              Text(
                                "All location and Schedule",
                                style: TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold,
                                  color: infoColor,
                                ),
                              ),
                              Icon(
                                Icons.chevron_right,
                                size: 18.0,
                                color: infoColor,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(12.0),
                        ),
                        border: Border.all(
                          width: 1.0,
                          color: Colors.grey[200]!,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x19000000),
                            blurRadius: 24,
                            offset: Offset(0, 11),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Doctor Profile",
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 6.0,
                          ),
                          Text(
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                            style: TextStyle(
                              fontSize: 12.0,
                            ),
                          ),
                          const SizedBox(
                            height: 6.0,
                          ),
                          Row(
                            children: [
                              Text(
                                "More",
                                style: TextStyle(
                                  fontSize: 12.0,
                                  color: infoColor,
                                ),
                              ),
                              Icon(
                                Icons.chevron_right,
                                size: 12.0,
                                color: infoColor,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              QExpansionPanel(
                  title: "Medical Treatment",
                  expanded: true,
                  children: [
                    for (var n in [1, 2, 3])
                      Container(
                        margin: const EdgeInsets.only(
                          bottom: 6.0,
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.circle,
                              size: 8.0,
                              color: secondaryTextColor,
                            ),
                            const SizedBox(
                              width: 6.0,
                            ),
                            Text(
                              "Fluoride Tratment",
                              style: TextStyle(
                                fontSize: 12.0,
                                color: secondaryTextColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                  ]),
              QExpansionPanel(
                  title: "Pratical Experience",
                  expanded: true,
                  children: [
                    for (var n in [1, 2, 3, 4, 5])
                      Container(
                        margin: const EdgeInsets.only(
                          bottom: 6.0,
                        ),
                        child: Text(
                          "Dokter Gigi - RS Gatoel Mojokerto",
                          style: TextStyle(
                              fontSize: 12.0, color: secondaryTextColor),
                        ),
                      ),
                  ]),
              QExpansionPanel(
                title: "Educational Background",
                expanded: true,
                children: [
                  for (var n in [
                    1,
                    2,
                  ])
                    Container(
                      margin: const EdgeInsets.only(
                        bottom: 6.0,
                      ),
                      child: Text(
                        "sp.KG - Spesialis Konservasi Gigi - Universitas Gadjah Mada",
                        style: TextStyle(
                          fontSize: 12.0,
                          color: secondaryTextColor,
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: Container(
      //   padding: const EdgeInsets.all(12.0),
      //   height: 66,
      //   child: ElevatedButton(
      //     style: ElevatedButton.styleFrom(
      //       shape: RoundedRectangleBorder(
      //           borderRadius: BorderRadius.circular(6.0)),
      //       backgroundColor: warningColor,
      //     ),
      //     onPressed: () {},
      //     child: const Text(
      //       "Buat Janji Konsultasi ",
      //       style: TextStyle(
      //         color: Colors.white,
      //         fontWeight: FontWeight.bold,
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}
