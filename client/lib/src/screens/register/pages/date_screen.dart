import 'package:flutter/services.dart';
import 'package:omonie/src/src.dart';

class DateScreen extends StatefulWidget {
  const DateScreen({Key? key}) : super(key: key);

  @override
  State<DateScreen> createState() => _DateScreenState();
}

class _DateScreenState extends State<DateScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  // String day = "00";
  // String month = "00";
  // String year = "0000";
  var day = TextEditingController();
  var month = TextEditingController();
  var year = TextEditingController();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalGap(40),
          const Text(
            'Enter your date of birth',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          verticalGap(38),
          buildDatePicker(),
          verticalGap(100),
          Row(
            children: [
              InkWell(
                onTap: () {
                  context.read<NavProvider>().controller.previousPage(
                      duration: const Duration(seconds: 1),
                      curve: Curves.easeInOut);
                },
                child: const CircleAvatar(
                  radius: 20,
                  backgroundColor: Color(0xFF1F2226),
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.arrow_back_sharp,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                ),
              ),
              horizontalGap(15),
              AppButton(
                  width: 190,
                  data: "Next",
                  onPressed: ((day.text.isEmpty && day.text.length != 2) ||
                          (month.text.isEmpty && month.text.length != 2) ||
                          year.text.isEmpty ||
                          year.text.length != 4)
                      ? null
                      : () {
                          var b = context.read<AuthProvider>().data;
                          context.read<AuthProvider>().data = b
                            ..addAll({
                              "dateOfBirth":
                                  "${DateTime.utc(int.parse(year.text), int.parse(month.text), int.parse(day.text))}",
                            });
                          context.read<NavProvider>().controller.nextPage(
                              duration: const Duration(seconds: 1),
                              curve: Curves.easeInOut);
                        }),
            ],
          ),
        ],
      ),
    );
  }

  Row buildDatePicker() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 59,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PopupMenuButton<String>(
                onSelected: (String value) {
                  setState(() {
                    day.text = value;
                  });
                },
                itemBuilder: (BuildContext context) {
                  return List.generate(31, (index) {
                    int day = index + 1;
                    String formattedDay = day.toString().padLeft(2, '0');
                    return PopupMenuItem<String>(
                      value: formattedDay,
                      child: Text(formattedDay),
                    );
                  });
                },
                child: Row(
                  children: [
                    const Text(
                      'Day',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                    SvgPicture.asset(Assets.assetsIconsArrowDown),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Container(
                width: double.infinity,
                height: 50,
                padding: const EdgeInsets.all(8),
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  color: const Color(0xFF101214),
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 1, color: Color(0xFF282D35)),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: TextField(
                        controller: day,
                        textAlign: TextAlign.center,
                        buildCounter: (context,
                                {required currentLength,
                                required isFocused,
                                maxLength}) =>
                            const SizedBox(),
                        maxLength: 4,
                        onChanged: (value) {
                          setState(() {});
                        },
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          FilteringTextInputFormatter.singleLineFormatter,
                        ],
                        decoration: const InputDecoration.collapsed(
                          hintText: "00",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 15),
        SizedBox(
          width: 62,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PopupMenuButton<String>(
                onSelected: (String value) {
                  setState(() {
                    month.text = value;
                  });
                },
                itemBuilder: (BuildContext context) {
                  return List.generate(12, (index) {
                    int month = index + 1;
                    String formattedMonth = month.toString().padLeft(2, '0');
                    return PopupMenuItem<String>(
                      value: formattedMonth,
                      child: Text(formattedMonth),
                    );
                  });
                },
                child: Row(
                  children: [
                    const Text(
                      'Month',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                    SvgPicture.asset(Assets.assetsIconsArrowDown),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Container(
                width: double.infinity,
                height: 50,
                padding: const EdgeInsets.all(8),
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  color: const Color(0xFF101214),
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 1, color: Color(0xFF282D35)),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: TextField(
                        controller: month,
                        textAlign: TextAlign.center,
                        buildCounter: (context,
                                {required currentLength,
                                required isFocused,
                                maxLength}) =>
                            const SizedBox(),
                        maxLength: 4,
                        onChanged: (value) {
                          setState(() {});
                        },
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          FilteringTextInputFormatter.singleLineFormatter,
                        ],
                        decoration: const InputDecoration.collapsed(
                          hintText: "00",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 15),
        SizedBox(
          width: 66,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PopupMenuButton<String>(
                onSelected: (String value) {
                  setState(() {
                    year.text = value;
                  });
                },
                itemBuilder: (BuildContext context) {
                  return List.generate(2024 - 1880 + 1, (index) {
                    int year = 2024 - index;
                    String formattedYear = year.toString().padLeft(2, '0');
                    return PopupMenuItem<String>(
                      value: formattedYear,
                      child: Text(formattedYear),
                    );
                  });
                },
                child: Row(
                  children: [
                    const Text(
                      'Year',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                    SvgPicture.asset(Assets.assetsIconsArrowDown),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Container(
                width: double.infinity,
                height: 50,
                padding: const EdgeInsets.all(8),
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  color: const Color(0xFF101214),
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 1, color: Color(0xFF282D35)),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: TextField(
                        controller: year,
                        textAlign: TextAlign.center,
                        buildCounter: (context,
                                {required currentLength,
                                required isFocused,
                                maxLength}) =>
                            const SizedBox(),
                        maxLength: 4,
                        onChanged: (value) {
                          setState(() {});
                        },
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          FilteringTextInputFormatter.singleLineFormatter,
                        ],
                        decoration: const InputDecoration.collapsed(
                          hintText: "0000",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
