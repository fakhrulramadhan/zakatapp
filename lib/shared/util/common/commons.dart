import 'package:example/core.dart';

//cara membuat extension
extension CommonsExtension on DateTime {
  get dMMMykkss {
    return DateFormat('d MMM y kk:ss').format(this);
  }

  get dMMMy {
    //this nya dari value si tanggal
    return DateFormat('d MMM y').format(this);
  }

  get kkss {
    //this nya dari value si tanggal
    return DateFormat('kk:ss').format(this);
  }
}
