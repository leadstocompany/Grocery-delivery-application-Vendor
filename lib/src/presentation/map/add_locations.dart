import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:http/http.dart' as http;

import 'package:provider/provider.dart';
import 'package:vendor_app/src/core/routes/routes.dart';
import 'package:vendor_app/src/core/utiils_lib/extensions.dart';
import 'package:vendor_app/src/logic/provider/address_provider.dart';

const String googleApiKey = "AIzaSyAi3_Dls63iGs7Nccgdm-4FkS0rhT03-4U";

class AddLocationAddress extends StatefulWidget {
  @override
  _AddLocationAddressState createState() => _AddLocationAddressState();
}

class _AddLocationAddressState extends State<AddLocationAddress> {
  final _formKey = GlobalKey<FormState>();
  late GoogleMapController mapController;
  LatLng _selectedLocation = LatLng(20.5937, 78.9629);

  TextEditingController _pincodeController = TextEditingController();
  TextEditingController _fullNameController = TextEditingController();
  TextEditingController _PhoneNumberController = TextEditingController();
  TextEditingController _addressTypeController = TextEditingController();
  TextEditingController _HouseNoController = TextEditingController();
  TextEditingController _RoadController = TextEditingController();
  TextEditingController _AlterNativeNumberController = TextEditingController();

  @override
  void initState() {
    super.initState();
 //   _determinePosition();
  }

  // Future<void> _determinePosition() async {
  //   bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
  //   if (!serviceEnabled) {
  //     return;
  //   }

  //   LocationPermission permission = await Geolocator.requestPermission();
  //   if (permission == LocationPermission.denied) {
  //     return;
  //   }

  //   Position position = await Geolocator.getCurrentPosition(
  //     desiredAccuracy: LocationAccuracy.high,
  //   );
  //   LatLng currentLatLng = LatLng(position.latitude, position.longitude);

  //   setState(() {
  //     _selectedLocation = currentLatLng;
  //   });

  //   _getAddressFromLatLng(position.latitude, position.longitude);
  // }

  // Future<void> _getAddressFromLatLng(double lat, double lng) async {
  //   final String url =
  //       "https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lng&key=$googleApiKey";

  //   try {
  //     final response = await http.get(Uri.parse(url));
  //     if (response.statusCode == 200) {
  //       final data = json.decode(response.body);
  //       if (data["status"] == "OK") {
  //         var result = data["results"][0]; // First result is most accurate

  //         _RoadController.text = result["formatted_address"];
  //         List components = result["address_components"];

  //         String roadName = "";
  //         String colony = "";
  //         String buildingName = "";
  //         String pincode = "";

  //         for (var component in components) {
  //           List types = component["types"];
  //           if (types.contains("route")) {
  //             roadName = component["long_name"]; // Road Name
  //           } else if (types.contains("sublocality_level_1") ||
  //               types.contains("locality")) {
  //             colony = component["long_name"]; // Colony Name
  //           } else if (types.contains("premise") ||
  //               types.contains("street_number")) {
  //             buildingName = component["long_name"]; // Building Name
  //           } else if (types.contains("postal_code")) {
  //             pincode = component["long_name"]; // Extract Pin Code
  //           }
  //         }

  //         // setState(() {
  //         //   //  _address = formattedAddress;
  //         //   _roadName = roadName;
  //         //   _colony = colony;
  //         //   _buildingName = buildingName;
  //         // });

  //         _pincodeController.text = pincode;
  //         _RoadController.text = result["formatted_address"];

  //         print(
  //             "Full Address: ${result["formatted_address"]}    ${response.body}  sdfsgd  ${pincode}");
  //         print("Road Name: $roadName");
  //         print("Colony: $colony");
  //         print("Building Name: $buildingName");
  //       } else {}
  //     } else {}
  //   } catch (e) {
  //     print("Error fetching address: $e");
  //   }
  // }

  // void _onMapTapped(LatLng tappedPoint) {
  //   setState(() {
  //     _selectedLocation = tappedPoint;
  //   });
  //   _getAddressFromLatLng(tappedPoint.latitude, tappedPoint.longitude);
  // }

  // Future<void> _updateLocationFromPincode(String enteredPincode) async {
  //   if (enteredPincode.isEmpty) return;

  //   try {
  //     List<Location> locations = await locationFromAddress(enteredPincode);
  //     if (locations.isNotEmpty) {
  //       Location location = locations.first;
  //       LatLng newLatLng = LatLng(location.latitude, location.longitude);

  //       setState(() {
  //         _selectedLocation = newLatLng;
  //       });

  //       _getAddressFromLatLng(location.latitude, location.longitude);
  //       mapController.animateCamera(CameraUpdate.newLatLng(newLatLng));
  //     }
  //   } catch (e) {
  //     print("Error fetching location from pincode: $e");
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white, title: Text("Add Address")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: 
            [
              // Container(
              //   height: 200.h,
              //   child: GoogleMap(
              //     initialCameraPosition: CameraPosition(
              //       target: _selectedLocation,
              //       zoom: 14,
              //     ),
              //     onMapCreated: (controller) {
              //       mapController = controller;
              //     },

              //     myLocationEnabled: true, // Enable current location button
              //     myLocationButtonEnabled: true,
              //     markers: {
              //       Marker(
              //         markerId: MarkerId("selected Location"),
              //         position: _selectedLocation,
              //       )
              //     },
              //     onTap: _onMapTapped,
              //   ),
              // ),

              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),
                      TextFormField(
                        controller: _fullNameController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText: "Full Name (Required)*",
                          border: OutlineInputBorder(),
                        ),

