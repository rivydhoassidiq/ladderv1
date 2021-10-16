import 'package:flutter/material.dart';
import 'package:ladder/app/utils/theme.dart';

import 'components/history_order.dart' as history;
import 'components/proses_order.dart' as proses;

class OrderView extends StatefulWidget {
  const OrderView({Key? key}) : super(key: key);

  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<OrderView> with SingleTickerProviderStateMixin {
  late TabController _controller = TabController(length: 2, vsync: this);

  @override
  void initState() {
    _controller = new TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: whiteColor,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(0),
          child: TabBar(
            indicatorWeight: 4,
            labelColor: boldColor,
            indicatorColor: bottomBlueColor,
            unselectedLabelColor: sliderColor,
            labelPadding: const EdgeInsets.only(bottom: 0),
            labelStyle: semiBoldText14,
            controller: _controller,
            tabs: const [
              Tab(
                text: 'Sedang Proses',
              ),
              Tab(
                text: 'Riwayat',
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: TabBarView(
          controller: _controller,
          children: [
            history.HistoryOrder(),
            proses.ProsesOrder(),
          ],
        ),
      ),
    );
  }
}
