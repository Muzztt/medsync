import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hyper_ui_test_test/core.dart';
import 'package:hyper_ui_test_test/shared/widget/container/qcontainer.dart';
import '../../../../shared/widget/form/radio/radio2.dart';
import '../bloc/patient_order_patient_data_bloc.dart';
import '../event/patient_order_patient_data_event.dart';
import '../state/patient_order_patient_data_state.dart';
import 'package:get_it/get_it.dart';

class PatientOrderPatientDataView extends StatefulWidget {
  const PatientOrderPatientDataView({Key? key}) : super(key: key);

  @override
  State<PatientOrderPatientDataView> createState() =>
      _PatientOrderPatientDataViewState();
}

class _PatientOrderPatientDataViewState
    extends State<PatientOrderPatientDataView> {
  PatientOrderPatientDataBloc bloc = PatientOrderPatientDataBloc();

  @override
  void initState() {
    if (GetIt.I.isRegistered<PatientOrderPatientDataBloc>()) {
      GetIt.I.unregister<PatientOrderPatientDataBloc>();
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
      child: BlocListener<PatientOrderPatientDataBloc,
          PatientOrderPatientDataState>(
        listener: (context, state) {},
        child: BlocBuilder<PatientOrderPatientDataBloc,
            PatientOrderPatientDataState>(
          builder: (context, state) {
            final bloc = context.read<PatientOrderPatientDataBloc>();
            return buildView(context, bloc, state);
          },
        ),
      ),
    );
  }

  Widget buildView(
    BuildContext context,
    PatientOrderPatientDataBloc bloc,
    PatientOrderPatientDataState state,
  ) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: ScrollController(),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              QContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Patient data",
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Fill in the forms",
                      style: TextStyle(
                        fontSize: 12.0,
                        color: secondaryTextColor,
                      ),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    QTextField(
                      label: "Name according to ID card ",
                      validator: Validator.required,
                      value: null,
                      onChanged: (value) {
                        state.name = value;
                      },
                    ),
                    const SizedBox(
                      height: 6.0,
                    ),
                    QDatePicker(
                      label: "Date of birth of the patient",
                      validator: Validator.required,
                      value: null,
                      onChanged: (value) {
                        state.dob = value;
                      },
                    ),
                    const SizedBox(
                      height: 6.0,
                    ),
                    QRadioField2(
                      label: "Gender",
                      validator: Validator.atLeastOneitem,
                      items: [
                        {
                          "label": "Female",
                          "value": "Female",
                        },
                        {
                          "label": "Male",
                          "value": "Male",
                        }
                      ],
                      onChanged: (value, label) {
                        print(value);
                        state.gender = value;
                      },
                    ),
                    QNumberField(
                      label: "ID Card",
                      validator: Validator.required,
                      value: null,
                      onChanged: (value) {
                        state.idCard = value;
                      },
                    ),
                    QMemoField(
                      label: "Address",
                      validator: Validator.required,
                      value: null,
                      onChanged: (value) {
                        state.address = value;
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        padding: EdgeInsets.all(12.0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 42,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.0)),
              backgroundColor: warningColor,
            ),
            onPressed: () {
              // var stepNavigationController =
              //     GetIt.I<StepNavigationController>();
              var stepNavigationController = StepNavigationController.instance;
              stepNavigationController.updateIndex(3);
              // patientOrderBloc.add(event)
            },
            child: Text(
              "Complete Patient Data",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
