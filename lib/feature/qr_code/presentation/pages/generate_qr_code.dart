import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intelligent_security_systems/common/helpers/extension/is_dark_mode.dart';
import 'package:intelligent_security_systems/common/widgets/basic_app_bar.dart';
import 'package:intelligent_security_systems/feature/main/data/models/buildings_res_params.dart';
import 'package:intelligent_security_systems/feature/qr_code/presentation/widgets/address_selector.dart';
import 'package:intelligent_security_systems/feature/qr_code/presentation/widgets/device_card.dart';

import '../../../../common/bloc/button/button_state.dart';
import '../../../../common/bloc/button/button_state_cubit.dart';
import '../../../../common/widgets/basic_button.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../generated/l10n.dart';
import '../../domain/entities/visitor_identity_entity.dart';
import '../widgets/identity_card.dart';
import '../widgets/time_periods_list.dart';

class GenerateQrCodePage extends StatefulWidget {
  final String? address;
  final bool staticAddress;
  final List<String>? addressList;
  final List<Device> devices;

  const GenerateQrCodePage({
    super.key,
    this.address,
    required this.staticAddress,
    this.addressList,
    required this.devices,
  });

  @override
  State<GenerateQrCodePage> createState() => _GenerateQrCodePageState();
}

class _GenerateQrCodePageState extends State<GenerateQrCodePage> {
  final TextEditingController addressController = TextEditingController();
  String? selectedAddress;
  List<int> activeDevices = [];
  List<int> activeIdentity = [];
  List<int> activeTime = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        title: S.of(context).generateQrCode,
      ),
      body: BlocProvider(
        create: (context) => ButtonStateCubit(),
        child: BlocListener<ButtonStateCubit, ButtonState>(
          listener: (context, state) {
            if (state is ButtonSuccessState) {
              // Navigator.pushAndRemoveUntil(
              // context,
              // MaterialPageRoute(
              // builder: (context) => const HomeNavigationPage()),
              // (Route<dynamic> route) => false,
              // );
            } else if (state is ButtonFailureState) {
              var snackBar = SnackBar(
                content: Text(state.errorMessage.message ??
                    S.of(context).unknownException),
                backgroundColor: AppColors.red,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
          child: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _description(desc: S.of(context).address),
                  const SizedBox(height: 16),
                  widget.staticAddress
                      ? _staticAddress(address: widget.address!)
                      : AddressSelector(
                          addressList: widget.addressList!,
                          select: (String address) => _selectAddress(address),
                        ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: _description(desc: S.of(context).device),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: SizedBox(
                      height: 65,
                      child: ListView.separated(
                        separatorBuilder: (context, index) {
                          return const SizedBox(width: 8);
                        },
                        itemCount: widget.devices.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return DeviceCard(
                            title: widget.devices[index].name,
                            activeStatus: activeDevices
                                .contains(widget.devices[index].id),
                            deviceId: widget.devices[index].id,
                            onPress: (id) => _setDeviceActive(id),
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  _description(desc: S.of(context).visitorIdentity),
                  const SizedBox(height: 16.0),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: SizedBox(
                      height: 42,
                      child: ListView.separated(
                        itemCount: visitorIdentity.length,
                        separatorBuilder: (context, index) {
                          return const SizedBox(width: 8);
                        },
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return IdentityCard(
                            title: visitorIdentity[index].title,
                            activeStatus: activeIdentity
                                .contains(visitorIdentity[index].id),
                            deviceId: visitorIdentity[index].id,
                            onPress: (id) => _setIdentityActive(id),
                          );
                        },
                      ),
                    ),
                  ),
                  _description(desc: S.of(context).timePeriod),
                  const SizedBox(height: 16.0),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: SizedBox(
                      height: 100,
                      child: TimePeriodsList(
                        select: (int id) => _setTimeActive(id),
                        activeList: activeTime,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: _generateQrButton(context),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _generateQrButton(BuildContext context) {
    return Builder(builder: (context) {
      return BasicAppButton(
        title: S.of(context).generate,
        onPressed: activeTime.isNotEmpty &&
                activeIdentity.isNotEmpty &&
                activeDevices.isNotEmpty
            ? () {
                if (true) {
                  // context.read<ButtonStateCubit>().execute(
                  //   useCase: ,
                  //   params: ,
                  // );
                }
              }
            : null,
      );
    });
  }


  Widget _staticAddress({required String address}) {
    return Opacity(
      opacity: 0.38,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
              color: AppColors.darkBackground,
            )),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _description(desc: address),
            const Icon(Icons.arrow_drop_down)
          ],
        ),
      ),
    );
  }

  Text _description({required String desc}) {
    return Text(
      desc,
      style: TextStyle(
        color: context.isDarkMode
            ? AppColors.lightBackground
            : AppColors.darkBackground,
        fontSize: 16,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.15,
      ),
    );
  }

  void _setDeviceActive(int id) {
    if (activeDevices.contains(id)) {
      activeDevices.remove(id);
    } else {
      activeDevices.add(id);
    }
    setState(() {});
  }

  void _setIdentityActive(int? id) {
    if (activeIdentity.contains(id)) {
      activeIdentity.remove(id);
    } else {
      activeIdentity.add(id!);
    }
    setState(() {});
  }

  void _setTimeActive(int? id) {
    if (activeTime.contains(id)) {
      activeTime.remove(id);
    } else {
      activeTime.add(id!);
    }
    setState(() {});
  }

  void _selectAddress(String address) {
    setState(() {
      selectedAddress = address;
    });
  }
}
