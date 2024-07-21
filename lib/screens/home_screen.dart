import 'package:basic/models/webtoon_model.dart';
import 'package:basic/services/api_service.dart';
import 'package:flutter/material.dart';

// 비동기 위젯 (비동기로 api를 통제하는 위젯)
// FutureBuilder는 async await를 할 필요가 없다 -> 비동기 처리를 해주기 때문이다.
// snapshot는 Future의 상태를 알 수 있다.
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  Future<List<WebtoonModel>> webtoons = ApiService.getTodaysToons();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 80,
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        elevation: 2,
        title: const Text(
          "오늘의 웹툰",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: FutureBuilder(
        future: webtoons,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Expanded(
                  child: makeList(snapshot),
                ),
              ],
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  ListView makeList(AsyncSnapshot<List<WebtoonModel>> snapshot) {
    return ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: snapshot.data!.length,
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20,
        ),
        itemBuilder: (context, index) {
          var webtoon = snapshot.data![index];
          return Column(
            children: [
              Container(
                width: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 15,
                      offset: const Offset(8, 8),
                      color: Colors.black.withOpacity(0.5),
                    )
                  ],
                ),
                clipBehavior: Clip.hardEdge,
                child: Image.network(
                  webtoon.thumb,
                  headers: const {
                    'User-Agent':
                        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36',
                    'Referer': 'https://comic.naver.com',
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                webtoon.title,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          );
        },
        separatorBuilder: (context, index) => const SizedBox(
              width: 40,
            ));
  }
}
