import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BookingHistoryScreen extends StatefulWidget {
  const BookingHistoryScreen({Key? key}) : super(key: key);

  @override
  State<BookingHistoryScreen> createState() => _BookingHistoryScreenState();
}

class _BookingHistoryScreenState extends State<BookingHistoryScreen> {
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      body: Column(
        children: [
          // AppBar
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 0, 131, 74),
                  Color(0xFF21C36A),
                ], // Darker on top, lighter on bottom
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            padding: const EdgeInsets.only(
              top: 48,
              left: 20,
              right: 20,
              bottom: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'My Booking History',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 18, 150, 71),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.add, color: Colors.white, size: 24),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
          // Horizontal card selector
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _tabCard('Upcoming', 0),
                _tabCard('Completed', 1),
                _tabCard('Canceled', 2),
              ],
            ),
          ),
          // Tab content
          Expanded(
            child: IndexedStack(
              index: _selectedTab,
              children: const [
                _BookingList(type: 'upcoming'),
                _BookingList(type: 'completed'),
                _BookingList(type: 'canceled'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _tabCard(String label, int index) {
    final bool selected = _selectedTab == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _selectedTab = index),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: selected ? const Color(0xFF21C36A) : Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow:
                selected
                    ? [
                      BoxShadow(
                        color: Colors.green.withOpacity(0.15),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ]
                    : [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.03),
                        blurRadius: 4,
                        offset: const Offset(0, 1),
                      ),
                    ],
            border: Border.all(
              color: selected ? const Color(0xFF21C36A) : Colors.grey.shade200,
              width: 1.5,
            ),
          ),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                color: selected ? Colors.white : Colors.black87,
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _BookingList extends StatelessWidget {
  final String type;
  const _BookingList({required this.type});

  @override
  Widget build(BuildContext context) {
    // Mock data
    final bookings = [
      {
        'hotel': 'Emerald Beach Hotel',
        'location': 'Kuta, Badung, Bali',
        'room': 'Superior Double Room',
        'image': 'assests/hotel1.png',
        'checkin': 'Tue, 11 Mar 2025',
        'checkinTime': '14:00',
        'checkout': 'Fri, 14 Mar 2025',
        'checkoutTime': '12:00',
        'nights': '3 Nights',
        'total': '\$242.40',
      },
      {
        'hotel': 'Imperium Hotel',
        'location': 'Sanur, Denpasar, Bali',
        'room': 'Family Suite Room',
        'image': 'assests/hotel2.png',
        'checkin': 'Wed, 02 Apr 2025',
        'checkinTime': '14:00',
        'checkout': 'Thr, 03 Apr 2025',
        'checkoutTime': '12:00',
        'nights': '1 Night',
        'total': '\$148.20',
      },
    ];
    if (type != 'upcoming') {
      return Center(
        child: Text(
          'No $type bookings',
          style: const TextStyle(color: Colors.black38, fontSize: 16),
        ),
      );
    }
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: bookings.length,
      separatorBuilder: (_, __) => const SizedBox(height: 16),
      itemBuilder: (context, i) {
        final b = bookings[i];
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.04),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      b['image']!,
                      width: 80,
                      height: 54,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          b['hotel']!,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Row(
                          children: [
                            const Icon(
                              Icons.place,
                              size: 14,
                              color: Colors.grey,
                            ),
                            const SizedBox(width: 3),
                            Text(
                              b['location']!,
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 2),
                        Row(
                          children: [
                            const Icon(
                              Icons.meeting_room,
                              size: 14,
                              color: Colors.grey,
                            ),
                            const SizedBox(width: 3),
                            Text(
                              b['room']!,
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Check in',
                        style: TextStyle(fontSize: 11, color: Colors.black54),
                      ),
                      Text(
                        b['checkin']!,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        b['checkinTime']!,
                        style: const TextStyle(
                          fontSize: 11,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.nights_stay,
                            size: 16,
                            color: Colors.green,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            b['nights']!,
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        'Check out',
                        style: TextStyle(fontSize: 11, color: Colors.black54),
                      ),
                      Text(
                        b['checkout']!,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        b['checkoutTime']!,
                        style: const TextStyle(
                          fontSize: 11,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Divider(height: 1, thickness: 1, color: Color(0xFFF0F0F0)),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total',
                    style: TextStyle(fontSize: 13, color: Colors.black54),
                  ),
                  Text(
                    b['total']!,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.black12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 8),
                      ),
                      child: const Text(
                        'Reschedule',
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.red,
                        side: BorderSide.none,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 8),
                      ),
                      child: const Text(
                        'Cancel',
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.green,
                        side: BorderSide.none,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 8),
                      ),
                      child: const Text(
                        'E-Receipt',
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
