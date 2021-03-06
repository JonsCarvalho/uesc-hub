import 'package:flutter/material.dart';

class GenerationDate {
  final DateTime dateTime;

  GenerationDate({Key key, @required this.dateTime});

  getSalutation() {
    int hour = dateTime.hour;
    if ((hour >= 0) && (hour < 5)) {
      return "Tenha uma boa madrugada";
    } else if ((hour >= 5) && (hour < 12)) {
      return "Tenha um bom dia";
    } else if ((hour >= 12) && (hour < 18)) {
      return "Tenha uma boa tarde";
    } else if (hour >= 18) {
      return "Tenha uma boa noite";
    }
  }

  getDay() {
    switch (dateTime.weekday.toInt()) {
      case 1:
        return "Segunda";
        break;
      case 2:
        return "Terça";
        break;
      case 3:
        return "Quarta";
        break;
      case 4:
        return "Quinta";
        break;
      case 5:
        return "Sexta";
        break;
      case 6:
        return "Sábado";
        break;
      case 7:
        return "Domingo";
        break;
      default:
    }
  }

  getMonth() {
    switch (dateTime.month.toInt()) {
      case 1:
        return "Janeiro";
        break;
      case 2:
        return "Fevereiro";
        break;
      case 3:
        return "Março";
        break;
      case 4:
        return "Abril";
        break;
      case 5:
        return "Maio";
        break;
      case 6:
        return "Junho";
        break;
      case 7:
        return "Julho";
        break;
      case 8:
        return "Agosto";
        break;
      case 9:
        return "Setembro";
        break;
      case 10:
        return "Outubro";
        break;
      case 11:
        return "Novembro";
        break;
      case 12:
        return "Dezembro";
        break;
      default:
    }
  }
}
