import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/bottom_sheet/language_bottom_sheet.dart';
import 'package:todo_app/bottom_sheet/themeing_bottom_sheet.dart';
import 'package:todo_app/provider/my_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo_app/shared/styles/colors.dart';

class SettingTab extends StatefulWidget {
  const SettingTab({super.key});

  @override
  State<SettingTab> createState() => _SettingTabState();
}

class _SettingTabState extends State<SettingTab> {
  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AppLocalizations.of(context)!.language,
              style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
          SizedBox(
            height: 15,
          ),
          InkWell(
            onTap: () {
              showLanguageBottomSheet();
            },
            child: Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.symmetric(horizontal: 18),
              padding: EdgeInsets.symmetric(horizontal: 18),
              width: double.infinity,
              height: 48,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.blue)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      pro.languageCode == "en"
                          ? AppLocalizations.of(context)!.english
                          : AppLocalizations.of(context)!.arabic,
                      style: TextStyle(color: Colors.blue)
                  ),
                  IconButton(onPressed: (){
                    showLanguageBottomSheet();
                  },
                      icon: Icon(Icons.keyboard_arrow_down_outlined,color: Colors.blue,))
                ],
              ),

            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(AppLocalizations.of(context)!.mode,
              style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
          SizedBox(
            height: 15,
          ),
          InkWell(
            onTap: () {
              showThemeingBottomSheet();
            },
            child: Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.symmetric(horizontal: 18),
              padding: EdgeInsets.symmetric(horizontal: 18),
              width: double.infinity,
              height: 48,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.blue)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      pro.modeApp==ThemeMode.light
                          ? AppLocalizations.of(context)!.light
                          : AppLocalizations.of(context)!.dark,
                      style: TextStyle(color: Colors.blue)
                  ),
                  IconButton(onPressed: (){
                    showThemeingBottomSheet();
                  },
                      icon: Icon(Icons.keyboard_arrow_down_outlined,color: Colors.blue,))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  showThemeingBottomSheet() {
    showModalBottomSheet(
        context: context,
        shape: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12), topRight: Radius.circular(12))),
        builder: (context) => ThemeingBottomSheet());
  }

  showLanguageBottomSheet() {
    showModalBottomSheet(
        context: context,
        shape: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12), topRight: Radius.circular(12))),
        builder: (context) => LanguageBottomSheet());
  }
}
