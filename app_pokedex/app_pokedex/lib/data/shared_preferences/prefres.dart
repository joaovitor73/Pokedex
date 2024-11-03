import 'package:shared_preferences/shared_preferences.dart';

class Prefes {
  SharedPreferences? prefs;

  Prefes() {
    initPrefes();
  }

  Future<void> initPrefes() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future<int?> getId() async {
    return prefs!.getInt('id');
  }

  Future<DateTime?> getDate() async {
    String? dataString = prefs!.getString('data');
    if (dataString == null || dataString.isEmpty) {
      return null;
    }
    return DateTime.tryParse(dataString);
  }

  void setId(int id) async {
    prefs!.setInt('id', id);
  }

  void setData(DateTime dataAtual) async {
    String dataFormatada =
        "${dataAtual.year}-${dataAtual.month.toString().padLeft(2, '0')}-${dataAtual.day.toString().padLeft(2, '0')}";
    prefs!.setString('data', dataFormatada);
  }

  Future<bool> novoDia(DateTime date) async {
    if (await isNullDate()) {
      return false;
    }
    DateTime? dataAntiga = await getDate();
    DateTime dataAtualSemHora = DateTime(date.year, date.month, date.day);
    DateTime dataAntigaSemHora =
        DateTime(dataAntiga!.year, dataAntiga.month, dataAntiga.day);
    return dataAtualSemHora.isAfter(dataAntigaSemHora);
  }

  Future<bool> isNullDate() async {
    DateTime? dataAntiga = await getDate();
    return dataAntiga == null ? true : false;
  }
}
