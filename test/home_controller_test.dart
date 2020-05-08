import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:uesc_hub/app/app_module.dart';
import 'package:uesc_hub/app/modules/home/home_controller.dart';
import 'package:uesc_hub/app/modules/home/home_module.dart';
import 'package:uesc_hub/app/shared/repositories/localstorage/local_storage_interface.dart';
import 'package:uesc_hub/app/shared/repositories/localstorage/local_storage_mock.dart';

main() {
  initModule(AppModule(), changeBinds: [
    Bind<ILocalStorage>((i) => LocalStorageMock()),
  ]);
  initModule(HomeModule());

  test('click save', () async {
    // final HomeController controller = Modular.get();
    // controller.textController.text = 'jons';
    // controller.save();
    // expect(controller.list.length, 1);
    // expect(controller.list[0], 'jons');

    // List<String> listStorage = await Modular.get<ILocalStorage>().get('key');
    // expect(listStorage[0], 'jons');
  });

  test('click remove', () async {
    // final HomeController controller = Modular.get();
    // controller.textController.text = 'jons';
    // controller.save();

    // controller.remove(0);
    // expect(controller.list.length, 0);
    // List<String> listStorage = await Modular.get<ILocalStorage>().get('key');
    // expect(listStorage.isEmpty, true);
  });
}
