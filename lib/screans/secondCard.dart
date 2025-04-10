import 'package:flutter/material.dart';
import 'package:realestate/data/data.dart';
import 'package:realestate/screans/housedetalesscrean.dart';
import 'package:realestate/screans/sign_up.dart';

class Secondcard extends StatelessWidget {
  const Secondcard({super.key, required this.cardView});

  final List<House> cardView;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        mainAxisExtent: 355,
      ),
      itemCount: realEstatemodelSearch.length,
      itemBuilder: (context, index) {
        final house = realEstatemodelSearch[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => HouseDetalesScrean(house: house)));
          },
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(16),
            margin: EdgeInsets.only(right: 8, top: 12, bottom: 12),
            decoration: BoxDecoration(
                // ignore: deprecated_member_use
                color: Colors.grey.withOpacity(.15),
                borderRadius: BorderRadius.circular(16)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      height: 200,
                      width: double.infinity,
                      house.image,
                      fit: BoxFit.cover,
                    )),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      house.name,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Spacer(),
                    _buildSaleBadge(context)
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  house.place,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  house.price,
                  style: TextStyle(color: color),
                ),
                SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildSaleBadge(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: const Color.fromARGB(176, 228, 220, 220),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        'للبيع',
        style: TextStyle(
          color: const Color.fromARGB(157, 18, 126, 4),
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
