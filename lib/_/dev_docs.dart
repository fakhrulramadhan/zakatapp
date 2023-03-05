// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';

class DevDocsView extends StatelessWidget {
  const DevDocsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[600],
        title: const Text("Dashboard"),
        actions: [
          InkWell(
            onTap: () {},
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.tune),
            ),
          ),
          InkWell(
            onTap: () {},
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.notifications),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              //#GROUP_TEMPLATE import
              /*
              //#TEMPLATE mat
              import 'package:flutter/material.dart';
              //#END
              //#TEMPLATE cup
              import 'package:flutter/cupertino.dart';
              //#END
              */
              //#GROUP_TEMPLATE common

              Column(
                //#TEMPLATE crostart
                crossAxisAlignment: CrossAxisAlignment.start,
                //#END
              ),
              Column(
                //#TEMPLATE croend
                crossAxisAlignment: CrossAxisAlignment.end,
                //#END
              ),
              Column(
                //#TEMPLATE crocenter
                crossAxisAlignment: CrossAxisAlignment.center,
                //#END
              ),
              Column(
                //#TEMPLATE mainstart
                mainAxisAlignment: MainAxisAlignment.start,
                //#END
              ),
              Column(
                //#TEMPLATE mainend
                mainAxisAlignment: MainAxisAlignment.end,
                //#END
              ),
              Column(
                //#TEMPLATE maincenter
                mainAxisAlignment: MainAxisAlignment.center,
                //#END
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: 0,
                //#TEMPLATE axisv
                scrollDirection: Axis.vertical,
                //#END
                itemBuilder: (context, index) {
                  return Container();
                },
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: 0,
                //#TEMPLATE axish
                scrollDirection: Axis.horizontal,
                //#END
                itemBuilder: (context, index) {
                  return Container();
                },
              ),

              /*
              //#TEMPLATE mq
              MediaQuery.of(context)
              //#END

              //#TEMPLATE mqw
              MediaQuery.of(context).size.width,
              //#END

              //#TEMPLATE mqh
              MediaQuery.of(context).size.height,
              //#END

              //#TEMPLATE w100
              width: MediaQuery.of(context).size.width,
              //#END

              //#TEMPLATE h100
              height: MediaQuery.of(context).size.height,
              //#END

              */
              ElevatedButton.icon(
                icon: const Icon(Icons.add),
                label: const Text("Add"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                ),
                onPressed: () {
                  //#TEMPLATE navpush
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Container()),
                  );
                  //#END

                  //#TEMPLATE navreplace
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Container()),
                  );
                  //#END

                  //#TEMPLATE navback
                  Navigator.pop(context);
                  //#END
                },
              ),

              //#GROUP_TEMPLATE SizedBox, Padding, Margin
              Container(
                child: const Text("OK"),
              ),

              //#GROUP_TEMPLATE image

              //#TEMPLATE image
              Image.network(
                "https://i.ibb.co/S32HNjD/no-image.jpg",
                width: 64.0,
                height: 64.0,
                fit: BoxFit.fill,
              ),
              //#END
              const SizedBox(
                height: 10.0,
              ),
              //#TEMPLATE image_network
              Image.network(
                "https://i.ibb.co/S32HNjD/no-image.jpg",
                width: 64.0,
                height: 64.0,
                fit: BoxFit.fill,
              ),
              //#END

              const SizedBox(
                height: 10.0,
              ),

              //#TEMPLATE image_asset
              Image.asset(
                "assets/icon/icon.png",
                width: 64.0,
                height: 64.0,
                fit: BoxFit.fill,
              ),
              //#END

              //#TEMPLATE list_image_gallery
              LayoutBuilder(
                builder: (context, constraint) {
                  List menus = [
                    {
                      "photo":
                          "https://i.ibb.co/rcDzK4T/photo-1605538293913-13cfc720511e-crop-entropy-cs-tinysrgb-fit-max-fm-jpg-ixid-Mnwy-ODA4-ODh8-MHwxf-H.jpg",
                      "onTap": () {
                        print("Test!");
                      },
                    },
                    {
                      "photo":
                          "https://i.ibb.co/TDyK1km/photo-1593807980339-b3fad3472c45-crop-entropy-cs-tinysrgb-fit-max-fm-jpg-ixid-Mnwy-ODA4-ODh8-MHwxf-H.jpg",
                      "onTap": () {},
                    },
                    {
                      "photo":
                          "https://i.ibb.co/k3T7YBz/photo-1610320819784-58ccf5531a3f-crop-entropy-cs-tinysrgb-fit-max-fm-jpg-ixid-Mnwy-ODA4-ODh8-MHwxf-H.jpg",
                      "onTap": () {},
                    },
                    {
                      "photo":
                          "https://i.ibb.co/0mS4w5t/photo-1576750168278-747aebbb30c3-crop-entropy-cs-tinysrgb-fit-max-fm-jpg-ixid-Mnwy-ODA4-ODh8-MHwxf-H.jpg",
                      "onTap": () {},
                    },
                    {
                      "photo":
                          "https://i.ibb.co/jDfJNM0/photo-1587897500679-a5962dc49c67-crop-entropy-cs-tinysrgb-fit-max-fm-jpg-ixid-Mnwy-ODA4-ODh8-MHwxf-H.jpg",
                      "onTap": () {},
                    },
                    {
                      "photo":
                          "https://i.ibb.co/MVYZL7Q/photo-1581906848371-59968ebb7052-crop-entropy-cs-tinysrgb-fit-max-fm-jpg-ixid-Mnwy-ODA4-ODh8-MHwxf-H.jpg",
                      "onTap": () {},
                    },
                    {
                      "photo":
                          "https://i.ibb.co/TmmxC61/photo-1605604904594-b640971ce3cb-crop-entropy-cs-tinysrgb-fit-max-fm-jpg-ixid-Mnwy-ODA4-ODh8-MHwxf-H.jpg",
                      "onTap": () {},
                    },
                    {
                      "photo":
                          "https://i.ibb.co/ck5p8Rx/photo-1594235372071-6734d85514ea-crop-entropy-cs-tinysrgb-fit-max-fm-jpg-ixid-Mnwy-ODA4-ODh8-MHwxf-H.jpg",
                      "onTap": () {},
                    },
                  ];

                  var spacing = 2.0;
                  var rowCount = 4;

                  return Wrap(
                    runSpacing: spacing,
                    spacing: spacing,
                    children: List.generate(
                      menus.length,
                      (index) {
                        var item = menus[index];
                        var size =
                            (constraint.biggest.width - (rowCount * spacing)) /
                                rowCount;

                        return InkWell(
                          onTap: () => item["onTap"](),
                          child: Container(
                            height: size,
                            width: size,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                  item["photo"],
                                ),
                                fit: BoxFit.fill,
                              ),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(
                                  0.0,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
              //#END

              //#GROUP_TEMPLATE circle_avatar

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  //#TEMPLATE circle_image_lg
                  CircleAvatar(
                    radius: 28.0,
                    backgroundImage: NetworkImage(
                      "https://i.ibb.co/PGv8ZzG/me.jpg",
                    ),
                  ),
                  //#END

                  //#TEMPLATE circle_image_md
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                      "https://i.ibb.co/PGv8ZzG/me.jpg",
                    ),
                  ),
                  //#END

                  //#TEMPLATE circle_image
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                      "https://i.ibb.co/PGv8ZzG/me.jpg",
                    ),
                  ),
                  //#END

                  //#TEMPLATE circle_image_sm
                  CircleAvatar(
                    radius: 16.0,
                    backgroundImage: NetworkImage(
                      "https://i.ibb.co/PGv8ZzG/me.jpg",
                    ),
                  ),
                  //#END

                  //#TEMPLATE circle_image_xs
                  CircleAvatar(
                    radius: 12.0,
                    backgroundImage: NetworkImage(
                      "https://i.ibb.co/PGv8ZzG/me.jpg",
                    ),
                  ),
                  //#END
                ],
              ),

              const SizedBox(
                height: 20.0,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  //#TEMPLATE circle_icon_lg
                  CircleAvatar(
                    backgroundColor: Colors.blueGrey,
                    radius: 28.0,
                    child: Icon(
                      Icons.add,
                      size: 28.0,
                    ),
                  ),
                  //#END

                  //#TEMPLATE circle_icon_md
                  CircleAvatar(
                    backgroundColor: Colors.blueGrey,
                    child: Icon(Icons.add),
                  ),
                  //#END

                  //#TEMPLATE circle_icon
                  CircleAvatar(
                    backgroundColor: Colors.blueGrey,
                    child: Icon(Icons.add),
                  ),
                  //#END

                  //#TEMPLATE circle_icon_sm
                  CircleAvatar(
                    backgroundColor: Colors.blueGrey,
                    radius: 16.0,
                    child: Icon(
                      Icons.add,
                      size: 16.0,
                    ),
                  ),
                  //#END

                  //#TEMPLATE circle_icon_xs
                  CircleAvatar(
                    backgroundColor: Colors.blueGrey,
                    radius: 12.0,
                    child: Icon(
                      Icons.add,
                      size: 12.0,
                    ),
                  ),
                  //#END
                ],
              ),

              //#GROUP_TEMPLATE button

              //#TEMPLATE button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                ),
                onPressed: () {},
                child: const Text("Save"),
              ),
              //#END

              //#TEMPLATE button_stadium
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                  shape: const StadiumBorder(),
                ),
                onPressed: () {},
                child: const Text("Save"),
              ),
              //#END

              //#TEMPLATE button_radius
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // <-- Radius
                  ),
                ),
                onPressed: () {},
                child: const Text("Save"),
              ),
              //#END

              //#TEMPLATE button_continuous
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                  shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.circular(64.0),
                  ),
                ),
                onPressed: () {},
                child: const Text("Save"),
              ),
              //#END

              //#TEMPLATE button_beveled
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                  shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {},
                child: const Text("Save"),
              ),
              //#END

              //#TEMPLATE button_outline
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.blueGrey,
                ),
                onPressed: () {},
                child: const Text("Save"),
              ),
              //#END

              //#TEMPLATE button_outline_stadium
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.blueGrey,
                  shape: const StadiumBorder(),
                ),
                onPressed: () {},
                child: const Text("Save"),
              ),
              //#END

              //#TEMPLATE button_outline_radius
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.blueGrey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // <-- Radius
                  ),
                ),
                onPressed: () {},
                child: const Text("Save"),
              ),
              //#END

              //#TEMPLATE button_outline_continuous
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.blueGrey,
                  shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.circular(64.0),
                  ),
                ),
                onPressed: () {},
                child: const Text("Save"),
              ),
              //#END

              //#TEMPLATE button_outline_beveled
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.blueGrey,
                  shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {},
                child: const Text("Save"),
              ),
              //#END

              //----------------------

              //#TEMPLATE button_icon
              ElevatedButton.icon(
                icon: const Icon(Icons.add),
                label: const Text("Add"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                ),
                onPressed: () {},
              ),
              //#END

              //#TEMPLATE button_icon_stadium
              ElevatedButton.icon(
                icon: const Icon(Icons.add),
                label: const Text("Add"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                  shape: const StadiumBorder(),
                ),
                onPressed: () {},
              ),
              //#END

              //#TEMPLATE button_icon_radius
              ElevatedButton.icon(
                icon: const Icon(Icons.add),
                label: const Text("Add"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // <-- Radius
                  ),
                ),
                onPressed: () {},
              ),
              //#END

              //#TEMPLATE button_icon_continuous
              ElevatedButton.icon(
                icon: const Icon(Icons.add),
                label: const Text("Add"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                  shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.circular(64.0),
                  ),
                ),
                onPressed: () {},
              ),
              //#END

              //#TEMPLATE button_icon_beveled
              ElevatedButton.icon(
                icon: const Icon(Icons.add),
                label: const Text("Add"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                  shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {},
              ),
              //#END

              //----------
              //#TEMPLATE button_icon_outline
              OutlinedButton.icon(
                icon: const Icon(Icons.add),
                label: const Text("Add"),
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.blueGrey,
                ),
                onPressed: () {},
              ),
              //#END

              //#TEMPLATE button_icon_outline_stadium
              OutlinedButton.icon(
                icon: const Icon(Icons.add),
                label: const Text("Add"),
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.blueGrey,
                  shape: const StadiumBorder(),
                ),
                onPressed: () {},
              ),
              //#END

              //#TEMPLATE button_icon_outline_radius
              OutlinedButton.icon(
                icon: const Icon(Icons.add),
                label: const Text("Add"),
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.blueGrey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // <-- Radius
                  ),
                ),
                onPressed: () {},
              ),
              //#END

              //#TEMPLATE button_icon_outline_beveled
              OutlinedButton.icon(
                icon: const Icon(Icons.add),
                label: const Text("Add"),
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.blueGrey,
                  shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {},
              ),
              //#END

              //#TEMPLATE button_icon_vertical
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.blueGrey,
                  animationDuration: const Duration(milliseconds: 1000),
                  backgroundColor: Colors.transparent,
                  splashFactory: InkSplash.splashFactory,
                  shadowColor: Colors.transparent,
                  elevation: 0.0,
                ),
                onPressed: () {},
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.home,
                      color: Colors.blueGrey,
                    ),
                    SizedBox(
                      height: 4.0,
                    ),
                    Text(
                      "Menu",
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 8.0,
                      ),
                    ),
                  ],
                ),
              ),
              //#END

              SizedBox(
                height: 0.0,
                width: 0.0,
                child: Scaffold(
                  //#TEMPLATE floating_action_button
                  floatingActionButton: FloatingActionButton(
                    child: const Icon(Icons.add),
                    onPressed: () {
                      //
                    },
                  ),
                  //#END
                ),
              ),

              //#TEMPLATE link
              Link(
                uri: Uri.parse('https://www.youtube.com/c/CapekNgoding'),
                target: LinkTarget.blank,
                builder: (BuildContext ctx, FollowLink? openLink) {
                  return TextButton.icon(
                    onPressed: openLink,
                    icon: const Icon(Icons.link),
                    label: const Text('Open Link'),
                  );
                },
              ),
              //#END
              const SizedBox(
                height: 20.0,
              ),
              //#TEMPLATE link_button
              Link(
                uri: Uri.parse('https://www.youtube.com/c/CapekNgoding'),
                target: LinkTarget.blank,
                builder: (BuildContext ctx, FollowLink? openLink) {
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey,
                    ),
                    onPressed: openLink,
                    child: const Text("Open Link"),
                  );
                },
              ),
              //#END
              const SizedBox(
                height: 20.0,
              ),
              //#TEMPLATE link_button_icon
              Link(
                uri: Uri.parse('https://www.youtube.com/c/CapekNgoding'),
                target: LinkTarget.blank,
                builder: (BuildContext ctx, FollowLink? openLink) {
                  return OutlinedButton.icon(
                    icon: const Icon(Icons.link),
                    label: const Text("Open Link"),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.blueGrey,
                    ),
                    onPressed: openLink,
                  );
                },
              ),
              //#END
              const SizedBox(
                height: 20.0,
              ),
              //#TEMPLATE link_icon
              Link(
                uri: Uri.parse('https://www.youtube.com/c/CapekNgoding'),
                target: LinkTarget.blank,
                builder: (BuildContext ctx, FollowLink? openLink) {
                  return IconButton(
                    onPressed: openLink,
                    icon: const Icon(
                      Icons.link,
                      size: 24.0,
                    ),
                  );
                },
              ),
              //#END

              //#GROUP_TEMPLATE icon

              //#TEMPLATE icon
              const Icon(
                Icons.developer_board,
                size: 24.0,
              ),
              //#END

              //#TEMPLATE icon_image
              const ImageIcon(
                NetworkImage(
                  "https://i.ibb.co/rsz6JWq/751463.png",
                ),
                size: 24.0,
              ),
              //#END

              //#TEMPLATE icon_image_asset
              const ImageIcon(
                AssetImage(
                  "assets/icon/icon.png",
                ),
                size: 24.0,
              ),
              //#END

              //#TEMPLATE icon_button
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.add,
                  size: 24.0,
                ),
              ),
              //#END

              //#TEMPLATE icon_image_button
              IconButton(
                onPressed: () {},
                icon: const ImageIcon(
                  NetworkImage(
                    "https://i.ibb.co/rsz6JWq/751463.png",
                  ),
                  size: 24.0,
                ),
              ),
              //#END

              //#TEMPLATE icon_image_asset_button
              IconButton(
                onPressed: () {},
                icon: const ImageIcon(
                  AssetImage(
                    "assets/icon/icon.png",
                  ),
                  size: 24.0,
                ),
              ),
              //#END

              //#GROUP_TEMPLATE form_ui
              //#TEMPLATE combo
              Builder(
                builder: (context) {
                  String value = 'Female';
                  var items = [
                    'Female',
                    'Male',
                  ];

                  return Container(
                    padding: const EdgeInsets.all(12),
                    margin: const EdgeInsets.only(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Gender",
                          style:
                              Theme.of(context).inputDecorationTheme.labelStyle,
                        ),
                        DropdownButton(
                          isExpanded: true,
                          value: value,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          items: items.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            debugPrint("newValue: $newValue");
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
              //#END

              //#GROUP_TEMPLATE textfield

              //#TEMPLATE textfield
              Container(
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.only(),
                child: TextFormField(
                  initialValue: 'John Doe',
                  maxLength: 20,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    labelStyle: TextStyle(
                      color: Colors.blueGrey,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blueGrey,
                      ),
                    ),
                    helperText: "What's your name?",
                  ),
                  onChanged: (value) {},
                ),
              ),
              //#END

              //#TEMPLATE textfield_icon
              Container(
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.only(),
                child: TextFormField(
                  initialValue: 'John Doe',
                  maxLength: 20,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    labelStyle: TextStyle(
                      color: Colors.blueGrey,
                    ),
                    suffixIcon: Icon(
                      Icons.abc,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blueGrey,
                      ),
                    ),
                    helperText: "What's your name?",
                  ),
                  onChanged: (value) {},
                ),
              ),
              //#END

              //#TEMPLATE textfield_email
              Container(
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.only(),
                child: TextFormField(
                  initialValue: 'admin@gmail.com',
                  maxLength: 20,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(
                      color: Colors.blueGrey,
                    ),
                    suffixIcon: Icon(
                      Icons.email,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blueGrey,
                      ),
                    ),
                    helperText: 'Enter your email address',
                  ),
                  onChanged: (value) {},
                ),
              ),
              //#END

              //#TEMPLATE textfield_password
              Container(
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.only(),
                child: TextFormField(
                  initialValue: '123456',
                  maxLength: 20,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(
                      color: Colors.blueGrey,
                    ),
                    suffixIcon: Icon(
                      Icons.password,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blueGrey,
                      ),
                    ),
                    helperText: 'Enter your password',
                  ),
                  onChanged: (value) {},
                ),
              ),
              //#END

              //#TEMPLATE textfield_radius
              Container(
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.only(),
                child: TextFormField(
                  initialValue: null,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: "Amount",
                    hintText: "Search",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onChanged: (value) {},
                ),
              ),
              //#END

              //#TEMPLATE textfield_search1
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 6.0,
                  horizontal: 12.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: const BorderRadius.all(
                    Radius.circular(12.0),
                  ),
                  border: Border.all(
                    width: 1.0,
                    color: Colors.grey[400]!,
                  ),
                ),
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.search),
                    ),
                    Expanded(
                      child: TextFormField(
                        initialValue: null,
                        decoration: const InputDecoration.collapsed(
                          filled: true,
                          fillColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          hintText: "Search",
                        ),
                        onFieldSubmitted: (value) {},
                      ),
                    ),
                  ],
                ),
              ),
              //#END
              const SizedBox(
                height: 20.0,
              ),

              //#TEMPLATE textfield_search2
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 6.0,
                  horizontal: 12.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.search,
                        color: Colors.grey[500],
                      ),
                    ),
                    Expanded(
                      child: TextFormField(
                        initialValue: null,
                        decoration: InputDecoration.collapsed(
                          filled: true,
                          fillColor: Colors.transparent,
                          hintText: "What are you craving?",
                          hintStyle: TextStyle(
                            color: Colors.grey[500],
                          ),
                          hoverColor: Colors.transparent,
                        ),
                        onFieldSubmitted: (value) {},
                      ),
                    ),
                  ],
                ),
              ),
              //#END
              const SizedBox(
                height: 20.0,
              ),

              //#TEMPLATE textfield_search3
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 6.0,
                  horizontal: 12.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(12.0),
                  ),
                  border: Border.all(
                    width: 1.0,
                    color: Colors.grey[400]!,
                  ),
                ),
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.search),
                    ),
                    Expanded(
                      child: TextFormField(
                        initialValue: null,
                        decoration: const InputDecoration.collapsed(
                          filled: true,
                          fillColor: Colors.transparent,
                          hintText: "Search",
                          hoverColor: Colors.transparent,
                        ),
                        onFieldSubmitted: (value) {},
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.sort,
                          size: 20.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //#END

              //#TEMPLATE textfield_autocomplete
              Container(
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.only(),
                child: LayoutBuilder(builder: (context, constraints) {
                  List<String> items = <String>[
                    'Angela',
                    'Ardy',
                    'Fizfat',
                    'Dita',
                    'Rimuru',
                    'Deny',
                    'John',
                    'Roy',
                  ];

                  return Autocomplete<String>(
                    fieldViewBuilder: (context, textEditingController,
                        focusNode, onFieldSubmitted) {
                      return TextField(
                        controller: textEditingController,
                        focusNode: focusNode,
                        onSubmitted: (text) => onFieldSubmitted(),
                        decoration: const InputDecoration(
                          labelText: 'Search',
                          labelStyle: TextStyle(
                            color: Colors.blueGrey,
                          ),
                          suffixIcon: Icon(
                            Icons.search,
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blueGrey,
                            ),
                          ),
                          helperText: "Let's start with some characters",
                        ),
                      );
                    },
                    initialValue: const TextEditingValue(
                      text: "Roy",
                    ),
                    onSelected: (String value) {
                      //selected value
                    },
                    optionsBuilder: (TextEditingValue textEditingValue) {
                      if (textEditingValue.text == '') {
                        return const Iterable<String>.empty();
                      }
                      return items.where((String option) {
                        return option
                            .contains(textEditingValue.text.toLowerCase());
                      });
                    },
                  );
                }),
              ),
              //#END
              //#TEMPLATE textfield_autocomplete_radius
              Container(
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.only(),
                child: LayoutBuilder(builder: (context, constraints) {
                  List<String> items = <String>[
                    'Angela',
                    'Ardy',
                    'Fizfat',
                    'Dita',
                    'Rimuru',
                    'Deny',
                    'John',
                    'Roy',
                  ];

                  return Autocomplete<String>(
                    fieldViewBuilder: (context, textEditingController,
                        focusNode, onFieldSubmitted) {
                      return TextField(
                        controller: textEditingController,
                        focusNode: focusNode,
                        onSubmitted: (text) => onFieldSubmitted(),
                        decoration: const InputDecoration(
                          labelText: 'Search',
                          labelStyle: TextStyle(
                            color: Colors.blueGrey,
                          ),
                          suffixIcon: Icon(
                            Icons.search,
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blueGrey,
                            ),
                          ),
                          helperText: "Let's start with some characters",
                        ),
                      );
                    },
                    initialValue: const TextEditingValue(
                      text: "Rosita",
                    ),
                    onSelected: (String value) {
                      //selected value
                    },
                    optionsBuilder: (TextEditingValue textEditingValue) {
                      if (textEditingValue.text == '') {
                        return const Iterable<String>.empty();
                      }
                      return items.where((String option) {
                        return option
                            .contains(textEditingValue.text.toLowerCase());
                      });
                    },
                    optionsViewBuilder: (context, onSelected, options) => Align(
                      alignment: Alignment.topLeft,
                      child: Material(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(4.0),
                          ),
                        ),
                        child: Container(
                          width: constraints.biggest.width,
                          margin: const EdgeInsets.only(top: 10.0),
                          child: Wrap(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey[100],
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(12.0),
                                  ),
                                  border: Border.all(
                                    width: 1.0,
                                    color: Colors.grey[300]!,
                                  ),
                                ),
                                child: ListView.builder(
                                  padding: EdgeInsets.zero,
                                  itemCount: options.length,
                                  shrinkWrap: true,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    bool selected =
                                        AutocompleteHighlightedOption.of(
                                                context) ==
                                            index;
                                    String option = options.elementAt(index);
                                    return InkWell(
                                      onTap: () => onSelected(option),
                                      child: Container(
                                        height: 50.0,
                                        padding: const EdgeInsets.only(
                                          left: 20.0,
                                          right: 20.0,
                                          top: 10.0,
                                          bottom: 10.0,
                                        ),
                                        decoration: BoxDecoration(
                                          color: selected
                                              ? Theme.of(context).focusColor
                                              : null,
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(
                                              index == 0 ? 12 : 0,
                                            ),
                                            topRight: Radius.circular(
                                              index == 0 ? 12 : 0,
                                            ),
                                            bottomLeft: Radius.circular(
                                              index == options.length - 1
                                                  ? 12
                                                  : 0.0,
                                            ),
                                            bottomRight: Radius.circular(
                                              index == options.length - 1
                                                  ? 12
                                                  : 0.0,
                                            ),
                                          ),
                                        ),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              option,
                                              style: TextStyle(
                                                color: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1!
                                                    .color,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
              //#END
              //#TEMPLATE textfield_autocomplete_people
              Container(
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.only(),
                child: LayoutBuilder(builder: (context, constraints) {
                  List<Map> items = <Map>[
                    {
                      "photo": "https://i.ibb.co/PGv8ZzG/me.jpg",
                      "label": "John Doe",
                      "info": "Programmer"
                    },
                    {
                      "photo":
                          "https://i.ibb.co/5v5RLKr/photo-1528813860492-bb99459ec095-crop-entropy-cs-tinysrgb-fit-max-fm-jpg-ixid-Mnwy-ODA4-ODh8-MHwxf-H.jpg",
                      "label": "Renata",
                      "info": "System Analyst"
                    },
                    {
                      "photo":
                          "https://i.ibb.co/mR8PJCz/photo-1576570734316-e9d0317d7384-crop-entropy-cs-tinysrgb-fit-max-fm-jpg-ixid-Mnwy-ODA4-ODh8-MHwxf-H.jpg",
                      "label": "Kayla",
                      "info": "Test Engineer"
                    }
                  ];

                  return Autocomplete<Map>(
                    fieldViewBuilder: (context, textEditingController,
                        focusNode, onFieldSubmitted) {
                      return TextField(
                        controller: textEditingController,
                        focusNode: focusNode,
                        onSubmitted: (text) => onFieldSubmitted(),
                        decoration: const InputDecoration(
                          labelText: 'Search',
                          labelStyle: TextStyle(
                            color: Colors.blueGrey,
                          ),
                          suffixIcon: Icon(
                            Icons.search,
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blueGrey,
                            ),
                          ),
                          helperText: "Let's start with some characters",
                        ),
                      );
                    },
                    initialValue: TextEditingValue(
                      text: items.first["label"],
                    ),
                    onSelected: (Map value) {
                      //selected value
                    },
                    optionsBuilder: (TextEditingValue textEditingValue) {
                      if (textEditingValue.text == '') {
                        return const Iterable<Map>.empty();
                      }
                      return items.where((Map option) {
                        return option["label"]
                            .toString()
                            .toLowerCase()
                            .contains(textEditingValue.text.toLowerCase());
                      });
                    },
                    displayStringForOption: (option) {
                      return option["label"];
                    },
                    optionsViewBuilder: (context, onSelected, options) => Align(
                      alignment: Alignment.topLeft,
                      child: Material(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(4.0),
                          ),
                        ),
                        child: Container(
                          width: constraints.biggest.width,
                          margin: const EdgeInsets.only(top: 10.0),
                          child: Wrap(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey[100],
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(12.0),
                                  ),
                                  border: Border.all(
                                    width: 1.0,
                                    color: Colors.grey[300]!,
                                  ),
                                ),
                                child: ListView.builder(
                                  padding: EdgeInsets.zero,
                                  itemCount: options.length,
                                  shrinkWrap: true,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    bool selected =
                                        AutocompleteHighlightedOption.of(
                                                context) ==
                                            index;
                                    Map option = options.elementAt(index);

                                    return InkWell(
                                      onTap: () => onSelected(option),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: selected
                                              ? Theme.of(context).focusColor
                                              : null,
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(
                                              index == 0 ? 12 : 0,
                                            ),
                                            topRight: Radius.circular(
                                              index == 0 ? 12 : 0,
                                            ),
                                            bottomLeft: Radius.circular(
                                              index == options.length - 1
                                                  ? 12
                                                  : 0.0,
                                            ),
                                            bottomRight: Radius.circular(
                                              index == options.length - 1
                                                  ? 12
                                                  : 0.0,
                                            ),
                                          ),
                                        ),
                                        child: ListTile(
                                          leading: CircleAvatar(
                                            backgroundImage: NetworkImage(
                                              option["photo"],
                                            ),
                                          ),
                                          title: Text("${option["label"]}"),
                                          subtitle: Text("${option["info"]}"),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
              //#END
            ],
          ),
        ),
      ),
    );
  }
}
