class TransactionModel {
  //*Bien*//
  int amount;
  final String note;
  final DateTime date;
  final String type;

  //*AddMount
  addMount(int amount) {
    this.amount = this.amount + amount;
  }

  //*Contructor*//
  TransactionModel(this.amount, this.note, this.date, this.type);
}
