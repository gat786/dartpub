import 'package:shelf/shelf.dart' as shelf;
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_router/shelf_router.dart';
import 'package:mime/mime.dart';
import 'package:shelf_static/shelf_static.dart';

Router staticRouter() {
  var router = Router();

  var staticHandler = createStaticHandler('static',
      listDirectories: true,
      serveFilesOutsidePath: true,
      useHeaderBytesForContentType: true);

  router.get('/<name|.*>', staticHandler);

  return router;
}
