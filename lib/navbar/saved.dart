import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:realestate/data.dart/data.dart';
import 'package:realestate/provider/favorite_prvider.dart';
// import 'package:realestate/screans/sign_up.dart';
// import 'package:realestate/screans/sign_up.dart';

class Saved extends StatefulWidget {
  const Saved({super.key});

  @override
  State<Saved> createState() => _SavedState();
}

class _SavedState extends State<Saved> {
  @override
  Widget build(BuildContext context) {
    final provider = FavoritePrvider.of(context);
    final finalList = provider.favorites;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'المحفوظات',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Expanded(child: finalList.isEmpty? Center(
            child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Text(
                        'لا توجد عقارات محفوظه حتي الان',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
          ):
          
          
              ListView.builder(
                itemCount: finalList.length,
                itemBuilder: (context, index) {
                  final favoriteItem = finalList[index];
                  return Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(15),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              // color: const Color.fromARGB(255, 94, 88, 88)
                              ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                padding: EdgeInsets.all(15),
                                width: 88,
                                height: 88,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(6),
                                  child: Image.asset(favoriteItem.image,
                                  fit: BoxFit.cover,),
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    favoriteItem.name,
                                    style: Theme.of(context).textTheme.titleMedium,
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Text(
                                    favoriteItem.place,
                                    style: Theme.of(context).textTheme.titleSmall,
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Text(
                                    favoriteItem.price,
                                    style: TextStyle(
                                      color: Colors.blueAccent.shade100,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10),
                                  ),
                                ],
                              ),GestureDetector(
                                onTap: () {
                                  finalList.removeAt(index);
                                  setState(() {
                                    
                                  });
                                    ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Center(
                                      child: Text(
                                        
                                        'تم حذف العقار من المفضله',
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    backgroundColor: const Color.fromARGB(255, 236, 0, 0),
                                    shape: StadiumBorder(),
                                    behavior: SnackBarBehavior.floating,
                                  ));
                                },
                                child: Icon(Icons.delete,color: Colors.redAccent,),
                              )
                            ],
                          ),
                        ),
                      ),
                      
                    ],
                  );
                }),
          ),
        ],
      ),
    );
  }
}
