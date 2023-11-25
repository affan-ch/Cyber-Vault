class CreditCard {
  final String id;
  final String userId;
  final String cardTitle;
  final String cardHolderName;
  final String cardNumber;
  final String cardPin;
  final String cardExpiryMonth;
  final String cardExpiryYear;
  final String cardCVV;
  final String note;

  CreditCard(
      this.id,
      this.userId,
      this.cardTitle,
      this.cardHolderName,
      this.cardNumber,
      this.cardPin,
      this.cardExpiryMonth,
      this.cardExpiryYear,
      this.cardCVV,
      this.note);

  factory CreditCard.fromJson(Map<String, dynamic> json) {
    return CreditCard(
        json['id'] ?? "",
        json['userId'] ?? "",
        json['cardTitle'] ?? "",
        json['cardHolderName'] ?? "",
        json['cardNumber'] ?? "",
        json['cardPin'] ?? "",
        json['cardExpiryMonth'] ?? "",
        json['cardExpiryYear'] ?? "",
        json['cardCVV'] ?? "",
        json['note'] ?? "");
  }
}