                        validator: (value) 
                        {
                          if (value == null || value.isEmpty) {
                            return "Full Name";
                          }
                          return null; // ✅ Valid input
                        },

                        // Auto-update on enter
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: _PhoneNumberController,
                        keyboardType: TextInputType.number,
                        maxLength: 10,
                        decoration: InputDecoration(
                          labelText: "Phone Number (Required)*",
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Phone Number ";
                          }
                          return null; // ✅ Valid input
                        },
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: _pincodeController,
                              keyboardType: TextInputType.number,
                              maxLength: 6,
                              decoration: InputDecoration(
                                  labelText: "Enter Pincode",
                                  border: OutlineInputBorder(),
                                  counterText: ""),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please enter a pincode";
                                } else if (value.length != 6) {
                                  return "Pincode must be exactly 6 digits";
                                } else if (!RegExp(r'^[1-9][0-9]{5}$')
                                    .hasMatch(value)) {
                                  return "Enter a valid Indian pincode";
                                }
                                return null; // ✅ Valid input
                              },
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          // Expanded(
                          //   child: TextFormField(
                          //     controller: _addressTypeController,
                          //     keyboardType: TextInputType.text,
                          //     decoration: InputDecoration(
                          //       labelText: "Address Type",
                          //       border: OutlineInputBorder(),
                          //     ),
                          //     validator: (value) {
                          //       if (value == null || value.isEmpty) {
                          //         return "Enter address Home or Work ";
                          //       }
                          //       return null; // ✅ Valid input
                          //     },
                          //   ),
                          // ),\
                          Expanded(
                            child: DropdownButtonFormField<String>(
                              value: _addressTypeController.text.isNotEmpty
                                  ? _addressTypeController.text
                                  : null,
                              items:
                                  ["HOME", "WORK", "OTHER"].map((String type) {
                                return DropdownMenuItem<String>(
                                  value: type,
                                  child: Text(type),
                                );
                              }).toList(),
                              decoration: InputDecoration(
                                labelText: "Address Type",
                                border: OutlineInputBorder(),
                              ),
                              onChanged: (value) {
                                if (value != null) {
                                  _addressTypeController.text = value;
                                }
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Select Address Type (Home, Work, Other)";
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: _HouseNoController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText: "House No, Building Name (Required)*",
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter House No, Building  ";
                          }
                          return null; // ✅ Valid input
                        },
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: _RoadController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText: "Road Name, Area , Colony(Required)*",
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter Road Name, Area , Colony(Required)";
                          }
                          return null; // ✅ Valid input
                        },
                      ),
                      SizedBox(height: 10),

                      Consumer<AddressProvider>(
                        builder: (context, addressProvider, child) {
                          return InkWell(
                            onTap: () async {
                              if (_formKey.currentState!.validate()) {
                                var status = await addressProvider.checkPin(
                                    context, _pincodeController.text);

                                if (status) {
                                  var state = await addressProvider.addAddress(
                                      context,
                                      _fullNameController.text,
                                      _pincodeController.text,
                                      _PhoneNumberController.text,
                                      _PhoneNumberController.text,
                                      _HouseNoController.text,
                                      _RoadController.text,
                                      _addressTypeController.text);
                                  if (state) {
                                    context.clearAndPush(
                                        routePath: MyRoutes.DASHBOARDSCREEN);
                                  }
                                } else {
                                  Fluttertoast.showToast(
                                    msg: "Pin Code  is not available!",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 14.0,
                                  );
                                }
                              }
                            },
                            child: Container(
                              margin: const EdgeInsets.only(
                                  left: 15, right: 15, top: 10, bottom: 10),
                              height: 50,
                              width: MediaQuery.sizeOf(context).width,
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  if (addressProvider.ischeckpin)
                                    const CircularProgressIndicator(
                                      color: Colors.white,
                                    )
                                  else
                                    Text(
                                      "Save Address",
                                    ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),

                      // InkWell(
                      //   onTap: () async {
                      //     if (_formKey.currentState!.validate()) {
                      //       var status = await Provider.of<AddressProvider>(
                      //               context,
                      //               listen: false)
                      //           .checkPin(context, _pincodeController.text);
                      //       if (status) {
                      //         //  var status = await Provider.of<AddressProvider>(
                      //         //       context,
                      //         //       listen: false)
                      //         //   .addAddress(context, _pincodeController.text);
                      //       } else {
                      //         // Delivery is not available for this pincode. Please try another pincode.

                      //         Fluttertoast.showToast(
                      //           msg:
                      //               "Delivery is not available for this pincode. Please try another pincode!",
                      //           toastLength: Toast.LENGTH_SHORT,
                      //           gravity: ToastGravity.BOTTOM,
                      //           backgroundColor: Colors.red,
                      //           textColor: Colors.white,
                      //           fontSize: 14.0,
                      //         );
                      //       }
                      //     }
                      //   },
                      //   child: Container(
                      //     margin: const EdgeInsets.only(
                      //         left: 15, right: 15, top: 10, bottom: 10),
                      //     height: 50,
                      //     width: MediaQuery.sizeOf(context).width,
                      //     decoration: BoxDecoration(
                      //         color: APPCOLOR.lightGreen,
                      //         borderRadius: BorderRadius.circular(10)),
                      //     child: Row(
                      //       mainAxisAlignment: MainAxisAlignment.center,
                      //       crossAxisAlignment: CrossAxisAlignment.center,
                      //       children: [
                      //         const SizedBox(
                      //           width: 10,
                      //         ),
                      //         Text(
                      //           "Save Address",
                      //           style: context.customMedium(Colors.white, 20),
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),

                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
