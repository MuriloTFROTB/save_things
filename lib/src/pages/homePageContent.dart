import 'package:flutter/material.dart';

class HomePageContent extends StatefulWidget {
  const HomePageContent({super.key});

  @override
  State<HomePageContent> createState() => _HomePageContentState();
}

class _HomePageContentState extends State<HomePageContent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(top: 32.0, left: 8, right: 8),
        child: Center(
          child: Column(
            children: [
              Expanded(
                child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    Container(
                      width: (MediaQuery.of(context).size.width - 36) / 2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Container(
                              height: 160,
                              child: Image.network(
                                'https://m.media-amazon.com/images/I/81pHqxTU7GS._AC_UF894,1000_QL80_.jpg',
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Container(
                              child: const Text(
                                'Funko Capitao AmericaFunko Capitao America',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: (MediaQuery.of(context).size.width - 36) / 2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Container(
                              height: 160,
                              child: Image.network(
                                'https://m.media-amazon.com/images/I/81pHqxTU7GS._AC_UF894,1000_QL80_.jpg',
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Container(
                              child: const Text(
                                'Funko Capitao AmericaFunko Capitao America',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
