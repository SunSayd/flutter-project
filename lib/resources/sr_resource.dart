import 'package:sunrise_map/models/control_closet.dart';
import 'package:sunrise_map/models/controller.dart';
import 'package:sunrise_map/models/light_source.dart';
import 'package:sunrise_map/models/light_support.dart';
import 'package:sunrise_map/models/projects.dart';
import 'package:sunrise_map/models/response.dart';
import 'package:sunrise_map/models/street.dart';
import 'package:sunrise_map/models/token.dart';
import 'package:sunrise_map/resources/http_client.dart';

class SRResource {
  final SRHttpClient _client = SRHttpClient();

  Future<Token> login(String login, String password) async {
    var json = await _client.post("/api/mobile/v1/auth", body: {"login": login, "password": password}, useToken: false);
    return Token.fromJson(json);
  }

  Future<List<Project>> getProjects() async {
    List json = await _client.post("/api/mobile/v1/projects", body: {});
    return List.generate(json.length, (index) => Project.fromJson(json[index]));
  }

  Future<List<ControlCloset>> getControlClosets(int projectId) async {
    List json = await _client.post("/api/mobile/v1/switchboards", body: {"projectId": projectId});
    return List.generate(json.length, (index) => ControlCloset.fromJson(json[index]));
  }

  Future<List<LightSupport>> getLightSupports(int projectId) async {
    List json = await _client.post("/api/mobile/v1/ls-supports", body: {"projectId": projectId});
    return List.generate(json.length, (index) => LightSupport.fromJson(json[index]));
  }

  Future<List<Street>> getStreets(int projectId) async {
    List json = await _client.post("/api/mobile/v1/streets", body: {"projectId": projectId});
    return List.generate(json.length, (index) => Street.fromJson(json[index]));
  }

  Future<List<LightSource>> getLightSources(int projectId) async {
    List json = await _client.post("/api/mobile/v1/light-sources", body: {"projectId": projectId});
    return List.generate(json.length, (index) => LightSource.fromJson(json[index]));
  }

  Future<List<Controller>> getControllers(int projectId, int lsSupportId) async {
    List json = await _client
        .post("/api/mobile/v1/ls-support/controllers", body: {"projectId": projectId, "lsSupportId": lsSupportId});
    return List.generate(json.length, (index) => Controller.fromJson(json[index]));
  }

  Future<Response> bindController(int projectId, int lsSupportId, String qrCode) async {
    var json = await _client.post("/api/mobile/v1/ls-support/controllers/bind-contrloller",
        body: {"projectId": projectId, "lsSupportId": lsSupportId, "qrCodeValue": qrCode});
    return Response.fromJson(json);
  }
}
