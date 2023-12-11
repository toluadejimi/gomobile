
import 'package:gomobilez/services/firebaseService.dart';



Future<String?> getId() async {
 return await FirebaseService().getToken();
}
