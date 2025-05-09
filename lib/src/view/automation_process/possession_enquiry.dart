import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:raghuvir_developers/src/config/config.dart';
import 'package:raghuvir_developers/src/utils/extensions/media_query_extensions.dart';

class PossessionEnquiry extends StatefulWidget {
  const PossessionEnquiry({super.key});

  @override
  State<PossessionEnquiry> createState() => _PossessionEnquiryState();
}

class _PossessionEnquiryState extends State<PossessionEnquiry> {
  final ValueNotifier<String?> _selectedProject = ValueNotifier(null);
  final ValueNotifier<String?> _selectedUnitNumber = ValueNotifier(null);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      height: context.height,
      decoration: BoxDecoration(
        color: Palette.white,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        children: [
          Container(
            height: 60.0.h,
            width: context.width,
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              color: Palette.automationYellow,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.0),
                topRight: Radius.circular(12.0),
              ),
            ),

            child: Padding(
              padding: EdgeInsets.only(left: 12.0.w),
              child: Text(
                'POSSESSION INQUIRY',
                style: TextStyle(
                  color: Palette.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0.sp,
                ),
              ),
            ),
          ),
          CustomSizedBox.h24,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0.w),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Projects',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16.0.sp,
                      ),
                    ),
                    Text(" *", style: TextStyle(color: Palette.redColor)),
                  ],
                ),

                CustomSizedBox.h6,
                // Projects Dropdown
                ValueListenableBuilder<String?>(
                  valueListenable: _selectedProject,
                  builder: (context, selectedProject, _) {
                    return DropdownSearch<String>(
                      selectedItem: selectedProject,
                      items: (filter, _) => Strings.projects,
                      onChanged: (value) => _selectedProject.value = value,
                      decoratorProps: const DropDownDecoratorProps(
                        decoration: InputDecoration(
                          hintText: 'Select Project Name',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      popupProps: PopupProps.menu(
                        showSearchBox: true,
                        fit: FlexFit.loose,
                        searchFieldProps: const TextFieldProps(
                          decoration: InputDecoration(
                            hintText: 'Search Project',
                          ),
                        ),
                      ),
                    );
                  },
                ),
                CustomSizedBox.h12,

                Row(
                  children: [
                    Text(
                      'Unit Number',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16.0.sp,
                      ),
                    ),
                    Text(" *", style: TextStyle(color: Palette.redColor)),
                  ],
                ),

                CustomSizedBox.h6,

                ValueListenableBuilder<String?>(
                  valueListenable: _selectedUnitNumber,
                  builder: (context, selectedUnitNumber, _) {
                    return DropdownSearch<String>(
                      selectedItem: selectedUnitNumber,
                      items: (filter, _) => Strings.unitNumbers,
                      onChanged: (value) => _selectedUnitNumber.value = value,
                      decoratorProps: const DropDownDecoratorProps(
                        decoration: InputDecoration(
                          hintText: 'Select a Unit',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      popupProps: PopupProps.menu(
                        showSearchBox: true,
                        fit: FlexFit.loose,
                        searchFieldProps: const TextFieldProps(
                          decoration: InputDecoration(hintText: 'Search Unit'),
                        ),
                      ),
                    );
                  },
                ),

                CustomSizedBox.h16,

                PossessionInquiryForm(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PossessionInquiryForm extends StatefulWidget {
  const PossessionInquiryForm({super.key});

  @override
  State<PossessionInquiryForm> createState() => _PossessionInquiryFormState();
}

enum InquiryType {
  callFromCustomer,
  messageFromCustomer,
  callFromRaghuvir,
  messageFromRaghuvir,
  faceToFace,
}

class _PossessionInquiryFormState extends State<PossessionInquiryForm> {
  InquiryType? _selectedType = InquiryType.callFromCustomer;

  final Map<InquiryType, TextEditingController> _controllers = {
    InquiryType.callFromCustomer: TextEditingController(),
    InquiryType.messageFromCustomer: TextEditingController(),
    InquiryType.callFromRaghuvir: TextEditingController(),
    InquiryType.messageFromRaghuvir: TextEditingController(),
    InquiryType.faceToFace: TextEditingController(),
  };

  @override
  void dispose() {
    for (var controller in _controllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  Widget buildRadioTile(String title, InquiryType type) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Radio<InquiryType>(
                value: type,
                groupValue: _selectedType,
                visualDensity: VisualDensity.compact,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                onChanged: (InquiryType? value) {
                  setState(() {
                    _selectedType = value;
                  });
                },
              ),
              SizedBox(width: 4), // control the spacing manually
              Text(title),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 0),
          child: TextField(
            controller: _controllers[type],
            enabled: _selectedType == type,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              isDense: false,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFFF4F4F4)),
        borderRadius: BorderRadius.circular(12.0.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 50,
            width: context.width,
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              color: Color(0xFfDFF0FA),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.0.r),
                topRight: Radius.circular(12.0.r),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 10.0.w),
              child: const Text(
                'POSSESSION INQUIRY FORM',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  letterSpacing: 1,
                ),
              ),
            ),
          ),
          SizedBox(height: 20.0.h),
          Padding(
            padding: EdgeInsets.only(left: 10.0.w),
            child: Text(
              'Inquiry Type',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18.0.sp),
            ),
          ),
          const Divider(),
          buildRadioTile('Call From Customer', InquiryType.callFromCustomer),
          buildRadioTile(
            'Message From Customer',
            InquiryType.messageFromCustomer,
          ),
          buildRadioTile('Call From Raghuvir', InquiryType.callFromRaghuvir),
          buildRadioTile(
            'Message From Raghuvir',
            InquiryType.messageFromRaghuvir,
          ),
          buildRadioTile('Face - Face', InquiryType.faceToFace),

          CustomSizedBox.h20,
        ],
      ),
    );
  }
}
