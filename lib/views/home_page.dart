import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:refcoins_app/core/utils.dart';
import 'package:refcoins_app/providers/character_provider.dart';
import 'package:refcoins_app/widgets/main_container.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isChecked = false;
  final _controller = TextEditingController();
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<CharacterProvider>(context, listen: false).fetchCharacters();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final characterProvider = Provider.of<CharacterProvider>(context);
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Amount",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
            Text(
              "R800.00 Avl.",
              style: TextStyle(
                color: lightGrey,
                fontSize: 16,
              ),
            )
          ],
        ),
        actions: [
          TextButton(
              onPressed: () {},
              child: const Text(
                "Confirm",
                style: TextStyle(
                  fontSize: 20,
                ),
              ))
        ],
      ),
      body: MainContainer(
        child: DefaultTextStyle(
          style: const TextStyle(color: lightGrey),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Pay",
                style: TextStyle(
                  color: Colors.lightBlue,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                height: 54,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 54,
                      height: 54,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.lightBlue,
                        borderRadius: BorderRadius.circular(defaultRadius),
                      ),
                      child: Text(
                        characterProvider.characters != null
                            ? "${characterProvider.characters!.name.split(" ")[0][0]} ${characterProvider.characters!.name.split(" ")[1][0]}"
                            : "N/A",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 24,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            characterProvider.characters != null
                                ? characterProvider.characters!.name
                                : "N/A",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                            ),
                          ),
                          const Text(
                            "FNB ...9547",
                            style: TextStyle(
                              color: lightGrey,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        side: const BorderSide(color: Colors.white),
                      ),
                      onPressed: () {},
                      child: const Text(
                        "Edit",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 64,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    "R",
                    style: TextStyle(fontSize: 24),
                  ),
                  const SizedBox(
                    width: 32,
                  ),
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextFormField(
                          cursorHeight: 72,
                          controller: _controller,
                          style: const TextStyle(
                            color: lightGrey,
                            fontSize: 72,
                          ),
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                              hintText: "0.00",
                              hintStyle: TextStyle(
                                color: lightGrey,
                                fontSize: 72,
                              )),
                        ),
                        const Text(
                          "R5.00 FNB Fees",
                          style: TextStyle(fontSize: 24),
                        )
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 64,
              ),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: lightGrey),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Checkbox(
                      side: const BorderSide(color: lightGrey),
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(color: lightGrey),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      checkColor: Colors.grey,
                      fillColor:
                          MaterialStateProperty.all<Color>(Colors.transparent),
                      value: isChecked,
                      onChanged: (val) {
                        setState(() {
                          isChecked = val!;
                        });
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 32,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Instant EFT",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                      Text(
                        "R10.00 Fee Applies",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
