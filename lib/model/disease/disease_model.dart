import 'package:doctor_help_app/containts/containts.dart';

class DiseaseModel{
  String nameDisease;
  int persion;
  String image;
  
  DiseaseModel({required this.nameDisease, required this.persion, required this.image});
}

DiseaseModel sick = DiseaseModel(nameDisease: 'Gastroenterology', persion: 5, image: iconGastroenterology);

final List<DiseaseModel>listSick=[
  DiseaseModel(nameDisease: 'Gastroenterology', persion: 5, image: iconGastroenterology),
  DiseaseModel(nameDisease: 'Gynecologiy', persion: 6, image: iconGynecology),
  DiseaseModel(nameDisease: 'Hepatology', persion: 9, image: iconHematology),
  DiseaseModel(nameDisease: 'Neurology', persion: 10, image: iconNeurology),
];