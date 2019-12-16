// import 'package:flutter/material.dart';
// import 'package:file_picker/file_picker.dart';

// class FilePickerDemo extends StatefulWidget {
//   final String patientId;
//   FilePickerDemo({this.patientId});
//   @override
//   _FilePickerDemoState createState() => _FilePickerDemoState();
// }

// class _FilePickerDemoState extends State<FilePickerDemo> {
//   String _loader = 'initial';
//   bool _uploadbutton = false;
//   FileType _pickingType;
//   TextEditingController _controller = new TextEditingController();
//   bool _hasValidMime = false;
//   bool _multiPick = false;

//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       body: new Center(
//           // child: _loader == 'loading'
//           //     ? new Container(
//           //         padding: const EdgeInsets.all(10.0),
//           //         child: new Column(
//           //           mainAxisAlignment: MainAxisAlignment.center,
//           //           children: <Widget>[],
//           //         ))
//           //     : Text('hello'))
//           child: _loader == 'done'
//               ? new AlertDialog(
//                   content: new Text('Files have been uploaded successfully.',
//                       style: TextStyle(
//                         fontFamily: "Lato",
//                       )),
//                   actions: [
//                     ButtonTheme(
//                         height: 35.0,
//                         child: RaisedButton(
//                           child: Text(
//                             'OK',
//                             style: TextStyle(
//                                 fontSize: 15,
//                                 fontFamily: "Lato",
//                                 color: Color.fromRGBO(255, 255, 255, 1)),
//                           ),
//                           textColor: Colors.white,
//                           elevation: 1.0,
//                           onPressed: () => Navigator.pop(context),
//                         ))
//                   ],
//                 )
//               : new Padding(
//                   padding: const EdgeInsets.only(left: 10.0, right: 10.0),
//                   child: new SingleChildScrollView(
//                     child: new Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: <Widget>[
//                         new ConstrainedBox(
//                           constraints: BoxConstraints.tightFor(width: 100.0),
//                           child: _pickingType == FileType.CUSTOM
//                               ? new TextFormField(
//                                   maxLength: 15,
//                                   autovalidate: true,
//                                   controller: _controller,
//                                   style: TextStyle(fontFamily: 'Lato'),
//                                   decoration: InputDecoration(
//                                     labelText: 'File extension',
//                                   ),
//                                   keyboardType: TextInputType.text,
//                                   textCapitalization: TextCapitalization.none,
//                                   validator: (value) {
//                                     RegExp reg = new RegExp(r'[^a-zA-Z0-9]');
//                                     if (reg.hasMatch(value)) {
//                                       _hasValidMime = false;
//                                       return 'Invalid format';
//                                     }
//                                     _hasValidMime = true;
//                                     return null;
//                                   },
//                                 )
//                               : new Container(),
//                         ),
//                         new ConstrainedBox(
//                           constraints: BoxConstraints.tightFor(width: 200.0),
//                           child: new SwitchListTile.adaptive(
//                             title: new Text('Pick multiple files',
//                                 style: TextStyle(fontFamily: 'Lato'),
//                                 textAlign: TextAlign.right),
//                             onChanged: (bool value) =>
//                                 setState(() => _multiPick = value),
//                             value: _multiPick,
//                           ),
//                         ),
//                         new Padding(
//                           padding:
//                               const EdgeInsets.only(top: 50.0, bottom: 20.0),
//                           child: new RaisedButton(
//                             onPressed: () => _openFileExplorer(),
//                             child: new Text(
//                               "Open file picker",
//                               style: TextStyle(
//                                   fontFamily: 'Lato',
//                                   fontWeight: FontWeight.bold),
//                             ),
//                           ),
//                         ),
//                         // new Builder(
//                         //   builder: (BuildContext context) => _loadingPath
//                         //       ? Padding(
//                         //           padding: const EdgeInsets.only(bottom: 10.0),
//                         //           child: const CircularProgressIndicator())
//                         //       : _path != null || _paths != null
//                         //           ? new Container(
//                         //               padding:
//                         //                   const EdgeInsets.only(bottom: 30.0),
//                         //               height:
//                         //                   MediaQuery.of(context).size.height *
//                         //                       0.50,
//                         //               child: new Scrollbar(
//                         //                 child: new ListView.separated(
//                         //                   itemCount: _paths != null &&
//                         //                           _paths.isNotEmpty
//                         //                       ? _paths.length
//                         //                       : 1,
//                         //                   itemBuilder: (BuildContext context,
//                         //                       int index) {
//                         //                     final bool isMultiPath =
//                         //                         _paths != null &&
//                         //                             _paths.isNotEmpty;
//                         //                     final String name =
//                         //                         'File $index: ' +
//                         //                             (isMultiPath
//                         //                                 ? _paths.keys
//                         //                                     .toList()[index]
//                         //                                 : _fileName ?? '...');
//                         //                     final path = isMultiPath
//                         //                         ? _paths.values
//                         //                             .toList()[index]
//                         //                             .toString()
//                         //                         : _path;
//                         //                     if (_paths != null) {
//                         //                       docsListValues1 =
//                         //                           _paths.values.toList();
//                         //                     } else if (_path != null) {
//                         //                       docsListValues1.add(_path);
//                         //                     }
//                         //                     return new ListTile(
//                         //                       title: new Text(
//                         //                         name,
//                         //                         style: TextStyle(
//                         //                             fontFamily: 'Lato'),
//                         //                       ),
//                         //                       subtitle: new Text(
//                         //                         path,
//                         //                         style: TextStyle(
//                         //                             fontFamily: 'Lato'),
//                         //                       ),
//                         //                     );
//                         //                   },
//                         //                   separatorBuilder:
//                         //                       (BuildContext context,
//                         //                               int index) =>
//                         //                           new Divider(),
//                         //                 ),
//                         //               ),
//                         //             )
//                         //           : new Container(),
//                         // ),
//                         _uploadbutton
//                             ? ButtonTheme(
//                                 height: 40.0,
//                                 child: RaisedButton(
//                                   child: Text(
//                                     'Upload',
//                                     style: TextStyle(
//                                         fontSize: 15,
//                                         fontFamily: "Lato",
//                                         color:
//                                             Color.fromRGBO(255, 255, 255, 1)),
//                                   ),
//                                   textColor: Colors.white,
//                                   elevation: 1.0,
//                                   onPressed: () {
//                                     // uploadPatientDocs(docsListValues1);
//                                   },
//                                 ))
//                             : new Container(),
//                       ],
//                     ),
//                   ),
//                 )),

//       // _uploadbutton
//       //     ? ButtonTheme(
//       //         child: RaisedButton(
//       //           child: Text('upload',
//       //               style: TextStyle(
//       //                   fontSize: 15,
//       //                   fontFamily: "Lato",
//       //                   color: Color.fromRGBO(255, 255, 255, 1))),
//       //           textColor: Colors.white,
//       //           elevation: 1.0,
//       //           onPressed: () {},
//       //         ),
//       //       )
//       //     : new Container(),
//     );
//   }
// }
