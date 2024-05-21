import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hyper_ui_test_test/core.dart';
import 'package:hyper_ui_test_test/shared/theme/theme_config.dart';
import '../bloc/patient_doctor_list_bloc.dart';
import '../event/patient_doctor_list_event.dart';
import '../state/patient_doctor_list_state.dart';
import 'package:get_it/get_it.dart';

class PatientDoctorListView extends StatefulWidget {
  const PatientDoctorListView({Key? key}) : super(key: key);

  @override
  State<PatientDoctorListView> createState() => _PatientDoctorListViewState();
}

class _PatientDoctorListViewState extends State<PatientDoctorListView> {
  PatientDoctorListBloc bloc = PatientDoctorListBloc();

  @override
  void initState() {
    if (GetIt.I.isRegistered<PatientDoctorListBloc>()) {
      GetIt.I.unregister<PatientDoctorListBloc>();
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
      child: BlocListener<PatientDoctorListBloc, PatientDoctorListState>(
        listener: (context, state) {},
        child: BlocBuilder<PatientDoctorListBloc, PatientDoctorListState>(
          builder: (context, state) {
            final bloc = context.read<PatientDoctorListBloc>();
            return buildView(context, bloc, state);
          },
        ),
      ),
    );
  }

  Widget buildView(
    BuildContext context,
    PatientDoctorListBloc bloc,
    PatientDoctorListState state,
  ) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(),
            child: Row(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                        state.categories.length,
                        (index) {
                          var item = state.categories[index];
                          bool selected = index == 0;
                          return Container(
                            height: 50,
                            padding: const EdgeInsets.all(12.0),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border(
                                    bottom: BorderSide(
                                  width: 2.0,
                                  color: selected ? infoColor : Colors.white,
                                ))),
                            child: Center(
                              child: Text(
                                "$item",
                                style: TextStyle(
                                  color:
                                      selected ? infoColor : Colors.grey[600],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x19000000),
                        blurRadius: 24,
                        offset: Offset(0, 11),
                      ),
                    ],
                    border: Border.all(
                      width: 1.0,
                      color: Colors.grey[200]!,
                    ),
                  ),
                  child: Icon(
                    MdiIcons.menu,
                    size: 24.0,
                    color: infoColor,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 3,
              physics: const ScrollPhysics(),
              padding: EdgeInsets.zero,
              itemBuilder: (BuildContext context, int index) {
                var item = state.doctorList[index];
                return InkWell(
                  onTap: () => Get.to(PatientDoctorDetailView(item: item)),
                  child: Container(
                    margin: const EdgeInsets.only(
                      bottom: 20.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 32.0,
                              backgroundImage: NetworkImage(
                                item["photo"],
                              ),
                            ),
                            const SizedBox(
                              width: 12.0,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item["doctor_name"],
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
                                      Icon(
                                        MdiIcons.doctor,
                                        size: 16.0,
                                        color: Color(0xff7f7f7f),
                                      ),
                                      const SizedBox(
                                        width: 6.0,
                                      ),
                                      Text(
                                        item["specialization"],
                                        style: TextStyle(
                                          fontSize: 12.0,
                                          color: Color(0xff7f7f7f),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 4.0,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        MdiIcons.hospital,
                                        size: 16.0,
                                        color: Color(0xff7f7f7f),
                                      ),
                                      const SizedBox(
                                        width: 6.0,
                                      ),
                                      Text(
                                        item["address"],
                                        style: TextStyle(
                                          fontSize: 12.0,
                                          color: Color(0xff7f7f7f),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 4.0,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        MdiIcons.directions,
                                        size: 16.0,
                                        color: Color(0xff7f7f7f),
                                      ),
                                      const SizedBox(
                                        width: 6.0,
                                      ),
                                      Text(
                                        "${item["location_in_km"]} km form you",
                                        style: TextStyle(
                                          fontSize: 12.0,
                                          color: Color(0xff7f7f7f),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 8.0,
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      text: '',
                                      style: DefaultTextStyle.of(context).style,
                                      children: <TextSpan>[
                                        TextSpan(
                                          text:
                                              '${item["patient_count"]} patient',
                                          style: TextStyle(
                                            color: infoColor,
                                            fontSize: 12.0,
                                          ),
                                        ),
                                        TextSpan(
                                          text:
                                              ' have made an appointment with this doctor.',
                                          style: TextStyle(
                                            fontSize: 12.0,
                                            color: Color(0xff7f7f7f),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 12.0,
                        ),
                        Row(
                          children: [
                            Icon(
                              MdiIcons.calendar,
                              size: 16.0,
                              color: Color(0xff7f7f7f),
                            ),
                            const SizedBox(
                              width: 6.0,
                            ),
                            Text(
                              "Next Scedule: ${item["next_schedule"]}",
                              style: TextStyle(
                                fontSize: 12.0,
                                color: Color(0xff7f7f7f),
                              ),
                            ),
                          ],
                        ),
                        Divider(),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Fee Consultation",
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: secondaryTextColor,
                                  ),
                                ),
                                Text(
                                  "Rp100.000",
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                    color: warningColor,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 4.0,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Doctor review",
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: secondaryTextColor,
                                  ),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      MdiIcons.thumbUp,
                                      size: 12.0,
                                      color: infoColor,
                                    ),
                                    const SizedBox(
                                      width: 4.0,
                                    ),
                                    Text(
                                      "100%",
                                      style: TextStyle(
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.bold,
                                        color: infoColor,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 4.0,
                                    ),
                                    Text(
                                      "(19)",
                                      style: TextStyle(
                                        fontSize: 12.0,
                                        color: secondaryTextColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 8.0,
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0)),
                                backgroundColor: warningColor,
                              ),
                              onPressed: () => Get.to(
                                PatientDoctorDetailView(
                                  item: item,
                                ),
                              ),
                              child: const Text(
                                "Buat Janji",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Divider(),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
