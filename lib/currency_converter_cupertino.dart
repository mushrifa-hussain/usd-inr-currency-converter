import 'package:flutter/cupertino.dart';

class CurrencyConverterCupertinoPage extends StatefulWidget {
  const CurrencyConverterCupertinoPage({super.key});

  @override
  State<CurrencyConverterCupertinoPage> createState() =>
      _CurrencyConverterCupertinoPageState();
}

class _CurrencyConverterCupertinoPageState
    extends State<CurrencyConverterCupertinoPage> {
  double result = 0;
  final currencyController = TextEditingController();

  void converter() {
    setState(() {
      result = double.parse(currencyController.text) * 81;
    });
  }

  @override
  void dispose() {
    currencyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemGrey3,
      navigationBar: CupertinoNavigationBar(
        backgroundColor: CupertinoColors.systemGrey3,
        middle: const Text('Currency Converter App'),
      ),
      child: Padding(
        padding: EdgeInsetsGeometry.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "INR ${result != 0 ? result.toStringAsFixed(2) : result.toString()}",
              style: const TextStyle(
                fontSize: 55,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
            CupertinoTextField(
              controller: currencyController,
              style: TextStyle(color: CupertinoColors.black),
              decoration: BoxDecoration(
                color: CupertinoColors.white,
                border: Border.all(),
                borderRadius: BorderRadius.circular(5),
              ),
              placeholder: 'Please enter the amount in USD',
              prefix: Icon(CupertinoIcons.money_dollar),
              keyboardType: TextInputType.numberWithOptions(
                signed: false,
                decimal: true,
              ),
            ),
            SizedBox(height: 10),
            CupertinoButton(
              onPressed: converter,
              color: CupertinoColors.black,
              child: const Text("Convert"),
            ),
          ],
        ),
      ),
    );
  }
}
