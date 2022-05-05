import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_triple/flutter_triple.dart';
import '../../../shared/domain/helpers/errors/failure.dart';
import '../../../shared/presentation/themes/app_theme.dart';
import 'home_state.dart';
import 'home_store.dart';
import 'widgets/book_card_widget.dart';
import 'widgets/details_dialog_widget.dart';
import 'widgets/modal_bottom_widget.dart';
import 'widgets/rounded_textfield_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  final theme = Modular.get<AppTheme>();

  late final ScrollController scrollController;

  void handleScrolling() async {
    if (scrollController.offset >= scrollController.position.maxScrollExtent &&
        store.state.bookResponseEntity.books.isNotEmpty &&
        !store.state.isFinalPage) {
      await store.newBooks();
    }
  }

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController()..addListener(handleScrolling);
    store.fetchBooks();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ScopedBuilder<HomeStore, Failure, HomeState>(
          store: store,
          onState: (context, triple) {
            return LayoutBuilder(builder: (context, constraints) {
              int? countGrid;
              if (constraints.maxWidth > 600 && constraints.maxWidth <= 870) {
                countGrid = 2;
              } else if (constraints.maxWidth > 870 &&
                  constraints.maxWidth <= 1170) {
                countGrid = 3;
              } else if (constraints.maxWidth > 1170) {
                countGrid = 4;
              }
              return SingleChildScrollView(
                controller:
                    constraints.maxWidth > 870 ? null : scrollController,
                physics: const ScrollPhysics(),
                child: Container(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(theme.images.homeBackground),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Container(
                    constraints: const BoxConstraints(maxWidth: 1200),
                    child: Column(
                      children: [
                        Container(
                          constraints: const BoxConstraints(maxWidth: 1200),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                theme.images.logo,
                                color: Colors.black,
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              const Text(
                                'Books',
                                style: TextStyle(fontSize: 28),
                              ),
                              const Spacer(),
                              Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: theme.colors.grey),
                                ),
                                child: IconButton(
                                  icon: const Icon(Icons.logout),
                                  onPressed: () {},
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        constraints.maxWidth > 600
                            ? Container()
                            : const RoundedTextfieldWidget(),
                        const SizedBox(
                          height: 20,
                        ),
                        constraints.maxWidth > 600
                            ? Container(
                                constraints:
                                    const BoxConstraints(maxWidth: 1200),
                                child: GridView.builder(
                                  itemCount:
                                      triple.bookResponseEntity.books.length,
                                  shrinkWrap: true,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: countGrid!,
                                    childAspectRatio: 3 / 2,
                                    crossAxisSpacing:
                                        constraints.maxWidth >= 660 &&
                                                countGrid == 2
                                            ? 80
                                            : constraints.maxWidth >= 950 &&
                                                    countGrid == 3
                                                ? 30
                                                : 10,
                                    mainAxisSpacing: 10,
                                  ),
                                  itemBuilder: (context, index) {
                                    final book =
                                        triple.bookResponseEntity.books[index];
                                    return GestureDetector(
                                      onTap: () => countGrid == 2
                                          ? showModalBottomSheet(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              isScrollControlled: true,
                                              context: context,
                                              builder: (context) {
                                                return ModalBottomWidget(
                                                    book: book);
                                              },
                                            )
                                          : showDialog(
                                              context: context,
                                              builder: (context) {
                                                return DetailsDialogWidget(
                                                  book: book,
                                                );
                                              },
                                            ),
                                      child: BookCardWidget(book: book),
                                    );
                                  },
                                ),
                              )
                            : ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount:
                                    triple.bookResponseEntity.books.length,
                                itemBuilder: (context, index) {
                                  final book =
                                      triple.bookResponseEntity.books[index];
                                  return GestureDetector(
                                    onTap: () {
                                      showModalBottomSheet(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        isScrollControlled: true,
                                        context: context,
                                        builder: (context) {
                                          return ModalBottomWidget(book: book);
                                        },
                                      );
                                    },
                                    child: SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          .9,
                                      child: BookCardWidget(book: book),
                                    ),
                                  );
                                },
                              ),
                        constraints.maxWidth > 870
                            ? Container(
                                constraints:
                                    const BoxConstraints(maxWidth: 1200),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                        'Página ${triple.bookResponseEntity.page} de ${triple.bookResponseEntity.totalPages}'),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: theme.colors.grey),
                                      ),
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(right: 2),
                                        child: IconButton(
                                          icon: const Icon(
                                            Icons.arrow_back_ios_new,
                                          ),
                                          onPressed: () async =>
                                              store.fetchBooks(previous: true),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: theme.colors.grey),
                                      ),
                                      child: IconButton(
                                        icon: const Icon(
                                          Icons.arrow_forward_ios,
                                        ),
                                        onPressed: () async =>
                                            store.fetchBooks(next: true),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : Container(),
                        SizedBox(
                          height: 100,
                          child: triple.loading
                              ? Center(
                                  child: CircularProgressIndicator(
                                    color: theme.colors.pink,
                                  ),
                                )
                              : Container(),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            });
          },
        ),
      ),
    );
  }
}
