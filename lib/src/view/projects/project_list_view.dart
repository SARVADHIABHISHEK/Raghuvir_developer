import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:raghuvir_developers/src/config/config.dart';
import 'package:raghuvir_developers/src/view/projects/project_detail_view.dart';

class ProjectListView extends StatefulWidget {
  const ProjectListView({super.key});

  @override
  State<ProjectListView> createState() => _ProjectListViewState();
}

class _ProjectListViewState extends State<ProjectListView> {
  List<Apartment> apartments = List.generate(10, (index) {
    return Apartment(
      name: 'Riverside Apartments',
      address1: 'Vesu Surat',
      address2: 'Althan char rasta bhimrad',
      pincode: '12345${index + 1}',
      status: index % 2 == 0 ? 'Active' : 'Inactive',
    );
  });

  final TextEditingController _searchProject = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Palette.loginBgColor,
        appBar: AppBar(title: Text('Project List')),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0.w, vertical: 18.0.h),
          child: Column(
            children: [
              TextFormField(
                controller: _searchProject,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search, color: Palette.greyLight),
                  hintText: 'Search for home or pincode',
                ),
              ),

              CustomSizedBox.h16,

              Expanded(
                child: ListView.builder(
                  itemCount: apartments.length,
                  padding: const EdgeInsets.all(12),
                  itemBuilder: (context, index) {
                    final apartment = apartments[index];
                    return Card(
                      margin: const EdgeInsets.only(bottom: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 0,
                      child: ListTile(
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    'Riverside apartment',
                                    style: TextStyle(
                                      fontSize: 18.0.sp,
                                      fontWeight: FontWeight.w500,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                                CustomSizedBox.w4,
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4.0),
                                    color: Color(0xFFDAF4F0),
                                  ),
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 8.0,
                                    vertical: 4.0,
                                  ),
                                  child: Text(
                                    'ACTIVE',
                                    style: TextStyle(
                                      fontSize: 8.0.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF0AB39C),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Text.rich(
                              TextSpan(
                                children: [
                                  const TextSpan(
                                    text: 'Address 1 : ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextSpan(text: apartment.address1),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text.rich(
                                    TextSpan(
                                      children: [
                                        const TextSpan(
                                          text: 'Address 2 : ',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        TextSpan(text: apartment.address2),
                                      ],
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigate.to(ProjectDetailsView());
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(right: 10.0.w),
                                    child: Icon(
                                      Icons.remove_red_eye_rounded,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'Pincode : ',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(apartment.pincode),
                              ],
                            ),
                          ],
                        ),
                        // trailing: IconButton(
                        //   icon: Icon(
                        //     Icons.remove_red_eye,
                        //     color: Theme.of(context).primaryColor,
                        //   ),
                        //   onPressed: () {
                        //     debugPrint('View ${apartment.name}');
                        //   },
                        // ),
                        contentPadding: const EdgeInsets.all(12),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),

          // Container(
          //   height: MediaQuery.of(context).size.height * 0.2,
          //   width: double.infinity,
          //   decoration: BoxDecoration(
          //     color: Palette.white,
          //     borderRadius: BorderRadius.circular(8.0),
          //   ),
          //   child: Padding(
          //     padding: EdgeInsets.symmetric(
          //       horizontal: 12.0.w,
          //       vertical: 12.0.h,
          //     ),
          //     child: Column(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [

          //         CustomSizedBox.h6,
          //         Row(
          //           children: [
          //             Icon(CupertinoIcons.location_solid),
          //             CustomSizedBox.w2,
          //             Expanded(
          //               child: Text(
          //                 'Vesu Surat',
          //                 maxLines: 2,
          //                 overflow: TextOverflow.ellipsis,
          //               ),
          //             ),
          //           ],
          //         ),
          //         CustomSizedBox.h12,
          //         Row(
          //           children: [
          //             Icon(CupertinoIcons.location_solid),
          //             CustomSizedBox.w2,
          //             Expanded(
          //               child: Text(
          //                 'Vesu Surat',
          //                 maxLines: 2,
          //                 overflow: TextOverflow.ellipsis,
          //               ),
          //             ),
          //           ],
          //         ),
          //         Row(
          //           children: [
          //             Expanded(
          //               child: Text(
          //                 'Vesu Surat',
          //                 maxLines: 2,
          //                 overflow: TextOverflow.ellipsis,
          //               ),
          //             ),
          //           ],
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
        ),
      ),
    );
  }

  Widget _buildRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        children: [
          Text('$label: ', style: const TextStyle(fontWeight: FontWeight.bold)),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}

class Apartment {
  final String name;
  final String address1;
  final String address2;
  final String pincode;
  final String status;

  Apartment({
    required this.name,
    required this.address1,
    required this.address2,
    required this.pincode,
    required this.status,
  });
}
