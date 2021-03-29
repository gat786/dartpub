import 'package:shelf/shelf.dart' as shelf;
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_router/shelf_router.dart';

Router methodsRouter() {
  var router = Router();

  router.get("/get", (Request request) {
    var parameters = request.context['shelf_router/params'];
    print('GET \nparams= ${request.url.queryParametersAll}');
    return shelf.Response.ok('This is a get request');
  });

  router.post("/post", (Request request) async {
    var body = await request.readAsString();
    print('POST \nPARAMS= ${request.url.queryParametersAll} \nBODY=$body');
    return shelf.Response.ok('This is a post request');
  });

  router.delete("/delete", (Request request) {
    var parameters = request.context['shelf_router/params'];
    print('DELETE \nPARAMS=$parameters');
    return shelf.Response.ok('This is a delete request');
  });

  return router;
}
