import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kalakar/data/models/company/project_status_list_class.dart';

import '../helper/kalakar_colors.dart';

typedef ItemsSelectedCallback = void Function(List<String> selectedItems);

class CustomDropdownSearch3 extends StatelessWidget {
  final String? Function(List<String>?)? validator; // Updated to handle List<String>?
  final List<String> items;
  final double borderRadius;
  final String labelText;
  final String titleText;
  final List<String> selectedItems; // Now a list to handle multiple selections
  final ItemsSelectedCallback? onItemsSelected; // Callback for multi-selection
  final EdgeInsetsGeometry? contentPadding;
  final Color? textColor;

  CustomDropdownSearch3({
    required this.validator,
    required this.items,
    this.textColor = KalakarColors.purple,
    this.borderRadius = 12.0,
    required this.labelText,
    required this.titleText,
    this.onItemsSelected,
    this.selectedItems = const [], // Default is an empty list for multi-selection
    this.contentPadding =
    const EdgeInsetsDirectional.symmetric(horizontal: 4, vertical: 12),
  });

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<String>.multiSelection( // Multi-selection enabled
      validator: validator, // List<String>? validator
      items: (filter, infiniteScrollProps) => items,
      selectedItems: selectedItems, // Handle selected items as a list
      decoratorProps: DropDownDecoratorProps(
        baseStyle: TextStyle(color: KalakarColors.textColor),
        decoration: InputDecoration(
          border: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
          labelText: labelText,
          labelStyle: TextStyle(color: textColor, fontSize: 5.sp),
          alignLabelWithHint: true,
          contentPadding: contentPadding,
        ),
      ),
      compareFn: (i, s) => i.toLowerCase() == s.toLowerCase(),
      popupProps: PopupPropsMultiSelection.modalBottomSheet(
        showSelectedItems: true,
        showSearchBox: true,
       listViewProps: ListViewProps(padding: EdgeInsets.only(right: 16.w)),
        searchFieldProps: TextFieldProps(
          padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 8.h),
        ),
        title: Padding(
          padding: EdgeInsets.all(24.h),
          child: Text(
            titleText,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        itemBuilder: _customPopupItemBuilderExample2, // Custom item builder
      ),
      onChanged: (List<String> selectedItems) { // Handle multiple selected items
        if (onItemsSelected != null && selectedItems.isNotEmpty) {
          onItemsSelected!(selectedItems); // Pass the selected items list
        }
      },
    );
  }

  Widget _customPopupItemBuilderExample2(
      BuildContext context, String item, bool isSelected, bool a) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24.w),
      child: ListTile(
        selected: isSelected,
        selectedColor: KalakarColors.headerText,
        title: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item),
                Divider(
                  color: isSelected
                      ? KalakarColors.headerText
                      : DefaultSelectionStyle.defaultColor,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
