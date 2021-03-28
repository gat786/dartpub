import 'package:shelf/shelf.dart' as shelf;
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_router/shelf_router.dart';

import 'routes/methods.rutes.dart';
import 'routes/static.routes.dart';

Future<void> main() async {
  var app = new Router();

  app.mount('/static/', staticRouter());
  app.mount('/methods/', methodsRouter());

  app.get('/', (Request request) => _echoRequest(request));

  var server = await io.serve(app, 'localhost', 8080);
  print('Serving at http://${server.address.host}:${server.port}');
}

shelf.Response _echoRequest(shelf.Request request) {
  return shelf.Response.ok('Request for "${request.url}"');
}
