part of 'pages.dart';

class PaymentPage extends StatefulWidget {
  final String category;
  final String title;
  final VoidCallback onSuccess;

  const PaymentPage({
    Key? key,
    required this.category,
    required this.title,
    required this.onSuccess,
  }) : super(key: key);

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String? _selectedPaymentMethod;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pilih Metode Pembayaran"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                _buildPaymentMethod("OVO", Icons.account_balance_wallet),
                _buildPaymentMethod("PayPal", Icons.paypal),
                _buildPaymentMethod("DANA", Icons.payments),
                _buildPaymentMethod(
                    "Indomaret", Icons.store_mall_directory_outlined),
                _buildPaymentMethod("Alfamart", Icons.storefront),
                _buildPaymentMethod("Bank Transfer", Icons.account_balance),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: _selectedPaymentMethod != null
                  ? () {
                      // Simulate Payment Success
                      _handlePaymentSuccess();
                    }
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
              ),
              child: Text(
                "Konfirmasi Pembayaran",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentMethod(String methodName, IconData icon) {
    return ListTile(
      leading: Icon(icon, size: 40),
      title: Text(
        methodName,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      trailing: Radio<String>(
        value: methodName,
        groupValue: _selectedPaymentMethod,
        onChanged: (value) {
          setState(() {
            _selectedPaymentMethod = value;
          });
        },
      ),
    );
  }

  void _handlePaymentSuccess() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Pembayaran Berhasil!"),
          content:
              Text("Pembayaran menggunakan $_selectedPaymentMethod berhasil."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
                widget.onSuccess();
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }
}
