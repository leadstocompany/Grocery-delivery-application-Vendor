import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:vendor_app/src/core/image/app_images.dart';
import 'package:vendor_app/src/core/utiils_lib/extensions.dart';
import 'package:vendor_app/src/core/utiils_lib/network_image.dart';
import 'package:vendor_app/src/data/myOrder.dart';
import 'package:vendor_app/src/logic/provider/home_provider.dart';
import 'package:vendor_app/src/presentation/widgets/elevated_button.dart';

class CustomerOrder extends StatefulWidget {
  final DatumOrder order;

  const CustomerOrder({super.key, required this.order});

  @override
  State<CustomerOrder> createState() => _CustomerOrderState();
}

class _CustomerOrderState extends State<CustomerOrder> {
  String? title;
  int? status;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: context.appColor.blackColor,
          ),
          onPressed: () {
            Navigator.pop(context); // Handle back button functionality
          },
        ),
        title: Text('Customer’s Order',
            style: context.subTitleTextStyleBloack.copyWith(fontSize: 16.sp)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              cardOrder(),
              Gap(20.h),
              detailsCategory(),
              //  if (title == "New Order")
              //  orderProcess(),

              Gap(20.h),
              if (title == "Awaiting Pickup" || title == "Completed") ...{
                Text(
                  'Agent’s Information',
                  style: context.titleStyleRegular.copyWith(),
                ),
                Gap(20.h),
                CustomerInformation()
              },
              if (title == "Cancelled") ...{
                Text(
                  'Agent’s Information',
                  style: context.titleStyleRegular.copyWith(),
                ),
                Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        Icon(Icons.circle, size: 15, color: Colors.black),
                        Text(
                          ' Order cancelled by the customer. ',
                          style: context.subTitleTextStyleBloack.copyWith(),
                        ),
                      ],
                    ))
              }
            ],
          ),
        ),
      ),
    );
  }

  Widget cardOrder() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: context.appColor.greyColor100),
        color: context.appColor.whiteColor,
        borderRadius: BorderRadius.all(Radius.circular(3.0)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Row(
          children: [
            Flexible(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${widget.order.customer!.name ?? "Unknown"} ",
                    style: context.subTitleTextStyleBloack,
                  ),
                  Text(
                    " ${widget.order.deliveryAddress?.addressLine}  ${widget.order.deliveryAddress?.city}" ??
                        "No Address Available",
                    style: context.subTitleTxtStyle,
                  ),
                  Text(
                    widget.order.customer?.phone ?? "No Phone Available",
                    style: context.subTitleTxtStyle,
                  ),
                ],
              ),
            ),
            // Spacer(),
            // Container(
            //   decoration: BoxDecoration(
            //     color: getStatus() ?? Colors.grey, // Default color if null
            //     borderRadius: const BorderRadius.all(Radius.circular(3.0)),
            //   ),
            //   child: Padding(
            //     padding: const EdgeInsets.all(4.0),
            //     child: Text(
            //       widget.order.orderStatus,
            //       style: context.buttonTestStyle.copyWith(
            //         color: getTextColor() ?? Colors.white, // Default text color
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Widget detailsCategory() {
    return Container(
        height: 450.h,
        decoration: BoxDecoration(
          border: Border.all(color: context.appColor.greyColor100),
          color: context.appColor.whiteColor,
          borderRadius: BorderRadius.all(Radius.circular(3.0)),
        ),
        child: Column(
          children: [
            Container(
              height: 400.h,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: widget.order.items!.length,
                itemBuilder: (context, index) {
                  var orderitem = widget.order.items![index];
                  Provider.of<HomeProvider>(context, listen: false)
                      .orderStatus = orderitem.status;

                  print("kdjgkjfdkgjh  ${orderitem.status}");

                  return Consumer<HomeProvider>(
                      builder: (context, statusProvider, child) {
                    return InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    // double.infinity,
                                    child: ButtonElevated(
                                      height: 30,
                                      text: '   Process Order   ',
                                      onPressed: () {
                                        _showBottomSheet(context, orderitem.id);
                                      },
                                      backgroundColor:
                                          context.appColor.primarycolor,
                                    ),
                                  ),
                                  Spacer(),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: getStatus() ?? Colors.grey,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(3.0)),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Text(
                                        statusProvider.orderStatus,
                                        style: context.buttonTestStyle.copyWith(
                                          color: getTextColor() ?? Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 8.0, right: 8),
                                child: Row(
                                  children: [
                                    AppNetworkImage(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.08,
                                      width: 48,
                                      imageUrl: orderitem.productImage,
                                      backGroundColor: Colors.transparent,
                                    ),
                                    Gap(5.w),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          orderitem.productName,
                                          style: context.buttonTestStyle
                                              .copyWith(),
                                        ),
                                        Text(
                                          orderitem.quantity.toString(),
                                          style: context.buttonTestStyle
                                              .copyWith(
                                                  color: context
                                                      .appColor.greyColor),
                                        ),
                                      ],
                                    ),
                                    Spacer(),
                                    Text(
                                      orderitem.totalOrderItemPrice ?? " ",
                                      style: context.buttonTestStyle.copyWith(),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  Spacer(),

                                  // SizedBox(
                                  //   // double.infinity,
                                  //   child: ButtonElevated(
                                  //     height: 30,
                                  //     text: ' Update Status ',
                                  //     onPressed: () async {
                                  //       //               var status =
                                  //       // await Provider.of<HomeProvider>(context, listen: false)
                                  //       //     .updateStatus(context, id, value);
                                  //     },
                                  //     backgroundColor: context.appColor.secondary,
                                  //   ),
                                  // ),

                                  if (statusProvider.orderStatus == "PENDING" ||
                                      statusProvider.orderStatus ==
                                          "PROCESSING")
                                    Container(
                                        width: 150,
                                        height: 35,
                                        child: DropdownButtonFormField<String>(
                                          value: statusProvider.selectedStatus,
                                          hint: Text("Update Status"),
                                          onChanged: (String? newValue) async {
                                            if (newValue != null) {
                                              statusProvider
                                                  .updateselectedStatus(context,
                                                      newValue, orderitem.id);

                                              var status = await statusProvider
                                                  .updateStatus(context,
                                                      newValue, orderitem.id);
                                              Provider.of<HomeProvider>(context,
                                                      listen: false)
                                                  .getMyOrder(
                                                context,
                                              );

                                              Navigator.pop(context);
                                            }
                                          },
                                          items: statusProvider.statusOptions
                                              .map((String status) {
                                            return DropdownMenuItem<String>(
                                              value: status,
                                              child: Text(status),
                                            );
                                          }).toList(),
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 10,
                                                    vertical: 1),
                                          ),
                                        )),

                                  // Update Status Button
                                  // Consumer<HomeProvider>(
                                  //   builder: (context, statusProvider, child) {
                                  //     return SizedBox(
                                  //       child: ElevatedButton(
                                  //         style: ElevatedButton.styleFrom(
                                  //           backgroundColor: Theme.of(context)
                                  //               .colorScheme
                                  //               .secondary,
                                  //           padding: EdgeInsets.symmetric(
                                  //               vertical: 10, horizontal: 20),
                                  //         ),
                                  //         onPressed: () async {
                                  //           if (statusProvider.selectedStatus !=
                                  //               null) {
                                  //             print(
                                  //                 "Updating status to: ${statusProvider.selectedStatus}");
                                  //           } else {
                                  //             ScaffoldMessenger.of(context)
                                  //                 .showSnackBar(
                                  //               SnackBar(
                                  //                   content: Text(
                                  //                       "Please select a status first!")),
                                  //             );
                                  //           }
                                  //         },
                                  //         child: Text("Update Status"),
                                  //       ),
                                  //     );
                                  //   },
                                  // ),
                                ],
                              ),
                              Divider(
                                thickness: 0.2,
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  });
                },
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.only(left: 8.0, right: 8),
            //   child: Row(
            //     children: [
            //       Gap(5.w),
            //       Padding(
            //         padding: EdgeInsets.only(left: 65.w),
            //         child: Text(
            //           "Total",
            //           style: context.buttonTestStyle.copyWith(),
            //         ),
            //       ),
            //       Spacer(),
            //       Padding(
            //         padding: const EdgeInsets.only(right: 10.0),
            //         child: Text(
            //           "${widget.order.storeSubtotal}",
            //           style: context.buttonTestStyle.copyWith(),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ));

    ;
  }

  Widget orderProcess() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Center(
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "₹${widget.order.storeSubtotal}",
                      style: context.subTitleTextStyleBloack
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    Gap(10.w),
                    Icon(Icons.check_circle,
                        color: context.appColor.primarycolor),
                    Text(
                      "Paid",
                      style: context.subTitleTxtStyle.copyWith(
                          fontWeight: FontWeight.bold,
                          color: context.appColor.primarycolor),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ButtonElevated(
                text: 'Process Order',
                onPressed: () {
                  //   _showBottomSheet(context);
                },
                backgroundColor: context.appColor.primarycolor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget CustomerInformation() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: context.appColor.greyColor100),
        color: context.appColor.whiteColor,
        borderRadius: BorderRadius.all(Radius.circular(3.0)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            InkWell(
              onTap: () {},
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image.network(
                  "",
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      AppImages.image,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
            ),
            Gap(10.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Order awaiting pickup 9:00 am',
                  style: context.buttonTestStyle.copyWith(fontSize: 13.sp),
                ),
                Text(
                  'Adekunle is on his way to pickup',
                  style: context.buttonTestStyle.copyWith(
                      color: context.appColor.greyColor, fontSize: 13.sp),
                ),
              ],
            ),
            Gap(10.w),
            Icon(
              Icons.call,
              size: 40,
            )
          ],
        ),
      ),
    );
  }

  String otpcode = '';
  void _showBottomSheet(BuildContext context, id) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
            border: Border.all(color: context.appColor.greyColor400),
            color: context.appColor.whiteColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0)),
          ),
          padding: EdgeInsets.all(20.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Image.asset(
                  AppImages.applogo,
                  height: 100.h,
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Text('Please Enter OTP', style: context.subTitleStyle),
              ),
              Gap(20.h),
              Pinput(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                length: 6,
                defaultPinTheme: PinTheme(
                  padding: EdgeInsets.symmetric(
                    vertical: 5.h,
                    horizontal: 8.w,
                  ),
                  decoration: BoxDecoration(
                    color: context.appColor.whiteColor,
                    borderRadius: BorderRadius.circular(4.r),
                    border: Border.all(
                        color: context.appColor.greyColor400, width: 1),
                  ),
                  textStyle:
                      context.subTitleTextStyle.copyWith(fontSize: 20.sp),
                ),
                focusedPinTheme: PinTheme(
                  decoration: BoxDecoration(
                    color: context.appColor.greyColor100,
                    borderRadius: BorderRadius.circular(4.r),
                    border:
                        Border.all(color: context.appColor.primary, width: 1),
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: 5.h,
                    horizontal: 8.w,
                  ),
                  textStyle:
                      context.subTitleTextStyle.copyWith(fontSize: 20.sp),
                ),
                onChanged: (value) {},
                onCompleted: (value) async {
                  otpcode = value;

                  var status =
                      await Provider.of<HomeProvider>(context, listen: false)
                          .getAssignedOtp(context, id, value);
                  if (status) {
                    Provider.of<HomeProvider>(context, listen: false)
                        .getMyOrder(
                      context,
                    );
                    Navigator.pop(context);
                    Navigator.pop(context);
                    ArtSweetAlert.show(
                        context: context,
                        artDialogArgs: ArtDialogArgs(
                            type: ArtSweetAlertType.success,
                            title: "Status Update",
                            text: "Your product successfully picked up"));
                  } else {
                    ArtSweetAlert.show(
                        context: context,
                        artDialogArgs: ArtDialogArgs(
                            type: ArtSweetAlertType.success,
                            title: "Invalid, used, or expired OTP",
                            text: ""));
                  }
                },
              ),
              Gap(50.h),
              Center(
                child: SizedBox(
                  child: SizedBox(
                    width: double.infinity,
                    child: ButtonElevated(
                        text: 'Process Order',
                        onPressed: () async 
                        {
                          if (otpcode.length < 6) {
                            Fluttertoast.showToast(
                              msg: "Please enter volid otp",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 14.0,
                            );
                          } else {
                            var status = await Provider.of<HomeProvider>(
                                    context,
                                    listen: false)
                                .getAssignedOtp(context, id, otpcode);
                            if (status)
                             {
                              Provider.of<HomeProvider>(context, listen: false)
                                  .getMyOrder(
                                context,
                              );
                              Navigator.pop(context);
                              Navigator.pop(context);
                              ArtSweetAlert.show(
                                  context: context,
                                  artDialogArgs: ArtDialogArgs(
                                      type: ArtSweetAlertType.success,
                                      title: "Status Update",
                                      text:
                                          "Your product successfully picked up"));
                            } else 
                            {
                              ArtSweetAlert.show(
                                  context: context,
                                  artDialogArgs: ArtDialogArgs(
                                      type: ArtSweetAlertType.success,
                                      title: "Invalid, used, or expired OTP",
                                      text: ""));
                            }
                          }
                        },
                        backgroundColor: context.appColor.primarycolor),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Color getStatus() {
    switch (status) {
      case 0:
        return Color(0xff315731);
      case 1:
        return Color.fromARGB(255, 240, 218, 178);
      case 2:
        return Color.fromARGB(255, 150, 163, 189);
      case 3:
        return Color(0xffEAFFEA);
      default:
        return Color(0xffFFDEDE);
    }
  }

  Color getTextColor() {
    switch (status) {
      case 0:
        return Color(0xffFFFFFF);
      case 1:
        return Color(0xffFFA500);
      case 2:
        return Color(0xff0754EA);
      case 3:
        return Color(0xff324E32);
      default:
        return Color(0xffA32424);
    }
  }
}
