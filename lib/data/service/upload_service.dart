import 'package:chat_app/data/service/base_service.dart';

class UploadService extends ServiceBase {
  final String path;

  UploadService(this.path);

  @override
  Future<String> call() async {
    final result = await upload('upload', 'photo', path);
    return result['data']['url'];
  }
}
