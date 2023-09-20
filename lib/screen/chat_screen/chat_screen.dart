import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_help_app/VM/service/user_responsitory.dart';
import 'package:doctor_help_app/bloc/doctor/doctor_cubit.dart';
import 'package:doctor_help_app/containts/containts.dart';
import 'package:doctor_help_app/widgets/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';
import 'components/appbar_chat.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

final GlobalKey _key = GlobalKey();

class ChatScreen extends StatefulWidget {
  ChatScreen(
      {Key? key,
      required this.name,
      required this.imageUrl,
      required this.receiverID})
      : super(key: key);
  static String routeName = 'ChatScreen';

  @override
  State<ChatScreen> createState() => _ChatScreenState();
  String name;
  String imageUrl;
  String receiverID;
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController mess = TextEditingController();
  final UserResponsitory _userResponsitory = UserResponsitory();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  List<types.Message> _messages = [];
  final _user = const types.User(
    id: '82091008-a484-4a89-ae75-a22bf8d6f3ac',
  );

  void _handleSendPressed(types.PartialText message) {
    final textMessage = types.TextMessage(
      author: _user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: 'id',
      text: message.text,
    );

    _addMessage(textMessage);
  }

  void _addMessage(types.Message message) {
    setState(() {
      _messages.insert(0, message);
    });
  }

  void sendMess() async {
    if (mess.text.isNotEmpty) {
      await _userResponsitory.sendMess(widget.receiverID, mess.text);
      mess.clear();
    }
  }

  CollectionReference chats = FirebaseFirestore.instance.collection('chats');
  @override
  void initState() {
    BlocProvider.of<DoctorCubit>(context).getListDataDoctor();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => unfocusKeyboard(),
      child: Scaffold(
        body: SafeArea(
          // child: BlocBuilder<DoctorCubit, DoctorState>(
          //   builder: (context, state) {
              // if (state is DoctorSuccess) {
                child: Column(
                  children: [
                    appBarChat(context, widget.imageUrl, widget.name),
                    // Expanded(child: _messagesList()),
                    Expanded(
                        child: Chat(
                            messages: _messages,
                            onSendPressed: _handleSendPressed,
                            onAttachmentPressed: (){},
                            user: _user)),
                    // Container(
                    //   height: 90.h,
                    //   width: MediaQuery.of(context).size.width,
                    //   padding: EdgeInsets.only(top: 8.h),
                    //   decoration: BoxDecoration(
                    //       color: Colors.white,
                    //       boxShadow: [
                    //         BoxShadow(
                    //             color: Colors.grey.shade300,
                    //             blurRadius: 10,
                    //             spreadRadius: 2)
                    //       ]),
                    //   alignment: Alignment.topCenter,
                    //   child: Form(
                    //     key: _key,
                    //     child: Row(
                    //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //       children: [
                    //         InkWell(
                    //           onTap: () {},
                    //           child: SvgPicture.asset(iconFile),
                    //         ),
                    //         SizedBox(
                    //           width: 248.w,
                    //           child: InputTextField(
                    //               text: mess, hintext: 'Type Message'),
                    //         ),
                    //         InkWell(
                    //           onTap: sendMess,
                    //           // onTap: (){
                    //           //   var test = _userResponsitory.getMessage(
                    //           //       widget.receiverID, _auth.currentUser!.uid);
                    //           //   print(test);
                    //           // },
                    //           child: SvgPicture.asset(iconMic),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // )
                  ],
                )
              // }
              // return Center(
              //   child: CircularProgressIndicator(),
              // );
            // },
          // ),
        ),
      ),
    );
  }

  // Widget _messagesList() {
  //   return StreamBuilder(
  //     stream: _userResponsitory.getMessage(
  //         widget.receiverID, _auth.currentUser!.uid),
  //     builder: (context, snapshot) {
  //       if (snapshot.hasError) {
  //         return Text('Error: ${snapshot.error}');
  //       }
  //       if (snapshot.connectionState == ConnectionState.waiting) {
  //         return Center(
  //           child: CircularProgressIndicator(),
  //         );
  //       }
  //       // return Container(
  //       //   child: Column(
  //       //     children:[
  //       //       Text(snapshot.data!.docs.map((e) => e).toString())
  //       //     ]
  //       //   ),
  //       // );
  //       return ListView(
  //         // reverse: true,
  //         children: snapshot.data!.docs
  //             .map((data) => _messagesItem(data))
  //             .toList()
  //            ,
  //       );
  //     },
  //   );
  // }
  //
  // Widget _messagesItem(DocumentSnapshot snapshot) {
  //   Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
  //   print('test: ${_auth.currentUser!.uid}');
  //   var alignment = (data['senderID'] == _auth.currentUser!.uid)
  //       ? Alignment.centerRight
  //       : Alignment.centerLeft;
  //   // print(formatDatetime((data['timestamp'] as Timestamp)).toString());
  //   return Container(
  //     padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
  //     alignment: alignment,
  //     child: Column(
  //       mainAxisAlignment: MainAxisAlignment.end,
  //       children: [
  //         // Text('data')
  //         Container(
  //           child: Text(
  //             data['message'],
  //             style: txt16w4!.copyWith(color: Colors.white),
  //           ),
  //           padding: EdgeInsets.all(10),
  //           decoration: BoxDecoration(
  //               color: colorOnlineStatus,
  //               borderRadius: BorderRadius.circular(12)),
  //         ),
  //         Text(
  //           '${formatDatetime((data['timestamp'] as Timestamp))}',
  //           style: txt12w4!.copyWith(color: Colors.grey),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}

