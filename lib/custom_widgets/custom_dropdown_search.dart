import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kalakar/data/models/project_status_list_class.dart';

import '../helper/kalakar_colors.dart';

typedef ItemSelectedCallback = void Function(String selectedItem);
typedef ItemSelectedCallback1 = void Function(GetProjectStatusMasterlist selectedItem);

class CustomDropdownSearch extends StatelessWidget {
  final String? Function(String?)? validator;
  final List<String> items;
  final double borderRadius;
  final String labelText;
  final String titleText;
  final String? selectedItem;
  final ItemSelectedCallback? onItemSelected;
  final EdgeInsetsGeometry? contentPadding;
  final Color? textColor;

  CustomDropdownSearch({
    required this.validator,
    required this.items,
    this.textColor = KalakarColors.textColor,
    this.borderRadius = 12.0,
    required this.labelText,
    required this.titleText,
    this.onItemSelected,
    this.selectedItem = null,
    this.contentPadding =
        const EdgeInsetsDirectional.symmetric(horizontal: 24, vertical: 12),
  });

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<String>(
      validator: validator,
      items: items,
      selectedItem: selectedItem,
      dropdownDecoratorProps: DropDownDecoratorProps(
        baseStyle: TextStyle(color: KalakarColors.textColor,),
          dropdownSearchDecoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
              labelText: labelText,
              labelStyle: TextStyle(color: textColor),
              alignLabelWithHint: true,
              contentPadding: contentPadding)),
      compareFn: (i, s) => i.toLowerCase() == s.toLowerCase(),
      popupProps: PopupPropsMultiSelection.modalBottomSheet(
        isFilterOnline: false,
        showSelectedItems: true,
        showSearchBox: true,
        searchFieldProps: TextFieldProps(
            padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 8.h)),
        title: Padding(
          padding: EdgeInsets.all(
            24.h,
          ),
          child: Text(
            titleText,
            style: TextStyle( fontWeight: FontWeight.bold),
          ),
        ),
        itemBuilder: _customPopupItemBuilderExample2,
      ),
      onChanged: (String? selectedItem) {
        if (onItemSelected != null && selectedItem != null) {
          onItemSelected!(selectedItem);
        }
      },
    );
  }

  Widget _customPopupItemBuilderExample2(
      BuildContext context, String item, bool isSelected) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24.w),

      child: ListTile(
        selected: isSelected,
        selectedColor: KalakarColors.headerText,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(item),
            Divider(color: isSelected?KalakarColors.headerText:DefaultSelectionStyle.defaultColor,)
          ],
        ),
      ),
    );
  }
}
