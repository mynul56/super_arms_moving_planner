import 'package:get/get.dart';

class SearchOffersController extends GetxController {
  final pickUpLocation = 'Paris'.obs;
  final dropOffLocation = 'Paris'.obs;

  final locations = [
    'Paris',
    'Pigalle',
    'Belleville',
    'Le Marais',
    'Montmartre',
    'Saint-Germain-des-Prés',
    'Latin Quarter',
    'La Défense',
    'Bastille',
    'Champs-Élysées',
    'Opera',
    'Fontainebleau',
    'Lille',
    'Reims',
    'Nantes',
    'Boulogne-Billancourt',
    'Saint-Denis',
    'Nanterre',
    'Neuilly-sur-Seine',
    'Levallois-Perret',
    'Issy-les-Moulineaux',
    'Vincennes',
    'Créteil',
    'Courbevoie',
    'Versailles',
  ];

  void updatePickUpLocation(String location) {
    pickUpLocation.value = location;
    Get.back();
  }

  void updateDropOffLocation(String location) {
    dropOffLocation.value = location;
    Get.back();
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