// int sortListByDateAndPrice(
//     DateTime timeFirst, DateTime timeSecond, int firstPrice, int secondPrice) {
//   int result = timeFirst.compareTo(timeSecond);
//   if (result != 0) {
//     return result;
//   } else {
//     return firstPrice.compareTo(secondPrice);
//   }
// }
//
// listOutbound.sort((a, b) => sortListByDateAndPrice(
// b.getArrivalDate,
// a.getArrivalDate,
// (a.priceAdult! + a.totalFeeTaxAdt!),
// (b.priceAdult! + b.totalFeeTaxAdt!),
// ));

formatDatetime(var time) {
  var d12 = DateFormat('hh:mm a').format(time.toDate());
  return d12;
}

// Widget MessageUI() {
//   return StreamBuilder<QuerySnapshot>(
//       stream: FirebaseFirestore.instance.collection('User').snapshots(),
//       builder: (context, snapshot) {
//         if (snapshot.hasError) {
//           return Text('Error');
//         }
//         if (snapshot.hasError) {
//           return Text('Loading...');
//         }
//         return ListView(
//           children: snapshot.data!.docs
//               .map<Widget>((doc) => _buildItemDoc(doc))
//               .toList(),
//         );
//       });
// }

// _buildItemDoc(DocumentSnapshot doc) {
//   Map<String, dynamic> data = doc.data()! as Map<String, dynamic>;
//   if (FirebaseAuth.instance.currentUser!.email != data['email']) {
//     return ListTile(
//       title: data['email'],
//       onTap: () {},
//     );
//   }
// }

