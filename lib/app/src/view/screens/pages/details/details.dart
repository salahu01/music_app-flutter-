import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../widgets/custom_widgets.dart';
import '../../../../../core/theme/theme.dart';
import 'about.dart';

class Details extends StatefulWidget {
  const Details({Key? key}) : super(key: key);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Details',
              style: TextStyle(
                  color: Themecolors.font??Colors.white,
                  fontSize: 35.sp,
                  fontWeight: FontWeight.w900),
            ),
          ],
        ),
       
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    SizedBox(height: 20.h),
                    SizedBox(height: 10.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Reset App',
                          style: TextStyle(
                            color: Themecolors.font??Colors.white,
                            fontWeight: FontWeight.w900,
                            fontSize: 18.sp
                            ),
                        ),
                        IconButton(onPressed: (){
                        showCupertinoModalPopup(
                        context: context,
                        builder: (context) {
                          return CustomWidgets.reset(context);
                        });
                        },
                        icon: Icon(
                          Icons.restart_alt,
                          color: Themecolors.font??Colors.white,
                          size: 22.sp
                          ))
                      ]
                    ),
                    const Expanded(flex: 1,child: SizedBox()),                 
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Themes',
                          style: TextStyle(
                            color: Themecolors.font??Colors.white,
                            fontWeight: FontWeight.w900,
                            fontSize: 18.sp
                            ),
                        ),
                        IconButton(
                          onPressed: (){
                            Themecolors.themeselection(context);
                          }, 
                          icon: Icon(
                          Icons.brush,
                          color: Themecolors.font??Colors.white,
                          size: 22.sp,
                        )
                       )
                      ]
                    ),
                    const Expanded(flex: 1,child: SizedBox()),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap:() {
                              showAboutDialog(
                                applicationName: 'Panda Music',
                                applicationVersion: '0.1',
                                context:context,
                                 children: [
                                  const PrivacyPoicy()
                                 ]
                                );
                          },
                          child: Text(
                            'About',
                            style: TextStyle(
                              color: Themecolors.font??Colors.white,
                              fontWeight: FontWeight.w900,
                              fontSize: 18.sp
                              ),
                          ),
                        ),
                      ]
                    ),
                    const Expanded(flex: 15,child: SizedBox()),
                  ],
                ),
              ),
            ),
             Align(
              alignment: Alignment.bottomCenter,
               child: Text(
                'Version    0.1',
                style: TextStyle(
                color: Themecolors.font??Colors.grey,
                fontWeight: FontWeight.w900,
                fontSize: 18.sp
                  ),
                ),
             ),
             SizedBox(height: 30.h,),
            Row(
              children: [
                const Spacer(flex: 2,),
                InkWell(
                  onTap: ()async{
                    if (!await launchUrl(Uri.parse('https://github.com/salahu01')))throw'Could not launch';
                  },
                  child: FaIcon(
                    FontAwesomeIcons.github,
                    color: Themecolors.font??Colors.grey,
                    size: 40.sp,
                  ),
                ),
                const Spacer(flex: 1,),
                 InkWell(
                  onTap: ()async{
                    if (!await launchUrl(Uri.parse('https://www.linkedin.com/in/salahu-cv-a98196230')))throw'Could not launch';
                   
                  },
                  child: FaIcon(
                    FontAwesomeIcons.linkedin,
                    color: Themecolors.font??Colors.grey,
                    size: 40.sp,
                  ),
                ),
               const Spacer(flex: 2,)
              ],
            )
          ],
    );
  }
}

