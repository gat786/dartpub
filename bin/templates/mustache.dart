import 'dart:io';

import 'package:mustache_template/mustache.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

Router templateRouter() {
  var router = new Router();
  router.get("/", (Request request) {
    var source = File("bin/templates/index.mustache").readAsStringSync();

    var template =
        Template(source, name: 'template-filename.html', lenient: true);

    var output = template.renderString({'names': []});

    return Response(200, body: output, headers: {'Content-Type': 'text/html'});
  });
  return router;
}
