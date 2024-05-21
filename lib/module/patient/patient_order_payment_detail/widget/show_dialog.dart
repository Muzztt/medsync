import 'package:flutter/material.dart';
import 'package:hyper_ui_test_test/module/patient/patient_order_payment_detail/event/patient_order_payment_detail_event.dart';
import 'package:hyper_ui_test_test/shared/theme/theme_config.dart';

Future<void> showCancelAppointmentBottomSheet(
    BuildContext context, dynamic bloc, dynamic state) async {
  await showModalBottomSheet<void>(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(2.0)),
    ),
    builder: (BuildContext context) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'Batalkan Jadwal Konsultasi?',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Apakah Anda yakin membatalkan jadwal konsultasi dengan dr. I Putu Eka Sukayasa, Sp.KJ di RSU Bhakti Rahayu Surabaya pada Rabu, 15 Mei 2024, Jam 15:00?',
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: infoColor,
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: Text(
                'Continue making an appoinment',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 8),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 42,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  foregroundColor: infoColor,
                  side: BorderSide(
                    color: infoColor,
                  ),
                ),
                onPressed: () {
                  bloc.add(PatientOrderPaymentDeleteEvent());
                  Navigator.pop(context);
                },
                child: const Text("Yes, cancel appointment"),
              ),
            ),
          ],
        ),
      );
    },
  );
}
