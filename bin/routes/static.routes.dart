import 'package:shelf/shelf.dart' as shelf;
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_router/shelf_router.dart';

Router staticRouter() {
  var router = Router();

  router.get('', (Request request) {
    return shelf.Response.ok('This is some random body for request');
  });

  return router;
}
