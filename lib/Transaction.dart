







class Transaction {
  Transaction({required this.content, required this.amount, required this.createDate});

  String content;
  double amount;
  DateTime createDate;

  @override
  String toString() {
    return 'content: $content -- amount: $amount';
  }
}
