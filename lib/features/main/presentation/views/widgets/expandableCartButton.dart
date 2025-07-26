import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/widgets/custom_button.dart';
import 'package:fruit_hub/features/checkout/presentation/views/checkout_view.dart';
import 'package:fruit_hub/features/main/presentation/manager/CartCubit/cart_cubit.dart';

class ExpandableCartButton extends StatefulWidget {
  final VoidCallback onCollapse;
  final String totalPrice;

  const ExpandableCartButton({
    super.key,
    required this.onCollapse,
    required this.totalPrice,
  });

  @override
  State<ExpandableCartButton> createState() => _ExpandableCartButtonState();
}

class _ExpandableCartButtonState extends State<ExpandableCartButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;
  bool isProcessing = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(-1.2, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _handlePayment() async {
    if (isProcessing) return;
    isProcessing = true;
    if (context.read<CartCubit>().cartsEntity.carts.isNotEmpty) {
      Navigator.of(context).pushNamed(
        CheckoutView.routeName,
        arguments: context.read<CartCubit>().cartsEntity,
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('لا يوجد منتجات في سلة التسوق'),
        ),
      );
    }
    // Your payment flow goes here
    await Future.delayed(const Duration(milliseconds: 300));

    widget.onCollapse();
    _controller.reverse();

    isProcessing = false;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SlideTransition(
        position: _slideAnimation,
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: CustomButton(
            key: const ValueKey('expanded'),
            text: 'الدفع ${widget.totalPrice}',
            onTap: _handlePayment,
          ),
        ),
      ),
    );
  }
}
// class ExpandableCartButton extends StatefulWidget {
//   const ExpandableCartButton({super.key});

//   @override
//   State<ExpandableCartButton> createState() => _ExpandableCartButtonState();
// }

// class _ExpandableCartButtonState extends State<ExpandableCartButton>
//     with SingleTickerProviderStateMixin {
//   bool isExpanded = false;
//   late AnimationController _controller;
//   late Animation<Offset> _slideAnimation;
//   late Animation<double> _fadeAnimation;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       duration: Duration(milliseconds: 400),
//     );
//     _slideAnimation = Tween<Offset>(
//       begin: Offset(-1.2, 0),
//       end: Offset.zero,
//     ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
//     _fadeAnimation =
//         CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
//   }

//   void _toggle() {
//     setState(() => isExpanded = !isExpanded);
//     isExpanded ? _controller.forward() : _controller.reverse();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<CartItemCubit, CartItemState>(
//       builder: (context, state) {
//         final String totalPrice =
//             '${context.watch<CartCubit>().cartsEntity.getTotalCartCheckOutPrice()} جنيه';

//         return AnimatedSwitcher(
//           duration: Duration(milliseconds: 300),
//           switchInCurve: Curves.easeOutBack,
//           switchOutCurve: Curves.easeInBack,
//           child: isExpanded
//               ? Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 16),
//                   child: SlideTransition(
//                     position: _slideAnimation,
//                     child: FadeTransition(
//                       opacity: _fadeAnimation,
//                       child: CustomButton(
//                         key: ValueKey('expanded'),
//                         text: 'الدفع $totalPrice',
//                         onTap: _handlePayment,
//                       ),
//                     ),
//                   ),
//                 )
//               : Align(
//                   alignment: Alignment.bottomLeft,
//                   child: Padding(
//                     padding:
//                         const EdgeInsets.only(left: 16, bottom: 0, right: 0),
//                     child: InkWell(
//                       key: ValueKey('mini'),
//                       onTap: _toggle,
//                       borderRadius: BorderRadius.circular(28),
//                       child: Material(
//                         elevation: 6,
//                         shape: CircleBorder(),
//                         color: AppColors.primaryColor,
//                         child: SizedBox(
//                           width: 48,
//                           height: 48,
//                           child: Icon(
//                             Icons.shopping_cart,
//                             color: Colors.white,
//                             size: 24, // 🔧 Smaller icon for better proportion
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//         );
//       },
//     );
//   }

//   Future<void> _handlePayment() async {
//     // Simulate or trigger your payment flow
//     await Future.delayed(Duration(milliseconds: 300)); // optional delay
//     // Navigate, show dialog, or integrate payment code here

//     // After completing payment, collapse the button
//     setState(() => isExpanded = false);
//     _controller.reverse();
//   }
// }
