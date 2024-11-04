import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../generated/l10n.dart';

class AddressSelector extends StatelessWidget {
  final List<String> addressList;
  final void Function(String) select;

  const AddressSelector({
    super.key,
    required this.addressList,
    required this.select,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: DropdownMenu<String>(
        width: double.infinity,
        hintText: S.of(context).chooseAddress,
        requestFocusOnTap: false, // Prevents focus to disable text input
        onSelected: (String? address) => select(address!),
        dropdownMenuEntries:
        addressList.map<DropdownMenuEntry<String>>((String address) {
          return DropdownMenuEntry<String>(
            value: address,
            label: address,
            style: MenuItemButton.styleFrom(
              alignment: Alignment.center,
              padding:
              const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              backgroundColor: AppColors.lightBackground,
              splashFactory: InkRipple.splashFactory,
              foregroundColor: AppColors.darkBackground,
              overlayColor: AppColors.grey,
              fixedSize: Size(MediaQuery.sizeOf(context).width - 32, 40),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
          );
        }).toList(),
      ),
    );
  }
}
