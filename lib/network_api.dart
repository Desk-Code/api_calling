import 'package:api_calling/comment.model.dart';
import 'package:http/http.dart' as http;

class NetworkApi {
  static String commentURL = "https://jsonplaceholder.typicode.com/comments";
  static Future<List<Vanila>> fetchCommentData() async {
    final response = await http.get(Uri.parse(commentURL));
    if (response.statusCode == 200) {
      return vanilaFromJson(response.body);
    } else {
      throw Exception("Some error occured");
    }
  }
}
