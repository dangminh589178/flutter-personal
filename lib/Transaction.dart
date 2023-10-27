class Transaction {
  Transaction({required this.content, required this.amount });

  String content;
  double amount;

  @override
  String toString() {
    return 'content: $content -- amount: $amount';
  }

}
