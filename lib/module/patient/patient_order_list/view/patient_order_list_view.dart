import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hyper_ui_test_test/core.dart';
import 'package:hyper_ui_test_test/shared/theme/theme_config.dart';
import 'package:hyper_ui_test_test/shared/widget/container/qcontainer.dart';
import '../bloc/patient_order_list_bloc.dart';
import '../event/patient_order_list_event.dart';
import '../state/patient_order_list_state.dart';
import 'package:get_it/get_it.dart';

class PatientOrderListView extends StatefulWidget {
  PatientOrderListView({Key? key}) : super(key: key);
  @override
  State<PatientOrderListView> createState() => _PatientOrderListViewState();
}

class _PatientOrderListViewState extends State<PatientOrderListView> {
  PatientOrderListBloc bloc = PatientOrderListBloc();
  @override
  void initState() {
    if (GetIt.I.isRegistered<PatientOrderListBloc>()) {
      GetIt.I.unregister<PatientOrderListBloc>();
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
      child: BlocListener<PatientOrderListBloc, PatientOrderListState>(
        listener: (context, state) {},
        child: BlocBuilder<PatientOrderListBloc, PatientOrderListState>(
          builder: (context, state) {
            final bloc = context.read<PatientOrderListBloc>();
            return buildView(context, bloc, state);
          },
        ),
      ),
    );
  }

  Widget buildView(
    BuildContext context,
    PatientOrderListBloc bloc,
    PatientOrderListState state,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PatientOrderList'),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream:
                  FirebaseFirestore.instance.collection("orders").snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasError) return Text("Error");
                if (snapshot.data == null) return Container();
                if (snapshot.data!.docs.isEmpty) {
                  return Text("No Data");
                }
                final data = snapshot.data!;
                return ListView.builder(
                  itemCount: data.docs.length,
                  padding: EdgeInsets.zero,
                  clipBehavior: Clip.none,
                  itemBuilder: (context, index) {
                    Map<String, dynamic> item =
                        (data.docs[index].data() as Map<String, dynamic>);
                    item["id"] = data.docs[index].id;
                    print(item["id"]);
                    // return ListTile(
                    //   title: Text(item["patient"]["name"] ?? "-"),
                    //   subtitle: Text(item["doctor"]["doctor_name"]),
                    // );
                    return Padding(
                      padding: EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    PatientOrderPaymentDetailView(
                                        orderId: item["id"])),
                          );
                        },
                        child: QContainer(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListTile(
                                leading: CircleAvatar(
                                  radius: 24.0,
                                  backgroundImage: NetworkImage(
                                    "https://plus.unsplash.com/premium_photo-1661764878654-3d0fc2eefcca?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8ZG9jdG9yfGVufDB8fDB8fHww",
                                  ),
                                ),
                                contentPadding: EdgeInsets.all(0.0),
                                title: Text(
                                  item["doctor"]["doctor_name"] ?? "-",
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Text(
                                  item["doctor"]["specialization"] ?? "-",
                                  style: TextStyle(
                                    color: secondaryTextColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
