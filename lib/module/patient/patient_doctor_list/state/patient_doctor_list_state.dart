import 'package:freezed_annotation/freezed_annotation.dart';
part 'patient_doctor_list_state.freezed.dart';

@unfreezed
class PatientDoctorListState with _$PatientDoctorListState {
  factory PatientDoctorListState({
    @Default(0) int counter,
    @Default([
      "General Practitioner",
      "Pediatrician",
      "Dermatologist",
      "Cardiologist",
      "Neurologist",
      "Gynecologist",
      "Oncologist",
      "Orthopedic Surgeon",
      "Psychiatrist",
      "Ophthalmologist",
      "ENT Specialist",
      "Endocrinologist",
      "Urologist",
      "Gastroenterologist",
      "Rheumatologist",
      "Pulmonologist",
      "Allergist",
      "Nephrologist",
      "Hematologist",
      "Infectious Disease Specialist",
      "Plastic Surgeon",
      "Radiologist",
      "Anesthesiologist",
      "Emergency Medicine Physician",
      "Physical Therapist",
      "Occupational Therapist",
      "Speech Therapist",
      "Dietitian",
      "Pain Management Specialist",
      "Sleep Medicine Specialist",
      "Sports Medicine Physician",
      "Geriatrician",
      "Obstetrician",
      "Neonatologist",
      "Hepatologist",
      "Intensivist",
      "Pathologist",
      "Palliative Care Physician",
      "Hospitalist",
      "Medical Geneticist",
      "Forensic Pathologist",
      "Reproductive Endocrinologist",
      "Clinical Immunologist",
      "Medical Microbiologist",
      "Clinical Pharmacologist",
      "Neurosurgeon",
      "Vascular Surgeon",
      "Thoracic Surgeon",
      "Colon and Rectal Surgeon",
      "Bariatric Surgeon",
      "Transplant Surgeon",
    ])
    List categories,
    @Default([
      {
        "photo":
            "https://images.unsplash.com/photo-1559839734-2b71ea197ec2?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDF8fHxlbnwwfHx8fHw%3D",
        "doctor_name": "Dr. Maria Garcia",
        "specialization": "Dermatologist",
        "address": "789 Oak Street",
        "location_in_km": 10,
        "patient_count": 30,
        "next_schedule": "2024-04-27 09:15 AM"
      },
      {
        "photo":
            "https://images.unsplash.com/photo-1582750433449-648ed127bb54?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MzF8fG1lZGljYWwlMjBjYXJlfGVufDB8fDB8fHww",
        "doctor_name": "Dr. David Brown",
        "specialization": "Cardiologist",
        "address": "101 Pine Street",
        "location_in_km": 15,
        "patient_count": 25,
        "next_schedule": "2024-04-28 02:00 PM"
      },
      {
        "photo":
            "https://images.unsplash.com/photo-1618498082410-b4aa22193b38?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NzF8fG1lZGljYWwlMjBjYXJlfGVufDB8fDB8fHww",
        "doctor_name": "Dr. Sarah Lee",
        "specialization": "Neurologist",
        "address": "222 Cedar Street",
        "location_in_km": 12,
        "patient_count": 35,
        "next_schedule": "2024-04-29 03:45 PM"
      },
      {
        "photo":
            "https://plus.unsplash.com/premium_photo-1673351534357-fcce6fc86cba?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDl8fGRvY3RvciUyMG9mZmljZXxlbnwwfHwwfHx8MA%3D%3D",
        "doctor_name": "Dr. Michael Wilson",
        "specialization": "Orthopedic Surgeon",
        "address": "333 Maple Street",
        "location_in_km": 20,
        "patient_count": 20,
        "next_schedule": "2024-04-30 10:30 AM"
      },
    ])
    List doctorList,
  }) = _PatientDoctorListState;
}
