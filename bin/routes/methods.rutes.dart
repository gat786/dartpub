import 'package:shelf/shelf.dart' as shelf;
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_router/shelf_router.dart';

Router methodsRouter() {
  var router = Router();

  router.get("/", (Request request) {
    var parameters = request.context['shelf_router/params'];
    print('parameters captured for the request are $parameters ');
    return shelf.Response.ok('This is a get request');
  });

  router.post("/", (Request request) async {
    var parameters = params(request, 'name');
    var body = await request.readAsString();
    print('POST \nPARAMS=$parameters\nBODY=$body');
    return shelf.Response.ok('This is a post request');
  });

  router.delete("/", (Request request) {
    var parameters = request.context['shelf_router/params'];
    print('POST \nPARAMS=$parameters');
    return shelf.Response.ok('This is a post request');
  });

  return router;
}