// import 'dart:io';
//
// import 'package:file_picker/file_picker.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
// import 'package:flutter_chat_ui/flutter_chat_ui.dart';
// import 'package:flutter_firebase_chat_core/flutter_firebase_chat_core.dart';
// import 'package:http/http.dart' as http;
// import 'package:image_picker/image_picker.dart';
// import 'package:mime/mime.dart';
// import 'package:open_filex/open_filex.dart';
// import 'package:path_provider/path_provider.dart';
//
// class ChatScreen extends StatefulWidget {
//   const ChatScreen({
//     super.key,
//     required this.room,
//   });
//   static String routeName = 'ChatScreen';
//
//   final types.Room room;
//
//   @override
//   State<ChatScreen> createState() => _ChatScreenState();
// }
//
// class _ChatScreenState extends State<ChatScreen> {
//   bool _isAttachmentUploading = false;
//
//   void _handleAtachmentPressed() {
//     showModalBottomSheet<void>(
//       context: context,
//       builder: (BuildContext context) => SafeArea(
//         child: SizedBox(
//           height: 144,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: <Widget>[
//               TextButton(
//                 onPressed: () {
//                   Navigator.pop(context);
//                   _handleImageSelection();
//                 },
//                 child: const Align(
//                   alignment: Alignment.centerLeft,
//                   child: Text('Photo'),
//                 ),
//               ),
//               TextButton(
//                 onPressed: () {
//                   Navigator.pop(context);
//                   _handleFileSelection();
//                 },
//                 child: const Align(
//                   alignment: Alignment.centerLeft,
//                   child: Text('File'),
//                 ),
//               ),
//               TextButton(
//                 onPressed: () => Navigator.pop(context),
//                 child: const Align(
//                   alignment: Alignment.centerLeft,
//                   child: Text('Cancel'),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   void _handleFileSelection() async {
//     final result = await FilePicker.platform.pickFiles(
//       type: FileType.any,
//     );
//
//     if (result != null && result.files.single.path != null) {
//       _setAttachmentUploading(true);
//       final name = result.files.single.name;
//       final filePath = result.files.single.path!;
//       final file = File(filePath);
//
//       try {
//         final reference = FirebaseStorage.instance.ref(name);
//         await reference.putFile(file);
//         final uri = await reference.getDownloadURL();
//
//         final message = types.PartialFile(
//           mimeType: lookupMimeType(filePath),
//           name: name,
//           size: result.files.single.size,
//           uri: uri,
//         );
//
//         FirebaseChatCore.instance.sendMessage(message, widget.room.id);
//         _setAttachmentUploading(false);
//       } finally {
//         _setAttachmentUploading(false);
//       }
//     }
//   }
//
//   void _handleImageSelection() async {
//     final result = await ImagePicker().pickImage(
//       imageQuality: 70,
//       maxWidth: 1440,
//       source: ImageSource.gallery,
//     );
//
//     if (result != null) {
//       _setAttachmentUploading(true);
//       final file = File(result.path);
//       final size = file.lengthSync();
//       final bytes = await result.readAsBytes();
//       final image = await decodeImageFromList(bytes);
//       final name = result.name;
//
//       try {
//         final reference = FirebaseStorage.instance.ref(name);
//         await reference.putFile(file);
//         final uri = await reference.getDownloadURL();
//
//         final message = types.PartialImage(
//           height: image.height.toDouble(),
//           name: name,
//           size: size,
//           uri: uri,
//           width: image.width.toDouble(),
//         );
//
//         FirebaseChatCore.instance.sendMessage(
//           message,
//           widget.room.id,
//         );
//         _setAttachmentUploading(false);
//       } finally {
//         _setAttachmentUploading(false);
//       }
//     }
//   }
//
//   void _handleMessageTap(BuildContext _, types.Message message) async {
//     if (message is types.FileMessage) {
//       var localPath = message.uri;
//
//       if (message.uri.startsWith('http')) {
//         try {
//           final updatedMessage = message.copyWith(isLoading: true);
//           FirebaseChatCore.instance.updateMessage(
//             updatedMessage,
//             widget.room.id,
//           );
//
//           final client = http.Client();
//           final request = await client.get(Uri.parse(message.uri));
//           final bytes = request.bodyBytes;
//           final documentsDir = (await getApplicationDocumentsDirectory()).path;
//           localPath = '$documentsDir/${message.name}';
//
//           if (!File(localPath).existsSync()) {
//             final file = File(localPath);
//             await file.writeAsBytes(bytes);
//           }
//         } finally {
//           final updatedMessage = message.copyWith(isLoading: false);
//           FirebaseChatCore.instance.updateMessage(
//             updatedMessage,
//             widget.room.id,
//           );
//         }
//       }
//
//       await OpenFilex.open(localPath);
//     }
//   }
//
//   void _handlePreviewDataFetched(
//       types.TextMessage message,
//       types.PreviewData previewData,
//       ) {
//     final updatedMessage = message.copyWith(previewData: previewData);
//
//     FirebaseChatCore.instance.updateMessage(updatedMessage, widget.room.id);
//   }
//
//   void _handleSendPressed(types.PartialText message) {
//     FirebaseChatCore.instance.sendMessage(
//       message,
//       widget.room.id,
//     );
//   }
//
//   void _setAttachmentUploading(bool uploading) {
//     setState(() {
//       _isAttachmentUploading = uploading;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) => Scaffold(
//     appBar: AppBar(
//       systemOverlayStyle: SystemUiOverlayStyle.light,
//       title: const Text('Chat'),
//     ),
//     body: StreamBuilder<types.Room>(
//       initialData: widget.room,
//       stream: FirebaseChatCore.instance.room(widget.room.id),
//       builder: (context, snapshot) => StreamBuilder<List<types.Message>>(
//         initialData: const [],
//         stream: FirebaseChatCore.instance.messages(snapshot.data!),
//         builder: (context, snapshot) => Chat(
//           isAttachmentUploading: _isAttachmentUploading,
//           messages: snapshot.data ?? [],
//           onAttachmentPressed: _handleAtachmentPressed,
//           onMessageTap: _handleMessageTap,
//           onPreviewDataFetched: _handlePreviewDataFetched,
//           onSendPressed: _handleSendPressed,
//           user: types.User(
//             id: FirebaseChatCore.instance.firebaseUser?.uid ?? '',
//           ),
//         ),
//       ),
//     ),
//   );
// }
