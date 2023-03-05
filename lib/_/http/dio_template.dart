//#GROUP_TEMPLATE http_dio

import 'dart:io';

//#TEMPLATE dio_import
import "package:dio/dio.dart";
//#END

void main() async {
  var filePath = "";
  {
    //#TEMPLATE dio_get
    var response = await Dio().get(
      "https://reqres.in/api/users",
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );
    Map obj = response.data;
    //#END
  }
  {
    //#TEMPLATE dio_get_single
    var id = 2;
    var response = await Dio().get(
      "https://reqres.in/api/users/\$id",
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );
    Map obj = response.data;
    //#END
  }

  {
    //#TEMPLATE dio_post
    var response = await Dio().post(
      "https://reqres.in/api/users",
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
      data: {
        "name": "morpheus",
        "job": "programmer",
      },
    );
    Map obj = response.data;
    //#END
  }

  {
    //#TEMPLATE dio_put
    var id = 2;
    var response = await Dio().put(
      "https://reqres.in/api/users/\$id",
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
      data: {
        "name": "granfield",
        "job": "system analyst",
      },
    );
    Map obj = response.data;
    //#END
  }

  {
    //#TEMPLATE dio_delete
    var id = 2;
    var response = await Dio().delete(
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
      "https://reqres.in/users/\$id",
    );
    print(response.statusCode);
    //#END
  }

  {
    //#TEMPLATE dio_upload
    final formData = FormData.fromMap({
      'image': MultipartFile.fromBytes(
        File(filePath).readAsBytesSync(),
        filename: "upload.jpg",
      ),
    });

    var res = await Dio().post(
      'https://api.imgbb.com/1/upload?key=b55ef3fd02b80ab180f284e479acd7c4',
      data: formData,
    );

    var data = res.data["data"];
    var url = data["url"];
    //#END
  }

  {
    //#TEMPLATE dio_post_login
    var response = await Dio().post(
      "https://reqres.in/api/login",
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
      data: {
        "email": "eve.holt@reqres.in",
        "password": "cityslicka",
      },
    );
    Map obj = response.data;
    //#END
  }
}
