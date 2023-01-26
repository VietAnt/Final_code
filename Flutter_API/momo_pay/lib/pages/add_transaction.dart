import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:momo_pay/controllers/db_helper.dart';
import 'package:momo_pay/static.dart' as Static;

class AddTransaction extends StatefulWidget {
  const AddTransaction({super.key});

  @override
  State<AddTransaction> createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  //1*: Bien-Khai-BAO
  //amount: so_luong
  int? amount;
  //note: ghi_chu
  String note = "Milk";
  //types: loai_chi
  String types = "income";
  //Datetime: Thoi_gian
  DateTime sdate = DateTime.now();
  //Months: Thang
  List<String> months = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec"
  ];

  //2*:selectDate:
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: sdate,
      firstDate: DateTime(1990, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != sdate) {
      setState(() {
        sdate = picked;
      });
    }
  }

  //3*:
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0.0,
      ),
      //3.1*
      persistentFooterButtons: [
        Container(
          width: 900,
          child: const Text(
            '@momo',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              letterSpacing: 1,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
      //3.2
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          const SizedBox(height: 20),
          //*Text
          const Text(
            "Add Transaction",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w700,
              color: Colors.green,
            ),
          ),
          //
          const SizedBox(height: 20),
          //3.2.1
          Row(
            children: [
              //
              Container(
                decoration: BoxDecoration(
                  color: Static.PrimaryMaterialColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.all(12),
                child: const Icon(
                  Icons.attach_money,
                  size: 24,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 12),
              //
              Expanded(
                child: TextField(
                  decoration: const InputDecoration(
                    hintText: "#",
                    border: InputBorder.none,
                  ),
                  style: TextStyle(fontSize: 24),
                  onChanged: (val) {
                    try {
                      amount = int.parse(val);
                    } catch (e) {}
                  },
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
          //3.2.2
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Static.PrimaryMaterialColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(12),
                child: const Icon(
                  Icons.description,
                  size: 24,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: TextField(
                  decoration: const InputDecoration(
                    hintText: "Note Of Transaction",
                    border: InputBorder.none,
                  ),
                  style: const TextStyle(fontSize: 24),
                  onChanged: (val) {
                    note = val;
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          //3.2.3
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Static.PrimaryMaterialColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.all(12),
                child: const Icon(
                  Icons.moving_sharp,
                  size: 24,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 12),
              ChoiceChip(
                label: Text(
                  "Income",
                  style: TextStyle(
                    fontSize: 16,
                    color: types == "Income" ? Colors.white : Colors.black,
                  ),
                ),
                selectedColor: Static.PrimaryMaterialColor,
                selected: types == "Income" ? true : false,
                onSelected: (val) {
                  setState(() {
                    types = "Income";
                    if (note.isEmpty || note == "Expense") {
                      note = 'Income';
                    }
                  });
                },
              ),
              const SizedBox(width: 12.0),
              ChoiceChip(
                label: Text(
                  "Expense",
                  style: TextStyle(
                    fontSize: 16,
                    color: types == "Income" ? Colors.white : Colors.black,
                  ),
                ),
                selectedColor: Static.PrimaryMaterialColor,
                selected: types == "Expense" ? true : false,
                onSelected: (val) {
                  if (val) {
                    setState(() {
                      types = "Expense";
                      if (note.isEmpty || note == "Expense") {
                        note = 'Expense';
                      }
                    });
                  }
                },
              ),
            ],
          ),
          const SizedBox(height: 20.0),
          //3.2.4: Slect Date
          SizedBox(
            height: 50,
            child: TextButton(
              onPressed: () {
                _selectDate(context);
              },
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Static.PrimaryMaterialColor,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    padding: const EdgeInsets.all(12),
                    child: const Icon(
                      Icons.date_range,
                      size: 24,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    "${sdate.day} ${months[sdate.month - 1]}",
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          //3.2.5: Button Add
          SizedBox(
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                if (amount != null) {
                  DbHelper dbHelper = DbHelper();
                  dbHelper.addData(amount!, sdate, types, note);
                  Navigator.of(context).pop();
                } else {
                  print("Not");
                }
              },
              child: const Text(
                "Add",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
