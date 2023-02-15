import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:system_mangment/shared/constants.dart';

import '../provider/provider.dart';

class ProfilePictureWidget extends StatelessWidget {
  final double width;
  final double height;

  const ProfilePictureWidget({
    Key key,
    @required this.width,
    @required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<EditProfileProvider>(
      builder: (context, value, child) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: height / 100),
          child: Center(
            child: Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                CircleAvatar(
                  radius: 70,
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  child: value.existPic
                      ? Align(
                          alignment: Alignment.topRight,
                          child: GestureDetector(
                            onTap: () {
                              Provider.of<EditProfileProvider>(context,
                                      listen: false)
                                  .removePickedPic();
                            },
                            child: const Icon(
                              Icons.cancel,
                              color: Constants.color,
                              size: 20,
                            ),
                          ),
                        )
                      : Container(
                          color: Colors.transparent,
                        ),
                ),
                if (value.networkProfilePic == "")
                  CircleAvatar(
                    onBackgroundImageError: (exception, stackTrace) {
                      const Icon(Icons.error);
                    },
                    radius: 65,
                    backgroundColor: Colors.transparent,
                    backgroundImage: NetworkImage(value.networkProfilePic),
                  ),
                if (value.profileImage != null)
                  CircleAvatar(
                    onBackgroundImageError: (exception, stackTrace) {
                      const Icon(Icons.error);
                    },
                    radius: 65,
                    backgroundColor: Colors.transparent,
                    backgroundImage: FileImage(value.profileImage),
                  ),
                if (!value.existPic)
                  const CircleAvatar(
                    radius: 65,
                    backgroundColor: Colors.transparent,
                    child: Icon(
                      Icons.person,
                      size: 90,
                      color: Constants.color,
                    ),
                  ),
                CircleAvatar(
                  backgroundColor: Colors.grey[300],
                  radius: 18,
                  child: IconButton(
                    iconSize: 20,
                    onPressed: () {
                      Provider.of<EditProfileProvider>(context, listen: false)
                          .pickProfileImage();
                    },
                    icon: const Icon(
                      Icons.camera_alt_outlined,
                      color: Constants.color,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
