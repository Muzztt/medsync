import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

class OrderService {
  createOrder({
    required String doctorName,
    required String specialization,
    required String patientName,
    required DateTime dob,
    required String gender,
    required String idCard,
    required String address,
    required String hospital,
    required String payment,
  }) async {
    try {
      await FirebaseFirestore.instance.collection("orders").add({
        "doctor": {
          "doctor_name": doctorName,
          "specialization": specialization, // Corrected the typo
        },
        "patient": {
          "name": patientName,
          "dob": dob,
          "gender": gender,
          "id_card": idCard,
          "address": address,
          "hospital": hospital,
          "payment": payment,
        },
        "created_at": Timestamp.now(),
      });
    } catch (e) {
      print("Failed to create order: $e");
    }
  }

  Future<void> deleteOrder(String orderId) async {
    try {
      await FirebaseFirestore.instance
          .collection("orders")
          .doc(orderId)
          .delete();
    } catch (e) {
      print("Failed to delete order: $e");
    }
  }

  Future<void> updateOrder({
    required String orderId,
    required String patientName,
    required String dob,
    required String gender,
    required String idCard,
    required String address,
  }) async {
    try {
      await FirebaseFirestore.instance
          .collection("orders")
          .doc(orderId)
          .update({
        "patient": {
          "name": patientName,
          "dob": dob,
          "gender": gender,
          "id_card": idCard,
          "address": address,
        },
        "created_at": Timestamp.now(),
      });
    } catch (e) {
      print("Failed to create order: $e");
    }
  }
}
